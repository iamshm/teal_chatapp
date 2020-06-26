import 'package:chat_app/fatSecret/credentials.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:http/http.dart' as http;

class Recipe extends StatefulWidget {
  static const String id = "RECIPE";
  @override
  RecipeState createState() => new RecipeState();
}

class RecipeState extends State<Recipe> {
  List data;
  String oAuthSignature = '';
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  String getOAuthSignature() {
    String normalizedParameters = Uri.encodeFull(
        "a=foo&oauth_consumer_key=$consumerKey&oauth_nonce=abcdef&oauth_signature_method=HMAC-SHA1&oauth_timestamp=$timestamp&oauth_version=1.0&z=bar");
    print("normalizedParameters --> " + normalizedParameters);
    String signatureBaseString = "POST" +
        "&" +
        Uri.encodeFull("https://platform.fatsecret.com/rest/server.api") +
        "&" +
        normalizedParameters;
    print("signatureBaseString --> " + signatureBaseString);

    var text = utf8.encode(signatureBaseString);
    print("text (encoded signBaseStr)--> ");
    print(text);

    var key = utf8.encode("$consumerSecret" + "&");
    print("key  cons secret --> ");
    print(key);

    var hmacSha1 = new Hmac(sha1, key);
    print("hmacSha1 --> ");
    print(hmacSha1);

    var digest = hmacSha1.convert(text);
    print("digest (hmcasha1 converted test) ---> ");
    print(digest);
    var osign = Uri.encodeFull(base64.encode(digest.bytes));
    print("oauthSignature---> " + osign);
    return Uri.encodeFull(base64.encode(digest.bytes));
  }

  @override
  void initState() {
    super.initState();
    if (oAuthSignature == '') {
      oAuthSignature = getOAuthSignature();
    }
  }

  Future<String> foodSearch(value) async {
    print("input value --> " + value);
    var response = await http.get(
        "https://platform.fatsecret.com/rest/server.api?method=foods.search&oauth_consumer_key=$consumerKey&oauth_nonce=abcdef&oauth_signature=$oAuthSignature&oauth_signature_method=HMAC-SHA1&oauth_timestamp=$timestamp&oauth_version=1.0&search_expression:$value&format=json");
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
                onSubmitted: (value) => foodSearch(value),
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
      ),
    );
  }
}
