import 'package:flutter/material.dart';
import 'pages/transactions.dart';
import 'pages/SignIn.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return const MaterialApp(
   //   home: TransactionsPage(),
      home: SignIn(),
     );
  }

}

