import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void getStats() async {
  final base = 'https://api.covid19api.com/';
  final url = base + 'summary';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    final globalCount = jsonResponse['Global'];
    final countryData = jsonResponse['Countries'];
  }
}
