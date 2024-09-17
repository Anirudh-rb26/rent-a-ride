import 'package:flutter/material.dart';
import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(model: "Fortuner GR", distance: 870, fuelCapacity: 80, pricePerHour: 160),
    Car(model: "Fortuner GR", distance: 480, fuelCapacity: 80, pricePerHour: 160),
    Car(model: "Fortuner GR", distance: 110, fuelCapacity: 80, pricePerHour: 160),
    Car(model: "Fortuner GR", distance: 830, fuelCapacity: 80, pricePerHour: 160),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Choose your Ride"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
