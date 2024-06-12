import 'package:care/pages/home/custom/article_card_widget.dart';
import 'package:care/pages/home/custom/seaction_header_widget.dart';
import 'package:care/pages/home/custom/shortcut_gridview.dart';
import 'package:care/pages/home/custom/top_doctor_card_view.dart';
import 'package:care/pages/notification/notification_page.dart';
import 'package:care/utils/color.dart';
import 'package:care/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double appBarPaddingVertical = screenHeight * 0.01;
    final double bodyPaddingAll = screenWidth * 0.05;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarPaddingVertical * 7),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: bodyPaddingAll, vertical: appBarPaddingVertical),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Good Morning \n',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: 'How are you feeling today?',
                      style: TextStyle(
                        color: blueOne,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          titleSpacing: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Pindah ke halaman notifikasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: bodyPaddingAll, vertical: screenHeight * 0.02),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SearchBarWidget(),
                      SizedBox(height: screenHeight * 0.02),
                      const SizedBox(
                        width: double.infinity,
                        child: ShortcutGridView(),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SectionHeader(
                        title: 'Top Doctor',
                        actionText: 'See All',
                        onTap: () {},
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      TopDoctorListView(),
                      SizedBox(height: screenHeight * 0.01),
                      SectionHeader(
                        title: 'Article',
                        actionText: 'See All',
                        onTap: () {},
                      ),
                      const ArticleListView(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
