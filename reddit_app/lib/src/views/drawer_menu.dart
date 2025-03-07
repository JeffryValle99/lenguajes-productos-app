import 'package:flutter/material.dart';
import 'package:reddit_app/src/views/menu_item.dart';



class DrawerMenu extends StatelessWidget {
  DrawerMenu({super.key});

  final style = TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
        
        width: 260,
        backgroundColor:Color.fromARGB(255, 29, 27, 27),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 10.0),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange.shade400,
                    child: Text('JV',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Column( 
                    spacing: 0,
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    "Jeffry Espinal Valle",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white

                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "jeffry.espinal@unah.hn",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white

                    ),
                  ),
                  SizedBox(height: 5.0,),
                  InkWell(
                    onTap: (){},
                    child: Text('Ver Cuenta', style: TextStyle(
                      color: Colors.blue.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0
                    ),),
                  ),
                  SizedBox(height: 5.0,),
                  ]),
                ],
              ),
              Divider(
                indent: 20.0,
                endIndent: 30.0,
                color: Colors.white,
              ),
              MenuItem(texto: "Inicio", estilo: style, iconoFirst: Icons.home,iconoLast: Icons.arrow_forward_ios_outlined),
              MenuItem(texto: "Comunidades", estilo: style, iconoFirst: Icons.people_sharp,iconoLast: Icons.arrow_forward_ios_outlined),
              MenuItem(texto: "Crear", estilo: style, iconoFirst: Icons.add,iconoLast: Icons.arrow_forward_ios_outlined),
              MenuItem(texto: "Chatear", estilo: style, iconoFirst: Icons.message,iconoLast: Icons.arrow_forward_ios_outlined),
              MenuItem(texto: "Notificaciones", estilo: style, iconoFirst: Icons.notification_add_sharp,iconoLast: Icons.arrow_forward_ios_outlined),
              
            ],
          )),
      );
  }
}