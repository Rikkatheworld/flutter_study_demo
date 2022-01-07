import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

/// 这个注解是表示该类是需要生成 Model 类的
@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  // 不同的类使用不同的 mixin 即可
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class A {
  a() {
    User user = User("rikka","rikkaxie@123.com");
    // 数据Bean 转化成一个 Map
    var json = user.toJson();
    // Map 转化成 数据Bean
    var user2 = User.fromJson(json);
  }
}
