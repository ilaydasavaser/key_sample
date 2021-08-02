import 'package:flutter/material.dart';

class ErrorMessageContainer extends StatelessWidget {
  const ErrorMessageContainer({
    Key? key,
    required this.width,
    required this.passwordValidationMessage,
  }) : super(key: key);

  final double width;
  final String passwordValidationMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Text(
          passwordValidationMessage,
          // textAlign: ,
          style: TextStyle(
            color: Colors.red,
            // fontWeight:
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
