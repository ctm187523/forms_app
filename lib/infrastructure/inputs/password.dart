
//para manejar los inputs he instalado -->  flutter pub add formz
//codigo copiado de --> https://pub.dev/packages/formz

import 'package:formz/formz.dart';

// Define input validation errors, definimos los errores vacio y longitud en un enum
enum PasswordError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {

  //Call super.pure to represent an unmodified form input.
  //llamamos al super para establecer el valor inicial
  //pure quiere decir que no ha sido modificado
  const Password.pure() : super.pure('');

  //Call super.dirty to represent a modified form input.
  //esto es la forma de como quiero que cambie el valor, cuando el campo cambia
  //dirty quiere decir que el valor ha sido modificado
  const Password.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  //establecemos como vamos a hacer las validaciones
  @override
  PasswordError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if ( value.length < 6) return PasswordError.lenght;

    return null;
  }
}