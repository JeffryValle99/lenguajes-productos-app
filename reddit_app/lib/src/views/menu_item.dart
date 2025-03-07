import 'package:flutter/material.dart';


class MenuItem extends StatelessWidget {

  const MenuItem({super.key, 
    required this.texto,
    required this.iconoFirst,
    required this.iconoLast,
    required this.estilo,
  });

  final String texto;
  final IconData? iconoFirst;
  final IconData? iconoLast;
  final TextStyle? estilo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto, style: estilo,),
      leading: Icon(iconoFirst, color: Colors.white,),
      trailing: Icon(iconoLast, color: Colors.white,),
      onTap: () {},
    );
  }
}