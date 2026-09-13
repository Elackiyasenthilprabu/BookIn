import 'package:flutter/material.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/search/search_results_screen.dart';
import '../screens/search/search_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String search = '/search';
  static const String searchResults = '/search-results';
  static const String favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        search: (context) => const SearchScreen(),
        favorites: (context) => const FavoritesScreen(),
      };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == searchResults) {
      final args = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (_) => SearchResultsScreen(
          query: args['query'] as String? ?? '',
          category: args['category'] as String?,
          department: args['department'] as String?,
          sortBy: args['sortBy'] as String? ?? 'Newest',
        ),
      );
    }

    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
