import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/common/placeholder_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/search/search_results_screen.dart';
import '../screens/search/search_screen.dart';

class AppRoutes {
  // Common / Splash
  static const String splash = '/';

  // Member 1 - Auth & User Management
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';

  // Member 2 - Book Management
  static const String home = '/home';
  static const String bookDetails = '/book-details';
  static const String addBook = '/add-book';
  static const String editBook = '/edit-book';
  static const String myListings = '/my-listings';

  // Member 3 - Search & Discovery
  static const String search = '/search';
  static const String searchResults = '/search-results';
  static const String favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => {
        // Implemented Screens
        splash: (context) => const SplashScreen(),
        search: (context) => const SearchScreen(),
        favorites: (context) => const FavoritesScreen(),

        // Member 1: Auth & User Management Placeholders
        onboarding: (context) => const PlaceholderScreen(
              title: 'Onboarding',
              subtitle: 'Welcome slides introducing BookIn app features.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.auto_stories_rounded,
            ),
        login: (context) => const PlaceholderScreen(
              title: 'Login',
              subtitle: 'Sign in with email and password or Google Auth.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.login_rounded,
            ),
        register: (context) => const PlaceholderScreen(
              title: 'Registration',
              subtitle: 'Create a new account with college email verification.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.person_add_alt_1_rounded,
            ),
        forgotPassword: (context) => const PlaceholderScreen(
              title: 'Forgot Password',
              subtitle: 'Password reset link sent to your registered email.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.lock_reset_rounded,
            ),
        profile: (context) => const PlaceholderScreen(
              title: 'User Profile',
              subtitle: 'View user profile, photo, and account details.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.account_circle_rounded,
            ),
        editProfile: (context) => const PlaceholderScreen(
              title: 'Edit Profile',
              subtitle: 'Update username, avatar, contact number, and department.',
              moduleOwner: 'Member 1 (Auth & User Management)',
              icon: Icons.manage_accounts_rounded,
            ),

        // Member 2: Book Management Placeholders
        home: (context) => const PlaceholderScreen(
              title: 'Home Dashboard',
              subtitle: 'Featured listings, recent books, and categories.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.dashboard_rounded,
            ),
        addBook: (context) => const PlaceholderScreen(
              title: 'Add New Book',
              subtitle: 'Post a book for exchange or sale with image upload.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.add_box_rounded,
            ),
        editBook: (context) => const PlaceholderScreen(
              title: 'Edit Book Listing',
              subtitle: 'Update book details, pricing, condition, or availability.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.edit_note_rounded,
            ),
        myListings: (context) => const PlaceholderScreen(
              title: 'My Book Listings',
              subtitle: 'Manage and track the books you have posted for sale/exchange.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.list_alt_rounded,
            ),
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
        settings: settings,
      );
    }

    if (settings.name == bookDetails) {
      final book = settings.arguments as Book?;
      return MaterialPageRoute(
        builder: (_) => PlaceholderScreen(
          title: book != null ? book.title : 'Book Details',
          subtitle: book != null
              ? 'Author: ${book.author} · Price: ₹${book.price}\nCondition & Exchange details'
              : 'Detailed book information, seller contact, and exchange options.',
          moduleOwner: 'Member 2 (Book Management)',
          icon: Icons.menu_book_rounded,
        ),
        settings: settings,
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
      settings: settings,
    );
  }
}
