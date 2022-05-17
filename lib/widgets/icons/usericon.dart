import 'package:flutter/material.dart';

class Usericon extends StatelessWidget{

  const Usericon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            "assets/icon/user.png",
          ),
        ),
      ),
    );
  }
}