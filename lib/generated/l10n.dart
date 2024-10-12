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

  /// `This is your ePhyLi buddy. They can help you with valuable information about the game, and guide you to complete our challenges. Select your buddy by clicking on the arrows below and then click 'Proceed'.`
  String get buddyIntro {
    return Intl.message(
      'This is your ePhyLi buddy. They can help you with valuable information about the game, and guide you to complete our challenges. Select your buddy by clicking on the arrows below and then click \'Proceed\'.',
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

  /// `This activity is locked. Complete the previous activities to unlock.`
  String get activityLockedMessage {
    return Intl.message(
      'This activity is locked. Complete the previous activities to unlock.',
      name: 'activityLockedMessage',
      desc: '',
      args: [],
    );
  }

  /// `An error has occured.`
  String get error {
    return Intl.message(
      'An error has occured.',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Let's start!`
  String get lets_start {
    return Intl.message(
      'Let\'s start!',
      name: 'lets_start',
      desc: '',
      args: [],
    );
  }

  /// `Reset game`
  String get resetGame {
    return Intl.message(
      'Reset game',
      name: 'resetGame',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `This will reset your current progress.`
  String get resetLoseProgressMessage {
    return Intl.message(
      'This will reset your current progress.',
      name: 'resetLoseProgressMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Game over`
  String get gameOver {
    return Intl.message(
      'Game over',
      name: 'gameOver',
      desc: '',
      args: [],
    );
  }

  /// `You have already participated in this activity. Would you like to replay it?`
  String get alreadyPlayedActivity {
    return Intl.message(
      'You have already participated in this activity. Would you like to replay it?',
      name: 'alreadyPlayedActivity',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Error - This activity cannot be started.`
  String get unableToStartActivity {
    return Intl.message(
      'Error - This activity cannot be started.',
      name: 'unableToStartActivity',
      desc: '',
      args: [],
    );
  }

  /// `Press the image to zoom in for more detail.`
  String get clickOnImageToZoom {
    return Intl.message(
      'Press the image to zoom in for more detail.',
      name: 'clickOnImageToZoom',
      desc: '',
      args: [],
    );
  }

  /// `Click here to read the article`
  String get clickToViewArticle {
    return Intl.message(
      'Click here to read the article',
      name: 'clickToViewArticle',
      desc: '',
      args: [],
    );
  }

  /// `Click OK to continue`
  String get clickOKToContinue {
    return Intl.message(
      'Click OK to continue',
      name: 'clickOKToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 1. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?`
  String get c1a1_welcome {
    return Intl.message(
      'Welcome to challenge 1. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?',
      name: 'c1a1_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Well done! All concepts are correctly matched to the related descriptions.`
  String get c1a1_congrats {
    return Intl.message(
      'Well done! All concepts are correctly matched to the related descriptions.',
      name: 'c1a1_congrats',
      desc: '',
      args: [],
    );
  }

  /// `Read the scientific article extract reported below to start the next step of the challenge.`
  String get c1a1_reading_instruction {
    return Intl.message(
      'Read the scientific article extract reported below to start the next step of the challenge.',
      name: 'c1a1_reading_instruction',
      desc: '',
      args: [],
    );
  }

  /// `You have made 5 mistakes, and the game will restart.`
  String get c1a1_5mistakesReset {
    return Intl.message(
      'You have made 5 mistakes, and the game will restart.',
      name: 'c1a1_5mistakesReset',
      desc: '',
      args: [],
    );
  }

  /// `Advances in technology and lifestyle changes`
  String get c1a2_bubble1 {
    return Intl.message(
      'Advances in technology and lifestyle changes',
      name: 'c1a2_bubble1',
      desc: '',
      args: [],
    );
  }

  /// `minimize the need for physical interaction with the environment.`
  String get c1a2_bubble2 {
    return Intl.message(
      'minimize the need for physical interaction with the environment.',
      name: 'c1a2_bubble2',
      desc: '',
      args: [],
    );
  }

  /// `For example, public or private transport decreases the need for (physical) movement to get around.`
  String get c1a2_bubble3 {
    return Intl.message(
      'For example, public or private transport decreases the need for (physical) movement to get around.',
      name: 'c1a2_bubble3',
      desc: '',
      args: [],
    );
  }

  /// `This leads to an increased risk of developing pathologies.`
  String get c1a2_bubble4 {
    return Intl.message(
      'This leads to an increased risk of developing pathologies.',
      name: 'c1a2_bubble4',
      desc: '',
      args: [],
    );
  }

  /// `Sedentary behaviours affect health, but they also have profound implications for mental and emotional well-being.`
  String get c1a2_bubble5 {
    return Intl.message(
      'Sedentary behaviours affect health, but they also have profound implications for mental and emotional well-being.',
      name: 'c1a2_bubble5',
      desc: '',
      args: [],
    );
  }

  /// `Read and then press each bubble to reveal the next.`
  String get c1a2_bubbles_instructions {
    return Intl.message(
      'Read and then press each bubble to reveal the next.',
      name: 'c1a2_bubbles_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Rekindling our relationship with physical activity and the environment is imperative to leading a healthy and fulfilling life. Read this scientific article to find out more.`
  String get c1a2_finish {
    return Intl.message(
      'Rekindling our relationship with physical activity and the environment is imperative to leading a healthy and fulfilling life. Read this scientific article to find out more.',
      name: 'c1a2_finish',
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
