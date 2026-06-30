import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:titan/features/monitoring/data/models/fire_log_response.dart';
import 'package:titan/features/monitoring/presentation/providers/fire_log_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:intl/intl.dart';

class FireLogDetailsScreen extends ConsumerWidget {
  final int fireLogId;

  const FireLogDetailsScreen({super.key, required this.fireLogId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fireLogAsync = ref.watch(fireLogDetailsProvider(fireLogId));
    final Color primaryColor = const Color(0xFFD32F2F); // Deep Red for Fire Alerts

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Fire Threat Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.2),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
        ),
      ),
      body: fireLogAsync.when(
        data: (log) => _buildDetails(context, ref, log, primaryColor),
        loading: () => Container(
          color: primaryColor,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
        error: (error, _) => Container(
          color: const Color(0xFFF9FAFB),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline_rounded, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: $error',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(fireLogDetailsProvider(fireLogId)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('RETRY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetails(
    BuildContext context,
    WidgetRef ref,
    FireLogDetail log,
    Color primaryColor,
  ) {
    final hasImage = log.image != null && log.image!.isNotEmpty;
    final imageUrl = hasImage
        ? (log.image!.startsWith('http')
            ? log.image!
            : '${ApiConstants.host}/${log.image}')
        : '';

    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final DateFormat outputFormat = DateFormat("EEEE, MMMM d, yyyy • hh:mm:ss a");
    String formattedTime = log.createdAt;
    try {
      final parsedDate = inputFormat.parse(log.createdAt);
      formattedTime = outputFormat.format(parsedDate);
    } catch (_) {}

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            const Color(0xFFF9FAFB),
          ],
          stops: const [0.0, 0.45],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 60),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFF9FAFB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Warning Banner
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red.shade100, width: 1.5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.local_fire_department_rounded, color: primaryColor, size: 28),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'THERMAL ALERT TRIGGERED',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: primaryColor,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Immediate inspection required.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F2937),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Violation Image with Hero Animation
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          if (imageUrl.isNotEmpty) {
                            _openFullScreenImage(context, imageUrl);
                          }
                        },
                        child: Hero(
                          tag: 'fire_log_image_${log.id}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Container(
                              height: 240,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: hasImage
                                  ? Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: imageUrl,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => const Center(
                                            child: CircularProgressIndicator(color: Colors.red),
                                          ),
                                          errorWidget: (context, url, error) => const Center(
                                            child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 16,
                                          right: 16,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(Icons.fullscreen_rounded, color: Colors.white, size: 24),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.red.shade100.withOpacity(0.3),
                                            Colors.orange.shade100.withOpacity(0.3),
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image_not_supported_outlined, size: 64, color: Colors.red.shade300),
                                          const SizedBox(height: 12),
                                          Text(
                                            'No Live Image Captured',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red.shade900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Information Card
                    const Text(
                      'Alert Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF1F2937)),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoCard(log, formattedTime, primaryColor),
                    const SizedBox(height: 32),

                    // Mute / Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Alarm signal silenced locally'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black87,
                              surfaceTintColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            icon: const Icon(Icons.volume_off_rounded),
                            label: const Text('Mute Alarm', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Incident marked as inspected'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              elevation: 4,
                              shadowColor: primaryColor.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            icon: const Icon(Icons.check_circle_outline_rounded),
                            label: const Text('Mark Handled', style: TextStyle(fontWeight: FontWeight.w900)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(FireLogDetail log, String formattedTime, Color primaryColor) {
    final double confidencePercent = log.confidence ?? 0.0;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          // Confidence progress bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.analytics_outlined, size: 18, color: Colors.blueGrey),
                  const SizedBox(width: 10),
                  Text(
                    'Confidence Level',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '${confidencePercent.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: confidencePercent / 100,
              minHeight: 12,
              backgroundColor: Colors.grey.shade100,
              color: primaryColor,
            ),
          ),
          const Divider(height: 32, thickness: 1),
          _buildInfoRow(Icons.tag, 'Event ID', '#${log.id}'),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.local_fire_department_rounded, 'Threat Type', log.type.toUpperCase()),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.camera_indoor_rounded,
            'Source Camera',
            log.numberCamera != null ? 'Camera #${log.numberCamera}' : 'Unknown',
          ),
          const SizedBox(height: 16),
          _buildInfoRow(Icons.calendar_month_rounded, 'Detection Time', formattedTime),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blueGrey.shade400),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade500, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF1F2937)),
          ),
        ),
      ],
    );
  }

  void _openFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
          ),
          body: Center(
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => const CircularProgressIndicator(color: Colors.red),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
