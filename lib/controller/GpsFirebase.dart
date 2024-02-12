import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveRunningPath(String userId, List<Position> positions) async {
    final path = positions
        .map((position) => {
              'latitude': position.latitude,
              'longitude': position.longitude,
              'timestamp': position.timestamp.toIso8601String(),
            })
        .toList();

    await _db.collection('running_paths').doc(userId).set({'path': path});
  }
}
