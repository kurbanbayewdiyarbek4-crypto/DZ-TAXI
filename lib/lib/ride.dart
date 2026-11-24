
class Ride {
  final String id;
  final String customerName;
  final String from;
  final String to;
  final double offeredPrice;
  final String status;

  Ride({
    required this.id,
    required this.customerName,
    required this.from,
    required this.to,
    required this.offeredPrice,
    this.status = 'pending',
  });
}
