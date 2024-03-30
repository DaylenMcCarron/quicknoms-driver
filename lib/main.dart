import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknomsdriver/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:quicknomsdriver/controller/provider/profileProvider/profileProvider.dart';
import 'package:quicknomsdriver/firebase_options.dart';
import 'package:quicknomsdriver/view/driverRegistrationScreen/driverRegistrationScreen.dart';
import 'package:quicknomsdriver/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const UberEats());
}

class UberEats extends StatelessWidget {
  const UberEats({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<MobileAuthProvider>(
            create: (_) => MobileAuthProvider(),
          ),
          ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider(),
          ),
          // ChangeNotifierProvider<RideProvider>(
          //   create: (_) => RideProvider(),
          // ),
          // ChangeNotifierProvider<OrderProvider>(
          //   create: (_) => OrderProvider(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          // home: const DriverRegistrationScreen(),
          home: const SignInLogicScreen(),
        ),
      );
    });
  }
}
