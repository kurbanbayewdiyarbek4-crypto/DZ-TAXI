
import '../models/ride.dart';

class RideService {
  final List<Ride> _rides = [];

  List<Ride> get rides => List.unmodifiable(_rides);

  void addRide(Ride ride) {
    _rides.add(ride);
  }

  List<Ride> getAvailableRides() {
    return _rides
        .where((ride) => ride.status == 'pending')
        .toList();
  }

  Ride? findRide(String id) {
    for (final ride in _rides) {
      if (ride.id == id) return ride;
    }
    return null;
  }
}
