import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:titan/features/monitoring/presentation/providers/vehicle_log_provider.dart';
import 'package:titan/features/home/presentation/screens/alert_details_screen.dart';
import 'package:titan/features/home/data/models/dashboard_response.dart'
    as home;
import 'package:intl/intl.dart';

class GateMonitoringScreen extends ConsumerStatefulWidget {
  const GateMonitoringScreen({super.key});

  @override
  ConsumerState<GateMonitoringScreen> createState() =>
      _GateMonitoringScreenState();
}

class _GateMonitoringScreenState extends ConsumerState<GateMonitoringScreen>
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

  @override
  Widget build(BuildContext context) {
    final vehicleLogsAsyncValue = ref.watch(vehicleLogsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 140,
              floating: false,
              pinned: true,
              backgroundColor: BrandColors.mediumBlue,
              elevation: 0,
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
                    await ref.refresh(vehicleLogsProvider.future);
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
                      'Gate Monitoring',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      'Real-time security gate access logs',
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
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            BrandColors.mediumBlue,
                            BrandColors.navy,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        Icons.door_sliding_outlined,
                        size: 140,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          color: BrandColors.mediumBlue,
          backgroundColor: Colors.white,
          onRefresh: () async {
            await ref.refresh(vehicleLogsProvider.future);
          },
          child: vehicleLogsAsyncValue.when(
            data: (vehicleLogs) {
              if (vehicleLogs.isEmpty) {
                return const CustomScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      child: Center(child: Text('No vehicle logs found.')),
                    ),
                  ],
                );
              }
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                itemCount: vehicleLogs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final log = vehicleLogs[index];
                  return _buildAnimatedItem(
                    index: index,
                    child: _buildEventCard(log),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: BrandColors.mediumBlue)),
            error: (error, stack) => CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: Center(child: Text('Error: $error')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedItem({required int index, required Widget child}) {
    return SlideTransition(
      position:
          Tween<Offset>(
            begin: const Offset(0, 0.2), // Slide up from slightly below
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(
                index * 0.1, // Stagger by 0.1s
                1.0,
                curve: Curves.easeOutCubic,
              ),
            ),
          ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(index * 0.1, 1.0, curve: Curves.easeOut),
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildEventCard(VehicleLog log) {
    bool isUnauthorized = log.authorized == 0;
    bool isEntry = true; // Defaulting to entry as in original code
    final hasImage = log.image.isNotEmpty;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Manually map to home.VehicleLog to avoid type mismatch and DateTime conversion issues
          final homeLog = home.VehicleLog(
            id: log.id,
            licensePlate: log.licensePlate,
            image: log.image,
            authorized: log.authorized,
            vehicleId: log.vehicleId,
            cameraId: log.cameraId,
            createdAt: log.createdAt.toIso8601String(),
            vehicle: log.vehicle == null
                ? null
                : home.Vehicle(
                    id: log.vehicle!.id,
                    licensePlate: log.vehicle!.licensePlate,
                    authorized: log.vehicle!.authorized,
                    vehicleType: log.vehicle!.vehicleType,
                    image: log.vehicle!.image,
                  ),
            camera: log.camera == null
                ? null
                : home.Camera(
                    id: log.camera!.id,
                    numberCamera: log.camera!.numberCamera,
                    location: log.camera!.location,
                    status: log.camera!.status,
                    department: log.camera!.department,
                  ),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlertDetailsScreen(vehicleLog: homeLog),
            ),
          );
        },
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.06),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: isUnauthorized
                  ? Colors.red.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.05),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
                child: Stack(
                  children: [
                    hasImage
                        ? CachedNetworkImage(
                            height: 180,
                            width: double.infinity,
                            imageUrl: log.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              height: 180,
                              color: Colors.grey[100],
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: BrandColors.mediumBlue,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 180,
                              color: Colors.grey[100],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.broken_image_outlined, size: 48, color: Colors.grey[300]),
                                  const SizedBox(height: 8),
                                  Text('Image Unavailable', style: TextStyle(color: Colors.grey[400], fontSize: 13)),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blue.shade500.withOpacity(0.08),
                                  Colors.indigo.shade500.withOpacity(0.08),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.directions_car_rounded, size: 48, color: Colors.blue.shade700),
                                  const SizedBox(height: 8),
                                  Text(
                                    'NO VEHICLE IMAGE ATTACHED',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade800,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    // Status Badge
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isUnauthorized ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          isUnauthorized ? 'UNAUTHORIZED' : 'AUTHORIZED',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    // Direction Badge
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isEntry ? Icons.login_rounded : Icons.logout_rounded,
                              size: 11,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isEntry ? 'ENTRY' : 'EXIT',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Details Section
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (isUnauthorized ? Colors.red : Colors.green).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.directions_car_rounded,
                        color: isUnauthorized ? Colors.red : Colors.green,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GATE ACCESS - ${log.vehicle?.vehicleType?.toUpperCase() ?? 'CAR'}',
                            style: TextStyle(
                              color: isUnauthorized ? Colors.red : Colors.green,
                              fontWeight: FontWeight.w900,
                              fontSize: 11,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Plate: ${log.licensePlate}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${log.camera?.location ?? 'Unknown Gate'} • ${DateFormat('EEEE, MMM d • hh:mm a').format(log.createdAt)}',
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
