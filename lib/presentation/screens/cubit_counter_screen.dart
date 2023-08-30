
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {


  //constructor
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //usamos el Provider Cubit para gestionar el estado envolvemos con BlocProvider
    return BlocProvider(
        create: (_) =>
            CounterCubit(), //usamos la clase creada CounterCubit para manejar el provider
        child:
            const _CubitCounterView() //llamamos al metodo creado abajo,lo estamos envolviendo con el provider para que pueda manejar el estado

        );
  }
}

class _CubitCounterView extends StatelessWidget {

  //constuctor
  const _CubitCounterView();

  //metodo para usar el metodo increaseBy de la clase CounterCubit(gestor de estado Bloc)
  //par ser reutilizado por los floatingActionButton de abajo
  //ponemos entre corchetes el segundo parametro porque tiene un valor predeterminado por si no viene
  void increaseCounterBy( BuildContext context, [int value = 1] ) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    //usamos el watch para estar atentos a los cambios en el state parecido a Riverpod, el watch redibuja un nuevo estado
    //podemos acceder a las propiedades y metodos de la clase creada CounterCubit, en este caso accedemos al state
    //LO COMENTAMOS ABAJO EN EL TITTLE DEL APPBAR LO HACEMOS DE OTRA MANERA SIN TNENER
    //QUE USAR EL WATCH
    //final counterState = context.watch<CounterCubit>().state;
    
    return Scaffold(
      appBar: AppBar(
        //usamos select y creamos una funcion con el parametro de tipo CounterCubit para acceder al estado de Bloc
        title: context.select(( CounterCubit value ) {
          return Text('Cubit Counter: ${ value.state.transactionCount }');
        }),
      
        actions: [
          IconButton(
              onPressed: () {  
                context.read<CounterCubit>().reset(); //usamos los metodos de la clase CounterCubit(gestor de estado Bloc)
                }, 
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        //envolvemos con el BlocBuilder para acceder al estado de otra manera diferente visto arriba
        child: BlocBuilder<CounterCubit, CounterState>(
          //solo lo reconstruye si son diferentes los valores del counter usando buildwhen
          //si hacemos reset no cambia el counter y usando la condicion en el buidwhen no lo redibujamos al hacer reset
          //LO COMENTAMOS PORQUE USAREMOS Equatable(ver clase counter_state) para esto ya que arriba al tener el wath se redibuja igualmente
          //buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${ state.counter }');
          },
        ),
      ),
      floatingActionButton: Column(
     
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag:
                  '1', //heroTag se usa si hay mas de un FloatingActionButton
              child: const Text('+3'),
              onPressed: () {
                //llamamos al metodo creado arriba
                increaseCounterBy(context, 3);
              }),
          //damos una separacion
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag:
                  '2', //heroTag se usa si hay mas de un FloatingActionButton
              child: const Text('+2'),
              onPressed: () {
                //llamamos al metodo creado arriba
                increaseCounterBy(context, 2);
              }),
          //damos una separacion
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag:
                  '3', //heroTag se usa si hay mas de un FloatingActionButton
              child: const Text('+1'),
              //llamamos al metodo creado arriba, aqui no ponemos los corchetes y usamos la funcion de flecha fijarse en los otrso FloatingActionButton
              //no mandamos el segundo parametro que en la funcion increaseCounterBy
              //si no mandas parametro vale uno, no hace falta mandarlo
              onPressed: () =>  increaseCounterBy(context)
          ),   
        ],
      ),
    );
  }
}
