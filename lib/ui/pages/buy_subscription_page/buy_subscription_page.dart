import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page_cubit.dart';
import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page_state.dart';
import 'package:ad_blocker/ui/widgets/buy_subscription_page_widgets/best_deal.dart';
import 'package:ad_blocker/ui/widgets/buy_subscription_page_widgets/documents_buttons.dart';
import 'package:ad_blocker/ui/widgets/buy_subscription_page_widgets/guide.dart';
import 'package:ad_blocker/ui/widgets/general_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/buy_subscription_page_widgets/offer_container.dart';
import '../../widgets/general_widgets/custom_app_bar.dart';

class BuySubscriptionPage extends StatelessWidget {
  const BuySubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeightCoefficient = MediaQuery.of(context).size.height / 812;
    final screenWidthCoefficient = MediaQuery.of(context).size.width / 375;

    return BlocBuilder<BuySubscriptionPageCubit, BuySubscriptionPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            appBarText: 'Premium Anti-A',
            appBarAction: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                iconSize: 18,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 10 * screenHeightCoefficient),
              const Guide(),
              SizedBox(height: 64 * screenHeightCoefficient),
              SubscriptionOffers(
                screenHeightCoefficient: screenHeightCoefficient,
                screenWidthCoefficient: screenWidthCoefficient,
                state: state,
              ),
              SizedBox(height: 35 * screenHeightCoefficient),
              CustomButton(text: 'Subscribe now', onTap: () {}),
              SizedBox(height: 22 * screenWidthCoefficient),
              const DocumentsButtons(),
            ],
          ),
        );
      },
    );
  }
}

class SubscriptionOffers extends StatelessWidget {
  final BuySubscriptionPageState state;
  final double screenHeightCoefficient;
  final double screenWidthCoefficient;

  const SubscriptionOffers({
    Key? key,
    required this.state,
    required this.screenHeightCoefficient,
    required this.screenWidthCoefficient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OfferContainer(
            id: 1,
            state: state,
            amountOfTrialDays: 3,
            pricing: r'After $14,99 every week',
          ),
          Column(
            children: [
              Stack(
                alignment: const Alignment(0, -1.13),
                children: [
                  OfferContainer(
                    id: 2,
                    state: state,
                    amountOfTrialDays: 3,
                    pricing: r'After $24,99 for month',
                  ),
                  const BestDeal(),
                ],
              ),
              SizedBox(height: 52 * screenHeightCoefficient),
            ],
          ),
          OfferContainer(
            id: 3,
            state: state,
            amountOfTrialDays: 14,
            pricing: r'After $49,99 every years',
          ),
        ],
      ),
    );
  }
}
