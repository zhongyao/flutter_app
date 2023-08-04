import 'package:flutter/cupertino.dart';

///自定义Sliver
class CustomSliverWidget extends StatefulWidget {
  const CustomSliverWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomSliverWidgetState();
}

class _CustomSliverWidgetState extends State<CustomSliverWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让 physics 支持弹性效果
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // slivers: getSliverFlexibleHeader(),
    );
  }

// getSliverFlexibleHeader() {
//   Sliver
// }
}
