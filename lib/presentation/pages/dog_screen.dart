import 'package:flutter/material.dart';

import '../widgets/dogs_list_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HELLO DOGS'),
        centerTitle: true,
      ),
      body: DogsList(),
    );
  }
}
