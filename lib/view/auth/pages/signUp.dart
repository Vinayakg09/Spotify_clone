import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/data/model/auth/create_user_req.dart';
import 'package:spotify_clone/domain/usescases/auth/signUp.dart';
import 'package:spotify_clone/view/auth/pages/signIn.dart';
import 'package:spotify_clone/view/home/pages/home.dart';
import 'package:spotify_clone/view/widgets/appBar/basic_appbar.dart';
import 'package:spotify_clone/view/widgets/button/basic_btn.dart';

import '../../../service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            const Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
              controller: _fullName,
              decoration: const InputDecoration(
                hintText: "Full Name",
              ).applyDefaults(Theme.of(context).inputDecorationTheme),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "Enter Email",
              ),
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
              height: 30,
            ),
            BasicBtn(
                onPressed: () async {
                  var result = await sl<SignUpUse>().call(
                      params: CreateUserReq(
                          fullName: _fullName.text.toString(),
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
                title: "Create Account"),
            const Spacer(),
            // const SizedBox(
            //   height: 150,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do You Have An Account? ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignInPage()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Sign In",
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
