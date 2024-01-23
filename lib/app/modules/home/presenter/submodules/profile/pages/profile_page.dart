import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/core/themes/themes.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/submodules/profile/widget/container_text.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/submodules/profile/widget/profile_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Image.asset('img/avatar_img.png'),
            ),
            Text(
              'Mariana Yoshino',
              style: textTheme.headlineLarge,
            ),
            Text(
              'UX / UI Designer at Guarani Sistemas',
              style: textTheme.bodySmall!.copyWith(
                color: ThemeColors.tintedGray,
              ),
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileButton(
                  text: 'Follow',
                  color: ThemeColors.darkNavy,
                  textColor: ThemeColors.white,
                ),
                SizedBox(width: 16),
                ProfileButton(
                  text: 'Message',
                  color: ThemeColors.lightGray,
                  textColor: ThemeColors.darkNavy,
                ),
              ],
            ),
            const ContainerText(
              title: 'Sobre mim',
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Semper viverra nam libero justo. Sed id semper risus in hendrerit.',
            ),
            const ContainerText(
              title: 'Sobre o projeto',
              message:
                  'Protótipo realizado para Guarani Sistemas para o teste para a vaga de Desenvolvedor Flutter Pleno.',
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: ThemeColors.almostWhite,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('img/linkedin_img.png'),
                  Image.asset('img/insta_img.png'),
                  Image.asset('img/github_img.png'),
                  Image.asset('img/notion_img.png'),
                  Image.asset('img/whatsapp_img.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
