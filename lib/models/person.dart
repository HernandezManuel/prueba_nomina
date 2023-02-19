double globalCestaAlimenticia = 74.3;

class Person {
  Person({
    required this.uid,
    required this.nombre,
    required this.apellido,
    required this.cedula,
    required this.salarioBase,
    required this.diasTrabajados,
    required this.sabado,
    required this.domingo,
    required this.sso,
    required this.faov,
    required this.inces,
    required this.cestaAlimenticia,
    required this.montoAPagar,
  });

  String uid;
  String nombre;
  String apellido;
  int cedula;
  double salarioBase;
  int diasTrabajados;
  int sabado;
  int domingo;
  double sso;
  double faov;
  double inces;
  double cestaAlimenticia;
  double montoAPagar;

  factory Person.fromJson(String uid, Map<String, dynamic> json) => Person(
        uid: uid,
        nombre: json["nombre"],
        apellido: json["apellido"],
        cedula: json["cedula"],
        salarioBase: json["salarioBase"],
        diasTrabajados: json["diasTrabajados"],
        sabado: json["sabado"],
        domingo: json["domingo"],
        sso: json["sso"],
        faov: json["faov"],
        inces: json["inces"],
        cestaAlimenticia: json["cestaAlimenticia"],
        montoAPagar: json["montoAPagar"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "cedula": cedula,
        "salarioBase": salarioBase,
        "diasTrabajados": diasTrabajados,
        "sabado": sabado,
        "domingo": domingo,
        "sso": sso,
        "faov": faov,
        "inces": inces,
        "cestaAlimenticia": cestaAlimenticia,
        "montoAPagar": montoAPagar,
      };

  void calculate() {
    sso = salarioBase * 0.04;
    faov = salarioBase * 0.01;
    inces = salarioBase * 0.01;
    cestaAlimenticia = globalCestaAlimenticia;
    montoAPagar = salarioBase -
        sso -
        faov -
        inces -
        cestaAlimenticia -
        (salarioBase / 30 * (30 - diasTrabajados));
  }
}
