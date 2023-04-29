import 'package:app_purchase_stripe/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51MDoRwSEwlTgujM2bRa04V2tzY1rxSnJkhbWlYBFRDBk8M8gqu3tBP1uagcwjxGe89778HzdPoZ9NmtSSwu6ERnC001cRuGxjW';
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Methods',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}
