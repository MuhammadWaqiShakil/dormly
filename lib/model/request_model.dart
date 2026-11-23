class RequestModel {
  final String hostelName;
  final String roomType;    // e.g., 'Double', 'Single', 'Triple'
  final String moveInDate;  // e.g., '1 Dec', '5 Dec'
  final String status;      // e.g., 'Visit scheduled', 'Pending', 'Booked'
  final bool isActive;      // true = shows in 'Active', false = shows in 'Past'

  RequestModel({
    required this.hostelName,
    required this.roomType,
    required this.moveInDate,
    required this.status,
    required this.isActive,
  });
}