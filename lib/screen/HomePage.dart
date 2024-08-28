import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trungtamthethao/HOME/AllCourtsPage.dart';
import 'package:trungtamthethao/HOME/UpdatingCourtsPage.dart';
import 'package:trungtamthethao/Widget/home_appbar.dart';
import '../Style/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const Gap(10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              children: [
                Icon(
                  FluentSystemIcons.ic_fluent_search_regular,
                  color: Colors.black,
                ),
                Gap(8),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (query) {
                      // Handle search logic here
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ],
            ),
          ),
          const Gap(20),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: [
              buildCarouselItem('assets/sanbongro.jpg'),
              buildCarouselItem('assets/sanbong.jpg'),
              buildCarouselItem('assets/tennis.jpg'),
            ],
          ),
          const Gap(20),
          buildSection(
            context,
            title: "Sân Mới",
            seeAllPage: const AllCourtsPage(),
            children: [
              buildCourtItem(context, 'assets/bongro1.jpg', const NewCourtPage1()),
              buildCourtItem(context, 'assets/bongro2.jpg', const NewCourtPage2()),
            ],
          ),
          const Gap(20),
          buildSection(
            context,
            title: "Đang cập nhật",
            seeAllPage: const UpdatingCourtsPage(),
            children: [
              buildCourtItem(context, 'assets/tennis1.jpg', const UpdatingPage1()),
              buildCourtItem(context, 'assets/tennis2.jpg', const UpdatingPage2()),
            ],
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget buildCarouselItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(BuildContext context, {required String title, required Widget seeAllPage, required List<Widget> children}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.headLineStyle2,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => seeAllPage));
                },
                child: Text(
                  "Xem tất cả",
                  style: Styles.textStyle,
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ],
    );
  }

  Widget buildCourtItem(BuildContext context, String imagePath, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy pages for navigation

class NewCourtPage1 extends StatelessWidget {
  const NewCourtPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Court 1')),
      body: const Center(child: Text('Details for New Court 1')),
    );
  }
}

class NewCourtPage2 extends StatelessWidget {
  const NewCourtPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Court 2')),
      body: const Center(child: Text('Details for New Court 2')),
    );
  }
}

class UpdatingPage1 extends StatelessWidget {
  const UpdatingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Updating Page 1')),
      body: const Center(child: Text('Details for Updating Page 1')),
    );
  }
}

class UpdatingPage2 extends StatelessWidget {
  const UpdatingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Updating Page 2')),
      body: const Center(child: Text('Details for Updating Page 2')),
    );
  }
}
