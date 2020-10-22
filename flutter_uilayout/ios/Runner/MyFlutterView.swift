//
//  MyFlutterView.swift
//  Runner
//
//  Created by xj_mac on 2020/10/22.
//

import Foundation
import Flutter

class MyFlutterView : NSObject,FlutterPlatformView {
    
    let label = UILabel()
    
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        super.init()
        if(args is NSDictionary){
            let dict = args as! NSDictionary
            label.text  = dict.value(forKey: "text") as? String
            
        }
        let methodChannel = FlutterMethodChannel(name: "com.flutter.guide.MyFlutterView_\(viewID)", binaryMessenger: messenger)
        
        methodChannel.setMethodCallHandler {(call, result:FlutterResult) in
            
            //Flutter传递数据给iOS
            if (call.method == "setText") {
                    if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    let age:Int = dict["age"] as? Int ?? -1
                    self.label.text = "hello,\(name),年龄：\(age)"
                }
            }
            //Flutter向iOS发起请求，回传数据
            else if (call.method == "getData"){
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    let age:Int = dict["age"] as? Int ?? -1
                    
                    result(["name":"我是发起请求后得到的\(name)","age":age])
                }
            }
        }
    }
    
    func view() -> UIView {
        return label
    }
}
