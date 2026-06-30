import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:titan/features/admin/presentation/providers/user_management_provider.dart';
import 'package:titan/features/admin/presentation/screens/edit_vehicle_screen.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:titan/shared/widgets/license_plate_widget.dart';
import 'package:titan/core/constants/api_constants.dart';

class VehicleDetailsScreen extends ConsumerWidget {
  final Vehicle vehicle;
  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isAuthorized = vehicle.authorized == 1;
    final DateFormat formatter = DateFormat('EEE, MMM d, yyyy • HH:mm');
    final String imageUrl = vehicle.image.startsWith('http')
        ? vehicle.image
        : '${ApiConstants.host}/${vehicle.image}';

    // Using colors from the home/app theme (F9FAFB background, 1E88E5 blue)
    final Color primaryColor = BrandColors.mediumBlue;
    final Color scaffoldBg = const Color(0xFFF9FAFB);
    final Color cardBg = Colors.white;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            stretch: true,
            backgroundColor: primaryColor,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.2),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.2),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditVehicleScreen(vehicle: vehicle),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(0.6),
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => _showDeleteDialog(context, ref, vehicle),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Hero(
                tag: 'vehicle_image_${vehicle.id}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade200,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.shade100,
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black38,
                            Colors.transparent,
                            Colors.black87,
                          ],
                          stops: [0.0, 0.4, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                decoration: BoxDecoration(
                  color: scaffoldBg,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // License Plate Layout - New Style
                    Center(
                      child: LicensePlateWidget(
                        licensePlate: vehicle.licensePlate,
                      ),
                    ),
                    const SizedBox(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle.vehicleType.toUpperCase(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                        _StatusBadge(isAuthorized: isAuthorized),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Technical Specifications'),
                    const SizedBox(height: 16),
                    _ModernInfoCard(
                      cardBg: cardBg,
                      primaryColor: primaryColor,
                      items: [
                        _InfoItem(
                          icon: Icons.tag,
                          label: 'Asset Reference',
                          value: '#${vehicle.id}',
                        ),
                        _InfoItem(
                          icon: Icons.event_available,
                          label: 'System Entry',
                          value: formatter.format(vehicle.createdAt),
                        ),
                        _InfoItem(
                          icon: Icons.history_rounded,
                          label: 'State Last Seen',
                          value: formatter.format(vehicle.updatedAt),
                        ),
                        _InfoItem(
                          icon: Icons.vpn_key_outlined,
                          label: 'Access Protocol',
                          value: isAuthorized
                              ? 'Full Authorization'
                              : 'Restricted Entry',
                          valueColor: isAuthorized
                              ? Colors.green.shade600
                              : Colors.red.shade600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildSectionTitle('Gateway Integration'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardBg,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.08),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.videocam_outlined,
                              color: Colors.orange.shade700,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Text(
                              'Linked to Smart Gateway Camera System #01',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Color(0xFF1F2937),
        letterSpacing: 0.3,
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text(
          'Confirm Disposal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Remove vehicle ${vehicle.licensePlate} from the system records?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              final success = await ref
                  .read(deleteVehicleNotifierProvider.notifier)
                  .deleteVehicle(vehicle.id);
              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Asset Removed'),
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
                Navigator.pop(context); // Go back to list
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Remove',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isAuthorized;
  const _StatusBadge({required this.isAuthorized});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isAuthorized ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAuthorized
              ? Colors.green.withOpacity(0.15)
              : Colors.red.withOpacity(0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAuthorized ? Icons.verified_rounded : Icons.lock_rounded,
            size: 14,
            color: isAuthorized ? Colors.green.shade600 : Colors.red.shade600,
          ),
          const SizedBox(width: 8),
          Text(
            isAuthorized ? 'AUTHORIZED' : 'RESTRICTED',
            style: TextStyle(
              color: isAuthorized ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.w900,
              fontSize: 11,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernInfoCard extends StatelessWidget {
  final List<_InfoItem> items;
  final Color cardBg;
  final Color primaryColor;
  const _ModernInfoCard({
    required this.items,
    required this.cardBg,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 1,
          indent: 60,
          endIndent: 20,
          color: Colors.grey.withOpacity(0.06),
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return _InfoItemDisplay(item: item, primaryColor: primaryColor);
        },
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });
}

class _InfoItemDisplay extends StatelessWidget {
  final _InfoItem item;
  final Color primaryColor;

  const _InfoItemDisplay({required this.item, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, size: 20, color: primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: item.valueColor ?? const Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
