import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentaride/firebase_options.dart';
import 'package:rentaride/injection_container.dart';
import 'package:rentaride/presentation/bloc/car_bloc.dart';
import 'package:rentaride/presentation/bloc/car_event.dart';
import 'package:rentaride/presentation/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Firebasek
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // DependencyInjection using GetIt
  initInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        title: 'Rent A Ride',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnBoardingScreen(),
        // home: MapDetailsScreen(),
      ),
    );
  }
}
