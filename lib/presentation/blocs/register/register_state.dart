part of 'register_cubit.dart';

//creamos un enum para los diferentes posibles estados del formulario
enum FormStatus { invalid, valid, validation, posting}

class RegisterFormState extends Equatable {
  
  //propiedades
  final FormStatus formStatus;
  final bool isValid;
  final Username username; //cambiamos el tipo de objeto String por Username creado en infrastructure/inputs
  final String email;
  final Password password; //cambiamos el tipo de objeto String por Password creado en infrastructure/inputs

  //constructor
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(), //establecemos el valor inicial
    this.email = '',
    this.password= const Password.pure()
  });

  //usamos el copyWith para crear nuevos estados
  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    String? email,
    Password? password,
  }) => RegisterFormState( //si no vienen ponemos los que viene por defecto en la clase padre
     formStatus: formStatus ?? this.formStatus,
     isValid: isValid ?? this.isValid,
     username: username ?? this.username,
     email: email ?? this.email,
     password: password ?? this.password
  );

  //metodo sobreescrito de Equatable para saber que propiedades consideramos como 
  //iguales si contienen el mismo valor, para que un status sea igual deben de ser
  //iguales las 4 propiedades introducidas en las props, y se considera el mismo estado
  @override
  List<Object> get props => [ formStatus, isValid, username, email, password ];
}


