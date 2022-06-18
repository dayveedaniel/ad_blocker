import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/buy_subscription_page/buy_subscription_page_cubit.dart';
import '../../pages/buy_subscription_page/buy_subscription_page_state.dart';

class OfferContainer extends StatelessWidget {
  final int id;
  final BuySubscriptionPageState state;
  final int amountOfTrialDays;
  final String pricing;

  const OfferContainer({
    Key? key,
    required this.id,
    required this.state,
    required this.amountOfTrialDays,
    required this.pricing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeightCoefficient = MediaQuery.of(context).size.height / 812;
    final screenWidthCoefficient = MediaQuery.of(context).size.width / 375;
    bool isSelected = state.selectedOfferId == id ? true : false;

    return GestureDetector(
      onTap: () => BlocProvider.of<BuySubscriptionPageCubit>(context)
          .onOfferSelected(selectedOfferId: id),
      child: Container(
        height: 155 * screenHeightCoefficient,
        width: 106 * screenWidthCoefficient,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF5D6CF0).withOpacity(0.1)
              : const Color(0xFFF5F5F5),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected
                ? const Color(0xFF5D6CF0)
                : const Color(0xFF373737).withOpacity(0.1),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$amountOfTrialDays DAY\n TRIAL',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3D3D3D),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  pricing,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF3D3D3D).withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
