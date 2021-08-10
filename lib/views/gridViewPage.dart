import 'package:flutter/material.dart';
import 'package:key_project/widgets/textFormFields/customTextFormField.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid Page"),
        ),
        body: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              controller: _scrollController,
              itemCount: 50,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2,
                crossAxisSpacing: 20,
                crossAxisCount: 3,
              ),
              // onDrag ve manual seçenekleri var. 
              // onDrag: Scroll için kaydırmaya başlayınca keyboard otomatik olarak kapanır.
              // manual: Hiç bir zaman keyboard kapanmaz. Manuel kontrol edilir.
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(),
                      Center(
                          child: Text(
                        '${index + 1}. lesson',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
