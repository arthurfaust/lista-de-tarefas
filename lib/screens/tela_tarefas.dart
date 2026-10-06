import 'package:flutter/material.dart';
import '../models/tarefa.dart';
import '../widgets/item_tarefa.dart';

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  final TextEditingController tarefaController = TextEditingController();

  final List<Tarefa> tarefas = [];

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  void adicionarTarefa() {
    final texto = tarefaController.text.trim();

    if (texto.isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite uma tarefa antes de adicionar.')),
      );
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
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = tarefas[index];
                    return ItemTarefa(
                      tarefa: tarefa,
                      onChanged: (valor) {
                        setState(() {
                          tarefa.concluida = valor ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
