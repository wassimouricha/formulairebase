// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:formulairebase/pageacc.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAjjTyVxm_q_Q5J0XzOuOCczZ9EGJiKsdE",
          authDomain: "formulaire-beebe.firebaseapp.com",
          projectId: "formulaire-beebe",
          storageBucket: "formulaire-beebe.appspot.com",
          messagingSenderId: "97262376468",
          appId: "1:97262376468:web:0076d1e2c3321ed70ab901"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Accueil(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _pseudoController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  _initController() {
    _firstNameController.clear();
    _nameController.clear();
    _pseudoController.clear();
    _mailController.clear();
    _passwordController.clear();
    _passwordController2.clear();
  }

  Future<void> addUser() {
    return user
        .add({
          'mail': _mailController.text,
          'nom': _nameController.text,
          'prenom': _firstNameController.text,
          'pseudo': _pseudoController.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Remplissez le Formulaire"),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Entrez votre Nom"),
                  controller: _nameController,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Entrez votre Pr??nom"),
                  controller: _firstNameController,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Entrez votre Pseudo"),
                  controller: _pseudoController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Entrez votre Adresse Mail"),
                  controller: _mailController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Entrez votre Mot de passe"),
                  obscureText: true,
                  controller: _passwordController,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Confirmez votre Mot de passe"),
                  obscureText: true,
                  controller: _passwordController2,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_passwordController.text == _passwordController2.text) {
                      addUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => 
                              
                              // PageDeux(
                              //       nom: _nameController.text,
                              //       prenom: _firstNameController.text,
                              //       mail: _mailController.text,
                              //       pseudo: _pseudoController.text,
                              //     )
                                  const Accueil()
                                  ))).then((value) {
                        _initController();
                      });
                    }
                    if (_passwordController.text != _passwordController2.text) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                              "Veuillez mettre exactement le meme mot de passe "),
                          content: const Text("S'il vous plait "),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, "cancel"),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, "OK"),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Valider"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

