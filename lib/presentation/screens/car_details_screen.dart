import 'package:flutter/material.dart';
import 'package:rentaride/constants/custom_box_shadow.dart';
import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/presentation/screens/map_details_screen.dart';
import 'package:rentaride/presentation/widgets/car_card.dart';
import 'package:rentaride/presentation/widgets/more_option_card.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(width: 5),
            Text("Details"),
          ],
        ),
      ),
      body: Column(
        children: [
          // CarCard
          CarCard(car: car),

          // Gap
          const SizedBox(height: 20),

          // UserContainer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // UserAvatarContainer
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        customBoxShadow(),
                      ],
                    ),
                    child: const Column(
                      children: [
                        // UserAvatar
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),

                        // Gap
                        SizedBox(height: 10),

                        // UserName
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        // WalletBalance
                        Text(
                          '\$4,325',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),

                // Gap
                const SizedBox(width: 20),

                //MapsContainer
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapDetailsScreen(car: car)),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/maps.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [customBoxShadow()],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Gap
          const SizedBox(height: 10),

          Column(
            children: [
              MoreOptionCard(car: car),
              MoreOptionCard(car: car),
              MoreOptionCard(car: car),
              MoreOptionCard(car: car),
              // MoreOptionCard(car: Car(model: "Fortuner GR", distance: 870, fuelCapacity: 80, pricePerHour: 160)),
            ],
          ),
        ],
      ),
    );
  }
}
