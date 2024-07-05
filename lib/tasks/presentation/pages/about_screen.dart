import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          Text(
            'Desenvolvido por:',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Nome: Roberson\n'
            'Especialidade: Desenvolvedor Flutter\n'
            'Contato: dev@example.com',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Nome: Mayra\n'
            'Especialidade: Desenvolvedora Frontend\n'
            'Contato: dev@email.com',
            style: TextStyle(fontSize: 18),
          ),
          // Adicione mais desenvolvedores conforme necessário
        ],
      ),
    );
  }
}
