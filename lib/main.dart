import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery/constants/theme.dart';
import 'package:grocery/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:grocery/provider/app_provider.dart';
import 'package:grocery/screens/auth_ui/welcome/Welcome.g.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:provider/provider.dart';

import 'firebase_helper/firebase_options/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_live_51O5UDaSGGCBVLHCcqC2fsaBZq01Ode7MrjrrvkZ7q8CX19B3PHUjkJQRjcNw98r6VKv2xGlaE413lWCK2if5IKE000Itkr5nTP";

  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shoe hub',
          theme: themeData,
          home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const CustomBottomBar();
              }
              return const Welcome();
            },
          )),
    );
  }
}
