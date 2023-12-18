// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:grocery/provider/app_provider.dart';
import 'package:grocery/screens/custom_bottom_bar/custom_bottom_bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StripeHelper {
  static StripeHelper instance = StripeHelper();

  Map<String, dynamic>? paymentIntent;
  Future<void> makePayment(String amount, BuildContext context) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'INR');

      var gpay = const PaymentSheetGooglePay(
          merchantCountryCode: "+91", currencyCode: "INR", testEnv: true);

//STEP 2: Initialize Payment Sheet

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent?[
                      'client_secret'], //Gotten from payment intent

                  style: ThemeMode.light,
                  merchantDisplayName: 'Marzook',
                  googlePay: gpay))
          .then((value) {});

//STEP 3: Display Payment sheet
      displayPaymentSheet(context);
    } catch (err) {
      showMessage(err.toString());
    }
  }

  displayPaymentSheet(BuildContext context) async {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    try {
      await Stripe.instance.presentPaymentSheet().then((value) async {
        bool value = await FirebaseFirestoreHelper.instance
            .uploadOrderProductFirebase(
                appProvider.getBuyProductList, context, "paid");

        appProvider.clearBuyProduct();
        if (value) {
          Future.delayed(const Duration(seconds: 2), () {
            Routes.instance
                .push(widget: const CustomBottomBar(), context: context);
          });
        }
      });
    } catch (e) {
      showMessage(e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer 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',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
