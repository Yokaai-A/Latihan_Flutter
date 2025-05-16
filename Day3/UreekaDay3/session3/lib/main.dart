import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todos = [];

  void _showAddTodoDialog() {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter your todo',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  setState(() {
                    _todos.add(text);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _todos.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTodoItem(String task, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        title: Text(task),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _confirmDelete(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'To Do List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _todos.isEmpty
          ? const Center(child: Text('No todos yet.'))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return _buildTodoItem(_todos[index], index);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
