import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'test.dart'; //测试视图

class TestTabbarRoute extends StatefulWidget {
  @override
  TestTabbarRouterState createState() {
    return new TestTabbarRouterState();
  }
}

class TestTabbarRouterState extends State<TestTabbarRoute> {
  int lastTime = 0;
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    // return Container();

    return WillPopScope(
        child: Scaffold(
          body: PageView(
            children: <Widget>[
              TestRoute(),
              TestRoute(),
              TestRoute(),
              TestRoute()
            ],
            onPageChanged: onPageChanged,
            controller: pageController,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('记录仪');
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).accentColor,
            shape: CircularNotchedRectangle(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 44,
                    child: GestureDetector(
                        onTap: () {
                          onTap(0);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.home, color: getColor(0)),
                            Text("首页", style: TextStyle(color: getColor(0)))
                          ],
                        )),
                  ),
                  Container(
                    width: 44,
                    child: GestureDetector(
                        onTap: () {
                          onTap(1);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.forum, color: getColor(1)),
                            Text("论坛", style: TextStyle(color: getColor(1)))
                          ],
                        )),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.transparent,
                      ),

                      Text("连接设备", style: TextStyle(color: Color(0xFFEEEEEE),fontSize: 12))
                    ],
                  ),
                  Container(
                    width: 44,
                    child: GestureDetector(
                        onTap: () {
                          onTap(2);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.mail, color: getColor(2)),
                            Text("消息", style: TextStyle(color: getColor(2)))
                          ],
                        )),
                  ),
                  Container(
                      width: 44,
                      child: GestureDetector(
                          onTap: () {
                            onTap(3);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.person, color: getColor(3)),
                              Text("我的", style: TextStyle(color: getColor(3)))
                            ],
                          ))),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;
          if (result > 2000) {
            SystemNavigator.pop();
            print('再按一次退出');
            // Toast.show(context, '再按一次退出');
          } else {
            SystemNavigator.pop();
          }
          return null;
        });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onPageChanged(int value) {
    setState(() {
      this.page = value;
    });
  }

  Color getColor(int value) {
    return this.page == value ? Theme.of(context).cardColor : Color(0XFFBBBBBB);
  }

  void onTap(int value) {

    pageController.jumpToPage(value);//不带动画的切换
    // pageController.animateToPage(value,
    //     duration: const Duration(milliseconds: 100), curve: Curves.ease);
    // pageController.animateToPage(value);
  }
}
