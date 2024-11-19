import 'package:ephyli/screen/game_screen.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/widgets/buddy_avatar_widget.dart';
import 'package:ephyli/widgets/ephyli_gradient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:fluttermoji/fluttermojiFunctions.dart';
import 'package:fluttermoji/fluttermojiThemeData.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/pref_utils.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/ui_utils.dart';
import '../widgets/page_indicator.dart';

class BuddyScreen extends StatefulWidget {
  const BuddyScreen({super.key});

  @override
  State<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends State<BuddyScreen> with TickerProviderStateMixin {

  String avatarData = defaultAvatarData;
  final PageController _pageController = PageController(keepPage: true);
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: buddyAvatars.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    UIUtils.disableFullscreen();
    _pageController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UIUtils.enableFullScreen();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15,
              right: 15
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              ),

              const Gap(10),

              Text(
                AppLocalizations.of(context)!.ePhyLiBuddyIntroHeadline,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const Gap(20),

              Text(
                AppLocalizations.of(context)!.buddyIntro,
              ),

              const Gap(20),

              Stack(
                alignment: Alignment.bottomCenter,
                children: [


                  SizedBox(
                    height: MediaQuery.of(context).size.height < 1000 ? 200 : 300,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: _handlePageViewChanged,
                      children: [
                        PersonalizedAvatar(buddyAvatars[0], avatarSize: 150),
                        PersonalizedAvatar(buddyAvatars[1], avatarSize: 150),
                        PersonalizedAvatar(buddyAvatars[2], avatarSize: 150),
                        PersonalizedAvatar(buddyAvatars[3], avatarSize: 150),
                        PersonalizedAvatar(buddyAvatars[4], avatarSize: 150),
                      ],
                    ),
                  ),

                  PageIndicator(
                    tabController: _tabController,
                    currentPageIndex: _currentPageIndex,
                    numOfPages: buddyAvatars.length,
                    onNextPage: _nextPage,
                    onPreviousPage: _previousPage,
                    isOnDesktopAndWeb: _isOnDesktopAndWeb,
                  ),

                ],
              ),

              const Gap(20),

              //Proceed button:
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 2/3,
                child: ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.proceed.toUpperCase()),
                  onPressed: () async {

                    //Save to prefs and move on:
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setInt(PrefUtils.buddy_selection, _currentPageIndex).then((value) {

                      debugPrint("Saved buddy in prefs: $_currentPageIndex");

                      prefs.setBool(PrefUtils.onboarding_completed, true);

                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const GameScreen(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                        ),
                      );
                    },);

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage() {
    if (_currentPageIndex < buddyAvatars.length - 1) {
      _currentPageIndex++;
      _updateCurrentPageIndex(_currentPageIndex);
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      _updateCurrentPageIndex(_currentPageIndex);
    }
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }

}
