import 'package:flutter/material.dart';
import 'package:key_sample/helper/differentPrintHelper.dart';
import 'package:key_sample/helper/printHelper.dart';
import 'package:key_sample/helper/uniqueColorGenerator.dart';

void main() => runApp(MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    Padding(
      // Place the keys at the *top* of the tree of the items in the collection.
      key: UniqueKey(),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: StatefulColorfulTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(0.0),
      child: StatefulColorfulTile(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dev Environment"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tiles,
              ),
              TextButton(
                onPressed: () {
                  PrintHelper().customPrint();
                },
                child: Text("Dev Press"),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.sentiment_very_satisfied,
          ),
          onPressed: swapTiles,
        ),
      ),
    );
  } //floatingAction onPressed

  swapTiles() {
    //print("fab pressed");
// PrintHelper().customPrint();
    DiffentPrintHelper().customPrint();

    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatefulColorfulTile extends StatefulWidget {
  StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  ColorfulTileState createState() => ColorfulTileState();
}

class ColorfulTileState extends State<StatefulColorfulTile> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      width: 140,
      height: 140,
      // child: Padding(
      //   padding: EdgeInsets.all(70.0),
      // ),
    );
  }
}
