import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:untitled1/placeModule.dart';

import 'api_url.dart';

class place extends StatefulWidget {
  const place({super.key});

  @override
  State<place> createState() => _placeState();
}
   List<Postmodule> Lisdata =[];
   Api api =Api();
   Future<List<Postmodule>> getPost() async{
  final res =await http.get(Uri.parse(api.baseUrl1));
  var data=jsonDecode(res.body);
  print(res);
   if(res.statusCode == 200){
     for(Map<String, dynamic> index in data){
       Lisdata.add(Postmodule.fromJson(index));
     }return Lisdata;
   }
    return Lisdata;
   }

class _placeState extends State<place> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Data",style: TextStyle(fontWeight: FontWeight.bold),),),
      body: FutureBuilder(future:getPost(), builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return ListView.builder(
              itemCount:Lisdata.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                    subtitle:Text(Lisdata[index].email.toString()) ,
                    title: Text(Lisdata[index].name.toString()));

              });
        }

      }),
      );
  }
}
