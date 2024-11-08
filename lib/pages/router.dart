import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hotel_management/pages/home_page.dart';
import 'package:hotel_management/pages/profile_page.dart';
import 'package:hotel_management/states/app_state.dart';
import 'package:hotel_management/widgets/ui_color.dart';
import 'package:provider/provider.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> with TickerProviderStateMixin {
  late AnimationController _hideBottomBarAnimationController;

  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.person_outline,
  ];

  @override
  void initState() {
    super.initState();

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification && notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  Widget getPage(int index) {
    if (index == 0) {
      return const HomePage();
    } else if (index == 1) {
      return const ProfilePage();
    }
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return Scaffold(
          body: NotificationListener<ScrollNotification>(
            onNotification: onScrollNotification,
            child: Column(
              children: [
                if (!kIsWeb)
                  const SizedBox(
                    height: 36,
                  ),
                SizedBox(
                  height: 54,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: Row(
                      children: [
                        Image.asset('assets/hotel.jpg'),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Hotel Access",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const Expanded(child: SizedBox()),
                        appState.isDarkMode
                            ? IconButton(
                                onPressed: () {
                                  AdaptiveTheme.of(context).setLight();
                                  appState.setDarkMode(false);
                                },
                                icon: const Icon(
                                  Icons.light_mode_outlined,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  AdaptiveTheme.of(context).setDark();
                                  setState(() {
                                    appState.setDarkMode(true);
                                  });
                                },
                                icon: const Icon(
                                  Icons.dark_mode_outlined,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: getPage(appState.bottomNavIndex),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive
                  ? appState.isDarkMode
                      ? Theme.of(context).iconTheme.color
                      : UIColor().secondaryBlue
                  : UIColor().gray;

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                ],
              );
            },
            backgroundColor: UIColor().primaryBlue,
            activeIndex: appState.bottomNavIndex,
            splashColor: appState.isDarkMode ? Theme.of(context).iconTheme.color : UIColor().secondaryBlue,
            gapLocation: GapLocation.none,
            onTap: (index) => appState.setBottomNavIndex(index),
            hideAnimationController: _hideBottomBarAnimationController,
          ),
        );
      },
    );
  }
}
