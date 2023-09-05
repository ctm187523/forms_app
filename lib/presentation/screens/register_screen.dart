
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


class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    //Widget para controlar el formulario
    return Form(
      child: Column(
        children: [

          //lLamamos a la clase creada en presentation/inputs para manejar
          //los TextFormFields
          CustomTextFormField(),
          const SizedBox(height: 10),
          CustomTextFormField(),
          
          const SizedBox(height: 20),

          FilledButton.tonalIcon( 
            onPressed: (){}, 
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}