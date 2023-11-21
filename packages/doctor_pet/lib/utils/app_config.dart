class AppEnvironment {
  AppEnvironment._({
    required this.apiBaseUrl,
  });

  String? apiBaseUrl;
  String? webSocket;

  factory AppEnvironment.live({
    required String apiBaseUrl,
  }) {
    return AppEnvironment._(apiBaseUrl: apiBaseUrl);
  }
}
