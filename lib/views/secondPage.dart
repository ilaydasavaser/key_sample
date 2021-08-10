import 'package:flutter/material.dart';
import 'package:key_project/providers/appStateProvider.dart';
import 'package:key_project/views/thirdPage.dart';
import 'package:key_project/widgets/containers/errorMessageContainer.dart';
import 'package:key_project/widgets/textFormFields/customTextFormField.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

  String emailValidationMessage = "";
  String passwordValidationMessage = "";

  late AppStateProvider appStateProvider;

  @override
  void initState() {
    appStateProvider = Provider.of<AppStateProvider>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    // provider'ı initState veya dispose'da kullanabilmek için Future.delayed method'undan yararlandık.
    Future.delayed(Duration(seconds: 0), () {
      appStateProvider.setEmailValidationMessage("");
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appStateProvider = Provider.of(context);

    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        // title: Text("Second Page"),
        leading: Container(),
      ),
      body: Container(
        //height: height,
        // Ögeyi ortalamak için kullanılır.
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Araya komple boşluk koymamızı sağlar.
                  Spacer(),
                  Container(
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Text("Here is second page!"),
                        Text("Transferred data is: " +
                            appStateProvider.getTextEditingController.text),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); //Geri gider. İlk sayfaya...
                          },
                          child: Text("Back"),
                        ), // Araya komple boşluk koymamızı sağlar.
                      ],
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: 30,
                  ),
                  // input alanı sağlar.

                  CustomTextFormField(
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                    validator: emailValidator,
                  ),
                  if (appStateProvider.getEmailValidationMessage != "")
                    ErrorMessageContainer(
                      width: width,
                      passwordValidationMessage:
                          appStateProvider.getEmailValidationMessage,
                    ),

                  // Spacer(),
                  SizedBox(
                    height: 10,
                  ),

// password kutucuğu
                  CustomTextFormField(
                    hintText: "Password",
                    keyboardType: TextInputType.visiblePassword,

                    obscureText: true,
                    // obscuringCharacter:"x",
                    prefixIcon: Icons.vpn_key,
                    validator: passwordValidator,
                  ),

                  if (passwordValidationMessage != "")
                    ErrorMessageContainer(
                        width: width,
                        passwordValidationMessage: passwordValidationMessage),

                  TextButton(
                    onPressed: () {
                      print("login pressed");

                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdPage()),
                        );
                      }
                    },
                    child: Text("Register"),
                  ),

                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? emailValidator(String? value) {
    print("value");
    print(value);
    if (value == null || value == "") {
      appStateProvider.setEmailValidationMessage("Please enter email");

      return "";
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
      appStateProvider.setEmailValidationMessage("Please enter a valid email");

      return "";
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value == "") {
      setState(() {
        passwordValidationMessage = "Please enter password";
      });

      return "";
    }

// ^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$

    bool isStrong = RegExp(
            r"^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        .hasMatch(value);

    if (!isStrong) {
      setState(() {
        passwordValidationMessage =
            """Please enter a strong password. \nYour password should contain these rules:
                            
8 characters length
2 letters in Upper Case
1 Special Character (!@#\$&*)
2 numerals (0-9)
3 letters in Lower Case
                            """;
      });
      return "";
    }
  }
}
