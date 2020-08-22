class WalletSlideModel {
  final String name, currency, balance, flagImage, backgroundImage;
  final bool last;

  WalletSlideModel({
    this.last,
    this.name,
    this.currency,
    this.balance,
    this.flagImage,
    this.backgroundImage,
  });

  @override
  String toString() {
    return 'WalletSlideModel{name: $name, currency: $currency, balance: $balance, flagImage: $flagImage, backgroundImage: $backgroundImage}';
  }
}
