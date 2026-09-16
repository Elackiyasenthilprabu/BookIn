import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/onboarding_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/verification_screen.dart';
import '../screens/common/placeholder_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/edit_profile_screen.dart';
import '../screens/profile/profile_screen.dart';
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
  static const String verification = '/verification';
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
        // Common
        splash: (context) => const SplashScreen(),

        // Member 1: Auth & User Management — Real Screens
        onboarding: (context) => const OnboardingScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        forgotPassword: (context) => const ForgotPasswordScreen(),
        profile: (context) => const ProfileScreen(),
        editProfile: (context) => const EditProfileScreen(),

        // Member 2: Book Management
        home: (context) => const HomeScreen(),
        addBook: (context) => const PlaceholderScreen(
              title: 'Add New Book',
              subtitle: 'Post a book for exchange or sale with image upload.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.add_box_rounded,
            ),
        editBook: (context) => const PlaceholderScreen(
              title: 'Edit Book Listing',
              subtitle:
                  'Update book details, pricing, condition, or availability.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.edit_note_rounded,
            ),
        myListings: (context) => const PlaceholderScreen(
              title: 'My Book Listings',
              subtitle:
                  'Manage and track the books you have posted for sale/exchange.',
              moduleOwner: 'Member 2 (Book Management)',
              icon: Icons.list_alt_rounded,
            ),

        // Member 3: Search & Discovery — Real Screens
        search: (context) => const SearchScreen(),
        favorites: (context) => const FavoritesScreen(),
      };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Search Results — requires query arguments
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

    // Verification — requires email argument
    if (settings.name == verification) {
      final args = settings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (_) => VerificationScreen(
          email: args['email'] as String? ?? '',
        ),
        settings: settings,
      );
    }

    // Book Details — requires Book argument
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

    // Fall back to static routes map
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }

    // 404
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
