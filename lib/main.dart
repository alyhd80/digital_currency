import 'package:digital_currency/providers/CryptoDataProvider.dart';
import 'package:digital_currency/providers/ThemeProvider.dart';
import 'package:digital_currency/providers/marketviewprovider.dart';
import 'package:digital_currency/providers/userDataProvider.dart';
import 'package:digital_currency/ui/mainWrapper.dart';
import 'package:digital_currency/ui/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (contex) => ThemeProvider()),
      ChangeNotifierProvider(create: (contex) => CryptoDataProvider()),
      ChangeNotifierProvider(create: (contex) => MarketViewProvider()),
      ChangeNotifierProvider(create: (contex) => UserDataProvider()),

    ],
    child: const MyMaterialApp(),
  ));
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
          //for them
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          //////////////////////////////////////////////////////////////

          home: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                SharedPreferences sharedPreferences=snapshot.data!;
                var loggedInState=sharedPreferences.getBool("loggedIn")??false;
                var loginUser=sharedPreferences.getString("userName")??false;
                var loginEmail=sharedPreferences.getString("userGmail")??false;
                var loginpasword=sharedPreferences.getString("userPasword")??false;

                print(loginUser);
                print(loginEmail);
                print(loginUser);


                if(loggedInState){
                  return MainWrapper();
                }else{
                  return MainWrapper();
                }

              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ));
    });
  }
}
