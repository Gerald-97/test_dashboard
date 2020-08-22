import 'package:test_flutter_app/models/wallet_slide_model.dart';

class WalletSliderPages {
  static List<WalletSlideModel> walletList = [
    WalletSlideModel(
      flagImage: "assets/images/flag_ngn.png",
      backgroundImage: "assets/backgrounds/naira_background.png",
      name: "Naira Wallet",
      balance: "₦3,469.52",
      currency: "NGN",
      last: false,
    ),
    WalletSlideModel(
      flagImage: "assets/images/flag_usd.png",
      backgroundImage: "assets/backgrounds/dollar_background.png",
      name: "Dollar Wallet",
      balance: "\$526.52",
      currency: "USD",
      last: false,
    ),
    WalletSlideModel(
      last: true,
    ),
  ];
}
