import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/domain/repositories/car_repository.dart';

// class GetCars {
//   final CarRepository repository;

//   GetCars(this.repository);

//   Future<List<Car>> call() async {
//     return await repository.fetchCars();
//   }
// }

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}
