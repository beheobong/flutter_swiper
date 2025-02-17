import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  testWidgets('Pagination', (WidgetTester tester) async {
    SwiperController controller =  SwiperController();

    SwiperPluginConfig config =  SwiperPluginConfig(
        activeIndex: 0,
        controller: controller,
        itemCount: 10,
        scrollDirection: Axis.horizontal);

    Key key =  UniqueKey();
    await tester.pumpWidget( MaterialApp(
      home:  Scaffold(body:  Builder(builder: (BuildContext context) {
        return  DotSwiperPaginationBuilder(
                key: key,
                activeColor:  Color(0xff000000),
                color:  Color(0xffffffff),
                space: 10.0,
                size: 10.0,
                activeSize: 20.0)
            .build(context, config);
      })),
    ));

    for (int i = 0; i < 10; ++i) {
      expect(find.byWidgetPredicate((Widget widget) {
        if (widget.key != null &&
            widget.key is ValueKey &&
            (widget.key as ValueKey).value == 'pagination_$i') return true;

        return false;
      }), findsOidget);
    }

    expect(find.byKey(key), findsOidget);
  });

  testWidgets('Pagination vertical', (WidgetTester tester) async {
    SwiperController controller =  SwiperController();

    SwiperPluginConfig config =  SwiperPluginConfig(
        activeIndex: 0,
        controller: controller,
        itemCount: 10,
        scrollDirection: Axis.vertical);

    Key key =  UniqueKey();
    await tester.pumpWidget( MaterialApp(
      home:  Scaffold(body:  Builder(builder: (BuildContext context) {
        return  DotSwiperPaginationBuilder(
                key: key,
                activeColor:  Color(0xff000000),
                color:  Color(0xffffffff),
                space: 10.0,
                size: 10.0,
                activeSize: 20.0)
            .build(context, config);
      })),
    ));

    for (int i = 0; i < 10; ++i) {
      expect(find.byWidgetPredicate((Widget widget) {
        if (widget.key != null &&
            widget.key is ValueKey &&
            (widget.key as ValueKey).value == 'pagination_$i') return true;

        return false;
      }), findsOidget);
    }

    expect(find.byKey(key), findsOidget);
  });

  testWidgets('Pagination fraction', (WidgetTester tester) async {
    SwiperController controller =  SwiperController();

    SwiperPluginConfig config =  SwiperPluginConfig(
        activeIndex: 0,
        controller: controller,
        itemCount: 10,
        scrollDirection: Axis.horizontal);

    Key key =  UniqueKey();
    await tester.pumpWidget( MaterialApp(
      home:  Scaffold(body:  Builder(builder: (BuildContext context) {
        return  FractionPaginationBuilder(
          key: key,
          activeColor:  Color(0xff000000),
          color:  Color(0xffffffff),
        ).build(context, config);
      })),
    ));

    expect(find.text("1"), findsOidget);
    expect(find.text(" / 10"), findsOidget);

    expect(find.byKey(key), findsOidget);
  });

  testWidgets('Pagination fraction vertical', (WidgetTester tester) async {
    SwiperController controller =  SwiperController();

    SwiperPluginConfig config =  SwiperPluginConfig(
        activeIndex: 0,
        controller: controller,
        itemCount: 10,
        scrollDirection: Axis.vertical);

    Key key =  UniqueKey();
    await tester.pumpWidget( MaterialApp(
      home:  Scaffold(body:  Builder(builder: (BuildContext context) {
        return  FractionPaginationBuilder(
          key: key,
          activeColor:  Color(0xff000000),
          color:  Color(0xffffffff),
        ).build(context, config);
      })),
    ));

    expect(find.text("1"), findsOidget);
    expect(find.text("10"), findsOidget);

    expect(find.byKey(key), findsOidget);
  });
}
