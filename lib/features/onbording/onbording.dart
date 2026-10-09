import 'package:evently/core/Models/onbording_model.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:flutter/material.dart';

class onbording extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.main_logo_light, height: 27),
              SizedBox(height: 24),
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          OnbordingModel.onbordingScreens[index].lightimagePath,
                          height: 343,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 24),
                        Text(
                          OnbordingModel.onbordingScreens[index].title,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          OnbordingModel.onbordingScreens[index].description,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.labelSmall!
                              .copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        index == 0
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Language",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),

                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     color: ,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                  Row(children: []),
                                ],
                              )
                            : SizedBox(),
                      ],
                    );
                  },
                  itemCount: OnbordingModel.onbordingScreens.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
