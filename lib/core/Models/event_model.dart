import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/Models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel {
  EventModel({
    required this.ownerId,
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.eventDate,
  });
  String ownerId;
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime eventDate;

  static Map<String, dynamic> toJson(EventModel event) {
    return {
      "ownerId": event.ownerId,
      "id": event.id,
      "categoryId": event.category.id,
      "title": event.title,
      "description": event.description,
      "eventDate": event.eventDate,
    };
  }

  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      ownerId: json["ownerId"],
      id: json["id"],
      category: CategoryModel.categories.firstWhere(
        (category) => json["categoryId"] == category.id,
      ),
      title: json["title"],
      description: json["description"],
      eventDate: (json["eventDate"] as Timestamp).toDate(), // this is important to convert the timestamp to DateTime and down casting
    );
  }
}
