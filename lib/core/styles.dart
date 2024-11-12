
import 'package:flutter/material.dart';
import 'package:newsify/constants.dart';

abstract class Styles
{
  static const tsArticleTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const tsActionSheet = TextStyle(
    fontSize: 18,
  );
  static const tsImageCaption = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.italic
  );

  static const tsH1Bold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const tsH1Medium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const tsH2Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const tsH2Medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const tsH3Bold = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static const tsH3Medium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: kGrey
  );

  static const tsP1Regular = TextStyle(
    fontSize: 15,
  );

}