import 'package:flutter/material.dart';

import 'tela_cadastro.dart';
import 'tela_login.dart';
import 'tela_principal.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAGIC PAPER',
      initialRoute: 'login',
      routes: {
        'login' :(context) => const TelaLogin(),
        'cadastro' :(context) => const TelaCadastro(),
        'principal' :(context) => const TelaPrincipal(),
      },
    ),
  );
}

