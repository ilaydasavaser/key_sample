
import 'package:flutter/material.dart';

class GridIcon extends StatelessWidget {
  const GridIcon({
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
            "assets/icon/grid.png",
          ),
        ),
      ),
    );
  }
}
