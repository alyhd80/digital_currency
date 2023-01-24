import 'package:digital_currency/ui/Homepage.dart';
import 'package:digital_currency/ui/marketviewpag.dart';
import 'package:digital_currency/ui/profilepage.dart';
import 'package:digital_currency/ui/ui_helper/bottomnav.dart';
import 'package:digital_currency/ui/watchlistpage.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(controller: myPage),
      body: PageView(
        controller: myPage,
        children: const [
          HomePage(),
          MarketViewPage(),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
