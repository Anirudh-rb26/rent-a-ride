import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rentaride/data/repositories/car_repository_impl.dart';
import 'package:rentaride/data/sources/firebase_car_data.dart';
import 'package:rentaride/domain/repositories/car_repository.dart';
import 'package:rentaride/domain/usecases/get_cars.dart';
import 'package:rentaride/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(() => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(() => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw (e);
  }
}
