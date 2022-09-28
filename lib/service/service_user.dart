import 'package:apiintercom/models/cliente.dart';
import 'package:apiintercom/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class MessajeService {
  Future<Messaje> datosFinansys() async {
    Map data = {
      'id_company': '0190483843001',
      "idc": "5600000038"
    };
    final body = json.encode(data);
    final peticion = await http.post(
        Uri.parse('http://codgrec.finamsys.com:9969/api/v1.0/get_data_contract')
        , headers: {"Content-Type": "application/json"}, body: body);
    final body1 = utf8.decode(peticion.bodyBytes);
    final jsonResponse = jsonDecode(body1);

    if (peticion.statusCode == 200) {
      Messaje product = new Messaje.fromJson(jsonResponse);
      // print(jsonResponse);
      return Messaje.fromJson(jsonResponse["messaje"]);
    }
    else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }


}