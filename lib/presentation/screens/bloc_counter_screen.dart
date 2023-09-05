
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //envolvemos con el BlocProvider para obtener el gestor de estados Bloc
    return BlocProvider(
      create: (_) => CounterBloc(),
      //creamos una clase abajo 
      child: const BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });
  
  //metodo para llamar a los metodos de la clase CounterEvent del gestor de estado Bloc CounterBloc
  void increaseCounterBy( BuildContext context, [ int value = 1]){
    context.read<CounterBloc>()
      .add( CounterIncreased(value)); //con el metodo add disparamos los eventos en este caso el CounterIncreased del gestor de estados Bloc creado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          ( CounterBloc counterBloc ) => Text('Bloc Counter: ${ counterBloc.state.transactionCount}')
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon( Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        //usamos el gestor de estados creados con Bloc CounterBloc
        child: context.select(
          ( CounterBloc counterBloc) => Text('Counter value: ${ counterBloc.state.counter}')
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+3'),
            //creamos la funcion creada arriba increaseCounterBy
            onPressed: () => increaseCounterBy(context,3)
          ),
          //damos una separacion
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '2', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+2'),
            //creamos la funcion creada arriba increaseCounterBy
            onPressed: () => increaseCounterBy(context,2)
          ),
            //damos una separacion
          const SizedBox(height: 15,),
          FloatingActionButton(
            heroTag: '3', //heroTag se usa si hay mas de un FloatingActionButton
            child: const Text('+1'),
            //creamos la funcion creada arriba increaseCounterBy, no mandamos el segundo parametro
            //por que en la funcion si no viene el segundo parametro vale 1
            onPressed: () => increaseCounterBy(context)
          ),
        ],
      ) ,
    );
  }
}