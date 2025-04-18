import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/common/widgets/button/basic_app_button.dart';
import 'package:pokedex/core/configs/assets/app_images.dart';
import 'package:pokedex/core/configs/assets/app_vectors.dart';
import 'package:pokedex/core/configs/theme/app_colors.dart';
import 'package:pokedex/presentation/auth/pages/login_page.dart';
import 'package:pokedex/presentation/splash/pages/splash/splash.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Column(
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    //child: SvgPicture.asset(AppVectors.onboarding1),
                    child: Image.asset(
                      AppImages.onboarding1,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Todos los Pokémon en un solo lugar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Accede a una amplia lista de Pokémon desde Cada generación jamás creada por Nintendo',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Appcolors.grey,
                        fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginPage()));
                    },
                    title: "Comenzar",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
