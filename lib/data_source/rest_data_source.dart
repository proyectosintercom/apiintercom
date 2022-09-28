import 'dart:convert';
import 'package:apiintercom/models/user.dart';

import 'package:http/http.dart' as http;

class RestDataSource {
  //http://codgrec.finamsys.com:9969/api/v1.0/get_invoice_from_idc
  static const String _baseUrl = 'codgrec.finamsys.com:9969';
  static const String _name = '/api/v1.0/get_invoice_from_idc';
  //static const String _location = '/api';
  //static const String _picture = '/api';

  final http.Client _httpClient;

  RestDataSource({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<T> _callGetApi<T>({
    required String endpoint,
   // required Map<String, dynamic> params,
    required T Function(Map<String, dynamic> data) builder,
  }) async {
    var

    uri = Uri.https(_baseUrl, endpoint);
    Map data = {
      'id_company': '0190483843001',
      "idc": "5600000038"
    };
    final body = json.encode(data);
    // peticion = await http.post(Uri.parse('http://codgrec.finamsys.com:9969/api/v1.0/get_data_contract'), headers: {"Content-Type": "application/json"}, body: body);
    final response = await _httpClient.post((uri),body: body);
    return builder(json.decode(response.body)['messaje'][0]);
     }

  Future<User> getName() async {
    return _callGetApi(
      endpoint: _name,
      //params: {'id_company': 'idc'},
      builder: (data) => User.fromJson(data),
    );
  }

}






















