import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentService extends ChangeNotifier {
  static Future<bool> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      var paymentIntent = await createPaymentIntent('10000', 'INR');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Function World'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      var result = displayPaymentSheet();
      return result;
    } catch (err) {
      Get.snackbar("Payment Provider", "Payment not successful");
      return false;
    }
  }

  static createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  static Future<bool> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {});
      return true;
    } catch (e) {
      Get.snackbar("Payment Provider", "Payment not successful");
      return false;
    }
  }
}
