import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/helpers/is_darkmode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/view/auth/pages/signIn.dart';
import 'package:spotify_clone/view/auth/pages/signUp.dart';
import 'package:spotify_clone/view/widgets/appBar/basic_appbar.dart';
import 'package:spotify_clone/view/widgets/button/basic_btn.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/vectors/Top_pattern.png"),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/vectors/Bottom_pattern.png"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/Billie_wp3.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/vectors/spotify_logo.png"),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Enjoy Listening to Music",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      //color: context.isDarkMode? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: AppColor.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BasicBtn(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUpPage()),
                              );
                            },
                            title: "Register"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignInPage()));
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
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
