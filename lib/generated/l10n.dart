// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to ePhyLi!`
  String get tagline {
    return Intl.message(
      'Welcome to ePhyLi!',
      name: 'tagline',
      desc: '',
      args: [],
    );
  }

  /// `Welcome text`
  String get welcomeText {
    return Intl.message(
      'Welcome text',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Greek`
  String get greek {
    return Intl.message(
      'Greek',
      name: 'greek',
      desc: '',
      args: [],
    );
  }

  /// `Italian`
  String get italian {
    return Intl.message(
      'Italian',
      name: 'italian',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get french {
    return Intl.message(
      'French',
      name: 'french',
      desc: '',
      args: [],
    );
  }

  /// `Luxenbourgese`
  String get luxenbourgese {
    return Intl.message(
      'Luxenbourgese',
      name: 'luxenbourgese',
      desc: '',
      args: [],
    );
  }

  /// `Polish`
  String get polish {
    return Intl.message(
      'Polish',
      name: 'polish',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get proceed {
    return Intl.message(
      'Proceed',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `What is your name?`
  String get whatIsYourName {
    return Intl.message(
      'What is your name?',
      name: 'whatIsYourName',
      desc: '',
      args: [],
    );
  }

  /// `Customize your avatar`
  String get customizeAvatar {
    return Intl.message(
      'Customize your avatar',
      name: 'customizeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a value`
  String get pleaseProvideAValue {
    return Intl.message(
      'Please provide a value',
      name: 'pleaseProvideAValue',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name`
  String get invalidPersonName {
    return Intl.message(
      'Invalid name',
      name: 'invalidPersonName',
      desc: '',
      args: [],
    );
  }

  /// `ePhyLi Buddy`
  String get ePhyLiBuddy {
    return Intl.message(
      'ePhyLi Buddy',
      name: 'ePhyLiBuddy',
      desc: '',
      args: [],
    );
  }

  /// `Your ePhyLi buddy`
  String get ePhyLiBuddyIntroHeadline {
    return Intl.message(
      'Your ePhyLi buddy',
      name: 'ePhyLiBuddyIntroHeadline',
      desc: '',
      args: [],
    );
  }

  /// `This is your ePhyLi buddy. He can help you with valuable information about the game, and guide you to complete our challenges. Select your buddy by clicking on the arrows below and then click 'Proceed'.`
  String get buddyIntro {
    return Intl.message(
      'This is your ePhyLi buddy. He can help you with valuable information about the game, and guide you to complete our challenges. Select your buddy by clicking on the arrows below and then click \'Proceed\'.',
      name: 'buddyIntro',
      desc: '',
      args: [],
    );
  }

  /// `You can also call me if you need help with an activity. I can provide extra help or hints.`
  String get buddy_description {
    return Intl.message(
      'You can also call me if you need help with an activity. I can provide extra help or hints.',
      name: 'buddy_description',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Here you can read news articles, posts, and more, related to Physical Literacy.`
  String get news_description {
    return Intl.message(
      'Here you can read news articles, posts, and more, related to Physical Literacy.',
      name: 'news_description',
      desc: '',
      args: [],
    );
  }

  /// `Glossary`
  String get glossary {
    return Intl.message(
      'Glossary',
      name: 'glossary',
      desc: '',
      args: [],
    );
  }

  /// `You can find terminology related to Physical Literacy in the Glossary.`
  String get glossary_description {
    return Intl.message(
      'You can find terminology related to Physical Literacy in the Glossary.',
      name: 'glossary_description',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `You can also manage your profile and preferences here.`
  String get profile_description {
    return Intl.message(
      'You can also manage your profile and preferences here.',
      name: 'profile_description',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to ePhyLi, your journey into Physical Literacy is going to start!\n\nEmbark on a unique mission to transform your life through knowledge, activity, and community. Navigate through challenges, and unlock the secrets of a healthy lifestyle. Your task is not just to play but to evolve, learning about physical health and well-being. Solve tasks and challenges, make impactful choices, and chart your progress in an engaging world where every step counts towards your ultimate goal: mastering Physical Literacy.\n\nReady to begin your adventure?`
  String get tutorial_text {
    return Intl.message(
      'Welcome to ePhyLi, your journey into Physical Literacy is going to start!\n\nEmbark on a unique mission to transform your life through knowledge, activity, and community. Navigate through challenges, and unlock the secrets of a healthy lifestyle. Your task is not just to play but to evolve, learning about physical health and well-being. Solve tasks and challenges, make impactful choices, and chart your progress in an engaging world where every step counts towards your ultimate goal: mastering Physical Literacy.\n\nReady to begin your adventure?',
      name: 'tutorial_text',
      desc: '',
      args: [],
    );
  }

  /// `Yes, let's go!`
  String get ready_letsgo {
    return Intl.message(
      'Yes, let\'s go!',
      name: 'ready_letsgo',
      desc: '',
      args: [],
    );
  }

  /// `Hi, I am your ePhyLi buddy, a virtual companion designed to guide and assist you throughout the game. Let me introduce you to the game with a brief tutorial.`
  String get tutorial_text_buddy {
    return Intl.message(
      'Hi, I am your ePhyLi buddy, a virtual companion designed to guide and assist you throughout the game. Let me introduce you to the game with a brief tutorial.',
      name: 'tutorial_text_buddy',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Well done! Now I am going to explain how you can start playing. The game consists of several challenges that you must complete in order.\n\nI have already unlocked the first challenge for you. Once you complete a challenge, the next will be unlocked. Each challenge will reward you with points, which can help you level up your avatar. You can also gather badges through the challenges, or various other activities, by interacting with the various features of the app.`
  String get tutorialTextChallenges {
    return Intl.message(
      'Well done! Now I am going to explain how you can start playing. The game consists of several challenges that you must complete in order.\n\nI have already unlocked the first challenge for you. Once you complete a challenge, the next will be unlocked. Each challenge will reward you with points, which can help you level up your avatar. You can also gather badges through the challenges, or various other activities, by interacting with the various features of the app.',
      name: 'tutorialTextChallenges',
      desc: '',
      args: [],
    );
  }

  /// `Ok, let's explore the challenges!`
  String get exploreChallenges {
    return Intl.message(
      'Ok, let\'s explore the challenges!',
      name: 'exploreChallenges',
      desc: '',
      args: [],
    );
  }

  /// `These are the challenges you must complete. Each of these challenges may consist of multiple activities, and once you complete all activities in a challenge, I will unlock the next challenge for you. Always remember to use my help if you get stuck in an activity, and remember to use the resources in the news and glossary sections.\n\nOur tutorial is finished. I think you are ready to get started!`
  String get challengesTextTutorial {
    return Intl.message(
      'These are the challenges you must complete. Each of these challenges may consist of multiple activities, and once you complete all activities in a challenge, I will unlock the next challenge for you. Always remember to use my help if you get stuck in an activity, and remember to use the resources in the news and glossary sections.\n\nOur tutorial is finished. I think you are ready to get started!',
      name: 'challengesTextTutorial',
      desc: '',
      args: [],
    );
  }

  /// `You have completed %1 out of %2 challenges so far. Would you like to try the next challenge?`
  String get challengesTextNormal {
    return Intl.message(
      'You have completed %1 out of %2 challenges so far. Would you like to try the next challenge?',
      name: 'challengesTextNormal',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Badge collected`
  String get newBadgeTitle {
    return Intl.message(
      'Badge collected',
      name: 'newBadgeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have received a new badge. Well done!`
  String get newBadgeText {
    return Intl.message(
      'Congratulations! You have received a new badge. Well done!',
      name: 'newBadgeText',
      desc: '',
      args: [],
    );
  }

  /// `View badges`
  String get viewBadges {
    return Intl.message(
      'View badges',
      name: 'viewBadges',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `activities`
  String get activities {
    return Intl.message(
      'activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `Hey %1! It's time to get started! Would you like to try the next challenge?`
  String get challengesTextNormalInitial {
    return Intl.message(
      'Hey %1! It\'s time to get started! Would you like to try the next challenge?',
      name: 'challengesTextNormalInitial',
      desc: '',
      args: [],
    );
  }

  /// `The next challenge has been unlocked.`
  String get nextChallengeUnlocked {
    return Intl.message(
      'The next challenge has been unlocked.',
      name: 'nextChallengeUnlocked',
      desc: '',
      args: [],
    );
  }

  /// `This challenge is locked`
  String get challengeLocked {
    return Intl.message(
      'This challenge is locked',
      name: 'challengeLocked',
      desc: '',
      args: [],
    );
  }

  /// `This challenge is locked. Complete the previous challenges to unlock.`
  String get challengeLockedMessage {
    return Intl.message(
      'This challenge is locked. Complete the previous challenges to unlock.',
      name: 'challengeLockedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Tutorial Badge`
  String get tutorialBadgeTitle {
    return Intl.message(
      'Tutorial Badge',
      name: 'tutorialBadgeTitle',
      desc: '',
      args: [],
    );
  }

  /// `This badge is awarded to players who have completed the tutorial.`
  String get tutorialBadgeDescription {
    return Intl.message(
      'This badge is awarded to players who have completed the tutorial.',
      name: 'tutorialBadgeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Buddy Badge`
  String get useBuddyBadgeTitle {
    return Intl.message(
      'Buddy Badge',
      name: 'useBuddyBadgeTitle',
      desc: '',
      args: [],
    );
  }

  /// `This badge is awarded to players who have the ePhyLi buddy at least once to help them with the activities.`
  String get useBuddyBadgeDescription {
    return Intl.message(
      'This badge is awarded to players who have the ePhyLi buddy at least once to help them with the activities.',
      name: 'useBuddyBadgeDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'lb'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
