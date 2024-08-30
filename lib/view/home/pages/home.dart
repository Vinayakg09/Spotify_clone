import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/helpers/is_darkmode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/view/home/widgets/news_song.dart';
import 'package:spotify_clone/view/home/widgets/playList.dart';
import 'package:spotify_clone/view/widgets/appBar/basic_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: Image.asset(
          "assets/vectors/spotify_logo.png",
          height: 35,
        ),
        action: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20
          ),
          child: Column(
            children: [
              _topCard(),
              const SizedBox(
                height: 30,
              ),
              _tapBar(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewsSongs(),
                    Container(),
                    Container(),
                    Container()
                  ]),
              ),
              //SizedBox(height: 40,),
              const PlayList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 360,
            height: 135,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              color: AppColor.primary,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText("New Album", 10),
                    myText("Happier Than", 20),
                    myText("Ever", 20),
                    myText("Billie Eilish", 14),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -37,
          right: 20,
          child: Image.asset(
            "assets/images/Billie_wp4.png",
            width: 350,
            height: 170,
          ),
        ),
      ],
    );
  }

  Widget _tapBar() {
    return TabBar(
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      indicatorColor: AppColor.primary,
      dividerColor: Colors.transparent,
      //isScrollable: true,
      tabs: const [
        Text("News"),
        Text("Videos"),
        Text("Artists"),
        Text("Podcasts"),
      ],
    );
  }

  Widget myText(String myText, double size) {
    return Text(
      myText,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
