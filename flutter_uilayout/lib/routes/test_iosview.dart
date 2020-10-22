import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestIosViewRoute extends StatefulWidget {

  @override
  TestIosViewRouteState createState() {
    return new TestIosViewRouteState();
  }
}

class TestIosViewRouteState extends State<TestIosViewRoute> {
  static const platform = const MethodChannel('com.flutter.guide.MyFlutterView');
  var _data = '获取数据';  //在setState里面调用修改了的值可以及时更新UI显示
  var platforms = [];//如果页面有多个原生空间可以使用数组或者字典的方式来获取并通信
  @override
  Widget build(BuildContext context) {

    Widget platformView(){
      if (defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(
          // viewType: 'plugins.flutter.io/custom_platform_view',
          // onPlatformViewCreated: (viewId) {
          //   print('viewId:$viewId');
          //   platforms
          //       .add(MethodChannel('com.flutter.guide.MyFlutterView_$viewId'));
          // },
          // creationParams: {'text': 'Flutter传给AndroidTextView的参数'},
          // creationParamsCodec: StandardMessageCodec(),
        );
      }else if(defaultTargetPlatform == TargetPlatform.iOS){
        return UiKitView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          onPlatformViewCreated: (viewId){
            print('viewId:$viewId');
            platforms.add(MethodChannel('com.flutter.guide.MyFlutterView_$viewId'));
          },
          creationParams: {'text': 'Flutter传给IOSTextView的参数'},//向iOS传递初始化参数
          creationParamsCodec: StandardMessageCodec(),//将 creationParams 编码后再发送给平台侧
        );
      }
    }

    //platformView
    return Column(

        children: [
        RaisedButton(
          child: Text('传递参数给原生'),
          onPressed: (){
            platforms[0].invokeMethod('setText', {'name': 'tqh', 'age': 18});
            print('我将数据传递给了iOS');
          },
        ),

         RaisedButton(

           child: Text('$_data'),
             onPressed: () async {
             //给第一个发送消息
               var result = await platforms[0]
                   .invokeMethod('getData', {'name': 'tqh', 'age': 18});//获取数据
               //可刷新UI
               setState(() {
                 _data = '${result['name']},${result['age']}';//
                 print(_data);
               });
             },
          ),
          Text('$_data'),
          Expanded(child: Container(color: Colors.red,child: platformView())),
          Expanded(child: Container(color: Colors.blue, child: platformView())),
          Expanded(child: Container(color: Colors.yellow, child: platformView())),

    ]);
  }
}