import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/view/auth/pages/signUp_signIn.dart';
import 'package:spotify_clone/view/choose_mode/bloc/themeCubit.dart';

import '../../widgets/button/basic_btn.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/billie_wp2.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/vectors/spotify_logo.png")),
                const Spacer(),
                const Text(
                  "Choose Mode",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xff30393c).withOpacity(0.55),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset("assets/vectors/Moon.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Dark Mode",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColor.grey)),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xff30393c).withOpacity(0.55),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset("assets/vectors/Sun.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Light Mode",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColor.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                BasicBtn(
                    onPressed: () {
                      debugPrint("Click");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignUpOrSignIn() ));
                    },
                    title: "Continue"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
