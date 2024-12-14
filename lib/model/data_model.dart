import 'package:flutter/material.dart';

class DataModel {
  final String problemDescription;
  final String problemDescriptionHindi;
  final String point;
  final String treatment;
  final String treatmentHindi;
  final List<Image>? images;

  DataModel({
    required this.problemDescription,
    required this.problemDescriptionHindi,
    required this.point,
    required this.treatment,
    required this.treatmentHindi,
    this.images,
  });
}
