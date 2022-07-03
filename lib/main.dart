import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/register/regitser.dart';
import 'package:payment/shared/component/dio.dart';

import 'modules/payment/cubit/payment_cubit.dart';

void main() async {
  await DioHelperPayment.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers : [
 
        BlocProvider<PaymentCubit>(
            create: (BuildContext context) => PaymentCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:RegisterScreen()
      ),
    );
  }
}

