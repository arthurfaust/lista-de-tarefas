import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class ItemTarefa extends StatelessWidget {
  final Tarefa tarefa;
  final ValueChanged<bool?> onChanged;

  const ItemTarefa({super.key, required this.tarefa, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: tarefa.concluida,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        tarefa.texto,
        style: TextStyle(
          decoration: tarefa.concluida ? TextDecoration.lineThrough : null,
          color: tarefa.concluida ? Colors.grey : null,
        ),
      ),
    );
  }
}
