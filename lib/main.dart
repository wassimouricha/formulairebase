import 'package:flutter/material.dart';
import 'package:formulairebase/pagus.dart';

void main() {
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
      home: const MyHomePage(title: 'Flutter Formulaire wassim'),
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

  _initController() {
    _firstNameController.clear();
    _nameController.clear();
    _pseudoController.clear();
    _mailController.clear();
    _passwordController.clear();
    _passwordController2.clear();
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
                      const InputDecoration(labelText: "Entrez votre Prénom"),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PageDeux(
                                    nom: _nameController.text,
                                    prenom: _firstNameController.text,
                                    mail: _mailController.text,
                                    pseudo: _pseudoController.text,
                                  )))).then((value) {
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
