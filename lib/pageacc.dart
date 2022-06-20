import 'package:flutter/material.dart';
import 'package:formulairebase/recup.dart';

import 'main.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
                const RetourDonne(),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => const MyHomePage(
                                              title: "Formulaire"))));
                                },
                                child: const Text("Ajouter un utilisateur ")),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
