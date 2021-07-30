import 'package:flutter/material.dart';
import 'package:key_sample/views/thirdPage.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

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
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (value) {
                      print("value");
                      print(value);
                      if (value == null || value == "") {
                        return "Please enter email";
                      }

                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);

                      if (!emailValid) {
                        return "Please enter a valid email";
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Please enter password";
                      }

// ^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$

                      bool isStrong = RegExp(
                              r"^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
                          .hasMatch(value);

                      if (!isStrong) {
                        return """Please enter a strong password. \nYour password should contain these rules:
                        
8 characters length
2 letters in Upper Case
1 Special Character (!@#\$&*)
2 numerals (0-9)
3 letters in Lower Case
                        """;
                      }
                    },
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
