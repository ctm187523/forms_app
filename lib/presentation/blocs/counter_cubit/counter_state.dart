part of 'counter_cubit.dart'; //indica que es parte de otro archivo

//He instalado flutter bloc -->  flutter pub add flutter_bloc
//tambien incluye este paquete los cubits
//uso la version 8.12 la 8.13 al crear automaticamente en el menu
//contextual de las carpetas me daba errores


//creamos el estado hemos instalado equatable --> flutter pub add equatable
//hacemos que herede nuestra clase de Equatable, esto hace que si un objeto
//tiene los mismos valores en sus propiedades se considere el mismo objeto
//en la linea 40 implementamos un metodo obligatorio al heredar de Equatable
//esto lo hacemos porque si es el mismo estado no redibuje nada, como en el caso
//de cuando hacemos reset varias veces seguidas la primera vez cambia el estado a cero
//pero las demas veces al ser 0 no deberia de redibujar
//esto nos permite comparar objetos con las mismas propiedades ver -> https://pub.dev/packages/equatable
class CounterState extends Equatable{

  //propiedades
  final int counter;
  final int transactionCount;

  //constructor
  const CounterState({
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
  
  @override
  //devolvemos entre corchetes todas las propiedades que queremos que sean iguales
  //para considerar que el estado sea igual
  List<Object> get props => [ counter, transactionCount];
}


