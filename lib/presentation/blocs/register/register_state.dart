part of 'register_cubit.dart';

//creamos un enum para los diferentes posibles estados del formulario
enum FormStatus { invalid, valid, validation, posting}

class RegisterFormState extends Equatable {
  
  //propiedades
  final FormStatus formStatus;
  final String username;
  final String email;
  final String password;

  //constructor
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.username = '',
    this.email = '',
    this.password= ''
  });

  //usamos el copyWith para crear nuevos estados
  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? email,
    String? password,
  }) => RegisterFormState( //si no vienen ponemos los que viene por defecto en la clase padre
     formStatus: formStatus ?? this.formStatus,
     username: username ?? this.username,
     email: email ?? this.email,
     password: password ?? this.password
  );

  //metodo sobreescrito de Equatable para saber que propiedades consideramos como 
  //iguales si contienen el mismo valor, para que un status sea igual deben de ser
  //iguales las 4 propiedades introducidas en las props, y se considera el mismo estado
  @override
  List<Object> get props => [ formStatus, username, email, password ];
}


