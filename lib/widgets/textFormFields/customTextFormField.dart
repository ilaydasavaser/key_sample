// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatefulWidget {
//   @override
//   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   @override
//   Widget build(BuildContext context) {
   
//    return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue[50],
//                     border: Border.all(
//                       color: Colors.blue,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                     child: TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         hintText: "Email",
//                         border: InputBorder.none,
//                         errorStyle: TextStyle(
//                           fontSize: 0,
//                         ),
//                         // prefix: Text("data"),
//                         prefixIcon: Container(
//                           width: 24,
//                           height: 24,
//                           // color: Colors.red,
//                           child: Icon(
//                             Icons.email,
//                             color: Colors.grey,
//                             size: 24,
//                           ),
//                         ),
//                       ),
//                       validator: (value) {
//                         print("value");
//                         print(value);
//                         if (value == null || value == "") {
//                           setState(() {
//                             emailValidationMessage = "Please enter email";
//                           });

//                           return "";
//                         }

//                         bool emailValid = RegExp(
//                                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                             .hasMatch(value);

//                         if (!emailValid) {
//                           setState(() {
//                             emailValidationMessage =
//                                 "Please enter a valid email";
//                           });
//                           return "";
//                         }
//                       },
//                     ),
//                   ),
//                 );
  
//   }
// }