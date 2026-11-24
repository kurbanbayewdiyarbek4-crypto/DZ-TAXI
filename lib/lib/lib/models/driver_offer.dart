
class DriverOffer {
  final String id;
  final String driverName;
  final String rideId;
  final double offeredPrice;
  final bool accepted;

  DriverOffer({
    required this.id,
    required this.driverName,
    required this.rideId,
    required this.offeredPrice,
    this.accepted = false,
  });
}
