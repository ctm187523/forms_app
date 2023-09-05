
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

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
      //obscureText: true,

      //metodo que al ir escribiendo el usuario toma el texto del TextFormField
      onChanged: (value) {
        print('value:value');
      },
      //propiedad para validar lo introducido en el TextFormField
      validator: (value) {
        if ( value == null) return 'Campo es requerido';
        if ( value.isEmpty) return 'Campo es requerido';
        if ( value.trim().isEmpty) return 'Campo es requerido'; //trim quita los espacios de delante y detras
        return null;
      },
      //decoracion para mejorar esteticamente el TextFormField
      decoration: InputDecoration(
        //border cuando el input esta habilitado
        enabledBorder: border, //usamos la variable final creada arriba
        focusedBorder: border.copyWith( borderSide: BorderSide( color: colors.primary)), //la caja con el foco canbia de color
      ),
    );
  }
}