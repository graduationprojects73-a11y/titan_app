import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:titan/features/monitoring/presentation/screens/ppe_logs_screen.dart';

import 'package:titan/features/monitoring/presentation/screens/restricted_areas_screen.dart';
import 'package:titan/features/monitoring/presentation/screens/gate_monitoring_screen.dart';
import 'package:titan/features/reports/presentation/screens/reports_screen.dart';
import 'package:titan/features/monitoring/presentation/screens/fire_logs_screen.dart';
import 'package:titan/features/monitoring/presentation/screens/fire_log_details_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:titan/features/home/presentation/providers/dashboard_provider.dart';
import 'package:titan/features/home/presentation/screens/alert_details_screen.dart';
import 'package:titan/features/settings/presentation/screens/settings_screen.dart';
import 'package:titan/features/home/presentation/screens/ppe_alert_details_screen.dart';
import 'package:titan/shared/widgets/custom_nav_bar.dart';
import 'package:titan/shared/widgets/skeleton.dart';

import 'package:titan/features/auth/presentation/providers/auth_provider.dart';
import 'package:titan/features/admin/presentation/screens/users_list_screen.dart';
import 'package:titan/features/admin/presentation/screens/vehicles_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  static List<Widget> _widgetOptions(void Function(int) onTabChange) =>
      <Widget>[
        DashboardTab(onTabChange: onTabChange),
        const ReportsScreen(),
        const RestrictedAreasScreen(), // Replaced FactoryMapScreen
        const SettingsScreen(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Animate to the selected page
    _pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    _pageController ??= PageController(initialPage: _selectedIndex);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      extendBody: true, // Allows body to go behind the floating navbar
      body: SafeArea(
        bottom: false, // Don't enforce bottom safe area on body since we extend
        child: PageView(
          controller: _pageController,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe if desired, matches tab behavior usually
          // If the user wants to SWIPE between tabs, we can change this.
          // But "navigate... from right/left" usually just refers to the animation.
          // Let's keep it non-scrollable via touch for now to avoid conflict with map/scrollables,
          // but the animation will happen via controller.
          children: _widgetOptions(_onItemTapped),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}

class DashboardTab extends ConsumerStatefulWidget {
  final Function(int) onTabChange;

  const DashboardTab({super.key, required this.onTabChange});

  @override
  ConsumerState<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends ConsumerState<DashboardTab>
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
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dashboardAsyncValue = ref.watch(dashboardProvider);
    final authState = ref.watch(authNotifierProvider);

    return RefreshIndicator(
      color: BrandColors.mediumBlue,
      backgroundColor: Colors.white,
      onRefresh: () async {
        await ref.refresh(dashboardProvider.future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Header
          _buildAnimatedItem(
            index: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                authState.when(
                  data: (loginResponse) {
                    if (loginResponse == null) return const SizedBox.shrink();

                    final bool isAdmin =
                        loginResponse.user.role.toLowerCase() == 'admin';
                    if (!isAdmin) return const SizedBox.shrink();

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          _createSlideRoute(const VehiclesListScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: BrandColors.mediumBlue, // Brand Medium Blue
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: BrandColors.mediumBlue.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.directions_car_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),

                authState.when(
                  data: (loginResponse) {
                    if (loginResponse == null) return const SizedBox.shrink();

                    final bool isAdmin =
                        loginResponse.user.role.toLowerCase() == 'admin';
                    if (!isAdmin) return const SizedBox.shrink();

                    return IconButton(
                      icon: const Icon(
                        Icons.manage_accounts_outlined,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          _createSlideRoute(const UsersListScreen()),
                        );
                      },
                    );
                  },
                  loading: () => const SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Overview Section
          _buildAnimatedItem(
            index: 1,
            child: const Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          Builder(
            builder: (context) {
              final dashboardAsyncValue = ref.watch(dashboardProvider);
              final data = dashboardAsyncValue.valueOrNull?.data;
              final isLoading = dashboardAsyncValue.isLoading;

              return Column(
                children: [
                  _buildAnimatedItem(
                    index: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildOverviewCard(
                            context,
                            title: "Today's Accident Count",
                            value: data?.todayAccidentCount.toString(),
                            icon: Icons.warning_amber_rounded,
                            iconColor: Colors.red,
                            bgColor: Colors.red.shade50,
                            isLoading: isLoading,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildOverviewCard(
                            context,
                            title: 'Area with Most Violations',
                            value: data?.areaWithMostViolations?.area ?? 'None',
                            icon: Icons.wb_sunny_outlined,
                            iconColor: Colors.orange,
                            bgColor: Colors.orange.shade50,
                            isLoading: isLoading,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildAnimatedItem(
                    index: 3,
                    child: _buildFullWidthCard(
                      context,
                      title: 'Safety Compliance',
                      value: data != null
                          ? '${(data.safetyCompliance is num ? data.safetyCompliance : 0).toStringAsFixed(2)}%'
                          : null,
                      icon: Icons.verified_user_outlined,
                      iconColor: BrandColors.limeGreen,
                      bgColor: BrandColors.lightGreen.withOpacity(0.15),
                      isLoading: isLoading,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 32),

          // Real-time Alerts
          _buildAnimatedItem(
            index: 4,
            child: const Text(
              'Real-time Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          dashboardAsyncValue.when(
            data: (dashboardResponse) {
              final alerts = dashboardResponse.data.realTimeAlerts;
              final ppeLogs = alerts.ppeLog?.take(2).toList() ?? [];
              final vehicleLogs = alerts.vehicleLog?.take(2).toList() ?? [];
              final fireLogs = alerts.fireLog?.take(2).toList() ?? [];
              final speedLogs = alerts.speedLog?.take(2).toList() ?? [];

              if (vehicleLogs.isEmpty && ppeLogs.isEmpty && fireLogs.isEmpty && speedLogs.isEmpty) {
                return const Text('No recent alerts');
              }

              return _buildAnimatedItem(
                index: 5,
                child: Column(
                  children: [
                    ...ppeLogs.map(
                      (log) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              _createSlideRoute(
                                PpeAlertDetailsScreen(ppeLogId: log.id),
                              ),
                            );
                          },
                          child: _buildAlertCard(
                            title: 'PPE Violation',
                            subtitle:
                                '${log.worker?.name ?? "Worker"} - No ${log.pees?.ppeType ?? "PPE"}',
                            icon: Icons.health_and_safety,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    ...vehicleLogs.map(
                      (log) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              _createSlideRoute(
                                AlertDetailsScreen(vehicleLog: log),
                              ),
                            );
                          },
                          child: _buildAlertCard(
                            title: 'Vehicle Alert',
                            subtitle:
                                '${log.licensePlate} at ${log.camera?.location ?? "Unknown"}',
                            icon: Icons.directions_car,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    ...fireLogs.map(
                      (log) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              _createSlideRoute(
                                FireLogDetailsScreen(fireLogId: log.id),
                              ),
                            );
                          },
                          child: _buildAlertCard(
                            title: 'Fire Alarm',
                            subtitle: 'Confidence: ${(log.confidence ?? 0).toStringAsFixed(1)}% at ${log.createdAt}',
                            icon: Icons.local_fire_department,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    ...speedLogs.map(
                      (log) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                title: const Row(
                                  children: [
                                    Icon(Icons.speed, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text('Speed Violation Details'),
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('License Plate: ${log.licensePlate ?? "Unknown"}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8),
                                    Text('Speed: ${log.speed != null ? "${log.speed} km/h" : "N/A"}'),
                                    const SizedBox(height: 8),
                                    Text('Speed Limit: ${log.limit != null ? "${log.limit} km/h" : "N/A"}'),
                                    const SizedBox(height: 8),
                                    Text('Detected at: ${log.createdAt}'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: _buildAlertCard(
                            title: 'Speed Violation',
                            subtitle: '${log.licensePlate ?? "Vehicle"} - Speed: ${log.speed ?? 0} km/h (Limit: ${log.limit ?? 0})',
                            icon: Icons.speed,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => _buildAnimatedItem(
              index: 5,
              child: Column(
                children: [
                  Skeleton(
                    height: 80,
                    width: double.infinity,
                    borderRadius: 16,
                  ),
                  const SizedBox(height: 12),
                  Skeleton(
                    height: 80,
                    width: double.infinity,
                    borderRadius: 16,
                  ),
                ],
              ),
            ),
            error: (_, __) => const SizedBox.shrink(),
          ),

          const SizedBox(height: 32),

          // Quick Access
          _buildAnimatedItem(
            index: 6,
            child: const Text(
              'Quick Access',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          _buildAnimatedItem(
            index: 7,
            child: Column(
              children: [
                // Full-width PPE button (spans 2 columns)
                _buildWideQuickAccessCard(
                  'PPE',
                  Icons.health_and_safety_outlined,
                  BrandColors.limeGreen,
                  onTap: () {
                    Navigator.push(
                      context,
                      _createSlideRoute(const PpeLogsScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Full-width Gate Monitoring button
                _buildWideQuickAccessCard(
                  'Gate Monitoring',
                  Icons.door_front_door_outlined,
                  BrandColors.mediumBlue,
                  onTap: () {
                    Navigator.push(
                      context,
                      _createSlideRoute(const GateMonitoringScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Full-width Fire Monitoring button
                _buildWideQuickAccessCard(
                  'Fire Monitoring',
                  Icons.local_fire_department_outlined,
                  const Color(0xFFD32F2F),
                  onTap: () {
                    Navigator.push(
                      context,
                      _createSlideRoute(const FireLogsScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Add extra padding at the bottom to account for the floating nav bar
          const SizedBox(height: 100),
        ],
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

  Widget _buildOverviewCard(
    BuildContext context, {
    required String title,
    required String? value,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    bool isLoading = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // More rounded
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          isLoading || value == null
              ? const Skeleton(height: 28, width: 60)
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24, // Larger number
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildFullWidthCard(
    BuildContext context, {
    required String title,
    required String? value,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    double? progress,
    bool isLoading = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: iconColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: iconColor.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    isLoading || value == null
                        ? const Skeleton(height: 32, width: 100)
                        : Text(
                            value,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: iconColor,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 10,
                  width:
                      MediaQuery.of(context).size.width *
                      0.75 *
                      progress, // Approximate width
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [iconColor, iconColor.withOpacity(0.7)],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: iconColor.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // White background for cleanliness
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.1),
        ), // Subtle border using alert color
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87, // Darker text
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(
    String title,
    IconData icon,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      // Changed to GestureDetector for better custom feedback control if needed, or stick to InkWell but styled
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWideQuickAccessCard(
    String title,
    IconData icon,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
