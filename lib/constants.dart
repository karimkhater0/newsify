import 'package:flutter/material.dart';

const Color kBlack = Color(0xFF180E19);
const Color kGrey = Color(0xFF909090);
const Color kGreyLight = Color(0xFFEEEEEE);
const Color kWhite = Color(0xFFFFFFFF);

const kDefaultPadding = 20.0;

BoxShadow kLightBoxShadow = BoxShadow(
  color: kGrey.withOpacity(0.5),
  spreadRadius: 1,
  blurRadius: 10,
  offset: const Offset(0, 0),
);
BoxShadow kDarkBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.5),
  spreadRadius: 1, blurRadius: 50,
  offset: const Offset(0, 4),
);



