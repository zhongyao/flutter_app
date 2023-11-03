part 'user.g.dart';

class User {
  String firstName;
  String address;

  User(this.firstName, this.address);

  factory User.fromJson(Map<String, String> json) => _$UserFromJson(json);

  Map<String, String> toJson() => _$UserToJson(this);
}
