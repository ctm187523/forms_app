
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {

  RegisterCubit() : super(const RegisterFormState());

  //metodos
  void onSubmit(){

    emit(
      state.copyWith(
        //cambiamos el status del enum creado en la clase RegisterFormState
        formStatus: FormStatus.validating,
        //al hacer submit si el input esta pure(no ha escrito nada el usaurio y ha echo submit)
        //lo "ensuciamos" con dirty y deja de estar pure asi saldra el error si al hacer submit no se escribe nada
        username: Username.dirty( state.username.value), 
        password: Password.dirty( state.password.value),
        email: Email.dirty(state.email.value),

        //cambiamos el valor del booleano de a clase RegisterFormState de presentation/blocs/register si los campos son correctamente validados
        //usando el paquete instalado Formz y aplicado en las clases Username y Password de infrastructure/inputs
        isValid: Formz.validate([
          state.username,
          state.password,
          // TODO: state.email
          ]
        )
      )
    );
    print('Cubit Submit: $state');
  }
  
  //metodos para manejar los cambios de las propiedades
  void usernameChanged( String value ){
    //usamos la clase creada Username en infrastructure/inputs
    final username = Username.dirty(value);
    
    emit(
      state.copyWith(
        username: username,
        //isValid metodo de la clase RegisterFormState de presentation/blocs/register
        isValid: Formz.validate([ username, state.password , state.email]) //usamos la validaciones creadas en las clases de infrastructure/inputs
      )
    );
  }

   void emailChanged( String value ){
    //usamos la clase creada Email en infrastructure/inputs
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        //isValid metodo de la clase RegisterFormState de presentation/blocs/register
        isValid: Formz.validate([ email, state.username, state.password ]) //usamos la validaciones creadas en las clases de infrastructure/inputs
      )
    );
  }

   void passwordChanged( String value ){
    //usamos la clase creada Password en infrastructure/inputs
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        //isValid metodo de la clase RegisterFormState de presentation/blocs/register
        isValid: Formz.validate([ password, state.username, state.email])
      )
    );
  }
}
