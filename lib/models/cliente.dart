import 'dart:convert';
import 'package:http/http.dart' as http;

class Messaje {
  String cedula;
  String nombre;

  Messaje({
    required this.cedula,
    required  this.nombre,
  });

  Map<String, dynamic> toMap() {
    return {
      "cedula": cedula,
      "nombre": nombre,
    };
  }

  factory Messaje.fromJson(Map<String, dynamic> json) {
    return Messaje(
      cedula: json["cedula"],
      nombre: json["nombre"],
    );
  }
}