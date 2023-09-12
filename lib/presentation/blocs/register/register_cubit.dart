
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {

  RegisterCubit() : super(const RegisterFormState());

  //metodos
  void onSubmit(){
    print('Cubit Submit: $state');
  }
  
  //metodos para manejar los cambios de las propiedades
  void usernameChanged( String value ){
    //usamos la clase clase creada Username en infrastructure/inputs
    final username = Username.dirty(value);
    
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([ username, state.password ]) //usamos la validaciones creadas en las clases de infrastructure/inputs
      )
    );
  }

   void emailChanged( String value ){
    emit(
      state.copyWith(
        email: value,
      )
    );
  }

   void passwordChanged( String value ){
    //usamos la clase clase creada Password en infrastructure/inputs
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.username ])
      )
    );
  }
}
