import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/presentation/bloc/car_bloc.dart';
import 'package:rentaride/presentation/bloc/car_state.dart';
import 'package:rentaride/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Choose your Ride"),
        centerTitle: true,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          // Returns A Loader if Carslist isLoading
          if (state is CarsLoading) {
            debugPrint("CarsLoading");
            return const Center(child: CircularProgressIndicator());
            // Returns CarsList when Carslist is loaded
          } else if (state is CarsLoaded) {
            debugPrint("${state.cars.length}");
            debugPrint("${state.cars}");
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
            // Returns ErrorMessage if CarsList has Error
          } else if (state is CarsError) {
            debugPrint("error");
            debugPrint(state.message);
            return Center(
              child: Text("Error: ${state.message}"),
            );
            // Returns EmptyContainer
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
