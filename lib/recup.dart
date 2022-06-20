// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RetourDonne extends StatefulWidget {
  const RetourDonne({Key? key}) : super(key: key);

  @override
  State<RetourDonne> createState() => _RetourDonneState();
}

class _RetourDonneState extends State<RetourDonne> {
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<QuerySnapshot>(
          future: getData(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Il y a eu une erreur");
            }

            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.docs.map((user) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Prénom : " + user["prenom"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Nom : " + user["nom"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pseudo : " + user["pseudo"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Email : " + user["mail"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),                     
                    ],
                  );
                }).toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ],
    );
  }

  Future<QuerySnapshot> getData() async {
    return user.get();
  }
}
