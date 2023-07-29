// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> with WidgetsBindingObserver {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  /**
   * 插入渲染树时调用，只调用一次
   */
  @override
  void initState() {
    super.initState();
    print('调用了 + initState');

    WidgetsBinding.instance.addObserver(this);

    /**
     * 帧绘制回调:
     * 1、addPostFrameCallback：
     *    指单次 Frame 绘制回调
     * 2、addPersistentFrameCallback：
     *    指实时 Frame 绘制回调
     */

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(" 单次 Frame 绘制回调 ");// 只回调一次
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      print(" 实时 Frame 绘制回调 ");// 每帧都回调
    });
  }

  /**
   * 初始化时，在initState()之后立刻调用,当依赖的InheritedWidget rebuild,会触发此接口被调用,
   * 实测在组件可见状态变化的时候会调用
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('调用了 + didChangeDependencies');
  }

  /**
   * 组件状态改变时候调用
   */
  @override
  void didUpdateWidget(covariant RandomWords oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('调用了 + didUpdateWidget');
  }

  /**
   * 热重载时被调用，在release模式下永不会调用
   */
  @override
  void reassemble() {
    super.reassemble();
    print('调用了 + reassemble');
  }

  /**
   * 当State对象从树中被移除时，会调用此回调，会在dispose之前调用。
   */
  @override
  void deactivate() {
    super.deactivate();
    print('调用了 + deactivate');
  }

  /**
   * 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
   */
  @override
  void dispose() {
    super.dispose();
    print('调用了 + dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('当前state为：$state');
  }

  /**
   * 初始化之后开始绘制界面，setState触发的时候会
   */
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    print('调用了 + build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
