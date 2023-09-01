part of 'counter_bloc.dart';

class CounterState extends Equatable {

  //propiedades
  final int counter;
  final int transactionCount;



  //constructor
  const CounterState({
    this.counter = 10,
    this.transactionCount = 0
  });

  //creamos el copyWith para crear instancias del CounterState
  CounterState copyWith({
     int? counter,
     int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  //clase sobreescrita para el uso de Equatable, para definir que porpiedades considiremos
  //iguales entre objetos para considerar un mismo objeto
  @override
  List<Object> get props => [counter, transactionCount];
}


