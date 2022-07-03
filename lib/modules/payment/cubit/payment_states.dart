abstract class PaymentStates{}
class PaymentInitalstate extends PaymentStates{}
class PaymentSuccessState extends PaymentStates{}
class PaymentErrorstate extends PaymentStates{
 String error;
 PaymentErrorstate(this.error);
}

class PaymentOrderIdSuccessState extends PaymentStates{}
class PaymentOrderIdErrorstate extends PaymentStates{
 String error;
 PaymentOrderIdErrorstate(this.error);
}

class PaymentRequestTokenSuccessState extends PaymentStates{}
class PaymentRequestTokenErrorstate extends PaymentStates{
 String error;
 PaymentRequestTokenErrorstate(this.error);
}

class PaymentkioskTokenSuccessState extends PaymentStates{}
class PaymentKioskTokenErrorstate extends PaymentStates{
 String error;
 PaymentKioskTokenErrorstate(this.error);
}
class PaymentRefCodeSuccessState extends PaymentStates{}
class PaymentRefCodeErrorstate extends PaymentStates{
 String error;
 PaymentRefCodeErrorstate(this.error);
}