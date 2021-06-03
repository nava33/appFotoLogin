import 'package:flutter/material.dart';
import 'app_controller.dart';

// Estado global com o Statefull, pode realizar mudanças, é dinâmico
class HomePage extends StatefulWidget {
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      // O drawer é a navegação do app
      drawer: Drawer(
        child: Column(
          children: [
            // Imagem do perfil de usuário
            UserAccountsDrawerHeader(
                // Adicionando bordas arredoandas na imagem com o ClipRRect
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/profile.jpg')),
                accountName: Text('Lucas'),
                accountEmail: Text('lucas98fernando@gmail.com')),
            ListTile(
              // O leading permite colocar widgets no lado esquerdo do menu
              leading: Icon(Icons.home_outlined),
              title: Text('Início'),
              subtitle: Text('Tela de início'),
              onTap: () {
                print('Home');
              },
            ),
            ListTile(
              // O leading permite colocar widgets no lado esquerdo do menu
              leading: Icon(Icons.people_alt_outlined),
              title: Text('Sobre'),
              subtitle: Text('Tela de sobre'),
              onTap: () {
                print('Sobre');
              },
            ),
            ListTile(
              // O leading permite colocar widgets no lado esquerdo do menu
              leading: Icon(Icons.login_outlined),
              title: Text('Sair'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        // actions são as opções no lado direito da barra do app
        actions: [CustomSwitch()],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          // Column e Row possui childrens, cada elemento children, herda as configurações do pai
          // O MainAxisAlignment refere-se ao alinhamento geral
          // O CrossAxisAlignment refere-se ao alinhamento de cada elemento individualmente

          // O ListView serve para permitir o scroll na tela
          //child: ListView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            // O scrollDirection muda a direção do scroll do ListView, por padrão é na vertical
            //scrollDirection: Axis.horizontal,
            children: [
              Text('Contador: $counter'),
              Container(
                height: 20,
              ),
              CustomSwitch(),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  )
                ],
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          }),
    );
  }
}

// Componentizando o Switch para reutilização
class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
