import 'package:flutter/material.dart';
import 'package:function_world_app/core/app_colors.dart';
import 'package:function_world_app/core/service/payment_service.dart';
import 'package:function_world_app/pages/vendors/vendor_registeration/vendor_welcome.dart';

class VendorPaymentGatewayScreen extends StatefulWidget {
  const VendorPaymentGatewayScreen({super.key});

  static String routeName = "/vendor/payment";

  @override
  State<VendorPaymentGatewayScreen> createState() =>
      _VendorPaymentGatewayScreenState();
}

class _VendorPaymentGatewayScreenState
    extends State<VendorPaymentGatewayScreen> {
  late PaymentService _paymentService;
  var err = null;

  @override
  void initState() {
    super.initState();

    _paymentService = PaymentService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/card.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              width: 300,
              child: Text(
                "As Per Payment Gateway",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(201, 176, 89, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Text(
                "The customizable, no hidden fee, instant discount debit or credit card",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(107, 114, 128, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.buttonColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // No rounded edges
                  ),
                ),
              ),
              onPressed: () {
                err = _paymentService.makePayment();

                if (err == null) {
                  Navigator.pushNamed(context, VendorsWelcome.routeName);
                }
              },
              child: Text(
                "Pay Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Divider(
            color: Color.fromRGBO(201, 176, 89, 1),
            thickness: 4,
            endIndent: 120,
            indent: 120,
          )
        ],
      ),
    );
  }
}
