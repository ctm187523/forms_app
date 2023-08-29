
import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter'),
        actions: [
          IconButton(
            onPressed: () => {}, 
            icon: const Icon( Icons.refresh_outlined)
          )
        ],
      ),
      body: const Center(
        child: Text('Counter value: xxx'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+3'),
            onPressed: () => {}
          ),
          //damos una separacion
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '2', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+2'),
            onPressed: () => {}
          ),
            //damos una separacion
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '3', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+1'),
            onPressed: () => {}
          ),
        ],
      ) ,
    );
  }
}