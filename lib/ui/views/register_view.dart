import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/providers/register_form_provider.dart';

import 'package:email_validator/email_validator.dart';

import 'package:ssalindemann/router/router.dart';

import 'package:ssalindemann/ui/buttons/custom_outlined_button.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';
import 'package:ssalindemann/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.brown[900],
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                    key: registerFormProvider.formKey,
                    child: Column(
                      children: [
                        // Usuario
                        TextFormField(
                          onChanged: (value) =>
                              registerFormProvider.nombre = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'El nombre es obligatorio';
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su nombre',
                              label: 'Nombre',
                              icon: Icons.supervised_user_circle),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              registerFormProvider.usuario = value,
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Usuario no valido';
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su usuario',
                            label: 'Usuario',
                            icon: Icons.email_outlined,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // Clave
                        TextFormField(
                          onChanged: (value) =>
                              registerFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length < 6 || value.isEmpty)
                              return 'La contraseña debe ser de 6 caracteres';
                            return null; // valido
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: '*******',
                            label: 'Contraseña',
                            icon: Icons.lock_outline_rounded,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                          onPressed: () {
                            final validForm =
                                registerFormProvider.validateForm();
                            if (!validForm) return;
                            // todo auth provider register
                            final authProvider = Provider.of<AuthProvider>(
                                context,
                                listen: false);
                            // authProvider.register(
                            //     registerFormProvider.usuario,
                            //     registerFormProvider.password,
                            //     registerFormProvider.nombre);
                          },
                          text: 'Crear Cuenta',
                          color: Colors.yellow.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LinkText(
                          text: 'Ir a Login',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Flurorouter.registerRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
