import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentaride/data/models/car_model.dart';

class FirebaseCarData {
  final FirebaseFirestore firestore;

  FirebaseCarData({required this.firestore});

  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
