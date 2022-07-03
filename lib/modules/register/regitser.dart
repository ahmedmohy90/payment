import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/payment/cubit/payment_cubit.dart';
import 'package:payment/modules/payment/cubit/payment_states.dart';
import 'package:payment/shared/component/components.dart';
import 'package:payment/shared/style/colors.dart';

import '../payment/toggle.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            print(state);
            if(state is PaymentRefCodeSuccessState){
             
            }
          },
          builder: (ctx, state) {
            return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: AppBar(
                  backgroundColor: defaultColor,
                  title: const Center(
                    child: Text('Payment'),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultformEleld(
                                controller: firstNameController,
                                type: TextInputType.name,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter your first name';
                                  }
                                  return null;
                                },
                                label: 'First Name',
                                prefix: Icons.person),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultformEleld(
                                controller: lastNameController,
                                type: TextInputType.name,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter your last name';
                                  }
                                  return null;
                                },
                                label: 'last Name',
                                prefix: Icons.person),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultformEleld(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter your Email';
                                  }
                                  return null;
                                },
                                label: 'Email',
                                prefix: Icons.email),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultformEleld(
                                controller: phoneController,
                                type: TextInputType.phone,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter your phone';
                                  }
                                  return null;
                                },
                                label: 'phone',
                                prefix: Icons.phone),
                            const SizedBox(
                              height: 20,
                            ),
                            defaultformEleld(
                                controller: priceController,
                                type: TextInputType.number,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter your price';
                                  }
                                  return null;
                                },
                                label: 'Price',
                                prefix: Icons.person),
                            const SizedBox(
                              height: 50,
                            ),
                            defaultButton(
                                function: () async{
                                  if(_formKey.currentState!.validate()){
                                     await  PaymentCubit.get(context).getFirstToken(
                                   priceController.text,
                                   firstNameController.text,
                                   lastNameController.text,
                                   emailController.text,
                                   phoneController.text
                                   );
                                    NavigateTo(context, const ToggleScreen());
                                  }                             
                                  //  
                                },
                                text: 'Go To Pay',
                                radius: 12,
                                width: 200)
                          ]),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
