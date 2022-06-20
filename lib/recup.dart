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
    return FutureBuilder<QuerySnapshot>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Il y a eu une erreur");
        }

        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!.docs.map((user) {
              return Text(user["prenom"]);
            }).toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<QuerySnapshot> getData() async {
    return user.get();
  }
}
