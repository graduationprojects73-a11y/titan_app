import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:titan/features/monitoring/data/models/fire_log_response.dart';
import 'package:titan/features/monitoring/presentation/providers/fire_log_provider.dart';
import 'package:titan/features/monitoring/data/repositories/fire_log_repository.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:intl/intl.dart';
import 'fire_log_details_screen.dart';

class FireLogsScreen extends ConsumerStatefulWidget {
  const FireLogsScreen({super.key});

  @override
  ConsumerState<FireLogsScreen> createState() => _FireLogsScreenState();
}

class _FireLogsScreenState extends ConsumerState<FireLogsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Route _createSlideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fireLogsAsyncValue = ref.watch(fireLogsProvider);
    final Color primaryColor = const Color(0xFFD32F2F); // Deep Red for Fire Alerts
    final Color scaffoldBg = const Color(0xFFF9FAFB);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          ref.read(fireLogRepositoryProvider).clearFireLogsCache();
          ref.invalidate(fireLogsProvider);
          await ref.read(fireLogsProvider.future);
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              expandedHeight: 120,
              floating: true,
              pinned: true,
              elevation: 0,
              backgroundColor: primaryColor,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh_rounded, color: Colors.white),
                  onPressed: () async {
                    ref.read(fireLogRepositoryProvider).clearFireLogsCache();
                    ref.invalidate(fireLogsProvider);
                  },
                ),
                const SizedBox(width: 8),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 20),
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Fire Monitoring',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      'Real-time thermal threat detection',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                        fontSize: 9,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
                background: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            primaryColor,
                            const Color(0xFFC62828), // Darker shade for depth
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        Icons.local_fire_department_rounded,
                        size: 140,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            fireLogsAsyncValue.when(
              data: (logs) {
                if (logs.isEmpty) {
                  return const SliverFillRemaining(
                    child: _EmptyStateIndicator(),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final log = logs[index];
                        return _buildAnimatedItem(
                          index: index,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _buildFireLogCard(context, log, primaryColor),
                          ),
                        );
                      },
                      childCount: logs.length,
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFD32F2F),
                  ),
                ),
              ),
              error: (err, stack) => SliverFillRemaining(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline_rounded, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading alerts: $err',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedItem({required int index, required Widget child}) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.25),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            (index * 0.05).clamp(0.0, 0.5),
            1.0,
            curve: Curves.easeOutCubic,
          ),
        ),
      ),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              (index * 0.05).clamp(0.0, 0.5),
              1.0,
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildFireLogCard(
    BuildContext context,
    FireLogDetail log,
    Color primaryColor,
  ) {
    final hasImage = log.image != null && log.image!.isNotEmpty;
    final String imageUrl = hasImage
        ? (log.image!.startsWith('http')
            ? log.image!
            : '${ApiConstants.host}/${log.image}')
        : '';
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final DateFormat outputFormat = DateFormat("EEE, MMM d, yyyy • hh:mm a");
    String formattedTime = log.createdAt;
    try {
      final parsedDate = inputFormat.parse(log.createdAt);
      formattedTime = outputFormat.format(parsedDate);
    } catch (_) {}

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            _createSlideRoute(FireLogDetailsScreen(fireLogId: log.id)),
          );
        },
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
            border: Border.all(color: Colors.grey.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Header
              Hero(
                tag: 'fire_log_image_${log.id}',
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                  child: Stack(
                    children: [
                      if (hasImage)
                        CachedNetworkImage(
                          height: 180,
                          width: double.infinity,
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            height: 180,
                            color: Colors.grey.shade100,
                            child: const Center(child: CircularProgressIndicator(color: Colors.red)),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 180,
                            color: Colors.red.shade50,
                            child: const Center(
                              child: Icon(Icons.broken_image_outlined, size: 48, color: Colors.red),
                            ),
                          ),
                        )
                      else
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.red.shade500.withOpacity(0.08),
                                Colors.orange.shade500.withOpacity(0.08),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_fire_department_rounded, size: 48, color: Colors.orange.shade700),
                                const SizedBox(height: 8),
                                Text(
                                  'NO THERMAL IMAGE ATTACHED',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.orange.shade800,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.warning_amber_rounded, size: 12, color: Colors.white),
                              const SizedBox(width: 4),
                              Text(
                                '${log.confidence?.toStringAsFixed(1)}% CONFIDENCE',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.local_fire_department_rounded,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FIRE DETECTED',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 11,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            log.numberCamera != null
                                ? 'Camera #${log.numberCamera} - Thermal threat'
                                : 'Unknown Camera - Thermal threat',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formattedTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyStateIndicator extends StatelessWidget {
  const _EmptyStateIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.health_and_safety_outlined,
              size: 80,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Safety Intact',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'No active thermal/fire threats detected.',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
