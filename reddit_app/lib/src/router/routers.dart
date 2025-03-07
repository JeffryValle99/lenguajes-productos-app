import 'package:flutter/material.dart';
import 'package:reddit_app/src/views/home_page.dart';
import 'package:reddit_app/src/views/detalle_producto.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/src/views/login_page.dart';
import 'package:reddit_app/src/views/register_page.dart';



final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/producto',
        name: "producto",
        builder: (context, settings) => HomePage(),
        routes: [
          GoRoute(
            path: '/detalle-producto',
            name: 'detalle-producto',
            builder: (BuildContext context, GoRouterState settings){

              final extras = settings.extra as Map;

              return DetalleProductoPage(
                extras: extras
              );
            } 
          )
        ]
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginPage(),
        routes: [
          GoRoute(
            path: '/register-page',
            name: 'register',
            builder: (context, settings) => RegisterPage(),
          ),
        ],
        ),
    ]);