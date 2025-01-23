import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/data/api/api_services.dart';
import 'package:tourism/data/local/local_database_service.dart';
import 'package:tourism/provider/bookmark/local_database_provider.dart';
import 'package:tourism/provider/detail/tourism_detail_provider.dart';
import 'package:tourism/provider/home/tourism_list_provider.dart';
import 'package:tourism/provider/main/index_nav_provider.dart';
import 'package:tourism/screen/detail/detail_screen.dart';
import 'package:tourism/screen/main/main_screen.dart';
import 'package:tourism/static/navigation_route.dart';
import 'package:tourism/style/theme/tourism_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexNavProvider(),
        ),
        Provider(
          create: (context) => ApiServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismListProvider(
            context.read<ApiServices>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismDetailProvider(
            context.read<ApiServices>(),
          ),
        ),
        Provider(
          create: (context) => LocalDatabaseService(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalDatabaseProvider(
            context.read<LocalDatabaseService>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
              tourismId: ModalRoute.of(context)?.settings.arguments as int,
            ),
      },
    );
  }
}
