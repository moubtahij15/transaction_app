import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  dynamic data;

  void _search() {
    var url = Uri.parse(
        'http://172.19.96.1:9999/FINANCE-SERVICE-ELASTICSEARCH/transactions');
    http.get(url).then((response) {
      setState(() {
        data = jsonDecode(response.body);
      });
      print("response");
      print(response);
      print(response.body);
    }).catchError((onError) {
      print("onError");
      print(onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    _search();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactionss'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:
                    (data == null) ? 0 : data['_embedded']['transactions'].length,
                itemBuilder: (context,index){
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data['_embedded']['transactions'][index]['minister']}", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
                            Text(DateFormat.yMMMMEEEEd().format( DateTime.parse("${data['_embedded']['transactions'][index]['createdAt']}")), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.grey),),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2),),
                          child: Text("${data['_embedded']['transactions'][index]['mentant']} MAD", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple),),
                        ),
                      ],
                    ),
                  );
                }

            ),
          )
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
