import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:titan/features/admin/data/repositories/user_management_repository.dart';
import 'package:titan/features/admin/presentation/providers/user_management_provider.dart';
import 'package:titan/features/admin/presentation/screens/add_vehicle_screen.dart';
import 'package:titan/features/admin/presentation/screens/edit_vehicle_screen.dart';
import 'package:titan/features/admin/presentation/screens/vehicle_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:titan/shared/widgets/license_plate_widget.dart';
import 'package:titan/core/constants/api_constants.dart';

class VehiclesListScreen extends ConsumerStatefulWidget {
  const VehiclesListScreen({super.key});

  @override
  ConsumerState<VehiclesListScreen> createState() => _VehiclesListScreenState();
}

class _VehiclesListScreenState extends ConsumerState<VehiclesListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine which provider to watch based on selected tab index
    final AsyncValue<List<Vehicle>> vehiclesAsyncValue;
    switch (_tabController.index) {
      case 0:
        vehiclesAsyncValue = ref.watch(vehiclesListProvider);
        break;
      case 1:
        vehiclesAsyncValue = ref.watch(authorizedVehiclesListProvider);
        break;
      case 2:
        vehiclesAsyncValue = ref.watch(unauthorizedVehiclesListProvider);
        break;
      default:
        vehiclesAsyncValue = ref.watch(vehiclesListProvider);
    }

    // Theme consistency
    final Color primaryColor = BrandColors.mediumBlue;
    final Color scaffoldBg = const Color(0xFFF9FAFB);

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: RefreshIndicator(
        color: BrandColors.mediumBlue,
        backgroundColor: Colors.white,
        onRefresh: () async {
          ref.read(userManagementRepositoryProvider).clearVehiclesCache();
          ref.invalidate(vehiclesListProvider);
          ref.invalidate(authorizedVehiclesListProvider);
          ref.invalidate(unauthorizedVehiclesListProvider);
          // Wait for the active provider to complete reloading
          switch (_tabController.index) {
            case 0:
              await ref.read(vehiclesListProvider.future);
              break;
            case 1:
              await ref.read(authorizedVehiclesListProvider.future);
              break;
            case 2:
              await ref.read(unauthorizedVehiclesListProvider.future);
              break;
          }
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              expandedHeight: 140, // Increased to fit the TabBar
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
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement search
                  },
                ),
                const SizedBox(width: 8),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.7),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                tabs: const [
                  Tab(text: 'ALL'),
                  Tab(text: 'AUTHORIZED'),
                  Tab(text: 'BLOCKED'),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 56), // Adjusted for TabBar
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Active Fleet',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      'Real-time asset tracking',
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
                            const Color(0xFF1565C0), // Darker shade for depth
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        Icons.directions_car_rounded,
                        size: 130,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            vehiclesAsyncValue.when(
              data: (vehicles) {
                if (vehicles.isEmpty) {
                  return const SliverFillRemaining(
                    child: _EmptyStateIndicator(),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _buildVehicleCard(
                          context,
                          ref,
                          vehicles[index],
                          primaryColor,
                        ),
                      ),
                      childCount: vehicles.length,
                    ),
                  ),
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, stack) => SliverFillRemaining(
                child: Center(child: Text('Data Access Error: $err')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (_, __, ___) => const AddVehicleScreen(),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        ),
        label: const Text(
          'Add Asset',
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 0.5),
        ),
        icon: const Icon(Icons.add_rounded, size: 28),
        backgroundColor: primaryColor,
        elevation: 8,
      ),
    );
  }

  Widget _buildVehicleCard(
    BuildContext context,
    WidgetRef ref,
    dynamic vehicle,
    Color primaryColor,
  ) {
    final String serverImageUrl = vehicle.image.startsWith('http')
        ? vehicle.image
        : '${ApiConstants.host}/${vehicle.image}';

    return Hero(
      tag: 'vehicle_image_${vehicle.id}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VehicleDetailsScreen(vehicle: vehicle),
            ),
          ),
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
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 180,
                        width: double.infinity,
                        imageUrl: serverImageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Colors.grey.shade100,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey.shade100,
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: _StatusBadge(
                          isAuthorized: vehicle.authorized == 1,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vehicle.vehicleType.toUpperCase(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 11,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: LicensePlateWidget(
                                    licensePlate: vehicle.licensePlate,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildActionButtons(
                            context,
                            ref,
                            vehicle,
                            primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    dynamic vehicle,
    Color primaryColor,
  ) {
    return Row(
      children: [
        _ActionButton(
          icon: Icons.edit_rounded,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditVehicleScreen(vehicle: vehicle),
            ),
          ),
          color: Colors.grey.shade100,
          iconColor: Colors.black87,
        ),
        const SizedBox(width: 12),
        _ActionButton(
          icon: Icons.delete_outline_rounded,
          onTap: () => _showDeleteDialog(context, ref, vehicle),
          color: Colors.red.shade50,
          iconColor: Colors.redAccent,
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, dynamic vehicle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text(
          'Remove Asset',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        content: Text(
          'Are you sure you want to delete vehicle ${vehicle.licensePlate}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref
                  .read(deleteVehicleNotifierProvider.notifier)
                  .deleteVehicle(vehicle.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'DELETE',
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

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;
  const _ActionButton({
    required this.icon,
    required this.onTap,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 18, color: iconColor),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isAuthorized ? Colors.green.shade500 : Colors.red.shade500,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        isAuthorized ? 'ACTIVE' : 'BLOCKED',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 10,
          letterSpacing: 0.5,
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
          Icon(
            Icons.directions_car_filled_outlined,
            size: 80,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 24),
          const Text(
            'Fleet Empty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'No vehicles currently registered in the system.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
