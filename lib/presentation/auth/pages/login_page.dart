import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/common/widgets/button/basic_app_button.dart';
import 'package:pokedex/common/widgets/button/basic_app_button_back.dart';
import 'package:pokedex/common/widgets/text/basic_app_subtitle.dart';
import 'package:pokedex/common/widgets/text/basic_app_title.dart';
import 'package:pokedex/core/configs/assets/app_images.dart';
import 'package:pokedex/core/configs/theme/app_colors.dart';
import 'package:pokedex/presentation/auth/widgets/button_another_sesion.dart';
import 'package:pokedex/presentation/auth/widgets/button_another_sesion2.dart';
import 'package:pokedex/presentation/home/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicAppButtonBack(),
          Align(
            alignment: Alignment.center,
            //child: SvgPicture.asset(AppVectors.onboarding1),
            child: Image.asset(
              AppImages.loginImg,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 25,
              ),
              BasicAppTitle(
                title: 'Bienvenido',
              ),
              BasicAppSubTitle(
                  subTitle:
                      'Para poder acceder a la aplicación, por favor seleccione una de las siguientes opciones'),
              Container(
                padding: const EdgeInsets.all(8),
                child:
                    ButtonAnotherSesionIos(title: 'Iniciar sesión con Apple'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: ButtonAnotherSesionGoogle(
                    title: 'Iniciar sesión con Google'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: BasicAppButton(
                    height: 65,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                    title: 'Iniciar sesión con email'),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
