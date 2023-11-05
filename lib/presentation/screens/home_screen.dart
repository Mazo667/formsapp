import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estados Simple"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/counter-cubits'),
          ),
          ListTile(
            title: const Text("Blocs"),
            subtitle: const Text("Gestor de estados Compuesto"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/counter-blocs'),
          ),
          ListTile(
            title: const Text("Nuevo Usuario"),
            subtitle: const Text("Manejo de Formularios"),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/new-user'),
          ),
        ],
      ),
    );
  }
}
