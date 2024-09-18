import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentaride/data/models/car_model.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    for (var doc in snapshot.docs) {
      print('Car details: ${doc.data()}');
    }
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
