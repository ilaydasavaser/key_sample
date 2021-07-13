import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Here is second page!"),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); //Geri gider. İlk sayfaya...
                },
                child: Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
