import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

// Método do body para ser instanciado
  Widget _body() {
    return
        // Habilitando o scroll quando o teclado abre nos TextFields
        SingleChildScrollView(
      child: SizedBox(
        // Configurando a largura máxima com o context do Material
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        // Importando imagems do assets, declarados no arquivo .yaml
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // Input
                      TextField(
                        // Recebendo os dados do inpute exibindo no console
                        onChanged: (text) {
                          email = text;
                        },
                        // Formatando o teclado para e-mails
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'E-mail'),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        // Oculta os caracteres do input, coloca no formato de senha
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Senha'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (email == 'lucas' && password == '123') {
                              /** 
                              // Navegação manual entre telas
                              // O pushReplacement remove a tela atual quando realiza a transição entre as telas, remove o botão de voltar no AppBar
                              
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => HomePage())); 
                              */
                              // Navegação com rotas nomeadas
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            } else {
                              print('Login inválido !');
                            }
                          },
                          child: Text(
                            'Entrar',
                            textScaleFactor: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // O Stack empilha todos o widgets que estivem em sequência
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child:
                // Background image
                Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            )),
        // Aplicando opacidade no background
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        _body(),
      ],
    ));
  }
}
