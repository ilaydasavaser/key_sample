import 'package:flutter/material.dart';
import 'package:key_project/providers/appStateProvider.dart';
import 'package:key_project/widgets/textFormFields/customTextFormField.dart';
import 'package:provider/provider.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final ScrollController _scrollController = ScrollController();

  late AppStateProvider appStateProvider;

  @override
  void initState() {
    appStateProvider = Provider.of<AppStateProvider>(context, listen: false);

    Future.delayed(Duration(seconds: 0), () {
      if (appStateProvider.getTextEditingControllerList.length != 50) {
        generateTextEditingControllerList();
      }
    });

    super.initState();
  }

  generateTextEditingControllerList() {
    List<TextEditingController> tempList = [];
    for (var i = 0; i < 50; i++) {
      tempList.add(TextEditingController());
    }

    appStateProvider.setTextEditingControllerList(tempList);
  }

  @override
  Widget build(BuildContext context) {
    appStateProvider = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Grid Page"),
        ),
        body: appStateProvider.getTextEditingControllerList.length != 50
            ? Container()
            : Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: 50,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 20,
                      crossAxisCount: 3,
                    ),
                    // onDrag ve manual seçenekleri var.
                    // onDrag: Scroll için kaydırmaya başlayınca keyboard otomatik olarak kapanır.
                    // manual: Hiç bir zaman keyboard kapanmaz. Manuel kontrol edilir.
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                              textEditingController: appStateProvider
                                  .getTextEditingControllerList[index],
                            ),
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
