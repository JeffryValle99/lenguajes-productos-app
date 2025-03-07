import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  const TextFieldWidget({super.key, 
  required this.nombreCampo,
  this.iconoIzquierda,
  this.iconoDerecha,
  required this.valor, 
  required this.tipoInput, 
  });

  final String? nombreCampo;
  final IconButton? iconoDerecha;
  final Icon? iconoIzquierda;
  final TextInputType? tipoInput;
  final String? Function(String? value) valor;
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipoInput,
      controller: TextEditingController(),
      validator: valor,
      decoration: InputDecoration(
        suffixIcon: iconoDerecha,
        labelText: nombreCampo,
        border: OutlineInputBorder(),
      ),
    );
  }
}