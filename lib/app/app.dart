import 'package:coachinho/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum TabItem { news, training, play, clubs, profile }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff266555), brightness: Brightness.dark),
          // colorSchemeSeed: const Color(0xff266555),
          // primaryColorDark: const Color(0xff030505),
          colorScheme:
              ColorScheme.fromSeed(seedColor: const Color(0xff092c23))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TabItem index = TabItem.news;

  void _selectTab(TabItem tabItem) {
    setState(() {
      index = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _buildSelectedScreen(index),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/news.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )),
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/news.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff6de07d),
                  )),
              label: 'News'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/pyramid-icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )),
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/pyramid-icon.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff6de07d),
                  )),
              label: 'Training'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/football-icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )),
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/football-icon.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff6de07d),
                  )),
              label: 'Play'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/shirts-icon.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )),
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/shirts-icon.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff6de07d),
                  )),
              label: 'Clubs'),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    width: 24,
                    height: 24,
                    color: Colors.white,
                  )),
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    width: 24,
                    height: 24,
                    color: const Color(0xff6de07d),
                  )),
              label: 'Profile'),
        ],
        backgroundColor: const Color(0xff266555),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xff6de07d),
        selectedLabelStyle: const TextStyle(
            fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
            fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        currentIndex: index.index,
        onTap: (index) => _selectTab(TabItem.values[index]),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildSelectedScreen(TabItem selectedIndex) {
    switch (selectedIndex) {
      case TabItem.news:
        return const Center(
            child: Text(
          'News Page',
        ));
      case TabItem.training:
        return const Center(child: Text('Training Page'));
      case TabItem.play:
        return const Center(child: Text('Play Page'));
      case TabItem.clubs:
        return const Center(child: Text('Clubs Page'));
      case TabItem.profile:
        return const ProfileScreen();
    }
  }
}
