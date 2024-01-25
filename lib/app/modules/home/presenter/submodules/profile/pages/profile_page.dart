import 'package:flutter/material.dart';
import 'package:pokedex_flutter/app/core/themes/themes.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/submodules/profile/widget/container_text.dart';
import 'package:pokedex_flutter/app/modules/home/presenter/submodules/profile/widget/profile_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void openURL(String url) async {
    var httpsUri = Uri.parse(url);
    if (await canLaunchUrl(httpsUri)) {
      await launchUrl(httpsUri);
    }
  }

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
              'Júlio Macena',
              style: textTheme.headlineLarge,
            ),
            Text(
              'Desenvolvedor Pleno at Guarani Sistemas',
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
                  'Sou desenvolvedor Frontend com foco em aplicações mobile, graduado em Engenharia Elétrica pelo IFPB. Possuo experiência profissionais trabalhando em projetos flutter com desenvolvimento guiado por testes, Test Driven Development, utilizando arquiteturas MVC, MVVN e Clean Architecture para aplicações Web e Mobile. Conhecimento Metodologia Ágil Scrum e Kanban.',
            ),
            const ContainerText(
              title: 'Sobre o projeto',
              message:
                  'Protótipo desenvolvido em flutter utilizando a api PokeAPI, para o teste de Desenvolvedor Flutter Pleno',
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
                  GestureDetector(
                    onTap: () {
                      openURL('https://www.linkedin.com/in/julio-macena/');
                    },
                    child: Image.asset('img/linkedin_img.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      openURL('https://www.instagram.com/juliovinnicius/');
                    },
                    child: Image.asset('img/insta_img.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      openURL('https://github.com/juliovinnicius');
                    },
                    child: Image.asset('img/github_img.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      openURL(
                          'https://wa.me/83998491578/?text=${Uri.parse("message")}');
                    },
                    child: Image.asset('img/whatsapp_img.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
