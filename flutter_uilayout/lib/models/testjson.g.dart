// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testjson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Testjson _$TestjsonFromJson(Map<String, dynamic> json) {
  return Testjson()
    ..reason1 = json['reason1'] as String
    ..result = json['result'] as Map<String, dynamic>
    ..error_code = json['error_code'] as num;
}

Map<String, dynamic> _$TestjsonToJson(Testjson instance) => <String, dynamic>{
      'reason1': instance.reason1,
      'result': instance.result,
      'error_code': instance.error_code
    };
