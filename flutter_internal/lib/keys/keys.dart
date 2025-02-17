import 'package:flutter/material.dart';
import 'package:flutter_internal/keys/checkable_todo_item.dart';
import 'package:flutter_internal/keys/todo_item.dart';

class Todo {
  Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget {
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todos = [
    Todo(
      'Buy milk',
      Priority.normal,
    ),
    Todo(
      'Buy eggs',
      Priority.urgent,
    ),
    Todo(
      'Buy bread',
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    // create a copy, not a reference
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  // key to make sure the state is following the widget
                  key: ObjectKey(todo), // or ValueKey(todo.text),
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        )
      ],
    );
  }
}
