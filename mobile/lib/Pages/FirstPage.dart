import 'package:flutter/material.dart';
import 'package:projetfinprepa/Pages/Search_Page.dart';
import 'package:projetfinprepa/Providers/Tailors.dart';
import 'package:projetfinprepa/tests/Home_Page.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentpage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TailorsProvider>(context, listen: false).GetAllTailors();
  }

  @override
  Widget build(BuildContext context) {
    List Pages = [HomePage(), SearchPage()];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF84643D)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.black,
            currentIndex: currentpage,
            showUnselectedLabels: false,
            elevation: 0,
            unselectedItemColor: Colors.white,
            onTap: (value) {
              print(value);
              currentpage = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "images/HomeIcon.png",
                    color: currentpage != 0 ? Colors.white : Colors.black,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "images/SearchIcon.png",
                  color: currentpage != 1 ? Colors.white : Colors.black,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "images/HomeIcon.png",
                    color: currentpage != 2 ? Colors.white : Color(0xFF352107),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "images/HomeIcon.png",
                    color: currentpage != 3 ? Colors.white : Color(0xFF352107),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "images/HomeIcon.png",
                    color: currentpage != 4 ? Colors.white : Color(0xFF352107),
                  ),
                  label: "Home")
            ],
          ),
        ),
        body: AnimatedSwitcher(
          child: Pages[currentpage],
          transitionBuilder: (child, animation) {
            // var tween = Tween(begin: Offset(0.2, 0), end: Offset(0, 0));
            // var offsetAnimation = animation.drive(tween);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          duration: Duration(milliseconds: 700),
        ),
      )),
    );
  }
}
