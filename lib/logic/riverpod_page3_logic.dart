import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startup_namer/bean/person_info.dart';
import 'package:startup_namer/util/print_util.dart';

final stateChangeNotifier = StateNotifierProvider.autoDispose<MyNotifier, MyModel>((ref) {
  ref.onDispose(() {
    PrintUtil.print("stateChangeNotifier --- onDispose");
  });

  ref.onResume(() {
    PrintUtil.print("stateChangeNotifier --- onResume");
  });

  ref.onCancel(() {
    PrintUtil.print("stateChangeNotifier --- onCancel");
  });

  var myNotifier =
      MyNotifier(MyModel(id: "--", name: "--", age: "--", gender: "--"));
  return myNotifier;
});

class MyNotifier extends StateNotifier<MyModel> {
  MyNotifier(super.state);

  ///模拟数据请求
  Future requestPersonalInfo() async {
    await Future.delayed(const Duration(seconds: 1), () {
      PrintUtil.print("requestPersonalInfo --- success");
    });
    PersonInfo info = personInfoFromJson(
        "{\"id\":\"111\",\"name\":\"红日\",\"age\":\"20\",\"gender\":\"male\"}");

    ///注意：这里必须使用copyWith创建新的MyModel对象，然后将其赋值给state,这样watch处才会更新UI
    state = state.copyWith(
        id: info.id, name: info.name, age: info.age, gender: info.gender);
  }

  ///给某个变量赋值时，最好使用下面的方式赋值，这样在使用watch监听的地方，就可以进行数据刷新
  ///尽量避免使用ref.read(stateNotifierProvider).country = "America"的方式进行赋值（这种方式无法响应式刷新UI），
  ///除非你没有使用watch的地方。
  void updateCountry(String country) async {
    state = state.copyWith(country: country);
  }
}

class MyModel {
  String id = "";
  String name = "";
  String age = "";
  String gender = "";

  String country = "";

  MyModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender});

  MyModel copyWith(
      {String? id,
      String? name,
      String? age,
      String? gender,
      String? country}) {
    return MyModel(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        gender: gender ?? this.gender)
      ..country = country ?? this.country;
  }
}
