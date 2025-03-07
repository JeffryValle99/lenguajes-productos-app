import 'package:flutter/material.dart';

class ItemRow extends StatefulWidget {
  const ItemRow({super.key, 
  required this.items, 
  required this.index,
  
  });

  final int index;
  final List items;


  @override
  State<ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {

  final active = TextStyle(
    fontWeight: FontWeight.w300,
    letterSpacing: 2.0,
    color: Colors.black, 
  );

  void onChange(int columna){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,left: 4.0,right: 0.0,top: 8.0,),
      child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
        ),
        onPressed: () {onChange(widget.index);}, 
        child: Text( widget.items[widget.index]["nombre"] , style: TextStyle(
          fontWeight: FontWeight.w300,
          letterSpacing: 2.0,
          color: Colors.black, 
        ),)),
    );
  }
}