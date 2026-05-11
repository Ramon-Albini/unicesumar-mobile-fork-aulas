import 'dart:convert';

import 'package:example_application/pages/tela_principal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/filme_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<FilmeItem> filmes = await carregarFilmes();
  runApp(MainApp(filmes: filmes));
}

Future<List<FilmeItem>> carregarFilmes() async {
  final String jsonString = await rootBundle.loadString(
    'assets/data/filmes.json',
  );
  final List<dynamic> dados = jsonDecode(jsonString) as List<dynamic>;

  return dados
      .cast<Map<String, dynamic>>()
      .map(FilmeItem.fromJson)
      .toList(growable: false);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.filmes});

  final List<FilmeItem> filmes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula - Lista de Filmes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1F6FEB)),
        useMaterial3: true,
      ),
      home: TelaPrincipalMoviePage(filmes: filmes),
    );
  }
}




