import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:key_project/widgets/icons/gridIcon.dart';
import 'gridViewPage.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();

  

}

class _ThirdPageState extends State<ThirdPage> {
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


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürünler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        //height: height,
        // Ögeyi ortalamak için kullanılır.
        child: ListView.builder(itemCount:5, itemBuilder:(context, index) {
          return ListTile(
            title: Text("title"),
            subtitle: Text("title"),
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
            ),
          );
        }),
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


