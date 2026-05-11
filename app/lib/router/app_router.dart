import 'package:auto_route/auto_route.dart';
import 'package:example_application/models/filme_item.dart';
import 'package:example_application/pages/tela_principal_page.dart';
import 'package:example_application/pages/detalhes_filme_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: TelaPrincipalMoviePageRoute.page, initial: true),
    AutoRoute(page: DetalhesFilmePageRoute.page),
  ];
}