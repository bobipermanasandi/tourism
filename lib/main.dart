import 'package:flutter/material.dart';
import 'package:tourism/model/tourism.dart';
import 'package:tourism/screen/detail/detail_screen.dart';
import 'package:tourism/screen/main/main_screen.dart';
import 'package:tourism/static/navigation_route.dart';
import 'package:tourism/style/theme/tourism_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourism',
      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
            ),
      },
    );
  }
}
