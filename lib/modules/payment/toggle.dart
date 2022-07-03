import 'package:flutter/material.dart';
import 'package:payment/modules/payment/visa_card_screen.dart';
import 'package:payment/shared/component/components.dart';
import '../../shared/style/colors.dart';
import 'ref_code_screen.dart';


class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: InkWell(
                onTap: (() {
                  NavigateTo(context, const VisaCardScrren());
                }),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: defaultColor)),
                  width: double.infinity,
                  child: Column(children: const [
                    Image(image: AssetImage('assets/images/visa_img.png')),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Payment With Card',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: InkWell(
                onTap: (() {
                  NavigateTo(context, const RefCodeScreen());
                }),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: defaultColor)),
                  width: double.infinity,
                  child: Column(children: const [
                    Image(image: AssetImage('assets/images/refCode.png')),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Payment With Ref Code',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
 