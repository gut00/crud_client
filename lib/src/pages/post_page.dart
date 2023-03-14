import 'dart:convert';
import 'dart:html';
import 'package:crud_client/src/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;

class newUser extends StatefulWidget {
  newUser({
    super.key,
  });

  @override
  State<newUser> createState() => _newUserState();

  final url = 'https://provisorio.sousmol.com.br/vagaflutter/crud-cliente/';

  void postUser() async {
    try {
      final response = await http.post(Uri.parse(url), body: {
        'name': 'augusto',
        'email': 'email@email',
        'cpf': '18548785578',
        'telefone': '16999999999',
        'data_nascimento': '20/08/2001',
        'sexo': 'masculino',
      });
      print(response.body);
    } catch (er) {}
  }
}

class _newUserState extends State<newUser> {
  final cpfFormat = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormat = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final dateFormat = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CustomTextFild(
              icon: Icons.person,
              label: 'Nome:',
              inputFormatters: const [],
            ),
            CustomTextFild(
              icon: Icons.person,
              label: 'email:',
              inputFormatters: const [],
            ),
            CustomTextFild(
              icon: Icons.person,
              label: 'cpf:',
              inputFormatters: [cpfFormat],
            ),
            CustomTextFild(
              icon: Icons.person,
              label: 'telefone:',
              inputFormatters: [phoneFormat],
            ),
            CustomTextFild(
              icon: Icons.person,
              label: 'Data de nascimento:',
              inputFormatters: [dateFormat],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.blue,
        shape: const CircleBorder(
          side: BorderSide(width: 2, color: Colors.transparent),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.check_outlined,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
