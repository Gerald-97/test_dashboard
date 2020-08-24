import 'package:flutter/material.dart';
import 'package:test_flutter_app/extras/colors.dart';
import 'package:test_flutter_app/models/wallet_slide_model.dart';

class DailyLimitBar extends StatelessWidget {
  final String title;
  final Function onTap;

  DailyLimitBar({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue[400],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.report_problem, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 130,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.dashboardClickRed,
              ),
              child: Center(
                child: Text(
                  "Upgrade limit",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationBell extends StatelessWidget {
  final Function onTap;
  final String badgeNumber;
  final bool showBadge;

  NotificationBell({this.onTap, this.badgeNumber, @required this.showBadge});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 35,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 38,
            ),
          ),
          showBadge
              ? Positioned(
                  top: 2,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    maxRadius: 7,
                    child: Text(
                      badgeNumber,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class DashButtons extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  DashButtons({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300],
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: AppColors.defaultBlue,
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionEntry extends StatelessWidget {
  final String customerInfo;
  final String transacPurpose;
  final String dateAndTime;
  final String cashAmount;
  final bool debit;

  TransactionEntry({
    this.customerInfo,
    this.transacPurpose,
    this.dateAndTime,
    this.cashAmount,
    @required this.debit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: debit
                        ? AppColors.dashboardClickRed.withOpacity(0.1)
                        : AppColors.dashboardClickGreen.withOpacity(0.1),
                  ),
                  child: Icon(
                    debit ? Icons.arrow_back : Icons.arrow_forward,
                    color: debit
                        ? AppColors.dashboardClickRed
                        : AppColors.dashboardClickGreen,
                    size: 15,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    debit ? "- ₦ $cashAmount" : " ₦ $cashAmount",
                    style: TextStyle(
                      fontSize: 16,
                      color: debit
                          ? AppColors.dashboardClickRed
                          : AppColors.dashboardClickGreen,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "$customerInfo  |  $transacPurpose",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.dashboardGray,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 150,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: AppColors.dashboardGray,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          dateAndTime,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.dashboardGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalletSlides extends StatelessWidget {
  final WalletSlideModel walletSlide;
  final Function onTap, onCreate;

  WalletSlides({
    @required this.walletSlide,
    this.onCreate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool _last = walletSlide.last ?? false;

    var size = MediaQuery.of(context).size;
    return _last
        ? Container(
            width: size.width / 1.2,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: AppColors.defaultBlue,
                  size: 35,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create New Currency Wallet",
                  style: TextStyle(
                    color: AppColors.defaultBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: size.width / 1.2,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(walletSlide.backgroundImage),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        walletSlide.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.4,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(walletSlide.flagImage),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            walletSlide.currency,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        walletSlide.balance,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Text(
                          "View Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
