import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/data/sources/firebase_car_data.dart';
import 'package:rentaride/domain/repositories/car_repository.dart';

// class CarRepositoryImpl implements CarRepository {
//   final FirebaseCarDataSource dataSource;

//   CarRepositoryImpl({required this.dataSource});

//   @override
//   Future<List<Car>> fetchCars() {
//     return dataSource.getCars();
//   }
// }

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
