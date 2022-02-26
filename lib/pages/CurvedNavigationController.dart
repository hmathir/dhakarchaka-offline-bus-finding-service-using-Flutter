import 'dart:io';
import 'package:dhakar_chaka/pages/searchBus.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'HomePage.dart';
import 'aboutPage.dart';

class CurvedNavigationController extends StatefulWidget {
  @override
  _CurvedNavigationControllerState createState() =>
      _CurvedNavigationControllerState();
}

class _CurvedNavigationControllerState
    extends State<CurvedNavigationController> {
  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are You Sure?'),
        content: Text('Do You Want To Exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  int bottomSelectedIndex = 0;

  List<Widget> buildBottomNavBarItems = <Widget>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.info_outline)
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomePage(),
        SearchBus(),
        About(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
       child: Scaffold(
        extendBody: true,
        body: buildPageView(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          index: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: buildBottomNavBarItems,
        ),
      ),
    );
  }
}
