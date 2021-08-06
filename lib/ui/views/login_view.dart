import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssalindemann/providers/auth_provider.dart';
import 'package:ssalindemann/providers/login_form_provider.dart';
import 'package:ssalindemann/router/router.dart';
import 'package:ssalindemann/ui/buttons/custom_outlined_button.dart';
import 'package:ssalindemann/ui/buttons/link_text.dart';
import 'package:ssalindemann/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
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
                    // autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        // Usuario
                        TextFormField(
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          // validator: (value) {
                          //   if (!EmailValidator.validate(value ?? ''))
                          //     return 'Usuario no valido';
                          //   return null;
                          // },
                          onChanged: (value) =>
                              loginFormProvider.usuario = value,
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
                          onFieldSubmitted: (_) =>
                              onFormSubmit(loginFormProvider, authProvider),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
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
                          onPressed: () =>
                              onFormSubmit(loginFormProvider, authProvider),
                          text: 'Ingresar',
                          color: Colors.yellow.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // LinkText(
                        //   text: 'Nueva Cuenta',
                        //   onPressed: () {
                        //     Navigator.pushReplacementNamed(
                        //         context, Flurorouter.registerRoute);
                        //   },
                        // )
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid)
      authProvider.login(loginFormProvider.usuario, loginFormProvider.password);
  }
}
