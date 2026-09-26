import 'package:evently/core/Models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  EventModel({
    required this.id,
    required this.imagePathLight,
    required this.imagePathDark,
    required this.category,
    required this.title,
    required this.description,
    required this.eventDate,
    required this.eventTime,
  });
  String id;
  String imagePathLight;
  String imagePathDark;
  CategoryModel category;
  String title;
  String description;
  DateTime eventDate;
  TimeOfDay eventTime;
}
