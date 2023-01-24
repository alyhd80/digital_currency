import 'package:digital_currency/providers/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final temProvider = Provider.of<ThemeProvider>(context);

    var switchIcon = Icon(temProvider.isDarkMode
        ? CupertinoIcons.moon_fill
        : CupertinoIcons.sun_max_fill);

    return IconButton(
        onPressed: () {
          temProvider.toggleTheme();
        },
        icon: switchIcon);
  }
}
