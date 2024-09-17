import 'package:flutter/material.dart';
import 'package:rentaride/constants/custom_box_shadow.dart';
import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/presentation/screens/car_details_screen.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarDetailsScreen(car: car)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            customBoxShadow(),
          ],
        ),

        // CarCard Assets
        child: Column(
          children: [
            // CarImage
            // if needed, image links of each car can be stored in the car_model but in our case we only have 1 image so its not necessary.
            Image.asset(
              'assets/car_image.png',
              height: 120,
            ),

            // CarModel Name
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // FuelCapacity & DistanceTravelled
                Row(
                  children: [
                    // CarDistance has Already Travelled
                    Row(
                      children: [
                        // ArrowGps Image
                        Image.asset('assets/gps.png'),

                        // Gap
                        const SizedBox(width: 5),

                        // CarDistanceTravelled
                        Text('${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),

                    // Gap
                    const SizedBox(width: 10),

                    // CarFuelCapacity
                    Row(
                      children: [
                        // FuelPump Image
                        Image.asset('assets/pump.png'),

                        // Gap
                        const SizedBox(width: 5),

                        // CarFuelCapacity
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),

                // PricePerHour
                Text('\$${car.pricePerHour.toStringAsFixed(2)}/hr')
              ],
            )
          ],
        ),
      ),
    );
  }
}
