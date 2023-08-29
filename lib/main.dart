import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

//repositorio git

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( //usamos el router
      routerConfig: appRouter, //instanciamos la clase del router creada
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
