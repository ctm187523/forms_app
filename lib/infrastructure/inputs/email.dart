


//para manejar los inputs(campos del formulario) he instalado -->  flutter pub add formz
//codigo copiado de --> https://pub.dev/packages/formz

import 'package:formz/formz.dart';

// Define input validation errors, definimos los errores vacio y longitud en un enum
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {

  //creamos la expresion regular para validar el formato del email
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Call super.pure to represent an unmodified form input.
  //llamamos al super para establecer el valor inicial
  //pure quiere decir que no ha sido modificado
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  //esto es la forma de como quiero que cambie el valor, cuando el campo cambia
  //dirty quiere decir que el valor ha sido modificado
  const Email.dirty(String value) : super.dirty(value);

  //creamos un metodo getter para mostrar el error en caso de que las validaciones no pasen
  String? get errorMessage {

    //si el formulario es valido o isPure que no se ha modificado la entrada el usuario no ha entrado ningun valor
    //retornamos null, isValid y isPure son metodos del paquete Formz usado
    if( isValid || isPure ) return null;

    //displayError es un metodo de Formz, si esta vacio mostramos un error, y mostramos error si 
    //no coinciede el formato de email,LAS CONDICIONES LAS HEMOS CREADO JUSTO ABAJO
    if ( displayError == EmailError.empty ) return 'El campo es requerido';
    if ( displayError == EmailError.format ) return 'No tiene formato de correo electrónico';

    return null; // si todo esta bien
  }

  // Override validator to handle validating a given input value.
  //establecemos como vamos a hacer las validaciones
  @override
  EmailError? validator(String value) {

    if ( value.isEmpty || value.trim().isEmpty ) return EmailError.empty;
    
    //evaluamos una expresion regular que contiene el formato que debe tener un email correcto
    //usamos la propiedad estatica creada arriba emailRegExp, si no hace match(no coincide el formato)
    //retornamos un error de tipo EmailError.format, format es un metodo que pertenece a la clase Formz
    if ( !emailRegExp.hasMatch(value))  return EmailError.format;

    return null; // si no hay error
  }
}