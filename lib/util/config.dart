class Config {
  static final Config _instance = Config._internal();

  factory Config() => _instance;

  Config._internal();

  final String baseUrl = "https://5517-120-188-87-27.ngrok-free.app/api";
  String formatCurrency(int value) {
    // Convert the number to a string and split it into the integer and decimal parts
    String stringValue = value.toStringAsFixed(0); // No decimal points
    String result = '';
    int count = 0;
    // Iterate backward through the string to insert commas
    for (int i = stringValue.length - 1; i >= 0; i--) {
      result = stringValue[i] + result;
      count++;
      if (count == 3 && i != 0) {
        result = '.' + result;
        count = 0;
      }
    }
    return 'Rp' + result;
  }
}
