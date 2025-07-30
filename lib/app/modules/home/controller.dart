import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> topSaleList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredList = <Map<String, dynamic>>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopSale();
  }

  Future<void> fetchTopSale() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        topSaleList.value = List<Map<String, dynamic>>.from(data);
        filteredList.value = topSaleList;
      } else {
        Get.snackbar("Error", "Failed to fetch products");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
    isLoading.value = false;
  }

  void search(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      filteredList.value = topSaleList;
    } else {
      final lowerQuery = query.toLowerCase();
      filteredList.value = topSaleList.where((item) {
        final title = (item['title'] ?? '').toString().toLowerCase();
        return title.contains(lowerQuery);
      }).toList();
    }
  }

  Map<String, dynamic>? paymentIntentData;



  ///=========================================Stripe=======================================

  Map<String, dynamic>? paymentIntentData;

  // Your Stripe Secret Key (test mode only! NEVER use in production like this)
  // final String secretKey = 'sk_test_51RV4ORDENSObmJv7hzL2FXhdxnFao8LQs5xvsiFfdT2Sc7is3BeGQiFa20pRMmJ4xNCHxZ6WedqLyjbWL4Ueiwwh007MO3ZZEy';

  Future<void> payment(String amount, String currency) async {
    Stripe.publishableKey = stripePublishableKey;
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);

      if (paymentIntentData == null) {
        Get.snackbar("Error", "Failed to create payment intent");
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: 'Demo Store',
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      CommonSnackBarMessage.successMessage(text: "Payment Successful");
      Get.offAllNamed(RouteNames.navbar);
    } catch (e) {
      CommonSnackBarMessage.errorMessage(text: "Payment Failed");

      log(e.toString());
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {'Authorization': 'Bearer $stripeSecretKey', 'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'amount': (double.parse(amount) * 100).toInt().toString(), 'currency': currency, 'payment_method_types[]': 'card'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log('Failed to create payment intent: ${response.body}');
        return null;
      }
    } catch (e) {
      log('Error creating payment intent: $e');
      return null;
    }
  }
}
