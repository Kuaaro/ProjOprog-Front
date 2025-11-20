class AppConfig {
  // Read API_BASE_URL from build-time constant (--dart-define)
  // If not provided, use default for local development
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000', // Default for local dev (mock server)
  );

  // Helper to get the base URL
  static String getBaseUrl() {
    return apiBaseUrl;
  }
}

