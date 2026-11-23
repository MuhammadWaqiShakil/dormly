import 'package:dormly/model/hostel_model.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  // Reactive variables (.obs)
  var selectedFilter = 'All'.obs;
  var searchQuery = ''.obs;
  var currentNavIndex = 0.obs;

  // Filter chip options from Screen 9
  final List<String> filters = ['All', 'Boys', 'Girls', 'Under 15k', 'Meals'];

  // Static mock data
  final List<HostelModel> allHostels = [
    HostelModel(
      name: 'Sunrise Hostel',
      area: 'Gulberg',
      genderType: 'Boys',
      rating: 4.6,
      distanceText: '12 min',
      price: 12000,
      isVerified: true,
      hasMeals: true,
      isFeatured: true,
    ),
    HostelModel(
      name: 'Cedar House',
      area: 'Johar Town',
      genderType: 'Boys',
      rating: 4.7,
      distanceText: '9 min',
      price: 15500,
      isVerified: true,
      hasMeals: false,
      isFeatured: false,
    ),
    HostelModel(
      name: 'Nest Hostel',
      area: 'Model Town',
      genderType: 'Girls',
      rating: 4.1,
      distanceText: '20 min',
      price: 10000,
      isVerified: true,
      hasMeals: true,
      isFeatured: false,
    ),
  ];

  // Getter that automatically filters hostels based on chip & search text
  List<HostelModel> get filteredHostels {
    return allHostels.where((hostel) {
      // 1. Search filter
      final matchesSearch = hostel.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          hostel.area.toLowerCase().contains(searchQuery.value.toLowerCase());

      if (!matchesSearch) return false;

      // 2. Chip filter
      switch (selectedFilter.value) {
        case 'Boys':
          return hostel.genderType == 'Boys';
        case 'Girls':
          return hostel.genderType == 'Girls';
        case 'Under 15k':
          return hostel.price <= 15000;
        case 'Meals':
          return hostel.hasMeals;
        default:
          return true; // 'All'
      }
    }).toList();
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }

  void changeNavIndex(int index) {
    currentNavIndex.value = index;
  }
}