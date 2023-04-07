import 'dart:ui';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;
  String _Content = 'استغفــر الله';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              ++_counter;
            });
          },
          child: Icon(Icons.add, color: Colors.teal, size: 30,),
          backgroundColor: Colors.white,
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text("سُــبحة الأذكــار",
              style: TextStyle(fontFamily: "Tajawal",
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          actions: [
            PopupMenuButton<int>(
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      _changeContent(newContent: 'استغفــر الله');
                      break;
                    case 2:
                      _changeContent(newContent: 'الحمــد لله');
                      break;
                    case 3:
                      _changeContent(newContent: 'سبحــان الله');
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text('استغفــر الله',
                      style: TextStyle(fontSize: 14, fontFamily: 'Cairo',),),
                      value: 1)
                    ,
                    PopupMenuItem(
                      child: Text('الحمــد لله',
                      style: TextStyle(fontSize: 14, fontFamily: 'Cairo'),),
                      value: 2,)
                    ,
                    PopupMenuItem(
                      child: Text('سبحــان الله',
                      style: TextStyle(fontSize: 14, fontFamily: 'Cairo'),),
                      value: 3,)
                  ];
                })

          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Colors.teal.shade200,
                    Colors.teal.shade900,
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://m.media-amazon.com/images/I/41140kXQ2lL._AC_UF1000,1000_QL80_.jpg')
                    )
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 15),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(_Content,
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal',
                          fontSize: 25
                      ),)),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.teal
                      ),
                      child: Text(_counter.toString(),
                        style: TextStyle(color: Colors.white,
                            fontFamily: 'Tajawal',
                            height: 2,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),),
                    )
                  ],
                ),
              ),
              Row(children: [
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal.shade400,
                            minimumSize: Size(0, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10)))
                        ),
                        child: Text(
                            "تسبيــح", style: TextStyle(fontFamily: 'Cairo')),
                        onPressed: () {
                          setState(() {
                            ++_counter;
                          });
                        })),
                Expanded(
                    child: ElevatedButton(
                      child: Text("اعـــادة", style: TextStyle(
                          color: Colors.black, fontFamily: 'Cairo'),),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade300,
                          minimumSize: Size(0, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius
                                  .circular(10))
                          )
                      ),
                      onPressed: () {
                        setState(() {
                          _counter = 0;
                        });
                      },))
              ],)
            ],
          ),
        ),
      ),
    );
  }

  void _changeContent({required String newContent}) {
    if (_Content != newContent) {
      setState(() {
        _Content = newContent;
        _counter = 0;
      });
    }
  }
}
