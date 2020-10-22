import 'package:json_annotation/json_annotation.dart';

part 'testjson.g.dart';

@JsonSerializable()
class Testjson {
    Testjson();

    String reason1;
    Map<String,dynamic> result;
    num error_code;
    
    factory Testjson.fromJson(Map<String,dynamic> json) => _$TestjsonFromJson(json);
    Map<String, dynamic> toJson() => _$TestjsonToJson(this);
}
