import 'package:evently/core/sourses/assets_manager.dart';
import 'package:flutter/material.dart';

class GoogleWidget extends StatelessWidget {
  String label;
  VoidCallback _onTap;
  GoogleWidget({required this.label, required this._onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.googleLogo, height: 24, width: 24),
            SizedBox(width: 16),
            Text(label, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
