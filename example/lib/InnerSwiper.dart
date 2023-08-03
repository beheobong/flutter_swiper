import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  InnerSwiper(),
    );
  }
}

class InnerSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  _InnerSwiperState();
  }
}

class _InnerSwiperState extends State<InnerSwiper> {
  SwiperController controller;

  List<bool> autoplayes;

  List<SwiperController> controllers;

  @override
  void initState() {
    controller =  SwiperController();
    autoplayes =  List()
      ..length = 10
      ..fillRange(0, 10, false);
    controllers =  List()
      ..length = 10
      ..fillRange(0, 10,  SwiperController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Swiper(
        loop: false,
        itemCount: 10,
        controller: controller,
        pagination:  SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            children: <Widget>[
               SizedBox(
                child:  Swiper(
                  controller: controllers[index],
                  pagination:  SwiperPagination(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      color: Colors.greenAccent,
                      child:  Text("jkfjkldsfjd"),
                    );
                  },
                  autoplay: autoplayes[index],
                ),
                height: 300.0,
              ),
               RaisedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = true;
                  });
                },
                child:  Text("Start autoplay"),
              ),
               RaisedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = false;
                  });
                },
                child:  Text("End autoplay"),
              ),
               Text("is autoplay: ${autoplayes[index]}")
            ],
          );
        },
      ),
    );
  }
}
