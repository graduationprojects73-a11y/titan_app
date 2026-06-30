import 'package:flutter/material.dart';
import 'package:titan/core/theme/brand_colors.dart';

class VestDetectionScreen extends StatefulWidget {
  const VestDetectionScreen({super.key});

  @override
  State<VestDetectionScreen> createState() => _VestDetectionScreenState();
}

class _VestDetectionScreenState extends State<VestDetectionScreen> {
  String _selectedTab = 'All'; // 'All', 'New', 'Handled'

  final List<Map<String, dynamic>> _detections = [
    {
      'id': '1',
      'location': 'Production Line A, Zone 3',
      'time': '2024-07-26 10:30 AM',
      'category': 'Manufacturing',
      'status': 'New', // New, Handled
      'image': 'assets/images/vest1.png', // Placeholder
    },
    {
      'id': '2',
      'location': 'Warehouse Storage, Section 5',
      'time': '2024-07-26 09:15 AM',
      'category': 'Logistics',
      'status': 'Handled',
      'image': 'assets/images/vest2.png', // Placeholder
    },
    {
      'id': '3',
      'location': 'Assembly Area 2, West Gate',
      'time': '2024-07-25 03:40 PM',
      'category': 'Assembly',
      'status': 'New',
      'image': 'assets/images/vest3.png', // Placeholder
    },
  ];

  List<Map<String, dynamic>> get _filteredDetections {
    if (_selectedTab == 'All') return _detections;
    return _detections.where((d) => d['status'] == _selectedTab).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Vest Detection',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                _buildTab('All', _selectedTab == 'All'),
                const SizedBox(width: 12),
                _buildTab('New', _selectedTab == 'New'),
                const SizedBox(width: 12),
                _buildTab('Handled', _selectedTab == 'Handled'),
              ],
            ),
          ),
          const Divider(height: 1),
          // List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredDetections.length,
              itemBuilder: (context, index) {
                final item = _filteredDetections[index];
                return _buildDetectionCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? BrandColors.mediumBlue : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDetectionCard(Map<String, dynamic> item) {
    bool isNew = item['status'] == 'New';

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Overlay Section
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.grey, // Placeholder
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.white54),
                  ), // Placeholder for image
                ),
              ),
              // Gradient Overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Text Content Overlay
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['location'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['time'],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isNew
                        ? const Color(0xFFE53935)
                        : BrandColors.mediumBlue, // Red if New, Blue if Handled (top badge)
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    isNew ? 'New' : 'Handled',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Action & Category Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      size: 18,
                      color: Colors.black54,
                    ), // Factory icon
                    const SizedBox(width: 8),
                    Text(
                      item['category'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (isNew)
                  SizedBox(
                    width: double.infinity, // block button
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          item['status'] = 'Handled';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BrandColors.mediumBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Mark as Handled",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Handled",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.check, size: 18, color: Colors.grey[600]),
                      ],
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
