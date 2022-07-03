


import 'package:flutter/material.dart';
import 'package:payment/shared/style/colors.dart';

Widget defaultButton({
  double width=double.infinity,
  Color background=defaultColor,
  bool isupperCase=true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isupperCase?text.toUpperCase() 
           :text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
    );

Widget defaultformEleld({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback?  onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isclickable = true,  
  int? lines,
}) =>
  TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isclickable,
  onFieldSubmitted: onSubmit,                     
  onChanged: onChange,
  onTap: onTap,
  maxLines: lines,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
  ), // Icon
    suffixIcon: suffix != null

     ?IconButton(
       onPressed: suffixPressed,
        icon: Icon(
          suffix,
        )
     )
                  
    :null,
border: const OutlineInputBorder(),
),
  );

void NavigateTo(context, widget) => Navigator.push(
context,
MaterialPageRoute(
builder: (context) => widget,
));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(
builder: (context) => widget,
),
(Route<dynamic> route) => false,
);