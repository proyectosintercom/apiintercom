class User {
  final String nombre;
  final String cedula;

  final String idc;

  User(this.nombre, this.cedula,this.idc);

  User.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        cedula = json['cedula'],

        idc= json['idc'];
}
