import 'package:flutter/material.dart';
import 'package:imake/tasks/data/repository/token_repository.dart';
import 'components/widgets.dart';
import 'routes/pages.dart';
import 'utils/color_palette.dart';
import 'utils/font_sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TokenRepository _tokenRepository = TokenRepository();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    final hasToken = await _tokenRepository.hasToken();
    
    if (!mounted) return;
    if (hasToken) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Pages.tasksScreen,
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Pages.login,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/android.png',
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            buildText('IMake Tasks', kWhiteColor, textBold, FontWeight.w600,
                TextAlign.center, TextOverflow.clip),
            const SizedBox(
              height: 10,
            ),
            buildText('Gerencie suas tarefas!', kWhiteColor, textTiny,
                FontWeight.normal, TextAlign.center, TextOverflow.clip),
          ],
        )));
  }
}
