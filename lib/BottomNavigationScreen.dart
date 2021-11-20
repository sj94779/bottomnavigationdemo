import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'comingsoon.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;
  GlobalKey bottomNavigationKey = GlobalKey();

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
    // use this to animate to the page
  }

  void _onPageChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _deviceSize = MediaQuery.of(context).size;
    final _padding = MediaQuery.of(context).padding;

    final _availableHeight = _deviceSize.height - _padding.top;

    return Scaffold(
        body: Center(child: _buildPageView()),
        bottomNavigationBar: _curvedNavBar());
  }

  Widget _curvedNavBar() {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      index: _selectedIndex,
      height: 60.0,
      items: <Widget>[
        // Image(
        //   image: AssetImage('assets/images/ic_weather_100.png'),
        //   width: 30,
        //   height: 30,
        // ),
        // Image(
        //   image: AssetImage('assets/images/ic_video_100.png'),
        //   width: 30,
        //   height: 30,
        // ),
        Icon(Icons.home, size: 30),
        Icon(Icons.air, size: 30),
        Icon(Icons.add_location, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      color: Color.fromRGBO(109, 192, 42, 0.7),
      // buttonBackgroundColor: Color.fromRGBO(100, 156, 241, 1),
      buttonBackgroundColor: Colors.green,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
      onTap: (index) => setState(() {
        _onPageChanged(index);
        _pageController.animateToPage(_selectedIndex,
            duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
      }),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) => _onPageChanged(index),
      children: <Widget>[
        SoonPage(),
        SoonPage(),
        SoonPage(),
        SoonPage(),
      ],
    );
  }
}
