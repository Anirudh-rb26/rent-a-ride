import 'package:flutter/material.dart';
import 'package:rentaride/constants/custom_box_shadow.dart';
import 'package:rentaride/data/models/car_model.dart';
import 'package:rentaride/presentation/screens/map_details_screen.dart';
import 'package:rentaride/presentation/widgets/car_card.dart';
import 'package:rentaride/presentation/widgets/more_option_card.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;
  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });

    _animationController!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.forward();
    super.dispose();
  }

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
          CarCard(car: widget.car),

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
                        MaterialPageRoute(builder: (context) => MapDetailsScreen(car: widget.car)),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [customBoxShadow()],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/maps.png',
                            fit: BoxFit.cover,
                          ),
                        ),
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
              MoreOptionCard(car: widget.car),
              MoreOptionCard(car: widget.car),
              MoreOptionCard(car: widget.car),
              MoreOptionCard(car: widget.car),
              // MoreOptionCard(car: Car(model: "Fortuner GR", distance: 870, fuelCapacity: 80, pricePerHour: 160)),
            ],
          ),
        ],
      ),
    );
  }
}
