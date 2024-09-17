import 'package:flutter/material.dart';
import 'package:rentaride/data/models/car_model.dart';

class MoreOptionCard extends StatelessWidget {
  final Car car;

  const MoreOptionCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xff212020),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ModelName
                Text(
                  car.model,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),

                // Gap
                const SizedBox(height: 5),

                // CarInfo
                Row(
                  children: [
                    // DistanceTravelled
                    const Icon(Icons.directions_car, color: Colors.white, size: 16),

                    // Gap
                    const SizedBox(width: 5),

                    // DistanceTravelledText
                    Text(
                      '${car.distance}km',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),

                    // Gap
                    const SizedBox(width: 10),

                    // FuelCapacity
                    const Icon(Icons.battery_full, color: Colors.white, size: 16),

                    // Gap
                    const SizedBox(width: 5),

                    // FuelCapacityText
                    Text(
                      '${car.fuelCapacity}L',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
