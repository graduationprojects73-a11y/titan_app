import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:titan/features/monitoring/data/models/ppe_log_response.dart';
import 'package:titan/features/monitoring/presentation/providers/ppe_log_provider.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/features/home/presentation/screens/ppe_alert_details_screen.dart';

class PpeLogsScreen extends ConsumerStatefulWidget {
  const PpeLogsScreen({super.key});

  @override
  ConsumerState<PpeLogsScreen> createState() => _PpeLogsScreenState();
}

class _CategoryItem {
  final String name;
  final IconData icon;
  final Color color;
  final int count;
  final int index;

  _CategoryItem(this.name, this.icon, this.color, this.count, this.index);
}

class _PpeLogsScreenState extends ConsumerState<PpeLogsScreen>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0; // 0: Helmet, 1: Vest, 2: Gloves, 3: Glasses, 4: Mask, 5: Boots
  late AnimationController _controller;
  late final ScrollController _categoryScrollController;
  late final PageController _pageController;

  // Pagination states
  int _helmetPage = 1;
  int _vestPage = 1;
  int _glovesPage = 1;
  int _glassesPage = 1;
  int _maskPage = 1;
  int _bootsPage = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _controller.forward();
    _categoryScrollController = ScrollController();
    _pageController = PageController(initialPage: _selectedTabIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    _categoryScrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  String _getCategoryName(int index) {
    switch (index) {
      case 0:
        return 'Helmet';
      case 1:
        return 'Vest';
      case 2:
        return 'Gloves';
      case 3:
        return 'Glasses';
      case 4:
        return 'Mask';
      case 5:
        return 'Boots';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final ppeAsyncValue = ref.watch(
      ppeLogsProvider(
        helmetPage: _helmetPage,
        vestPage: _vestPage,
        glovesPage: _glovesPage,
        glassesPage: _glassesPage,
        maskPage: _maskPage,
        bootsPage: _bootsPage,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: ppeAsyncValue.when(
        data: (response) {
          final data = response.data;
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 120,
                  floating: false,
                  pinned: true,
                  backgroundColor: BrandColors.navy,
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
                      onPressed: () {
                        ref.invalidate(ppeLogsProvider(
                          helmetPage: _helmetPage,
                          vestPage: _vestPage,
                          glovesPage: _glovesPage,
                          glassesPage: _glassesPage,
                          maskPage: _maskPage,
                          bootsPage: _bootsPage,
                        ));
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: const EdgeInsets.only(bottom: 16),
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PPE Logs',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Real-time safety equipment tracking',
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
                                BrandColors.navy,
                                Color(0xFF2A5298), // Glossy Navy Blue
                                BrandColors.limeGreen,
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                        // Translucent background circles for premium depth
                        Positioned(
                          right: -30,
                          top: -30,
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.04),
                            ),
                          ),
                        ),
                        Positioned(
                          left: -20,
                          bottom: -10,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.03),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          bottom: 20,
                          child: Icon(
                            Icons.engineering_rounded,
                            size: 100,
                            color: Colors.white.withOpacity(0.05),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverHeaderDelegate(
                    height: 68,
                    child: Container(
                      color: const Color(0xFFF9FAFB),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: _buildCategorySelector(data),
                    ),
                  ),
                ),
              ];
            },
            body: _buildContent(data),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: BrandColors.mediumBlue),
        ),
        error: (error, _) => _buildErrorState(error),
      ),
    );
  }

  Widget _buildContent(PpeLogData data) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _selectedTabIndex = index;
        });
        _scrollToCategory(index);
      },
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildCategoryPage(index, data);
      },
    );
  }

  Widget _buildCategoryPage(int categoryIndex, PpeLogData data) {
    List<PpeLogItem> items = [];
    int currentPage = 1;
    int lastPage = 1;

    switch (categoryIndex) {
      case 0:
        items = data.helmet.data;
        currentPage = _helmetPage;
        lastPage = data.helmet.lastPage;
        break;
      case 1:
        items = data.vest.data;
        currentPage = _vestPage;
        lastPage = data.vest.lastPage;
        break;
      case 2:
        items = data.gloves.data;
        currentPage = _glovesPage;
        lastPage = data.gloves.lastPage;
        break;
      case 3:
        items = data.glasses.data;
        currentPage = _glassesPage;
        lastPage = data.glasses.lastPage;
        break;
      case 4:
        items = data.mask.data;
        currentPage = _maskPage;
        lastPage = data.mask.lastPage;
        break;
      case 5:
        items = data.boots.data;
        currentPage = _bootsPage;
        lastPage = data.boots.lastPage;
        break;
    }

    return Column(
      children: [
        const SizedBox(height: 12),
        Expanded(
          child: items.isEmpty
              ? _buildEmptyState(key: ValueKey('empty_$categoryIndex'))
              : ListView.separated(
                  key: ValueKey('list_${categoryIndex}_$currentPage'),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _buildAnimatedItem(
                      index: index,
                      child: GestureDetector(
                        onTap: () {
                          if (item.id != null) {
                            Navigator.push(
                              context,
                              _createSlideRoute(
                                PpeAlertDetailsScreen(ppeLogId: item.id!),
                              ),
                            );
                          }
                        },
                        child: _buildLogCard(item),
                      ),
                    );
                  },
                ),
        ),
        _buildPaginationControls(
          currentPage,
          lastPage,
          onPrev: () {
            setState(() {
              _updatePageForCategory(categoryIndex, -1);
            });
          },
          onNext: () {
            setState(() {
              _updatePageForCategory(categoryIndex, 1);
            });
          },
        ),
      ],
    );
  }

  void _updatePageForCategory(int categoryIndex, int offset) {
    switch (categoryIndex) {
      case 0:
        _helmetPage += offset;
        break;
      case 1:
        _vestPage += offset;
        break;
      case 2:
        _glovesPage += offset;
        break;
      case 3:
        _glassesPage += offset;
        break;
      case 4:
        _maskPage += offset;
        break;
      case 5:
        _bootsPage += offset;
        break;
    }
  }

  void _scrollToCategory(int index) {
    if (!_categoryScrollController.hasClients) return;
    
    const double itemWidth = 120.0;
    const double spacing = 12.0;
    const double leadingPadding = 20.0;
    
    final double viewportWidth = MediaQuery.of(context).size.width;
    
    double targetOffset = leadingPadding + 
        (index * (itemWidth + spacing)) + 
        (itemWidth / 2) - 
        (viewportWidth / 2);
        
    final double maxScrollExtent = _categoryScrollController.position.maxScrollExtent;
    final double minScrollExtent = _categoryScrollController.position.minScrollExtent;
    targetOffset = targetOffset.clamp(minScrollExtent, maxScrollExtent);
    
    _categoryScrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
    );
  }

  Widget _buildCategorySelector(PpeLogData data) {
    final categories = [
      _CategoryItem('Helmet', Icons.engineering_outlined, BrandColors.mediumBlue, data.helmet.total, 0),
      _CategoryItem('Vest', Icons.accessibility_new_outlined, Colors.orange, data.vest.total, 1),
      _CategoryItem('Gloves', Icons.pan_tool_outlined, Colors.teal, data.gloves.total, 2),
      _CategoryItem('Glasses', Icons.visibility_outlined, Colors.purple, data.glasses.total, 3),
      _CategoryItem('Mask', Icons.masks_outlined, Colors.blueGrey, data.mask.total, 4),
      _CategoryItem('Boots', Icons.hiking, Colors.brown, data.boots.total, 5),
    ];

    return SizedBox(
      height: 52,
      child: ListView.separated(
        controller: _categoryScrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = _selectedTabIndex == cat.index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTabIndex = cat.index;
              });
              _pageController.animateToPage(
                cat.index,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOutCubic,
              );
              _scrollToCategory(cat.index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? cat.color : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? cat.color.withOpacity(0.3) : Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    cat.icon,
                    color: isSelected ? Colors.white : cat.color,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${cat.name} (${cat.count})',
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaginationControls(int currentPage, int lastPage, {required VoidCallback onPrev, required VoidCallback onNext}) {
    if (lastPage <= 1) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: currentPage > 1 ? onPrev : null,
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
              color: currentPage > 1 ? BrandColors.mediumBlue : Colors.grey.shade400,
            ),
          ),
          Text(
            'Page $currentPage of $lastPage',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: currentPage < lastPage ? onNext : null,
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: currentPage < lastPage ? BrandColors.mediumBlue : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(int index) {
    switch (index) {
      case 0:
        return Icons.engineering_rounded;
      case 1:
        return Icons.accessibility_new_rounded;
      case 2:
        return Icons.pan_tool_rounded;
      case 3:
        return Icons.visibility_rounded;
      case 4:
        return Icons.masks_rounded;
      case 5:
        return Icons.hiking_rounded;
      default:
        return Icons.engineering_rounded;
    }
  }

  Widget _buildLogCard(PpeLogItem item) {
    final hasImage = item.image != null && item.image!.isNotEmpty;

    return Container(
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
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
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
                        imageUrl: item.image!.startsWith('http')
                            ? item.image!
                            : '${ApiConstants.host}${item.image}',
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
                        errorWidget: (context, url, error) => _buildImagePlaceholder(),
                      )
                    : _buildImagePlaceholder(),
                // Status badge
                if (item.status != null)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getStatusColor(item.status!).withOpacity(0.9),
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
                        item.status!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                // ID badge
                if (item.id != null)
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '#${item.id}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
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
                    color: _getStatusColor(item.status ?? 'Safe').withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getCategoryIcon(_selectedTabIndex),
                    color: _getStatusColor(item.status ?? 'Safe'),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getCategoryName(_selectedTabIndex).toUpperCase(),
                        style: TextStyle(
                          color: _getStatusColor(item.status ?? 'Safe'),
                          fontWeight: FontWeight.w900,
                          fontSize: 11,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.location ?? 'Unknown Location',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.createdAt != null ? _formatDate(item.createdAt!) : '',
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
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 180,
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 48, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(
            'No Image',
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState({Key? key}) {
    final catName = _getCategoryName(_selectedTabIndex);
    return Center(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.green[400],
              size: 56,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No $catName Logs',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'All clear! No violations detected.',
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: Colors.red[400],
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load PPE logs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$error',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.invalidate(ppeLogsProvider(
                  helmetPage: _helmetPage,
                  vestPage: _vestPage,
                  glovesPage: _glovesPage,
                  glassesPage: _glassesPage,
                  maskPage: _maskPage,
                  bootsPage: _bootsPage,
                ));
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: BrandColors.mediumBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'detected':
      case 'violation':
        return Colors.red;
      case 'handled':
      case 'resolved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 60) {
        return '${diff.inMinutes}m ago';
      } else if (diff.inHours < 24) {
        return '${diff.inHours}h ago';
      } else if (diff.inDays < 7) {
        return '${diff.inDays}d ago';
      } else {
        return '${date.day}/${date.month}/${date.year}';
      }
    } catch (_) {
      return dateStr;
    }
  }

  Widget _buildAnimatedItem({required int index, required Widget child}) {
    final clampedIndex = index.clamp(0, 9);
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
          .animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(
                clampedIndex * 0.1,
                1.0,
                curve: Curves.easeOutCubic,
              ),
            ),
          ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(clampedIndex * 0.1, 1.0, curve: Curves.easeOut),
          ),
        ),
        child: child,
      ),
    );
  }

  Route _createSlideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverHeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _SliverHeaderDelegate oldDelegate) {
    return oldDelegate.child != child || oldDelegate.height != height;
  }
}
