import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:startup_namer/util/print_util.dart';

part 'riverpod_page4_logic.g.dart';

///1、首先定义RiverPodPage4Logic类，并继承_$RiverPodPage4Logic
///2、添加注解@riverpod
///3、定义ViewModel类RiverPodPage4ViewModel
///4、覆写build方法，并返回RiverPodPage4ViewModel实例
///5、顶部添加：part 'riverpod_page4_logic.g.dart';
///6、终端执行指令：flutter pub run build_runner build
@riverpod
class RiverPodPage4Logic extends _$RiverPodPage4Logic {
  @override
  RiverPodPage4ViewModel build() {
    requestRemoteData();
    return RiverPodPage4ViewModel();
  }

  ///模拟网络请求
  void requestRemoteData() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      PrintUtil.print("request finished");
      String data = "remote data";
      //更新数据
      state = state.copyWith(data: data);
    });
  }

  void updateBgColor(bool isRed) {
    ///注意这里需使用如下方法才能是watch方法生效;而使用state.isRed = isRed无法使watch监听生效;
    state = state.copyWith(isRed: isRed);
  }
}

class RiverPodPage4ViewModel {
  String data = "";
  bool isRed = false;

  RiverPodPage4ViewModel();

  RiverPodPage4ViewModel copyWith({String? data, bool? isRed}) {
    return RiverPodPage4ViewModel()
      ..data = data ?? this.data
      ..isRed = isRed ?? this.isRed;
  }
}
