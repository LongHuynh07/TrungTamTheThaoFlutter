import 'package:trungtamthethao/screen/HomePage.dart';
import 'package:trungtamthethao/screen/Accountpage.dart';
import 'package:trungtamthethao/screen/SettingPage.dart';
import 'package:trungtamthethao/screen/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
    State<BottomBar> createState() => _BottomBarState();
  }

class _BottomBarState extends State<BottomBar> { int _selectedIndex=0;
static final List<Widget>_widgetOptions=<Widget> [
HomePage(),
Settingpage(),
Cartpage(),
Accountpage()

];
void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey[500],
        items: const [
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_regular),label: ""),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_heart_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_heart_regular),label: ""),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),label: "")
        ],
      ),
    );
  }
}

