import 'package:http/http.dart' as http;

class BackEnd {
  Future<http.Response> buttonPressed() async {
    final response = await http.get(Uri.parse("uri"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset-UTF-8'
    });

    return response;
  }
}
