import 'dart:developer';

import 'package:app_purchase_stripe/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({super.key});

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  final _razorpay = Razorpay();
  var amountController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
        _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
      },
    );
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('Success ${response.orderId}');

    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          content: SizedBox(
            height: 80,
            width: 280,
            child: Center(
              child: Text(
                'Payment Successful',
              ),
            ),
          ),
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Failure ${response.message}');
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          content: SizedBox(
            height: 80,
            width: 280,
            child: Center(
              child: Text(
                'Payment Unsuccessful',
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    _razorpay.clear();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RazorPay Integration',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                isDense: true,
                hintText: "Enter amount",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                var options = {
                  'key': AppConstant.razorpayKeyId,
                  'amount': '${int.parse(amountController.text) * 100}',
                  'name': 'Ashwini',
                  'description': 'Payment',
                  'timeout': 300,
                  'prefill': {
                    'contact': '8787878787',
                    'email': 'abc.kumar@example.com'
                  }
                };
                _razorpay.open(options);
              },
              child: const Text(
                "Make payment",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
