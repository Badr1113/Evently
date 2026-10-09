import 'package:evently/core/sourses/assets_manager.dart';

class OnbordingModel {
  final String lightimagePath;
  final String darkimagePath;
  final String title;
  final String description;

  OnbordingModel({
    required this.lightimagePath,
    required this.darkimagePath,
    required this.title,
    required this.description,
  });

  static final List<OnbordingModel> onbordingScreens = [
    OnbordingModel(
      lightimagePath: AssetsManager.onbordinglight1,
      darkimagePath: AssetsManager.onbordingdark1,
      title: "Personalize Your Experience",
      description: "Choose your preferred theme andlanguage to get started with a comfortable, tailored experience that suits your style.",
    ),
    OnbordingModel(
      lightimagePath: AssetsManager.onbordinglight2,
      darkimagePath: AssetsManager.onbordingdark2,
      title: "Find Events That Inspire You",
      description: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    ),
    OnbordingModel(
      lightimagePath: AssetsManager.onbordinglight3,
      darkimagePath: AssetsManager.onbordingdark3,
      title: "Effortless Event Planning",
      description: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
    ),
    OnbordingModel(
      lightimagePath: AssetsManager.onbordinglight4,
      darkimagePath: AssetsManager.onbordingdark4,
      title: "Connect with Friends & Share Moments",
      description: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
    ),
  ];
}
