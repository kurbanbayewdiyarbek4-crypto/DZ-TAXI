
class UserProfile {
  final String id;
  final String name;
  final String phone;
  final String role;
  final String? carModel;
  final String? carNumber;

  UserProfile({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    this.carModel,
    this.carNumber,
  });

  bool get isDriver => role == 'driver';
}
