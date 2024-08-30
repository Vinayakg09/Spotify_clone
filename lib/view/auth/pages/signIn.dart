import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/helpers/is_darkmode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/data/model/auth/signIn_user_req.dart';
import 'package:spotify_clone/domain/usescases/auth/signIn.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:spotify_clone/view/auth/pages/signUp.dart';
import 'package:spotify_clone/view/home/pages/home.dart';
import 'package:spotify_clone/view/widgets/appBar/basic_appbar.dart';
import 'package:spotify_clone/view/widgets/button/basic_btn.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Image.asset(
          "assets/vectors/spotify_logo.png",
          height: 35,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            const Text(
              "Sign In",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("If You Need Any Support "),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Click Here",
                      style: TextStyle(fontSize: 16, color: AppColor.primary),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "Enter Username or Email",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Recovery Password",
                      style: TextStyle(
                          color:
                              context.isDarkMode ? Colors.white : Colors.black),
                    ))),
            const SizedBox(
              height: 15,
            ),
            BasicBtn(
                onPressed: () async {
                  var result = await sl<SignInUse>().call(
                      params: SignInUserReq(
                          email: _email.text.toString(),
                          password: _password.text.toString()));
                  result.fold((l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const HomePage()),
                        (route) => false);
                  });
                },
                title: "Sign In"),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not A Member? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignUpPage()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
