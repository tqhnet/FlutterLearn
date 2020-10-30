import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tool_xi/Tool/index.dart';

import 'package:flutter_uilayout/models/index.dart';
import 'package:tool_xj/Tool/http/http_manager.dart';
import 'package:tool_xj/Tool/http/http_error.dart';


//这里引用有问题不能这样引用，需要写到库里面引用
// import 'package:flutter_uilayout/Tool/http/http_error.dart';
// import 'package:flutter_uilayout/Tool/http/http_manager.dart';
// import 'package:flutter_uilayout/models/index.dart';

class TestHttpRoute extends StatefulWidget {

  @override
  TestHttpRouteState createState() {
    return new TestHttpRouteState();
  }
}

class TestHttpRouteState extends State<TestHttpRoute> {
  @override
  Widget build(BuildContext context) {

    _request();
    _get();
    // _post();
    // getHttp();
    return Container(child: Text('注意看提示日志'),);
  }

  //dio请求
  void getHttp() async {
    try {
      Response response = await Dio().get("http://v.juhe.cn/toutiao/index?type=top&key=b6084e63b96ad9becbf98ff0004a5597");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void _request(){
    //Api.getBaseUrl()
    HttpManager().init(
      baseUrl: 'http://v.juhe.cn',
      //日志打印
      interceptors: [
        // HeaderInterceptor(),
        LogInterceptor(),
      ],
    );
  }

  void _get() {
    HttpManager().get(
      url: "/toutiao/index?type=top&key=b6084e63b96ad9becbf98ff0004a5597",
      successCallback: (data) {

        var model = Testjson.fromJson(data);

        print(data);
        print(model.reason1);
      },
      errorCallback: (HttpError error) {
        // print(error);
      },
      tag: "tag",
    );
  }
  ///post 网络请求
  void _post(){
    print('111111111');
    HttpManager().post(
      url: "/toutiao/index?type=top&key=b6084e63b96ad9becbf98ff0004a5597",
      // data: {"iouCode": iouCode},
      successCallback: (data) {
        print('111111111');
        print('111111111');
        print('111111111');
      },
      errorCallback: (HttpError error) {

      },
      tag: "tag",
    );
  }
}
