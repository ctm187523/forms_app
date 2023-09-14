
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      //envolvemos con el BlocProvider para que los hijos reciban el estado usado en
      //este caso Cubit
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ) ,
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    //el SafeArea muestra los widgets sin ningun estorbo, notch , controles movimiento, cerrarse, etc
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        //creamos un scroll ideal para inputs como TextFormField
        child: SingleChildScrollView(
          child: Column(  
            //mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              //logo de Flutter
              FlutterLogo( size: 100),
            
              //llamamos a la clase creada abajo
              _RegisterForm(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatelessWidget {


  const _RegisterForm();

  //creamos un objeto GlobalKey para enlazar con el key del widget Form de abajo 
  @override
  Widget build(BuildContext context) {

    //referenciamos al cubit para manejar el estado, con el watch cada vez que el estado cambia
    //se dispara la renderizacion
    final registerCubit = context.watch<RegisterCubit>();

    //obtenemos referencias a las propiedades del estado del gestor de estado creado Cubit(registerCubit)
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    //Widget para controlar el formulario
    return Form(
      //key: _formKey,
      child: Column(
        children: [

          //lLamamos a la clase creada en presentation/inputs para manejar
          //los TextFormFields
          CustomTextFormField(
            label: 'Nombre de usario',
            //usamos la referecia al estado(cubit) creada arriba, usamos la validacion del campo
            //con _formKey creado arriba y el metodo validate de la clase Form de Flutter
            onChange: registerCubit.usernameChanged,
            //LO COMENTAMOS AL USAR LOS INPUTS YA NO NOS HACE FALTA,YA LOS INCLUYE
            // validator: ( value ) {
            //   if( value == null || value.isEmpty ) return 'Campo requerido';
            //   if( value.trim().isEmpty ) return 'Campo requerido';
            //   if( value.length < 6 ) return 'Más de 6 letras';
            //   return null;
            // },

            
            //Usamos el getter creado en el input Username infrastructure/inputs
            errorMessage: username.errorMessage   
          ),
          
          const SizedBox(height: 10),
          
          CustomTextFormField(
            label: 'Correo electrónico',
            //usamos la referecia al estado(cubit) creada arriba, usamos la validacion del campo
            //con _formKey creado arriba y el metodo validate de la clase Form de Flutter
            onChange: registerCubit.emailChanged, 
            //LO COMENTAMOS AL USAR LOS INPUTS YA NO NOS HACE FALTA,YA LOS INCLUYE
            // validator: ( value ) {
            //   if( value == null || value.isEmpty ) return 'Campo requerido';
            //   if( value.trim().isEmpty ) return 'Campo requerido';
              
            //   //creamos una expresion regular para validar el correo
            //   final emailRegExp = RegExp(
            //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            //   );

            //   //comprobamos la expresion regular con lo escrito por el usuario
            //   if(!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
            //   return null;
            // },
            errorMessage: email.errorMessage,
          ),
           const SizedBox(height: 10),
          
           CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            //usamos la referecia al estado(cubit) creada arriba, usamos la validacion del campo
            //con _formKey creado arriba y el metodo validate de la clase Form de Flutter
            onChange: registerCubit.passwordChanged, 
            //LO COMENTAMOS AL USAR LOS INPUTS YA NO NOS HACE FALTA,YA LOS INCLUYE
            // validator: ( value ) {
            //   if( value == null || value.isEmpty ) return 'Campo requerido';
            //   if( value.trim().isEmpty ) return 'Campo requerido';
            //   if( value.length < 6 ) return 'Más de 6 letras';
            //   return null;
            // },
            errorMessage: password.errorMessage,
          ),
          
          const SizedBox(height: 20),

          FilledButton.tonalIcon( 
            //cuando se presiona el boton de crear usuario
            onPressed: (){

              // final isValid = _formKey.currentState!.validate(); //usamos la funcion validate de la classe Form de Flutter
              // if ( !isValid ) return;

             registerCubit.onSubmit();
            }, 
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}