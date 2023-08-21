import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarGenerator {
  static PreferredSize getNoramlAppBar({
    required BuildContext context,
    String? title,
    Widget? leftButton,
    double? leadingWidth,
    bool showback = true,
    VoidCallback? onLeftPressed,
    VoidCallback? onPreBackAction,
    List<Widget>? rightButtons,
    double elevation = 0,
    double prferredheight = -1,
    Widget? titleWidget,
    Color? backgroundColor,
    Color? leftButtonColor,
    PreferredSizeWidget? bottom,
  }) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    // 目前都是二级页面 这里不做处理了 因为跟Native混编
    bool canshowback = true /*parentRoute?.canPop ?? false*/;
    if (prferredheight == -1) {
      prferredheight = 44.w;
    }

    backgroundColor ??= Colors.white;
    return PreferredSize(
      preferredSize: Size.fromHeight(prferredheight),
      child: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        actions: rightButtons,
        leading: showback
            ? (canshowback
                ? (leftButton ??
                    normalBackWidget(context, onPreBackAction, onLeftPressed))
                : null)
            : null,
        title: titleWidget ??
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
        elevation: elevation,
        bottom: bottom,
        automaticallyImplyLeading: showback,
      ),
    );
  }

  static Widget normalBackWidget(
    BuildContext context,
    VoidCallback? onPreBackAction,
    VoidCallback? onLeftPressed,
  ) {
    return GestureDetector(
      onTap: () {
        if (onPreBackAction != null) {
          onPreBackAction();
          return;
        }
        if (onLeftPressed != null) {
          onLeftPressed();
        }
        if (Navigator.canPop(context)) {
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(12.w),
        alignment: Alignment.center,
        child: Image.asset(
          'images/back_icon.webp',
          height: 20.w,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
