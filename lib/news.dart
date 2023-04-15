import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dio/dio.dart';

class NewsScreen extends StatefulWidget {
  late List<dynamic> article = [];
  NewsScreen({super.key});
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response = await Dio().get(
          'https://newsapi.org/v2/everything?q=tesla&from=2023-03-15&sortBy=publishedAt&apiKey=52e823d38a404b629b50a688ce6c1f71');
      if (response.statusCode == 200) {
        setState(() {
          widget.article = response.data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.article == []
        ? Center(
            child: Column(
              children: const [
                CircularProgressIndicator(),
                Text('Loading...'),
              ],
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.article.length,
            itemBuilder: (context, index) {
              dynamic article = widget.article[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    article['urlToImage'] != null
                        ? Image.network(article['urlToImage'])
                        : const SizedBox(),
                    Text(article['title'] ?? '',
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 16.0),
                    Text(article['description'] ?? ''),
                  ],
                ),
              );
            });
  }
}
