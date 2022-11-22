//import 'dart:io';

const String tablePersonne = 'personne';
const String colonneld = 'id';
const String colonneNom = 'nom';
const String colonnePrenom = 'prénom';
const String colonneAge = 'age';

class Personne {
  late int id;
  late String nom;
  late String prenom;
  late String age;

  Personne();

  Personne.fromMap(Map<String, dynamic> map) {
    id = map[colonneld];
    nom = map[colonneNom];
    prenom = map[colonnePrenom];
    age = map[colonneAge];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colonneNom: nom,
      colonnePrenom: prenom,
      colonneAge: age
    };

    // ignore: unnecessary_null_comparison
    if (id != null) {
      map[colonneld] = id;
    }

    return map;
  }
}
