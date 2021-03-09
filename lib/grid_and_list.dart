import 'package:flutter/material.dart';

class GridApp extends StatelessWidget {
  final bool showGrid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter layout demo"),
        ),
        body: Center(
          child: showGrid ? _buildGrid() : _buildList(),
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(15.0),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30),
    );
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (index) => Container(child: Image.asset('images/pic$index.jpg')));

  Widget _buildList() {
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subTitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.green,
      ),
    );
  }
}
