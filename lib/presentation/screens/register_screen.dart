
import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: const _RegisterView(),
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


class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  //creamos un objeto GlobalKey para enlazar con el key del widget Form de abajo 
  //para controlar el formulario basado en este key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  String username = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    //Widget para controlar el formulario
    return Form(
      key: _formKey,
      child: Column(
        children: [

          //lLamamos a la clase creada en presentation/inputs para manejar
          //los TextFormFields
          CustomTextFormField(
            label: 'Nombre de usario',
            onChange: (value) => username = value, //le damos valor a la variable creada arriba
            validator: ( value ) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              if( value.length < 6 ) return 'Más de 6 letras';
              return null;
            },
          ),
          const SizedBox(height: 10),
          
          CustomTextFormField(
            label: 'Correo electrónico',
            onChange: (value) => email = value, //le damos valor a la variable creada arriba
            validator: ( value ) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              
              //creamos una expresion regular para validar el correo
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              //comprobamos la expresion regular con lo escrito por el usuario
              if(!emailRegExp.hasMatch(value)) return 'No tiene formato de correo';
              return null;
            },
          ),
           const SizedBox(height: 10),
          
           CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChange: (value) => password = value, //le damos valor a la variable creada arriba
            validator: ( value ) {
              if( value == null || value.isEmpty ) return 'Campo requerido';
              if( value.trim().isEmpty ) return 'Campo requerido';
              if( value.length < 6 ) return 'Más de 6 letras';
              return null;
            },
          ),
          
          const SizedBox(height: 20),

          FilledButton.tonalIcon( 
            //cuando se presiona el boton de crear usuario
            onPressed: (){

              final isValid = _formKey.currentState!.validate(); //usamos la funcion validate de arriba de Form
              if ( !isValid ) return;

              print('$username, $email, $password');
            }, 
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}