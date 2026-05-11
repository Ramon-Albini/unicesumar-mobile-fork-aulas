import 'package:auto_route/auto_route.dart';
import 'package:example_application/models/filme_item.dart';
import 'package:example_application/pages/detalhes_filme_page.dart';
import 'package:example_application/temas.dart';
import 'package:example_application/widgets/filmes_listview.dart';
import 'package:example_application/widgets/temas_gridview.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TelaPrincipalMoviePage extends StatelessWidget {
  const TelaPrincipalMoviePage({super.key, required this.filmes});

  final List<FilmeItem> filmes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App - Lista de Filmes'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Temas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(flex: 1, child: TemasGridView(temas: temas)),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text(
                'Filmes em Destaque',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 4,
              child: FilmesListView(
                filmes: filmes,
                onTap: (filme) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalhesFilmePage(filme: filme),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}