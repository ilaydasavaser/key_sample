import 'package:flutter/material.dart';
import 'package:key_project/providers/appStateProvider.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  // ortak için alanlar
  final String? hintText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;

  // password için alanlar
  final bool? obscureText;
  final String? obscuringCharacter;

  const CustomTextFormField({
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.obscuringCharacter = '*',
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late AppStateProvider appStateProvider;

  @override
  Widget build(BuildContext context) {
    appStateProvider = Provider.of<AppStateProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextFormField(
          obscureText: widget.obscureText!,
          obscuringCharacter: widget.obscuringCharacter!,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            errorStyle: TextStyle(
              fontSize: 0,
            ),
            // prefix: Text("data"),
            prefixIcon: Container(
              width: 24,
              height: 24,
              // color: Colors.red,
              child: Icon(
                widget.prefixIcon,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
