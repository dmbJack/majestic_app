import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackgroundColor = Color.fromRGBO(19, 2, 2, 0.5);
const kPrimaryColor = Color.fromRGBO(231, 35, 35, 1);

TextStyle font(
    {required double size, required Color colors, FontWeight? weight}) {
  return GoogleFonts.inter(fontSize: size, fontWeight: weight, color: colors);
}

TabBar tabListName() {
  return TabBar(
    isScrollable: true,
    indicatorWeight: 3,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Colors.red,
    tabs: [
      Text(
        'IVOIRE',
        style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
      ),
      Text(
        'PRIMA',
        style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
      ),
      Text(
        'SOCOCÉ',
        style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
      ),
      Text(
        'FIGAYO',
        style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
      ),
    ],
  );
}
