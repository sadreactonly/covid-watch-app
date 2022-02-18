import 'package:covid19/scrap_service.dart';
import 'package:covid19/stats_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: WatchShape(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Center(
                child: PageView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                StatsView("БРОЈ ПОТВРЂЕНИХ СЛУЧАЈЕВА У ПОСЛЕДЊА 24 ЧАСА",
                    ScrapService.get()),
                StatsView("БРОЈ ТЕСТИРАНИХ ОСОБА У ПОСЛЕДЊА 24 ЧАСА",
                    ScrapService.getTestedCases()),
                StatsView("БРОЈ ПРЕМИНУЛИХ ОСОБА У ПОСЛЕДЊА 24 ЧАСА",
                    ScrapService.getDeathCases())
              ],
            )),
          ),
        ),
      ),
    );
  }
}
