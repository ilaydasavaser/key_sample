import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:key_project/db/db_references.dart';
import 'package:key_project/db/models.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {}

  @override
  void dispose() {
    super.dispose();
  }

// MovieQuery query = MovieQuery.year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürünler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: 400,
        //height: height,
        // Ögeyi ortalamak için kullanılır.
        child: Column(
          children: [
            Expanded(
              // height: 200,
              child: StreamBuilder<QuerySnapshot<Product>>(
                stream: productRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return _ProductItem(data.docs[index].data());
                    },
                  );
                },
              ),
            ),
          ],
        ),
        //child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //children: [
        //SizedBox(
        //height: 550,
        //),

        // Row(mainAxisAlignment: MainAxisAlignment.end,
        //children: [
        //IconButton(
        //icon: SvgPicture.asset(
        //"assets/image/basket.svg",
        //width: 50,
        //height: 50,
        //),
        //onPressed:() {
        // Navigator.push(
        //  context,
        //MaterialPageRoute(builder: (context) => ProductPage()),
        //);
        //},
        //),
        // Text(""),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          child: SvgPicture.asset(
            "assets/image/basket.svg",
            width: 30,
            height: 30,
          ),
        ),
        onPressed: () async {},
      ),
    );
  }
}

class _ProductItem extends StatefulWidget {
  _ProductItem(this.product);

  final Product product;

  @override
  State<_ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<_ProductItem> {
  /// Returns the movie poster.

  /// Returns movie details.
  Widget get details {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                Checkbox(
                    value: widget.product.isSelected == true,
                    onChanged: (val) {
                      setState(() {
                        widget.product.isSelected = val;
                      });
                    })
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  /// Return the movie title.
  Widget get title {
    return Text(
      '${widget.product.name}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  /// Returns metadata about the movie.

  /// Returns a list of genre movie tags.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: details),
        ],
      ),
    );
  }
}
