import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class PayPalPage extends StatefulWidget {
  const PayPalPage({super.key});

  @override
  State<PayPalPage> createState() => _PayPalPageState();
}

class _PayPalPageState extends State<PayPalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PayPal Integration',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UsePaypal(
                      sandboxMode: true,
                      clientId:
                          "AfGZwXtm1IAQ4Dq_3PqYWCxsZSVxA9-rHHOQ9ATDV3l_V0arVWqtsVHQQlFe7HM1CerjCIAjjy7gTMGK",
                      secretKey:
                          "EPpa__KYcBoEq8n04-_l-NB4hHA-mSdg1D4tdz7FNNs82WjjWUZHnNamonmDp4HZ7pgSx1_e7giqGjbT",
                      returnURL: "https://samplesite.com/return",
                      cancelURL: "https://samplesite.com/cancel",
                      transactions: const [
                        {
                          "amount": {
                            "total": '10.12',
                            "currency": "USD",
                            "details": {
                              "subtotal": '10.12',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "A demo product",
                                "quantity": 1,
                                "price": '10.12',
                                "currency": "USD"
                              }
                            ],

                            // shipping address is not required though
                            // "shipping_address": {
                            //   "recipient_name": "Jane Foster",
                            //   "line1": "Travis County",
                            //   "line2": "",
                            //   "city": "Austin",
                            //   "country_code": "US",
                            //   "postal_code": "73301",
                            //   "phone": "+00000000",
                            //   "state": "Texas"
                            // },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        log("onSuccess: $params");
                      },
                      onError: (error) {
                        log("onError: $error");
                      },
                      onCancel: (params) {
                        log('cancelled: $params');
                      },
                    ),
                  ),
                );
              },
              child: const Text(
                "Make payment",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
