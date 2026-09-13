/// Global application constants, collection names, and UI dimensions.
class AppConstants {
  AppConstants._();

  // App Metadata
  static const String appName = 'BookIn';
  static const String appTagline = 'Buy, Sell & Exchange Books';
  static const String appVersion = '1.0.0';

  // Firestore Collection Names
  static const String usersCollection = 'users';
  static const String booksCollection = 'books';
  static const String favoritesCollection = 'favorites';
  static const String searchHistoryCollection = 'search_history';
  static const String categoriesCollection = 'categories';

  // Firebase Storage Folders
  static const String bookImagesFolder = 'book_images';
  static const String userAvatarsFolder = 'user_avatars';

  // UI Dimensions & Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusCircular = 999.0;

  static const double elevationNone = 0.0;
  static const double elevationLow = 1.0;
  static const double elevationMedium = 3.0;

  // Defaults & Limits
  static const int maxRecentSearches = 10;
  static const int maxSuggestions = 5;
  static const int defaultPageSize = 20;
  static const String defaultCurrencySymbol = '₹';

  // Placeholder Assets
  static const String defaultBookCover = 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400';
  static const String defaultUserAvatar = 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200';
}
