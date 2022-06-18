class BuySubscriptionPageState {
  int selectedOfferId;

  BuySubscriptionPageState({required this.selectedOfferId});

  BuySubscriptionPageState copyWith({
    int? selectedOfferId,
  }) {
    return BuySubscriptionPageState(
      selectedOfferId: selectedOfferId ?? this.selectedOfferId,
    );
  }
}
