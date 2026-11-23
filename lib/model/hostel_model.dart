class HostelModel {
  final String name;
  final String area;
  final String genderType; // 'Boys', 'Girls', 'Co-ed'
  final double rating;
  final String distanceText;
  final int price;
  final bool isVerified;
  final bool hasMeals;
  final bool isFeatured;

  HostelModel({
    required this.name,
    required this.area,
    required this.genderType,
    required this.rating,
    required this.distanceText,
    required this.price,
    required this.isVerified,
    required this.hasMeals,
    this.isFeatured = false,
  });
}