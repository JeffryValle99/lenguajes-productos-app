import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reddit_app/src/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  final usuarioControlador = TextEditingController();

  //llave para el form
  final formkey = GlobalKey<FormState>();

  bool activo = true;

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
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    
                    tipoInput: TextInputType.text,
                    nombreCampo: 'Nombre de Usuario',
                    valor: (valor) {
                      if (valor!.trim().isEmpty) return 'El Nombre es obligatorio';
                      if (valor.length < 6) return 'El Nomrbe debe tener más de 6 caracteres';
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    
                    tipoInput: TextInputType.text,
                    nombreCampo: 'Apellido', 
                    valor: (String? valor){
                      if(valor!.trim().isEmpty) return 'El apellido es obligatorio';
                      return 'ok';
                    }
                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    
                    tipoInput: TextInputType.phone,
                    nombreCampo: 'Telefono', 
                    valor: (String? valor){
                      if(valor!.trim().isEmpty) return 'El telefono es obligatorio';
                      if(valor.length > 8) return 'Debe contener más de 8 números';
                      return 'ok';
                    }
                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    iconoDerecha: IconButton(
                      icon: ( activo ) ? Icon(Icons.visibility_rounded) : Icon(Icons.visibility_off_rounded),
                      onPressed: (){
                        mostrarPassword();
                      }  
                    ),

                    tipoInput: TextInputType.text,
                    nombreCampo: 'Contrasenia',
                    valor: (String? valor){
                      if(valor!.isEmpty) return 'La contraseña es obligatoria';
                      if(valor.length < 6 ) return 'La contraseña debe ser mayor a 6 caracteres';
                      return 'ok';
                    }

                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    
                    tipoInput: TextInputType.number,
                    nombreCampo: 'ID', 
                    valor: (String? valor){
                      if(valor!.isEmpty) return 'El ID es obligatoria';
                      if(valor.length < 6 ) return 'El ID debe ser mayor a 13 caracteres';
                      return 'ok';
                    }
                  ),
                  SizedBox(height: 20,),
                  TextFieldWidget(
                    
                    tipoInput: TextInputType.emailAddress,
                    nombreCampo: 'Correo', 
                    valor: (String? valor){
                      if(valor!.trim().isEmpty) return 'El correo es obligatoria';
                      if(!valor.contains('@') ) return 'El correo debe contener un @';
                      return 'ok';
                    }
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
                                        context.go('/login');
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
                    child: Text('Registrar Cuenta'),
                  ),
                  TextButton(
                    child: Text('Regresar'),
                    onPressed: () {
                      context.pop();
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