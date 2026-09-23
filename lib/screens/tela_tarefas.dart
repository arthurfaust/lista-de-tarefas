import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final TextEditingController tarefaController = TextEditingController();

  final List<Tarefa> tarefas = [];

  void adicionarTarefa() {
    final texto = tarefaController.text.trim();

    if (texto.isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(Tarefa(texto: texto));
    });

    tarefaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Tarefas')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: tarefaController,
                decoration: const InputDecoration(
                  labelText: 'Nova tarefa',
                  hintText: 'Digite uma tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: adicionarTarefa,
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
