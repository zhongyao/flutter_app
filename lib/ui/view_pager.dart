import 'package:flutter/material.dart';

class ViewPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ViewPager",
      theme: ThemeData(primaryColor: Colors.blue),
      home: ViewPagerStateless(),
    );
  }
}

class ViewPagerStateless extends StatelessWidget {
  var imgs = [
    "https://i1.mifile.cn/f/i/2019/micc9/summary/specs-02.png",
    "https://i1.mifile.cn/f/i/2019/micc9/summary/specs-03.png",
    "https://i1.mifile.cn/f/i/2019/micc9/summary/specs-04.png",
    "https://i1.mifile.cn/f/i/2019/micc9/summary/specs-05.png",
    "https://i1.mifile.cn/f/i/2019/micc9/summary/specs-06.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ViewPager")),
      body: PageView(
        /**
         *  PageView滑动属性【physics】设置：
         *  BouncingScrollPhysics	允许滚动出边界，超过边界时会有回弹效果，会响应滚动事件
            ClampingScrollPhysics	不允许滚动出边界，会响应滚动事件
            AlwaysScrollableScrollPhysics	一直响应滚动事件
            NeverScrollableScrollPhysics	禁止滚动，不响应滚动事件
            FixedExtentScrollPhysics	ListWheelScrollView滚轮使用时，item都会停止在中间位置，不会停在分割线
            PageScrollPhysics	PageView滚轮使用时，item都会停止在一页，不会停止在分割线位置
            RangeMaintainingScrollPhysics	当内容突然改变尺寸时，试图将滚动位置保持在范围内的滚动物理
         */
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Image.network(imgs[0]),
          Image.network(imgs[1]),
          Image.network(imgs[2]),
          Image.network(imgs[3]),
          Image.network(imgs[4]),
        ],
      ),
    );
  }
}
