import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'home_page.dart';
import 'login_page.dart';

// Estado local com o Stateless, não realizada mudanças, é uma constante
class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: '/',
            // Rotas nomeadas ou rotas automáticas
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
            },
          );
        });
  }
}
