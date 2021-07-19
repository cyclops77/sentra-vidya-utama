import 'package:mobile/core/color.dart';
import 'package:mobile/core/href.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  final int i;
  final bool loading;
  Navbar(this.i, this.loading);
  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  final listPage = <StatefulWidget>[
    // HomeIndexScreen(),
    // CariNewsScreen(),
    // DetailRedaksiScreen(),
  ];
  // int selectedIndex = widget.i;
  void _navbarTapped(int index) {
    if (widget.loading == false) {
      if (widget.i != index) {
        Routes.stfR(context, listPage[index]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _bottomNavbarItem = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_alt), label: "Beranda"),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Cari"),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.bookmark), label: "Tersimpan"),
    ];
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomNavbarItem,
      // backgroundColor: HexColor('ffffff'),
      currentIndex: widget.i,
      selectedItemColor: Clr.primary,
      selectedLabelStyle: GoogleFonts.varela(
          color: Colors.deepOrange, fontSize: 10, fontWeight: FontWeight.w500),
      unselectedLabelStyle: GoogleFonts.varela(fontSize: 10),
      unselectedItemColor: Colors.grey,
      onTap: _navbarTapped,
    );
  }
}
