part of 'counter_bloc.dart';

//nos permite definir que tipos de evento vamos a recibir
abstract class CounterEvent  {

  //constructor
  const CounterEvent();
}

//eventos
class CounterIncreased extends CounterEvent {

  //propiedades
  final int value;

   //constructor
  const CounterIncreased(this.value);
  
}

//mas eventos, no recibimos parametros
class CounterReset extends CounterEvent {}