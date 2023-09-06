
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  //propiedades opcionales para personalizar el TextFormField
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool obscureText;

  //constructor
  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.onChange, 
    this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    //variable para personalizar los borders del TextFormField
    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(40),
    );

    //TextField para formularios
    return TextFormField(
      
      //para que no se vea lo introducido, uso en passwords
      obscureText: obscureText,

      //metodo que al ir escribiendo el usuario toma el texto del TextFormField
      onChanged: onChange, //usamos los campos del constructor
      
      //propiedad para validar lo introducido en el TextFormField
      validator: validator,
      //decoracion para mejorar esteticamente el TextFormField
      decoration: InputDecoration(
        //border cuando el input esta habilitado
        enabledBorder: border, //usamos la variable final creada arriba
        focusedBorder: border.copyWith( borderSide: BorderSide( color: colors.primary)), //la caja con el foco canbia de color
        
        //diseño para cuando ocurre un error al introducir datos el usuario
        errorBorder: border.copyWith( borderSide: BorderSide( color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith( borderSide: BorderSide( color: colors.primary)),
        
        isDense: true, //hace que sea mas extrecho
        label: label != null ? Text(label!) : null,  //usamos los campos del constructor
        hintText: hint ,//seria como el placeholder, usamos los campos del constructor
        errorText: errorMessage, //usamos los campos del constructor
        focusColor: colors.primary,
        //comentamos los iconos en el TextFormField
        //prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary), //icono al principio del TextFormField
        //suffixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary), //icono al final del TextFormField
        //icon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary), //este icono lo pone fuera del TextFormLabel
      ),
    );
  }
}