import 'package:flutter/material.dart';
import 'package:reddit_app/src/api/productos.dart';
import 'package:reddit_app/src/views/drawer_menu.dart';
import 'package:reddit_app/src/views/menu_item.dart';
import 'package:reddit_app/src/widgets/item_list.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 1;

  List options = [
    {"id": 1,"nombre": "Columna 1",},
    {"id": 2,"nombre": "Columna 2",},
    {"id": 3,"nombre": "Columna 3",},
    {"id": 4,"nombre": "Columna 4",},
  ];

  int _crossAxisCount = 2; // Valor inicial de las columnas

  void _updateGrid(int columns) {
    setState(() {
      _crossAxisCount = columns;
    });
  }

  void onItemChange(int index){
    setState(() {    
      currentIndex = index;
    });
  }

  final style = TextStyle(
    color: Colors.white,
    fontSize: 13,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: DrawerMenu(),
      // Color de Fondo
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xCC222222),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: 
          Row(
            children: [
              Text("reddit", 
                style: 
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                      ),),
            PopupMenuButton(
              icon: Icon(Icons.keyboard_arrow_down_outlined),
              position: PopupMenuPosition.under,
              color: Colors.grey[900],
              itemBuilder: (context)=> [
                PopupMenuItem(child: MenuItem(texto: "Inicio", iconoFirst: Icons.home, iconoLast: null, estilo: style)),
                PopupMenuItem(child: MenuItem(texto: "Popular", iconoFirst: Icons.arrow_outward_rounded, iconoLast: null, estilo: style)),
                PopupMenuItem(child: MenuItem(texto: "Videos", iconoFirst: Icons.ondemand_video_rounded, iconoLast: null, estilo: style)),
                PopupMenuItem(child: MenuItem(texto: "Reciente", iconoFirst: Icons.blur_on, iconoLast: null, estilo: style)),
              ]),  
            ],
          ),
        
        actions: [
          Icon(
            Icons.search, 
            size: 35,
            color: Colors.white,
            ),
            SizedBox(width: 20,),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white70,
          ),
          SizedBox(width: 20,),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        // Propiedad con la variable que almacenará el indice actual
        currentIndex: currentIndex,
        // Funcion que actualiza el valor de currentIndex
        onTap: onItemChange,
        backgroundColor: Color(0xCC222222),
        selectedItemColor: Colors.blueGrey,
        selectedIconTheme: IconThemeData(color: Colors.blueGrey),
        unselectedItemColor: Colors.white,

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.blur_circular), label: "Reciente"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_rounded), label: "Notificaciones"),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection_rounded), label: "Videos"),
        ]),

      body: Column(
        children: [
          SizedBox(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 4.0,right: 0.0,top: 8.0,),
                  child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll((_crossAxisCount == 1) ? Colors.black : Colors.grey.shade200),
                    ),onPressed: () {
                      _updateGrid(1);
                    },child: Icon(Icons.looks_one_rounded, color: (_crossAxisCount == 1) ? Colors.white : Colors.black,)
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 4.0,right: 0.0,top: 8.0,),
                  child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll((_crossAxisCount == 2) ? Colors.black : Colors.grey.shade200),
                    ),onPressed: () {
                      _updateGrid(2);
                    },child: Icon(Icons.looks_two_rounded, color: (_crossAxisCount == 2) ? Colors.white : Colors.black,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 4.0,right: 0.0,top: 8.0,),
                  child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll((_crossAxisCount == 3) ? Colors.black : Colors.grey.shade200),
                    ),onPressed: () {
                      _updateGrid(3);
                    },child: Icon(Icons.looks_3_rounded, color: (_crossAxisCount == 3) ? Colors.white : Colors.black,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 4.0,right: 0.0,top: 8.0,),
                  child: TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll((_crossAxisCount == 4) ? Colors.black : Colors.grey.shade200),
                    ),onPressed: () {
                      _updateGrid(4);
                    },child: Icon(Icons.looks_4_rounded, color: (_crossAxisCount == 4) ? Colors.white : Colors.black,)),
                ),
              ],

            ),
          ),
          Expanded(
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount),
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return ItemList(producto: productos[index], columns: _crossAxisCount);
              },
              
              ),
          ),
        ],
      ),
    );
  }
}