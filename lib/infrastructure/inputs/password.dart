
//para manejar los inputs(campos del formulario) he instalado -->  flutter pub add formz
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

  //creamos un metodo getter para mostrar el error en caso de que las validaciones no pasen
  String? get errorMessage {

    //si el formulario es valido o isPure que no se ha modificado la entrada el usuario no ha entrado ningun valor
    //retornamos null, isValid y isPure son metodos del paquete Formz usado
    if( isValid || isPure ) return null;

    //displayError es un metodo de Formz, si esta vacio mostramos un error, y mostramos error si 
    //es menor a 6,LAS CONDICIONES LAS HEMOS CREADO JUSTO ABAJO
    if ( displayError == PasswordError.empty ) return 'El campo es requerido';
    if ( displayError == PasswordError.lenght ) return 'Minimo 6 caracteres';

    return null; // si todo esta bien
  }

  // Override validator to handle validating a given input value.
  //establecemos como vamos a hacer las validaciones
  @override
  PasswordError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty ) return PasswordError.empty;
    if ( value.length < 6) return PasswordError.lenght;

    return null;
  }
}