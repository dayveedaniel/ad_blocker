import 'package:ad_blocker/ui/pages/buy_subscription_page/buy_subscription_page_state.dart';
import 'package:bloc/bloc.dart';

class BuySubscriptionPageCubit extends Cubit<BuySubscriptionPageState> {
  BuySubscriptionPageCubit()
      : super(
          BuySubscriptionPageState(selectedOfferId: 1),
        );

  void onOfferSelected({required int selectedOfferId}) {
    emit(state.copyWith(selectedOfferId: selectedOfferId));
  }
}
