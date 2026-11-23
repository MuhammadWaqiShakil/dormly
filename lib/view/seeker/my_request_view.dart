import 'package:dormly/constant/app_colors.dart';
import 'package:dormly/controller/seeker/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/request_card.dart';

class MyRequestsView extends StatelessWidget {
  MyRequestsView({super.key});

  // Connect to the GetX controller
  final RequestController controller = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My requests'),
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
    );
  }
}