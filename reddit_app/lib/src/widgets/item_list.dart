import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, 
  required this.producto, required this.columns});

  final Map<String, dynamic> producto;
  final int columns;

  @override
  Widget build(BuildContext context) {

    if (columns == 1) {
      return Card(
      elevation: 0.0,      
      shape: RoundedRectangleBorder(side: BorderSide.none),
      color: Colors.white,
      borderOnForeground: false,
      child: InkWell(
        onTap: (){

          context.goNamed('detalle-producto', extra: producto);

        },
        child: Column(
          children: [
            Image.network(producto['image'], 
            fit: BoxFit.fitWidth,
            height: 200.0,
            repeat: ImageRepeat.noRepeat,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(producto['title'], style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                  Text('\$ ${producto['price'].toString()}', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    }
    if (columns == 2) {
      return Card(
      elevation: 0.0,      
      shape: RoundedRectangleBorder(side: BorderSide.none),
      color: Colors.white,
      borderOnForeground: false,
      child: InkWell(
        onTap: (){

          context.goNamed('detalle-producto', extra: producto);

        },
        child: Column(
          children: [
            Image.network(producto['image'], 
            fit: BoxFit.fitWidth,
            height: 110.0,
            repeat: ImageRepeat.noRepeat,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(producto['title'], style: TextStyle(
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),),
                  Text('\$ ${producto['price'].toString()}', style: TextStyle(
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    }
    if (columns == 3) {
      return Card( 
      elevation: 0.0,      
      shape: RoundedRectangleBorder(side: BorderSide.none),
      color: Colors.white,
      borderOnForeground: false,
      child: InkWell(
        onTap: (){

          context.goNamed('detalle-producto', extra: producto);

        },
        child: Column(
          children: [
            Image.network(producto['image'], 
            fit: BoxFit.fitWidth,
            height: 60.0,
            repeat: ImageRepeat.noRepeat,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(producto['title'], style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                  Text('\$ ${producto['price'].toString()}', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    }

    return Card(
      elevation: 0.0,      
      shape: RoundedRectangleBorder(side: BorderSide.none),
      color: Colors.white,
      borderOnForeground: false,
      child: InkWell(
        onTap: (){

          context.goNamed('detalle-producto', extra: producto);

        },
        child: Column(
          children: [
            Image.network(producto['image'], 
            fit: BoxFit.fitWidth,
            height: 40.0,
            repeat: ImageRepeat.noRepeat,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(producto['title'], style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 8.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                  Text('\$ ${producto['price'].toString()}', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8.0,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}