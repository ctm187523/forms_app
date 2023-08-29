import 'package:flutter_bloc/flutter_bloc.dart';



//He instalado flutter bloc -->  flutter pub add flutter_bloc
//tambien incluye este paquete los cubits
//uso la version 8.12 la 8.13 al crear automaticamente en el menu
//contextual de las carpetas me daba errores
part 'counter_state.dart'; //indica que es parte de otro archivo

//utilizamos Cubit para manejar el estado
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState( counter: 5));

  //incrementamos el estado
  void increaseBy ( int value ){
    
    //usamos emit para manejar la instancia del estado
    emit( state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1
    ));

  }

  void reset() {

    emit( state.copyWith(
      counter: 0,
    ));
  }
}
