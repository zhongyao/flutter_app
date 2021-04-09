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

/// 在写应用的过程中，取决于是否需要管理状态，
/// 通常会创建一个新的组件继承 StatelessWidget 或 StatefulWidget。
class GirdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'GridView Demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

///相当于ContentView
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

      ///创建一个基于与[Future]交互的最新快照的一个Widget
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //future执行完毕
            if (snapshot.hasData) {
              return PhotosList(photos: snapshot.data);
            } else if (snapshot.hasError) {
              print(snapshot.error);
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

///获取网络数据，并解析
///此处Future相当于ES6的Promise, async/await相当于ES7中的async/await
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  ///通过 Flutter 提供的 compute() 方法将解析和转换的工作移交到一个后台 isolate 中
  ///这个 compute() 函数可以在后台 isolate 中运行复杂的函数并返回结果。
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    print("failed to load data");
  }
  return null;
}

///json数据解析
///将responseBody转换成List<Photo>的数据格式
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

///GridView
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

///Photo实体类
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
