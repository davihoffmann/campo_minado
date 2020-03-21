import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';

class CampoMinadoApp extends StatelessWidget {
  
  void _reiniciar() {
    print('reiniciar');
  }

  void _abrir(Campo campo) {
    print('abrir');
  }

  void _alterarMarcacao(Campo campo) {
    print('alterar....');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();

    Campo campo = Campo(linha: 0, coluna: 0);
    //campo.adicionarVizinho(vizinho1);
    
    try {
      campo.alternarMarcacao();
      //campo.abrir();
    } on ExplosaoException {

    }

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlterarMarcacao: _alterarMarcacao,
          ),
        ),
      ),
    );
  }
}
