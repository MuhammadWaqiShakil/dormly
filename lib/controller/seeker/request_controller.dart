import 'package:dormly/model/request_model.dart';
import 'package:get/get.dart';


class RequestController extends GetxController {
  // 1. Track which tab is selected (.obs makes it reactive)
  var selectedTab = 'All'.obs;

  // The 3 filter options
  final List<String> tabs = ['All', 'Active', 'Past'];

  // 2. Static mock data matching your design
  final List<RequestModel> allRequests = [
    RequestModel(
      hostelName: 'Sunrise Hostel',
      roomType: 'Double',
      moveInDate: '1 Dec',
      status: 'Visit scheduled',
      isActive: true,
    ),
    RequestModel(
      hostelName: 'Cedar House',
      roomType: 'Single',
      moveInDate: '5 Dec',
      status: 'Pending',
      isActive: true,
    ),
    RequestModel(
      hostelName: 'Nest Hostel',
      roomType: 'Double',
      moveInDate: '1 Dec',
      status: 'Rejected',
      isActive: false,
    ),
    RequestModel(
      hostelName: 'Green Villa',
      roomType: 'Triple',
      moveInDate: '10 Dec',
      status: 'Expired',
      isActive: false,
    ),
    RequestModel(
      hostelName: 'Maple Stay',
      roomType: 'Double',
      moveInDate: '15 Nov',
      status: 'Booked',
      isActive: false,
    ),
  ];

  // 3. Return only the requests that match the selected tab
  List<RequestModel> get filteredRequests {
    if (selectedTab.value == 'Active') {
      return allRequests.where((r) => r.isActive).toList();
    } else if (selectedTab.value == 'Past') {
      return allRequests.where((r) => !r.isActive).toList();
    }
    return allRequests; // 'All'
  }

  // 4. Function to change the tab when tapped
  void changeTab(String tab) {
    selectedTab.value = tab;
  }
}