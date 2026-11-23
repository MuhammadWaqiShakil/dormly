import 'package:dormly/constant/app_colors.dart';
import 'package:dormly/controller/seeker/explore_controller.dart';
import 'package:dormly/controller/seeker/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/request_card.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  // Connect to the GetX controller
  final RequestController controller = Get.put(RequestController());
  final ExploreController exploreController = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Filter Tabs: All, Active, Past
            Row(
              children: controller.tabs.map((tab) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Obx(() {
                    final isSelected = controller.selectedTab.value == tab;
                    return ChoiceChip(
                      label: Text(tab),
                      selected: isSelected,
                      onSelected: (_) => controller.changeTab(tab),
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
                  }),
                );
              }).toList(),
            ),
            const SizedBox(height: 18),

            // 2. Request Cards List (Updates automatically with Obx)
            Expanded(
              child: Obx(() {
                final requests = controller.filteredRequests;

                if (requests.isEmpty) {
                  return Center(
                    child: Text(
                      'No requests found.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final item = requests[index];
                    return RequestCard(
                      request: item,
                      onTap: () {
                        Get.snackbar(
                          item.hostelName,
                          'Status: ${item.status}',
                        );
                      },
                    );
                  },
                );

              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          //currentIndex: controller.currentNavIndex.value,
          //onTap: controller.changeNavIndex,
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