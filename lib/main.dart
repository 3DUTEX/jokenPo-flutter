import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Gesture detector -> Classe para detectar se algo foi tocado

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Joken Po",
    home: Home(),
  ));
}

class CustomText extends StatelessWidget {
  late String _txt;

  CustomText(this._txt);

  @override
  Widget build(BuildContext context) {
    return Text(
      _txt,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _escolhaApp = "images/padrao.png";

  String _resultado = "Escolha uma opção abaixo";


  Map<String, String> _formas = {
    "pedra": "images/pedra.png",
    "papel": "images/papel.png",
    "tesoura": "images/tesoura.png",
  };

  var _possiblidades = <String>["pedra", "papel", "tesoura"];

  void calculaResultado(String escolhaPlayer) {
    int randomNumber = Random().nextInt(_possiblidades.length);
    String resultadoApp = _possiblidades[randomNumber];

    String vitoriaApp = "O App venceu :(";

    mudaEscolhaApp(_formas[resultadoApp]!);
    if (resultadoApp == "pedra" && escolhaPlayer == "tesoura") {
      mudaResultado(vitoriaApp);
      return;
    }
    if (resultadoApp == "tesoura" && escolhaPlayer == "papel") {
      mudaResultado(vitoriaApp);
      return;
    }
    if (resultadoApp == "papel" && escolhaPlayer == "pedra") {
      mudaResultado(vitoriaApp);
      return;
    }
    if (resultadoApp == escolhaPlayer) {
      mudaResultado("Empate, tente novamente!");
      return;
    }

    mudaResultado("Parabéns!! Você ganhou :)");
  }

  void mudaResultado(String txtResultado) {
    setState(() {
      _resultado = txtResultado;
    });
  }

  void mudaEscolhaApp(String novaEscolha) {
    setState(() {
      _escolhaApp = novaEscolha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText("Escolha do App:"),
            Image.asset(_escolhaApp, width: 200),
            CustomText(_resultado),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Image.asset(_formas["pedra"]!, width: 120),
                  onTap: () { calculaResultado("pedra"); },
                ),
                GestureDetector(
                  child: Image.asset(_formas["papel"]!, width: 120),
                  onTap: () { calculaResultado("papel"); },
                ),
                GestureDetector(
                  child: Image.asset(_formas["tesoura"]!, width: 120),
                  onTap: () { calculaResultado("tesoura"); },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
