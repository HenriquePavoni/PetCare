class VaccineModel {
  final int? id;
  final String name;
  final bool vacinado; // Parâmetro esperado

  VaccineModel({this.id, required this.name, required this.vacinado});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'vacinado': vacinado ? 1 : 0,
    };
  }

  factory VaccineModel.fromMap(Map<String, dynamic> map) {
    return VaccineModel(
      id: map['id'],
      name: map['name'],
      vacinado: map['vacinado'] == 1,
    );
  }
}
