

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mushaf/QuranAudioScr.dart';
import 'package:mushaf/QuranReadScr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mushaf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff023E73)),
        useMaterial3: true,
      ),
      home: const SplashScr(),
    );
  }
}

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TabsScr()));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff010D26),
              Color(0xff023E73),
            ]),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Al-Mushaf",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jameel",
                fontSize: 30,
                color: Color(0XFFF2F2F2)),
          )),
          Center(
              child: Text(
            "المصحف",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "jameel",
                fontSize: 30,
                color: Color(0XFFF2F2F2)),
          )),
        ],
      ),
    ))
        // backgroundColor: Color(0XFFD9D9D9)
        );
  }
}

class TabsScr extends StatefulWidget {
  const TabsScr({super.key});

  @override
  State<TabsScr> createState() => _TabsScrState();
}

class _TabsScrState extends State<TabsScr> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "المصحف",
              style: TextStyle(
                fontFamily: "alq",
                color: Color(0xff010D26),
              ),
            ),
            centerTitle: true,
            // backgroundColor: Color(0XFF010D26),
            bottom: TabBar(
              labelColor: Color(0XFF023E73),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xff010D26),
              tabs: [
                Tab(
                  text: "Quran",
                ),
                Tab(
                  text: "Recitation",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            QuranReadScr(),
            QuranAudioScr(),
          ])),
    );
  }
}
