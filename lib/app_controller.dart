// Controla o estado de mudança de tema

import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = false;

  // Método para mudar a cor do tema
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
