import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/models/first_token.dart';
import 'package:payment/modules/payment/cubit/payment_states.dart';
import 'package:payment/shared/component/constants.dart';

import '../../../shared/component/dio.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitalstate());
  static PaymentCubit get(context) => BlocProvider.of(context);

  FirstToken? firstToken;

  Future  getFirstToken(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone
    ) async {
   await DioHelperPayment.postData(
        url: 'auth/tokens', data: {'api_key': Paymobapikey}
        ).then((value) {
          //  firstToken = FirstToken.fromJson(value.data);
          // PaymobFirstToken = firstToken!.token;
          PaymobFirstToken = value.data['token'];
          print(PaymobFirstToken);
          getorderId(price, firstName, lastName, email, phone);
          emit(PaymentSuccessState());
        })
        .catchError((error){
          emit(PaymentErrorstate(error.message));
        });
  }
  
  Future getorderId(
    String price,
     String firstName,
    String lastName,
    String email,
    String phone
    )async
    {
 DioHelperPayment.postData(
   url:'ecommerce/orders',
   data:{
      'auth_token':PaymobFirstToken,
      'delivery_needed':'false',
      "amount_cents":price,
      "currency":"EGP",
      "items":[],
   },
 ).then((value){
   orderIdFromToken=value.data['id'].toString();
   print('OrderId :$orderIdFromToken}');
   getToken(price, firstName, lastName, email, phone);
   getKiosk(price, firstName, lastName, email, phone);
    emit(PaymentOrderIdSuccessState());
 }).catchError((error){
    emit(PaymentOrderIdErrorstate(error));
 });
}


Future getToken(
  String price,
  String firstName,
  String lastName,
  String email,
  String phone
)async
{
 DioHelperPayment.postData(
   url:'acceptance/payment_keys',
   data:{
  "auth_token": PaymobFirstToken,
  "amount_cents":price, 
  "expiration": 3600, 
  "order_id": orderIdFromToken,
  "billing_data": {
    "apartment": "NA", 
    "email": email, 
    "floor": "`NA", 
    "first_name": firstName, 
    "street": "NA", 
    "building": "NA", 
    "phone_number": phone, 
    "shipping_method": "NA", 
    "postal_code": "NA", 
    "city": "NA", 
    "country": "NA", 
    "last_name":lastName, 
    "state": "Utah"
  }, 
  "currency": "EGP", 
  "integration_id": IntegrationIDCard,
  "lock_order_when_paid": "false"
},
 ).then((value){
   FinalTokencard=value.data['token'].toString();
   print('final token :$FinalTokencard}');
    emit(PaymentRequestTokenSuccessState());
 }).catchError((error){
    emit(PaymentRequestTokenErrorstate(error));
 });
}


 

Future getKiosk (
  String price,
  String firstName,
  String lastName,
  String email,
  String phone
)async
{
 DioHelperPayment.postData(
   url:'acceptance/payment_keys',
   data:
   {
  "auth_token": PaymobFirstToken,
  "amount_cents":price, 
  "expiration": 3600, 
  "order_id": orderIdFromToken,
  "billing_data": {
    "apartment": "NA", 
    "email": email, 
    "floor": "`NA", 
    "first_name": firstName, 
    "street": "NA", 
    "building": "NA", 
    "phone_number": phone, 
    "shipping_method": "NA", 
    "postal_code": "NA", 
    "city": "NA", 
    "country": "NA", 
    "last_name":lastName, 
    "state": "Utah"
  }, 
  "currency": "EGP", 
  "integration_id": IntegrationIDKiosk,
  "lock_order_when_paid": "false"
},
 
 ).then((value){
   FinalTokenkiosk=value.data['token'].toString();
   print('final kiosk token :$FinalTokenkiosk}');
   getRefCode();
    emit(PaymentkioskTokenSuccessState());
 }).catchError((error){
    emit(PaymentKioskTokenErrorstate(error));
 });
}

Future getRefCode ()async
{
 DioHelperPayment.postData(
   url:'acceptance/payments/pay',
   data:{
  "source": {
    "identifier": "AGGREGATOR", 
    "subtype": "AGGREGATOR"
  },
  "payment_token":FinalTokenkiosk
}
 ).then((value){
   Refcode=value.data['data']['bill_reference'].toString();
   print('ref code is :$Refcode}');
    emit(PaymentRefCodeSuccessState());
 }).catchError((error){
    emit(PaymentRefCodeErrorstate(error));
 });
}
}
