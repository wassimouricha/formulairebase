import 'package:flutter/material.dart';

class PageDeux extends StatelessWidget {
  const PageDeux({Key? key, required this.nom, required this.prenom, required this.mail, required this.pseudo}) : super(key: key);
  final String nom;
  final String prenom;
  final String mail;
  final String pseudo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Bar"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const Text("Vos informations ", style: TextStyle(color: Colors.red , fontSize: 40, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Text(pseudo , style: const TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(height: 20,),
            Text(nom,  style: const TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(height: 20,),
            Text(prenom,  style: const TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(height: 20,),
            Text(mail, style: const TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.w700),),
            const SizedBox(height: 20,),
            
          
          ]),
        ),
      ),
    );
  }
}
