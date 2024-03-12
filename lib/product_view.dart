import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {

   const ProductView({super.key, required this.title,
     required this.image,
     required this.desc,
     required this.name,});
  final String title;
  final String desc;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ProductView"),),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    SizedBox(
    height: 200,
    width: 200,
    // decoration: BoxDecoration(
    // image: DecorationImage(image:FadeInImage(placeholder: null, image: null,),
    // ),
    // color: Colors.black,
    // borderRadius: BorderRadius.circular(10)
    // ),
            child: FadeInImage(image: NetworkImage(image), placeholder: const AssetImage('pic.jpg'),),
    ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Text(name.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),

              Text(desc.toString())
            ],),
          ),

      ],
    )
    );
  }
}
