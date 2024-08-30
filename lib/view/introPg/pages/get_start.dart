import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/view/choose_mode/pages/choose_mode.dart';
import 'package:spotify_clone/view/widgets/button/basic_btn.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/billie_wp.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/vectors/spotify_logo.png"),
                  ),
                  const Spacer(),
                  const Text(
                    "Enjoy Listening to Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: AppColor.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  BasicBtn(
                      onPressed: () {
                        debugPrint("Click");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => const ChooseMode()));
                      },
                      title: "Get Started"),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
