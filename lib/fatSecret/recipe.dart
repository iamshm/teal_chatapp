import 'package:chat_app/fatSecret/credentials.dart';
import 'package:chat_app/fatSecret/nonce.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

class Recipe extends StatefulWidget {
  static const String id = "RECIPE";
  @override
  RecipeState createState() => new RecipeState();
}

class RecipeState extends State<Recipe> {
  List data;
  String oAuthSignature = '';
  String nonce = Nonce.generate();
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  String getOAuthSignature() {
    String normalizedParameters = Uri.encodeFull(
        "a=foo&oauth_consumer_key=$consumerKey&oauth_nonce=$nonce&oauth_signature_method=HMAC-SHA1&oauth_timestamp=$timestamp&oauth_version=1.0&z=bar");

    String signatureBaseString = "GET" +
        "&" +
        Uri.encodeFull("https://platform.fatsecret.com/rest/server.api") +
        "&" +
        normalizedParameters;

    var text = utf8.encode(signatureBaseString);
    var key = utf8.encode("$consumerSecret" + "&");
    var hmacSha1 = new Hmac(sha1, key);
    var digest = hmacSha1.convert(text);
    return Uri.encodeFull(base64.encode(digest.bytes));
  }

  @override
  void initState() {
    super.initState();
    if (oAuthSignature == '') {
      oAuthSignature = getOAuthSignature();
    }
  }

  Future<String> getData(value) async {
    var response = await http.get(Uri.encodeFull(
        "https://platform.fatsecret.com/rest/server.api?method=foods.search&oauth_consumer_key=$consumerKey&oauth_nonce=$nonce&oauth_signature=$oAuthSignature&oauth_signature_method=HMAC-SHA1&oauth_timestamp=$timestamp&oauth_version=1.0&search_expression:$value&format=json"));
    Map<String, dynamic> data = json.decode(response.body);
    print(data);
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onSubmitted: (value) => getData(value),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Search Food ',
                hintStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
