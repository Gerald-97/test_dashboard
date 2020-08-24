import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_flutter_app/app/app_config.dart';
import 'package:test_flutter_app/extras/colors.dart';
import 'package:test_flutter_app/widgets/dashboard_slider/dashboard_slides.dart';
import 'package:test_flutter_app/widgets/navbar/navbar.dart';
import 'package:test_flutter_app/widgets/reusables.dart';

class InitApp extends StatefulWidget {
  @override
  _InitAppState createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  int _selectedIndex = AppConfig.homePage;
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _pageController = PageController();
  var _page = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          elevation: 0.0,
          backgroundColor: AppColors.defaultBlue,
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 30, right: 30, top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hello, Lois",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "What would you like to do today",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                NotificationBell(
                  showBadge: true,
                  onTap: () {},
                  badgeNumber: "1",
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBarBorder(
        bottomNavBar: BottomNavigationBar(
          elevation: 0.0,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.defaultBlue,
          selectedIconTheme: IconThemeData(size: 26),
          unselectedItemColor: AppColors.dashboardGray,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: NavBar.getNavBarList(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height / 1.9,
              color: AppColors.defaultBlue,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 160,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: DailyLimitBar(
                      title: "Daily limit is ₦50,000",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: size.height / 4.5,
                          child: ListView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            children: WalletSliderPages.walletList.map((item) {
                              return WalletSlides(
                                walletSlide: item,
                                onCreate: () {},
                                onTap: () {
                                  /// add view details key route here
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: SmoothPageIndicator(
                            controller: _pageController, // PageController
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor: Colors.white70,
                              activeDotColor: Colors.white,
                            ), // your preferred effect
                            onDotClicked: (index) {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DashButtons(
                    title: "Send Money",
                    icon: Icons.call_missed_outgoing,
                    onTap: () {},
                  ),
                  DashButtons(
                    title: "Withdraw",
                    icon: Icons.arrow_forward_ios,
                    onTap: () {},
                  ),
                  DashButtons(
                    title: "Bills",
                    icon: Icons.dialpad,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recent Transactions",
                        style: TextStyle(
                          color: AppColors.dashboardGray,
                          fontSize: 14,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Text(
                              "See all",
                              style: TextStyle(
                                color: AppColors.defaultBlue,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: AppColors.defaultBlue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TransactionEntry(
                    debit: true,
                    cashAmount: "3,000.00",
                    customerInfo: "Ruth -  0019200010",
                    transacPurpose: "Airtime Purchase",
                    dateAndTime: "Feb 10th, 12:30pm",
                  ),
                  TransactionEntry(
                    debit: false,
                    cashAmount: "5,000.00",
                    customerInfo: "NGN Wallet funded",
                    transacPurpose: "Wallet funds",
                    dateAndTime: "Feb 10th, 12:30pm",
                  ),
                  TransactionEntry(
                    debit: false,
                    cashAmount: "5,000.00",
                    customerInfo: "NGN Wallet funded",
                    transacPurpose: "Wallet funds",
                    dateAndTime: "Feb 10th, 12:30pm",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
