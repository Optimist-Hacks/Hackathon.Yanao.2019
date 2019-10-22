import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_app/model/child.dart';

part 'login_response.g.dart';

abstract class LoginResponse
    implements Built<LoginResponse, LoginResponseBuilder> {
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;

  String get id;

  String get name;

  String get token;

  BuiltSet<Child> get children;

  LoginResponse._();

  factory LoginResponse([void Function(LoginResponseBuilder) updates]) =
      _$LoginResponse;
}
