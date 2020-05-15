import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RetrieveFood extends StatefulWidget {
  static const String id = "RETRIEVEFOOD";
  @override
  _RetrieveFoodState createState() => _RetrieveFoodState();
}

class _RetrieveFoodState extends State<RetrieveFood> {
  static String username = '64b3690427d9434b904696fa39c0593f';
  static String password = 'c43e8f868b9842d3aa7148b878f080b4';
  String _basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  TextEditingController foodSearchController = TextEditingController();
  Future<Response> getData() async {
    Response response = await post('https://oauth.fatsecret.com/connect/token',
        headers: <String, String>{
          'authorization': _basicAuth,
        },
        body: <String, String>{
          'grant_type': 'client_credentials',
          'scope': 'basic'
        });
    giveOp(response.body);
    return null;
  }
  Future<Response> giveOp(token) async {
    Response output = await post(
      'https://platform.fatsecret.com/rest/server.api',
      headers: {HttpHeaders.authorizationHeader: token},
    );
    print(output.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Search"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "search a food...",
                suffixIcon: IconButton(
                    icon: Icon(Icons.send), onPressed: () => getData()),
              ),
              controller: foodSearchController,
            ),
          ),
        ],
      ),
    );
  }
}
