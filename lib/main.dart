import 'package:flutter/material.dart';
import 'package:untitled1/Home.dart';

 main() {
   runApp( const MyApp());


   // List a=[0,0,0,1,0,0,0,0,8,9,1];
  // int max=a[0];
  // int count =0;
  // for(int i =0;i<a.length;i++){
  //   if(a[i]!=0){
  //      count=0;
  //   }
  //   else{count++;}
  // }
  // print(count);

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApiDataView(),

    );
  }
}

