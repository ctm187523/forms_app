import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  //constructor
  CounterBloc() : super(const CounterState()) { //inicializamos el estado

    //manejador(handler) de eventos, usamos el evento creado en la clase CounterEvent, CounterIncreased
    //reacciona al llamar a el evento CounterIncreased, on dispara el evento cuando ocurre
    //podriamos poner on<CounterIncreased>( _onCounterIncreased); ya que son las mismas referencias
    on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit)); //enviamos la referencia de la funcion creada abajo
    
    //manejamos otro evento
    on<CounterReset>((event, emit) => _onCounterReset(event, emit));
    //podriamos poner on<CounterReset>( _onCounterReset) en lugar de la linea de arriba
  }

  //usamos el evento en el constructor,
  void _onCounterIncreased(CounterIncreased event,Emitter<CounterState> emit){
     emit(state.copyWith(
        counter: state.counter + event.value, //ver clase counter_event, el value son las propiedades definidas en el evento
        transactionCount: state.transactionCount +1
      ));
    }

  void _onCounterReset(CounterReset event,Emitter<CounterState> emit) {
    
    emit(state.copyWith(
      counter: 0
    ));
  }
}
  
 

