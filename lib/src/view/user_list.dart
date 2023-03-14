import 'dart:convert';
import 'package:crud_client/src/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/user_tile.dart';

class userList extends StatefulWidget {
  const userList({super.key});

  @override
  State<userList> createState() => _userListState();
}

class _userListState extends State<userList> {
  Future<List> takeUser() async {
    var url = Uri.parse(
      'https://provisorio.sousmol.com.br/vagaflutter/crud-cliente/',
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('-- ERRO --');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crud Clinet'),
          actions: [
            IconButton(
              onPressed: () {
                var push = Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => newUser(),
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: FutureBuilder<List>(
          future: takeUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Erro ao carregar usuario'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return userTile(snapshot, index);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
