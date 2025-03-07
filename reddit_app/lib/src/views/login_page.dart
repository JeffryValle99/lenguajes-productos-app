import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool activo = true;

  //llave para el form
  final formkey = GlobalKey<FormState>();

  void mostrarPassword(){
    activo = !activo;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0,),
                  Icon(
                    Icons.person,
                    color: Colors.lightBlue,
                    size: 120.0,
                  ),
                  // FlutterLogo(size: 150,),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: userController,
                    validator: (String? valor) {
                      if (valor!.isEmpty) {
                        return 'El usuario es obligatorio';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person),
                      labelText: 'Usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: activo,
                    controller: passwordController,
                    validator: (String? valor) {
                      if (valor!.isEmpty) {
                        return 'El password es obligatorio';
                      }

                      if (valor.length < 6) {
                        return 'El password debe tener al menos 6 caracteres';
                      }

                      if (!valor.contains('@')) {
                        return 'El password debe contener un @';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(icon: ( activo ) ? Icon(Icons.visibility_rounded) : Icon(Icons.visibility_off_rounded),
                      onPressed: () {
                        mostrarPassword();
                      },),                      
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  ElevatedButton(
                    onPressed: () {
                      // formkey.currentState!.validate();

                      if (userController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          action: SnackBarAction(
                            label: 'Cerrar',
                            onPressed: () {},
                          ),
                          content: Column(
                            children: [
                              Text('Titulo'),
                              Text('El usuario es obligatorio'),
                            ],
                          ),
                        ));

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Aviso!'),
                                  content: Text('El usuario es obligatorio'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.go('/producto');
                                      },
                                      child: Text('oki'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Text('Cancelar'),
                                    ),
                                  ],
                                ));
                        return;
                      }
                      // print(userController.text);
                      // print(passwordController.text);
                    },
                    child: Text('Iniciar Sesión'),
                  ),
                  TextButton(
                    child: Text('Crear Cuenta'),
                    onPressed: () {
                      context.goNamed('register');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}