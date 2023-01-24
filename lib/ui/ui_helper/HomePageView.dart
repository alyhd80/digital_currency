import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  var controller;

  HomePageView({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var images = [
    "assets/images/first.jpg",
    "assets/images/secend.jpg",
    "assets/images/third.jpg",
    "assets/images/forth.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }

  Widget myPages(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image(
        image: AssetImage(image),
        fit: BoxFit.fill,
      ),
    );
  }
}
