import 'package:example/services/movies_provider.dart';
import 'package:example/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1A1919),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const HomePage(),
      ),
    );
  }
}
