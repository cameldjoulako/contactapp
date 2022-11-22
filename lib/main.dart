import 'package:flutter/material.dart';
import 'package:contactapp/personne.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContactApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> mapPersonne = {
    'nom': 'John',
    'prénom': 'Doe',
    'age': 25
  };

  late Map<String, dynamic> mapPersonneRecuperee;
  Personne personneEnregistree = Personne();
  Personne personneRecuperee = Personne();
  late PersonneProvider provider;

  @override
  void initState() {
    super.initState();
    personneEnregistree = Personne.fromMap(mapPersonne);
    getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    provider.close();
  }

  Future<PersonneProvider> getInstance() async {
    return provider = await PersonneProvider.instance;
  }

  Future<void> enregistrer() async {
    int id = await provider.insert(personneEnregistree);
    mapPersonneRecuperee = {'id': id};
    personneRecuperee = Personne.fromMap(mapPersonneRecuperee);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Enregistrement'),
          content: Text('Les données ont été enregistrées !'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactApp'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.account_circle,
              size: 80.0,
              color: Colors.blue,
            ),
            const Text('Données soumises :'),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${personneEnregistree.toMap()['nom']}',
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Prénom :',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${personneEnregistree.toMap()['prénom']}',
                        style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${personneEnregistree.toMap()['age']}',
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //Section 2
            const Text("Données récupérées :"),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'id :',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['id'] != null
                          ? Text(
                              '${personneRecuperee.toMap()['id']}',
                              style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Aucune donnée',
                              style: TextStyle(color: Colors.white),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['nom'] != null
                          ? Text('${personneRecuperee.toMap()['nom']}',
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                          : const Text(
                              'Aucune donnée',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Prénom : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['prénom'] != null
                          ? Text(
                              '${personneRecuperee.toMap()['prénom']}',
                              style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Aucune donnée',
                              style: TextStyle(color: Colors.white),
                            )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Age : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      personneRecuperee.toMap()['age'] != null
                          ? Text(
                              '${personneRecuperee.toMap()['age']}',
                              style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              'Aucune donnée',
                              style: TextStyle(color: Colors.white),
                            ),
                    ],
                  ),

                  //r2
                ],
              ),
            ),
            //end section 2

            //Section 3
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextButton(
                  onPressed: null /* enregistrer */,
                  child: Text('Enregistrer'),
                ),
                TextButton(
                  onPressed: null /* recuperer */,
                  child: Text('Lire les données'),
                ),
                TextButton(
                  onPressed: null /* supprimer */,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            //End Section 3
          ],
        ),
      ),
    );
  }
}
