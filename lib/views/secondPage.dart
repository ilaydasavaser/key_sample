import 'package:flutter/material.dart';
import 'package:key_sample/views/thirdPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

  String emailValidationMessage = "";
  String passwordValidationMessage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
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
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          errorStyle: TextStyle(
                            fontSize: 0,
                          )
                        ),
                        validator: (value) {
                          print("value");
                          print(value);
                          if (value == null || value == "") {
                            setState(() {
                              emailValidationMessage = "Please enter email";
                            });

                            return "";
                          }

                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);

                          if (!emailValid) {
                            setState(() {
                              emailValidationMessage =
                                  "Please enter a valid email";
                            });
                            return "";
                          }
                        },
                      ),
                    ),
                  ),
                  if (emailValidationMessage != "")
                    Container(
                      width: width,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          emailValidationMessage,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  // Spacer(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                           errorStyle: TextStyle(
                            fontSize: 0,
                          )
                        ),
                        validator: (value) {
                          if (value == null || value == "") {
                            setState(() {
                              passwordValidationMessage =
                                  "Please enter password";
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
                        },
                      ),
                    ),
                  ),
                  if (passwordValidationMessage != "")
                    Container(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          passwordValidationMessage,
                          // textAlign: ,
                          style: TextStyle(
                            color: Colors.red,
                            // fontWeight:
                          fontSize:  12
                          ),
                        ),
                      ),
                    ),

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
}
