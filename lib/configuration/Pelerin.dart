class Pelerin {
  int id;
  String nomArabe;
  String prenomArabe;
  String telephoneTunisien;
  String etat;
  Pelerin({
    required this.id,
    required this.nomArabe,
    required this.prenomArabe,
    required this.telephoneTunisien,
    required this.etat,
  });

  factory Pelerin.fromJson(Map<String, dynamic> fichierJson) {
    return Pelerin(
      id: fichierJson['id'],
      nomArabe: fichierJson['nomArabe'].toString(),
      prenomArabe: fichierJson['prenomArabe'].toString(),
      telephoneTunisien: fichierJson['telephoneTunisien'].toString(),
      etat: fichierJson['etat'].toString(),
    );
  }
}
