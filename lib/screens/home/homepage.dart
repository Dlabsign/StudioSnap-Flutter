import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studiosnap/components/bottombar.dart';
import 'package:studiosnap/screens/home/photopage/event.dart';
import 'package:studiosnap/screens/home/photopage/photobox.dart';
import 'package:studiosnap/screens/home/photopage/product.dart';
import 'package:studiosnap/screens/home/photopage/selfphoto.dart';
import 'package:studiosnap/screens/home/comp/clickable-con.dart';
import 'package:studiosnap/screens/home/comp/desc.dart';
import 'package:studiosnap/screens/home/comp/homeappbar.dart';
import 'package:studiosnap/screens/home/comp/name.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({super.key, required this.userName});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: BottomBar(
          userName: widget.userName,
          currentIndex: 0,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double horizontalPadding = screenWidth * 0.2 - 70;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                NameComp(
                  userName: widget.userName,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        DescComp(),
                        SizedBox(
                          height: 28,
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF0404B2),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: MenuButton(
                                BtnTitle: "Self Photo",
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => selfPhotoPage(
                                          userName: widget.userName,
                                        ),
                                      ));
                                },
                                BtnDesc:
                                    "Automated self-portrait sessions, perfect for profile or ID photos",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF0A8A9A),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: MenuButton(
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductPage(
                                          userName: widget.userName,
                                        ),
                                      ));
                                },
                                BtnTitle: "Product Photography",
                                BtnDesc:
                                    "Professional product shoots for catalogs and online stores.",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF191716),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: MenuButton(
                                BtnTitle: "Wide Photobox",
                                BtnDesc:
                                    "Studio setup for high-quality video production, including lighting and sound.",
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PhotoBox(
                                          userName: widget.userName,
                                        ),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF9A031E),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: MenuButton(
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventPage(
                                          userName: widget.userName,
                                        ),
                                      ));
                                },
                                BtnTitle: "Event Photography",
                                BtnDesc:
                                    "Professional photography services for weddings, seminars, and more.",
                              ),
                            ),
                            SizedBox(
                              height: 15,
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
        },
      ),
    );
  }
}
