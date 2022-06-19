import 'package:ad_blocker/ui/widgets/general_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/training_page_widgets/training_step.dart';

class SetupTrainingPage extends StatelessWidget {
  const SetupTrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeightCoefficient = MediaQuery.of(context).size.height / 812;

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: 'Setup training',
        appBarAction: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            iconSize: 18,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 31),
              const Text(
                'How to enable Anti-Ads\n in Safari:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 55),
              Container(
                height: 274 * screenHeightCoefficient,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      TrainingStep(
                        text: 'Go to Settings',
                        iconName: 'setup_settings',
                      ),
                      TrainingStep(
                        text: 'Choose Safari > Extensions',
                        iconName: 'safari',
                      ),
                      TrainingStep(
                        text: 'Enable the “ClearAd” extension',
                        iconName: 'setup_switch',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

