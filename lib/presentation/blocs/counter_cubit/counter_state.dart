part of 'counter_cubit.dart'; //indica que es parte de otro archivo

//He instalado flutter bloc -->  flutter pub add flutter_bloc
//tambien incluye este paquete los cubits
//uso la version 8.12 la 8.13 al crear automaticamente en el menu
//contextual de las carpetas me daba errores


//creamos el estado 
class CounterState {

  //propiedades
  final int counter;
  final int transactionCount;

  //constructor
  CounterState({
   this.counter = 0, 
   this.transactionCount = 0
  });

  //emitimos el estado, instancia de este estado, emitimos una copia
  //del estado inicial
  copyWith({

    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter, //si no viene ponemos el de la clase el de las propiedades
    transactionCount: transactionCount ?? this.transactionCount
  );
}


