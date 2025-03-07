
import 'dart:async';

import 'package:flutter/material.dart';

class DetalleProductoPage extends StatefulWidget {

  const DetalleProductoPage({super.key, required this.extras});

  final Map<dynamic, dynamic> extras;

  @override
  State<DetalleProductoPage> createState() => _DetalleProductoPageState();
}

class _DetalleProductoPageState extends State<DetalleProductoPage> {

  bool isActive = true;
  bool activo = true;

  void cartChange(){
    activo = !activo;
      Timer(const Duration(seconds: 1), () { 
        setState(() {
          activo = true; 
        });
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(

            padding: const EdgeInsets.only(right: 25.0, top: 10.0),
            child: InkWell(
              onTap: () {
                setState(() => isActive = !isActive );
              },
              child: (( !isActive ) ? Icon(Icons.add_box_rounded, size: 35.0,) : Icon(Icons.add_box_outlined, size: 35.0,)), 
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              Image.network('${widget.extras['image']}', height: 350.0,),
              SizedBox(height: 15.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10.0,),
                  Icon(Icons.star, size: 30.0, color: Colors.orange.shade800,),
                  SizedBox(width: 10.0,),
                  Text("${widget.extras['rating']['rate']}", style: TextStyle( fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.orange.shade800),),
                  SizedBox(width: 10.0,),
                  TextButton(
                    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blueGrey.shade100) ),
                    onPressed: () {} , 
                    child: Text("${widget.extras['rating']['count']} reviews", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black,), ),   
                  )
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    Text("${widget.extras['title']}", style: TextStyle( fontSize: 20.0 ), softWrap: true,),
                    Text("${widget.extras['description']}", 
                    textDirection: TextDirection.ltr,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(15, 0, 0, 0), // Color de la sombra
              blurRadius: 20, // Difuminado
              spreadRadius: 2, // Expansión
              offset: Offset(0, -10)
            )
          ]
        ),
        child: BottomAppBar(
          shadowColor: Colors.amber,
          elevation: 8.0,
          
          color: Colors.white,
          child: Row(
        
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ ${widget.extras['price']}", style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade500
              ),),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(( activo ) ? Colors.black : Colors.white),
                  minimumSize: WidgetStatePropertyAll(Size(200.0, 50.0)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cambia el valor para ajustar los bordes
                  )),
                ),
                onPressed: () {
                  setState(() {
                      cartChange();
                  });
                                      
                }, 
                child: Text("Add to Cart", style: TextStyle(color: ( activo ) ? Colors.white : Colors.black ),),
        
              ),
            ],
          ),
        ),
      ),

    );
  }
}