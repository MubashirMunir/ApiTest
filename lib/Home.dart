import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:flutter/material.dart';
import 'package:untitled1/Api_Modeule.dart';
import 'package:untitled1/product_view.dart';
import 'api_url.dart';
class ApiDataView extends StatelessWidget {


  Future<List<Articles>> getPosts() async {
     Api api=Api();
    final response = await http.get(Uri.parse(api.baseUrl));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode ==200){
      for(Map<String ,dynamic >files in data ){

      }
    }
    return ApiModeule.fromJson(data).articles! ;
  }
    List<Articles> list = [];
     @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Api Data")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPosts(),
                builder: (context, listOfData) {
                  if (!listOfData.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else {
                     final articles = listOfData.data!;
                    return ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return InkWell(onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductView(
                             image: listOfData.data![index].urlToImage,
                              title:listOfData.data![index].title.toString(),
                            name:listOfData.data![index].author.toString(),
                            desc:articles[index].description.toString()))),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 100,width: 120,
                                          child: Image.network(articles[index].urlToImage.toString(),height: 20,),),
                                        Center(child: Text(articles[index].author.toString(),style: const TextStyle(fontSize: 14),)),
                                      ],),
                                    const SizedBox(width: 30,),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 100,width: 120,
                                          child: Image.network(articles[index].urlToImage.toString()),),
                                        Text(articles[index].author.toString(),style: const TextStyle(fontSize: 14),),
                                      ],),
                                  ],),
                              ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}

