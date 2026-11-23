import 'package:dormly/constant/app_colors.dart';
import 'package:dormly/controller/seeker/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/hostel_cards.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // Initialize the GetX controller
  final ExploreController controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Greeting & Notification Bell
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Ali',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Lahore near FAST University',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.snackbar('Notifications', 'Opening notifications...');
                    },
                    icon: const Icon(Icons.notifications_none_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor:
                          isDark ? AppColors.darkSurface : AppColors.lightSurface,
                      side: BorderSide(
                        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // 2. Search Bar
              TextField(
                onChanged: controller.updateSearch,
                decoration: InputDecoration(
                  hintText: 'Search area or university',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.tune_rounded),
                    onPressed: () {
                      Get.snackbar('Filters', 'Opening filter screen...');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 3. Horizontal Filter Chips (Reactive with Obx)
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = controller.filters[index];
                    return Obx(() {
                      final isSelected = controller.selectedFilter.value == filter;
                      return ChoiceChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (_) => controller.changeFilter(filter),
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary),
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 22),

              // 4. Featured Section
              Text(
                'Featured',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Obx(() {
                final featured = controller.filteredHostels
                    .where((h) => h.isFeatured)
                    .toList();

                if (featured.isEmpty) {
                  return Text(
                    'No featured hostels match this filter.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }

                return Column(
                  children: featured
                      .map(
                        (hostel) => HostelCard(
                          hostel: hostel,
                          onTap: () => Get.snackbar(
                            hostel.name,
                            'Opening hostel details...',
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
              const SizedBox(height: 18),

              // 5. Near Your University Section
              Text(
                'Near your university',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Obx(() {
                final nearby = controller.filteredHostels;

                if (nearby.isEmpty) {
                  return Text(
                    'No hostels found.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }

                return Column(
                  children: nearby
                      .map(
                        (hostel) => HostelCard(
                          hostel: hostel,
                          onTap: () => Get.snackbar(
                            hostel.name,
                            'Opening hostel details...',
                          ),
                        ),
                      )
                      .toList(),
                );
              }),
            ],
          ),
        ),
      ),

      // 6. Bottom Navigation Bar (Reactive with Obx)
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          onTap: controller.changeNavIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Map'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_rounded), label: 'Requests'),
                
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}