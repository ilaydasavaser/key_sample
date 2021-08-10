import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid Page"),
        ),
        body: Scrollbar(
          // controller: _controller,
          isAlwaysShown: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              // controller: _controller,
              itemCount: 50,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2,
                crossAxisSpacing: 20,
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    '${index + 1}. lesson',
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
            ),
          ),
        ));
  }
}
