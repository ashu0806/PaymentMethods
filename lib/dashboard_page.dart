import 'package:app_purchase_stripe/paypal_page.dart';
import 'package:app_purchase_stripe/razorpay_page.dart';
import 'package:app_purchase_stripe/stripe_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List pages = [
    const StripePage(),
    const RazorPayPage(),
    const PayPalPage(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment_sharp,
              ),
              label: "Stripe",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment_sharp,
              ),
              label: "RazorPay",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment_sharp,
              ),
              label: "PayPal",
            ),
          ],
        ),
      ),
    );
  }
}
