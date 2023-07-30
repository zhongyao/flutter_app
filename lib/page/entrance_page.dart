import 'package:flutter/material.dart';
import 'package:startup_namer/page/widget/my_drawer.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("红日"),
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.share))
        ],
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        //底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "Business"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          onPressed: _onAdd,
          //悬浮按钮
          child: const Icon(Icons.add)),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
