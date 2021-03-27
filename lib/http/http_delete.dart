import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:startup_namer/anim/AnimatedContainer.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load album");
  }
}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse("https://jsonplaceholder.typicode.com/albums/$id"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load album");
  }
}

class HttpApp extends StatefulWidget {
  HttpApp({Key key}) : super(key: key);

  @override
  _HttpAppState createState() {
    return _HttpAppState();
  }
}

class _HttpAppState extends State<HttpApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Delete Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Http Delete Data Example"),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum, // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
            builder: (context, snapshot) {
              //snapshot就是futureAlbum在时间轴上执行过程的状态快照
              if (snapshot.connectionState == ConnectionState.none) {
                return new Text('Press button to start');//如果futureAlbum未执行则提示：请点击开始
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return new Text('Awaiting result...');//如果futureAlbum正在执行则提示：加载中
              } else if (snapshot.connectionState == ConnectionState.done) {//futureAlbum执行完毕
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${snapshot.data?.title ?? 'Deleted'}'),
                      ElevatedButton(
                        child: Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                            futureAlbum =
                                deleteAlbum(snapshot.data.id.toString());
                          });
                        },
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
