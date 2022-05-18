import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  getData() {

  }

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
        
        height:400,
        //height: height,
        // Ögeyi ortalamak için kullanılır.
        child: Column(
          children: [
        Container(
          height:200,

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
                return _MovieItem(
                  data.docs[index].data(),
                  data.docs[index].reference,
                );
              },
            );
          },
      ),
        ),
    
            Container(
              height:200,
              child: ListView.builder(itemCount:5, itemBuilder:(context, index) {
                return ListTile(
                  title: Text("title"),
                  subtitle: Text("title"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                );
              }),
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
                onPressed: ()async{

                  

              },
              ) ,
            
          
    );
        
      
    
  }
}


class _MovieItem extends StatelessWidget {
  _MovieItem(this.product, this.reference);

  final Product product;
  final DocumentReference<Product> reference;

  /// Returns the movie poster.
 

  /// Returns movie details.
  Widget get details {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
         
         
        ],
      ),
    );
  }

  /// Return the movie title.
  Widget get title {
    return Text(
      '${product.name}',
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
