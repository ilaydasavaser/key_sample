import 'package:flutter/material.dart';

class AppStateProvider with ChangeNotifier {
  late TextEditingController _textEditingController = TextEditingController();

  TextEditingController get getTextEditingController => _textEditingController;

  void setTextEditingController(TextEditingController textEditingController) {
    _textEditingController = textEditingController;
    notifyListeners();
  }

//   String _text = "";
//   get getText => _text;

// // void yazılsa güzel olur.
//     setText(String text) {
//     _text = text;
//     notifyListeners();
//   }

  String _emailValidationMessage = "";

  get getEmailValidationMessage => _emailValidationMessage;

  void setEmailValidationMessage(String message) {
    _emailValidationMessage = message;
    notifyListeners();
  }

  late List<TextEditingController> _textEditingControllerList = [];

  List<TextEditingController> get getTextEditingControllerList =>
      _textEditingControllerList;

  void setTextEditingControllerList(
      List<TextEditingController> textEditingControllerList) {
    _textEditingControllerList = textEditingControllerList;
    notifyListeners();
  }
}
