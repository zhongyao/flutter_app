//Dart 应用通常只会在单线程中处理它们的工作。并且在大多数情况中，这种模式不但简化了代码而且速度也够快，
// 基本不会出现像动画卡顿以及性能不足这种「不靠谱」的问题。

//但是，当你需要进行一个非常复杂的计算时，例如解析一个巨大的 JSON 文档。如果这项工作耗时超过了 16 毫秒，
// 那么你的用户就会感受到掉帧。

//为了避免掉帧，像上面那样消耗性能的计算就应该放在后台处理。在 Android 平台上，
// 这意味着你需要在不同的线程中进行调度工作。而在 Flutter 中，你可以使用一个单独的 Isolate。

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //通过 Flutter 提供的 compute() 方法将解析和转换的工作移交到一个后台 isolate 中
  //这个 compute() 函数可以在后台 isolate 中运行复杂的函数并返回结果。
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class IsolateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  //当你需要构造函数不是每次都创建一个新的对象时，使用factory关键字。
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        albumId: json["albumId"] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }
}
