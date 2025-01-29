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

  /// `Congratulations! You have completed all the challenges. Would you like to replay any of them?`
  String get challengesTextFinishedAll {
    return Intl.message(
      'Congratulations! You have completed all the challenges. Would you like to replay any of them?',
      name: 'challengesTextFinishedAll',
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

  /// `An error has occurred.`
  String get error {
    return Intl.message(
      'An error has occurred.',
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

  /// `%1 challenge(s) were unlocked!`
  String get challenges_unlocked {
    return Intl.message(
      '%1 challenge(s) were unlocked!',
      name: 'challenges_unlocked',
      desc: '',
      args: [],
    );
  }

  /// `Your screen will change to landscape mode for this activity.`
  String get screen_flip_notice {
    return Intl.message(
      'Your screen will change to landscape mode for this activity.',
      name: 'screen_flip_notice',
      desc: '',
      args: [],
    );
  }

  /// `Drop here`
  String get drop_here {
    return Intl.message(
      'Drop here',
      name: 'drop_here',
      desc: '',
      args: [],
    );
  }

  /// `Available cards`
  String get available_cards {
    return Intl.message(
      'Available cards',
      name: 'available_cards',
      desc: '',
      args: [],
    );
  }

  /// `Dragging...`
  String get dragging {
    return Intl.message(
      'Dragging...',
      name: 'dragging',
      desc: '',
      args: [],
    );
  }

  /// `Well done!`
  String get well_done {
    return Intl.message(
      'Well done!',
      name: 'well_done',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Check solution`
  String get check_solution {
    return Intl.message(
      'Check solution',
      name: 'check_solution',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Please rotate your device.`
  String get pleaseTurnDevice {
    return Intl.message(
      'Please rotate your device.',
      name: 'pleaseTurnDevice',
      desc: '',
      args: [],
    );
  }

  /// `Your badges`
  String get badges_view_title {
    return Intl.message(
      'Your badges',
      name: 'badges_view_title',
      desc: '',
      args: [],
    );
  }

  /// `You have earned this badge. Well done!`
  String get you_have_earned_badge {
    return Intl.message(
      'You have earned this badge. Well done!',
      name: 'you_have_earned_badge',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `This is a glossary - a list of terms related to physical literacy and their descriptions. Scroll through the list below to find the term you need and click it to view its description.`
  String get glossary_instructions {
    return Intl.message(
      'This is a glossary - a list of terms related to physical literacy and their descriptions. Scroll through the list below to find the term you need and click it to view its description.',
      name: 'glossary_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Under construction`
  String get under_construction {
    return Intl.message(
      'Under construction',
      name: 'under_construction',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Customize your avatar`
  String get pick_avatar {
    return Intl.message(
      'Customize your avatar',
      name: 'pick_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Select your ePhyLi buddy`
  String get pick_buddy {
    return Intl.message(
      'Select your ePhyLi buddy',
      name: 'pick_buddy',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `You have not earned any badges yet. Complete some challenges to earn badges.`
  String get no_badges_yet {
    return Intl.message(
      'You have not earned any badges yet. Complete some challenges to earn badges.',
      name: 'no_badges_yet',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `ePhyLi is an Erasmus+ Sport funded project that aims to promote physical literacy and healthy lifestyles through digital materials for university students.`
  String get project_description {
    return Intl.message(
      'ePhyLi is an Erasmus+ Sport funded project that aims to promote physical literacy and healthy lifestyles through digital materials for university students.',
      name: 'project_description',
      desc: '',
      args: [],
    );
  }

  /// `Visit the project's website`
  String get visit_website {
    return Intl.message(
      'Visit the project\'s website',
      name: 'visit_website',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get about_the_app {
    return Intl.message(
      'About the app',
      name: 'about_the_app',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
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

  /// `Welcome to the end of the XIX century. Arrange the cards on the golden timeline matching the concept of Physical Literacy with the historical data. Ready? Let's start!`
  String get c2a1_intro_message {
    return Intl.message(
      'Welcome to the end of the XIX century. Arrange the cards on the golden timeline matching the concept of Physical Literacy with the historical data. Ready? Let\'s start!',
      name: 'c2a1_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `American Army Captain used the word “Physical Literacy” to describe the physicality or movement quality of an indigenous culture.`
  String get c2a1_term1 {
    return Intl.message(
      'American Army Captain used the word “Physical Literacy” to describe the physicality or movement quality of an indigenous culture.',
      name: 'c2a1_term1',
      desc: '',
      args: [],
    );
  }

  /// `American educators stated: “We must prepare for physical literacy as well as for mental literacy”, responding to an upcoming era of modernization and army recruitment.`
  String get c2a1_term2 {
    return Intl.message(
      'American educators stated: “We must prepare for physical literacy as well as for mental literacy”, responding to an upcoming era of modernization and army recruitment.',
      name: 'c2a1_term2',
      desc: '',
      args: [],
    );
  }

  /// `Margaret Whitehead promotes discussion on the Physical Literacy concept.`
  String get c2a1_term3 {
    return Intl.message(
      'Margaret Whitehead promotes discussion on the Physical Literacy concept.',
      name: 'c2a1_term3',
      desc: '',
      args: [],
    );
  }

  /// `The word 'Physical Literacy' was used to describe 'A disciplined command over the body'.`
  String get c2a1_term4 {
    return Intl.message(
      'The word \'Physical Literacy\' was used to describe \'A disciplined command over the body\'.',
      name: 'c2a1_term4',
      desc: '',
      args: [],
    );
  }

  /// `Margaret Whitehead published a scientific article in the European Journal of Physical Education to promote an open debate on the Physical Literacy concept.`
  String get c2a1_term5 {
    return Intl.message(
      'Margaret Whitehead published a scientific article in the European Journal of Physical Education to promote an open debate on the Physical Literacy concept.',
      name: 'c2a1_term5',
      desc: '',
      args: [],
    );
  }

  /// `Holistic approach to the concept of Physical Literacy, identifying four dimensions: physical, emotional, social and cognitive dimensions.`
  String get c2a1_term6 {
    return Intl.message(
      'Holistic approach to the concept of Physical Literacy, identifying four dimensions: physical, emotional, social and cognitive dimensions.',
      name: 'c2a1_term6',
      desc: '',
      args: [],
    );
  }

  /// `Well done! All the cards are correctly arranged! Let's move on to the next activity.`
  String get c2a1_finish_message {
    return Intl.message(
      'Well done! All the cards are correctly arranged! Let\'s move on to the next activity.',
      name: 'c2a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `In recent years, different countries have adopted different definitions of physical literacy. In the following activity you must link the definition of physical literacy to the country in which it is adopted.`
  String get c2a2_intro_message {
    return Intl.message(
      'In recent years, different countries have adopted different definitions of physical literacy. In the following activity you must link the definition of physical literacy to the country in which it is adopted.',
      name: 'c2a2_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You have finished this challenge!`
  String get c2a2_finish_message {
    return Intl.message(
      'Congratulations! You have finished this challenge!',
      name: 'c2a2_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Who adopted the above definition? Click on the selection you think is correct.`
  String get c2a2_instruction {
    return Intl.message(
      'Who adopted the above definition? Click on the selection you think is correct.',
      name: 'c2a2_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.`
  String get c2a2_term1 {
    return Intl.message(
      'Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.',
      name: 'c2a2_term1',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy is about building the skills, knowledge, and behaviors that give us the confidence and motivation to lead active lives.`
  String get c2a2_term2 {
    return Intl.message(
      'Physical literacy is about building the skills, knowledge, and behaviors that give us the confidence and motivation to lead active lives.',
      name: 'c2a2_term2',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy is the ability, confidence, and desire to be physically active for life.`
  String get c2a2_term3 {
    return Intl.message(
      'Physical literacy is the ability, confidence, and desire to be physically active for life.',
      name: 'c2a2_term3',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy is our relationship with movement and physical activity throughout life.`
  String get c2a2_term4 {
    return Intl.message(
      'Physical literacy is our relationship with movement and physical activity throughout life.',
      name: 'c2a2_term4',
      desc: '',
      args: [],
    );
  }

  /// `IPLA, Ireland, Northern Ireland, Canada`
  String get c2a2_option1 {
    return Intl.message(
      'IPLA, Ireland, Northern Ireland, Canada',
      name: 'c2a2_option1',
      desc: '',
      args: [],
    );
  }

  /// `Australia`
  String get c2a2_option2 {
    return Intl.message(
      'Australia',
      name: 'c2a2_option2',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get c2a2_option3 {
    return Intl.message(
      'USA',
      name: 'c2a2_option3',
      desc: '',
      args: [],
    );
  }

  /// `England`
  String get c2a2_option4 {
    return Intl.message(
      'England',
      name: 'c2a2_option4',
      desc: '',
      args: [],
    );
  }

  /// `Arrange the cards in chronological order (top to bottom), matching the Jurbala’s spiral of physical literacy development. Ready?`
  String get c3a1_intro_message {
    return Intl.message(
      'Arrange the cards in chronological order (top to bottom), matching the Jurbala’s spiral of physical literacy development. Ready?',
      name: 'c3a1_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `Drag the cards to sort them in the correct order based on Jurbala’s spiral of physical literacy. You can scroll through the slots on the top or the cards at the bottom to see all options.`
  String get c3a1_activity_message {
    return Intl.message(
      'Drag the cards to sort them in the correct order based on Jurbala’s spiral of physical literacy. You can scroll through the slots on the top or the cards at the bottom to see all options.',
      name: 'c3a1_activity_message',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You sorted the cards correctly!`
  String get c3a1_success {
    return Intl.message(
      'Well done! You sorted the cards correctly!',
      name: 'c3a1_success',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{There are no mistakes.} =1{There is 1 mistake in the card order.} other{There are {count} mistakes in the card order.}}`
  String c3a1_fail(num count) {
    return Intl.plural(
      count,
      zero: 'There are no mistakes.',
      one: 'There is 1 mistake in the card order.',
      other: 'There are $count mistakes in the card order.',
      name: 'c3a1_fail',
      desc: '',
      args: [count],
    );
  }

  /// `Congratulations, you have finished the challenge. Click 'Finish' to earn a badge!`
  String get c3a1_finish_message {
    return Intl.message(
      'Congratulations, you have finished the challenge. Click \'Finish\' to earn a badge!',
      name: 'c3a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Enriched movement environment`
  String get c3a1_term1 {
    return Intl.message(
      'Enriched movement environment',
      name: 'c3a1_term1',
      desc: '',
      args: [],
    );
  }

  /// `Extensive developmental participation`
  String get c3a1_term2 {
    return Intl.message(
      'Extensive developmental participation',
      name: 'c3a1_term2',
      desc: '',
      args: [],
    );
  }

  /// `Increased movement repertoire`
  String get c3a1_term3 {
    return Intl.message(
      'Increased movement repertoire',
      name: 'c3a1_term3',
      desc: '',
      args: [],
    );
  }

  /// `Improved proficiency across repertoire`
  String get c3a1_term4 {
    return Intl.message(
      'Improved proficiency across repertoire',
      name: 'c3a1_term4',
      desc: '',
      args: [],
    );
  }

  /// `Improved adaptability to new movements`
  String get c3a1_term5 {
    return Intl.message(
      'Improved adaptability to new movements',
      name: 'c3a1_term5',
      desc: '',
      args: [],
    );
  }

  /// `Increased self-efficacy`
  String get c3a1_term6 {
    return Intl.message(
      'Increased self-efficacy',
      name: 'c3a1_term6',
      desc: '',
      args: [],
    );
  }

  /// `Increased disposition to try new activities`
  String get c3a1_term7 {
    return Intl.message(
      'Increased disposition to try new activities',
      name: 'c3a1_term7',
      desc: '',
      args: [],
    );
  }

  /// `Increased success in new activities`
  String get c3a1_term8 {
    return Intl.message(
      'Increased success in new activities',
      name: 'c3a1_term8',
      desc: '',
      args: [],
    );
  }

  /// `Retention in new activities`
  String get c3a1_term9 {
    return Intl.message(
      'Retention in new activities',
      name: 'c3a1_term9',
      desc: '',
      args: [],
    );
  }

  /// `Increased participation`
  String get c3a1_term10 {
    return Intl.message(
      'Increased participation',
      name: 'c3a1_term10',
      desc: '',
      args: [],
    );
  }

  /// `Improved health`
  String get c3a1_term11 {
    return Intl.message(
      'Improved health',
      name: 'c3a1_term11',
      desc: '',
      args: [],
    );
  }

  /// `Improved quality of life`
  String get c3a1_term12 {
    return Intl.message(
      'Improved quality of life',
      name: 'c3a1_term12',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Challenge 4. You will be immersed in different real-life scenarios. Think about the factors or strategies that influence the motivation to engage in physical activity/movement. Ready?`
  String get c4a1_intro_message {
    return Intl.message(
      'Welcome to Challenge 4. You will be immersed in different real-life scenarios. Think about the factors or strategies that influence the motivation to engage in physical activity/movement. Ready?',
      name: 'c4a1_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `It's a sunny Sunday. Decide which leisure activity would be best for a child. Click on the qualities shown on the screen for each activity, trying to identify which ones could be proposed to increase the child's Physical Literacy. Be careful! If you click on the wrong activity your selection will be reset. When you are finished, click 'Check solution' to check your solution.`
  String get c4a1_instruction_message {
    return Intl.message(
      'It\'s a sunny Sunday. Decide which leisure activity would be best for a child. Click on the qualities shown on the screen for each activity, trying to identify which ones could be proposed to increase the child\'s Physical Literacy. Be careful! If you click on the wrong activity your selection will be reset. When you are finished, click \'Check solution\' to check your solution.',
      name: 'c4a1_instruction_message',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the activity. Let's move on!`
  String get c4a1_finish_message {
    return Intl.message(
      'Well done! You have completed the activity. Let\'s move on!',
      name: 'c4a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Funny`
  String get c4a1_category_funny {
    return Intl.message(
      'Funny',
      name: 'c4a1_category_funny',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get c4a1_category_social {
    return Intl.message(
      'Social',
      name: 'c4a1_category_social',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get c4a1_category_active {
    return Intl.message(
      'Active',
      name: 'c4a1_category_active',
      desc: '',
      args: [],
    );
  }

  /// `Includes different movements`
  String get c4a1_category_movements {
    return Intl.message(
      'Includes different movements',
      name: 'c4a1_category_movements',
      desc: '',
      args: [],
    );
  }

  /// `Playing video games using tablet, smartphone or PC, or watching TV alone.`
  String get c4a1_term1 {
    return Intl.message(
      'Playing video games using tablet, smartphone or PC, or watching TV alone.',
      name: 'c4a1_term1',
      desc: '',
      args: [],
    );
  }

  /// `Playing cards with friends at home`
  String get c4a1_term2 {
    return Intl.message(
      'Playing cards with friends at home',
      name: 'c4a1_term2',
      desc: '',
      args: [],
    );
  }

  /// `Gardening with family members`
  String get c4a1_term3 {
    return Intl.message(
      'Gardening with family members',
      name: 'c4a1_term3',
      desc: '',
      args: [],
    );
  }

  /// `Playing with dog`
  String get c4a1_term4 {
    return Intl.message(
      'Playing with dog',
      name: 'c4a1_term4',
      desc: '',
      args: [],
    );
  }

  /// `Telling stories sitting on the sofa`
  String get c4a1_term5 {
    return Intl.message(
      'Telling stories sitting on the sofa',
      name: 'c4a1_term5',
      desc: '',
      args: [],
    );
  }

  /// `Walking in the neighbourhood with family members`
  String get c4a1_term6 {
    return Intl.message(
      'Walking in the neighbourhood with family members',
      name: 'c4a1_term6',
      desc: '',
      args: [],
    );
  }

  /// `It's a sunny elementary school day. Assume the role of a PE teacher and assign qualities to each activity to identify which ones could be proposed to your students to improve their Physical Literacy during the breaks.`
  String get c4a2_instruction_message {
    return Intl.message(
      'It\'s a sunny elementary school day. Assume the role of a PE teacher and assign qualities to each activity to identify which ones could be proposed to your students to improve their Physical Literacy during the breaks.',
      name: 'c4a2_instruction_message',
      desc: '',
      args: [],
    );
  }

  /// `Playing with tablet and smartphone.`
  String get c4a2_term1 {
    return Intl.message(
      'Playing with tablet and smartphone.',
      name: 'c4a2_term1',
      desc: '',
      args: [],
    );
  }

  /// `Drawing and painting`
  String get c4a2_term2 {
    return Intl.message(
      'Drawing and painting',
      name: 'c4a2_term2',
      desc: '',
      args: [],
    );
  }

  /// `Telling stories while sitting on the schoolyard`
  String get c4a2_term3 {
    return Intl.message(
      'Telling stories while sitting on the schoolyard',
      name: 'c4a2_term3',
      desc: '',
      args: [],
    );
  }

  /// `Telling a story that requires children to imitate movements of animals`
  String get c4a2_term4 {
    return Intl.message(
      'Telling a story that requires children to imitate movements of animals',
      name: 'c4a2_term4',
      desc: '',
      args: [],
    );
  }

  /// `Playing with a ball`
  String get c4a2_term5 {
    return Intl.message(
      'Playing with a ball',
      name: 'c4a2_term5',
      desc: '',
      args: [],
    );
  }

  /// `Playing seek and hide`
  String get c4a2_term6 {
    return Intl.message(
      'Playing seek and hide',
      name: 'c4a2_term6',
      desc: '',
      args: [],
    );
  }

  /// `Our third scenario is based on the ecological model of the determinants of physical activity proposed by Bauman et al. (2012). In the next activity, you need to match each factor with its correct category.`
  String get c4a3_intro_message {
    return Intl.message(
      'Our third scenario is based on the ecological model of the determinants of physical activity proposed by Bauman et al. (2012). In the next activity, you need to match each factor with its correct category.',
      name: 'c4a3_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `Move the factors in the middle (red circle) influencing engagement in physical activity to the right variables (blue circles).`
  String get c4a3_instruction_message {
    return Intl.message(
      'Move the factors in the middle (red circle) influencing engagement in physical activity to the right variables (blue circles).',
      name: 'c4a3_instruction_message',
      desc: '',
      args: [],
    );
  }

  /// `Here is a quick reminder of how the model looks. You can click on the image to zoom in.`
  String get c4a3_info_message {
    return Intl.message(
      'Here is a quick reminder of how the model looks. You can click on the image to zoom in.',
      name: 'c4a3_info_message',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the fourth challenge. For more information read the scientific article in the news section. Press 'Finish' to get your badge!`
  String get c4a3_finish_message {
    return Intl.message(
      'Well done! You have completed the fourth challenge. For more information read the scientific article in the news section. Press \'Finish\' to get your badge!',
      name: 'c4a3_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get individual {
    return Intl.message(
      'Individual',
      name: 'individual',
      desc: '',
      args: [],
    );
  }

  /// `Social environment`
  String get social_environment {
    return Intl.message(
      'Social environment',
      name: 'social_environment',
      desc: '',
      args: [],
    );
  }

  /// `Organizations and institutions`
  String get organizations_and_institutions {
    return Intl.message(
      'Organizations and institutions',
      name: 'organizations_and_institutions',
      desc: '',
      args: [],
    );
  }

  /// `Physical environment`
  String get physical_environment {
    return Intl.message(
      'Physical environment',
      name: 'physical_environment',
      desc: '',
      args: [],
    );
  }

  /// `Regional or national policy`
  String get regional_or_national_policy {
    return Intl.message(
      'Regional or national policy',
      name: 'regional_or_national_policy',
      desc: '',
      args: [],
    );
  }

  /// `Culture`
  String get culture {
    return Intl.message(
      'Culture',
      name: 'culture',
      desc: '',
      args: [],
    );
  }

  /// `Motivation`
  String get motivation {
    return Intl.message(
      'Motivation',
      name: 'motivation',
      desc: '',
      args: [],
    );
  }

  /// `Beliefs`
  String get beliefs {
    return Intl.message(
      'Beliefs',
      name: 'beliefs',
      desc: '',
      args: [],
    );
  }

  /// `Sex`
  String get sex {
    return Intl.message(
      'Sex',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `Self-efficacy`
  String get self_efficacy {
    return Intl.message(
      'Self-efficacy',
      name: 'self_efficacy',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get family {
    return Intl.message(
      'Family',
      name: 'family',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: '',
      args: [],
    );
  }

  /// `Cultural norms`
  String get cultural_norms {
    return Intl.message(
      'Cultural norms',
      name: 'cultural_norms',
      desc: '',
      args: [],
    );
  }

  /// `Colleagues`
  String get colleagues {
    return Intl.message(
      'Colleagues',
      name: 'colleagues',
      desc: '',
      args: [],
    );
  }

  /// `Schools`
  String get schools {
    return Intl.message(
      'Schools',
      name: 'schools',
      desc: '',
      args: [],
    );
  }

  /// `Community Clubs`
  String get community_clubs {
    return Intl.message(
      'Community Clubs',
      name: 'community_clubs',
      desc: '',
      args: [],
    );
  }

  /// `Organisations`
  String get organizations {
    return Intl.message(
      'Organisations',
      name: 'organizations',
      desc: '',
      args: [],
    );
  }

  /// `Workplace`
  String get workplace {
    return Intl.message(
      'Workplace',
      name: 'workplace',
      desc: '',
      args: [],
    );
  }

  /// `Built environment`
  String get built_environment {
    return Intl.message(
      'Built environment',
      name: 'built_environment',
      desc: '',
      args: [],
    );
  }

  /// `Active travel opportunities `
  String get active_opportunities {
    return Intl.message(
      'Active travel opportunities ',
      name: 'active_opportunities',
      desc: '',
      args: [],
    );
  }

  /// `Parks and recreation facilities`
  String get parks_recreation {
    return Intl.message(
      'Parks and recreation facilities',
      name: 'parks_recreation',
      desc: '',
      args: [],
    );
  }

  /// `Natural spaces `
  String get natural_spaces {
    return Intl.message(
      'Natural spaces ',
      name: 'natural_spaces',
      desc: '',
      args: [],
    );
  }

  /// `Transport systems`
  String get transport_systems {
    return Intl.message(
      'Transport systems',
      name: 'transport_systems',
      desc: '',
      args: [],
    );
  }

  /// `Health sector`
  String get health_sector {
    return Intl.message(
      'Health sector',
      name: 'health_sector',
      desc: '',
      args: [],
    );
  }

  /// `Education and school sector`
  String get education_school {
    return Intl.message(
      'Education and school sector',
      name: 'education_school',
      desc: '',
      args: [],
    );
  }

  /// `Organised sport sector`
  String get organized_sport {
    return Intl.message(
      'Organised sport sector',
      name: 'organized_sport',
      desc: '',
      args: [],
    );
  }

  /// `National`
  String get national {
    return Intl.message(
      'National',
      name: 'national',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get local {
    return Intl.message(
      'Local',
      name: 'local',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Challenge 5. You are challenged to complete the diagram which follows by filling in the missing elements. Ready?`
  String get c5a1_intro_message {
    return Intl.message(
      'Welcome to Challenge 5. You are challenged to complete the diagram which follows by filling in the missing elements. Ready?',
      name: 'c5a1_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the fifth challenge. Press 'Finish' to get your badge!`
  String get c5a1_finish_message {
    return Intl.message(
      'Well done! You have completed the fifth challenge. Press \'Finish\' to get your badge!',
      name: 'c5a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Choose element`
  String get c5a1_instruction_title {
    return Intl.message(
      'Choose element',
      name: 'c5a1_instruction_title',
      desc: '',
      args: [],
    );
  }

  /// `Click the element you would like to place in this area:`
  String get c5a1_instruction_place {
    return Intl.message(
      'Click the element you would like to place in this area:',
      name: 'c5a1_instruction_place',
      desc: '',
      args: [],
    );
  }

  /// `Click on the yellow boxes to fill in the empty parts of the diagram.`
  String get c5a1_help {
    return Intl.message(
      'Click on the yellow boxes to fill in the empty parts of the diagram.',
      name: 'c5a1_help',
      desc: '',
      args: [],
    );
  }

  /// `Selected element:`
  String get currentElement {
    return Intl.message(
      'Selected element:',
      name: 'currentElement',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 6. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?`
  String get c6a1_welcome {
    return Intl.message(
      'Welcome to challenge 6. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?',
      name: 'c6a1_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Well done! All concepts are correctly matched to the related descriptions. Click 'Finish' to earn a badge.`
  String get c6a1_congrats {
    return Intl.message(
      'Well done! All concepts are correctly matched to the related descriptions. Click \'Finish\' to earn a badge.',
      name: 'c6a1_congrats',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 7. You will be shown scenarios representing the progression levels of a student's sports practice in relation to the four physical literacy dimensions (physical, affective, social, and cognitive). For each scenario, you need to identify the correct progression level by dragging the scenario to the correct level. Ready?`
  String get c7a1_welcome {
    return Intl.message(
      'Welcome to challenge 7. You will be shown scenarios representing the progression levels of a student\'s sports practice in relation to the four physical literacy dimensions (physical, affective, social, and cognitive). For each scenario, you need to identify the correct progression level by dragging the scenario to the correct level. Ready?',
      name: 'c7a1_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Identify the correct level for this scenario:`
  String get c7a1_instruction {
    return Intl.message(
      'Identify the correct level for this scenario:',
      name: 'c7a1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the seventh challenge. Press 'Finish' to get your badge!`
  String get c7a1_finish_message {
    return Intl.message(
      'Well done! You have completed the seventh challenge. Press \'Finish\' to get your badge!',
      name: 'c7a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `The student has very limited motor skills and has difficulty approaching the basic movements of volleyball (physical dimension).`
  String get limited_motor_skills {
    return Intl.message(
      'The student has very limited motor skills and has difficulty approaching the basic movements of volleyball (physical dimension).',
      name: 'limited_motor_skills',
      desc: '',
      args: [],
    );
  }

  /// `The student does not know the rules of the basketball game and does not know the health benefits related to sports practice (cognitive dimension).`
  String get lack_of_rules_knowledge {
    return Intl.message(
      'The student does not know the rules of the basketball game and does not know the health benefits related to sports practice (cognitive dimension).',
      name: 'lack_of_rules_knowledge',
      desc: '',
      args: [],
    );
  }

  /// `The student does not want to participate in PE lessons at school because he/she is not confident or motivated enough (affective dimension).`
  String get lack_of_motivation {
    return Intl.message(
      'The student does not want to participate in PE lessons at school because he/she is not confident or motivated enough (affective dimension).',
      name: 'lack_of_motivation',
      desc: '',
      args: [],
    );
  }

  /// `The student does not have relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).`
  String get lack_of_social_support {
    return Intl.message(
      'The student does not have relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).',
      name: 'lack_of_social_support',
      desc: '',
      args: [],
    );
  }

  /// `The student is developing basic motor skills in volleyball and has a greater awareness of his/her own physical abilities (physical dimension).`
  String get developing_motor_skills {
    return Intl.message(
      'The student is developing basic motor skills in volleyball and has a greater awareness of his/her own physical abilities (physical dimension).',
      name: 'developing_motor_skills',
      desc: '',
      args: [],
    );
  }

  /// `The student can describe the rules of the basketball game and understand the health benefits related to sports practice (cognitive dimension).`
  String get basic_rules_knowledge {
    return Intl.message(
      'The student can describe the rules of the basketball game and understand the health benefits related to sports practice (cognitive dimension).',
      name: 'basic_rules_knowledge',
      desc: '',
      args: [],
    );
  }

  /// `The student wants to participate in physical education classes at school and is aware of the possibility of improvement (affective dimension).`
  String get wants_to_participate {
    return Intl.message(
      'The student wants to participate in physical education classes at school and is aware of the possibility of improvement (affective dimension).',
      name: 'wants_to_participate',
      desc: '',
      args: [],
    );
  }

  /// `The student is building positive relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).`
  String get positive_social_support {
    return Intl.message(
      'The student is building positive relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).',
      name: 'positive_social_support',
      desc: '',
      args: [],
    );
  }

  /// `The student knows how to adapt to the game situations of volleyball and is physically capable of dealing with them (physical dimension).`
  String get adapts_to_game {
    return Intl.message(
      'The student knows how to adapt to the game situations of volleyball and is physically capable of dealing with them (physical dimension).',
      name: 'adapts_to_game',
      desc: '',
      args: [],
    );
  }

  /// `The student can analyse and adapt strategies to the game situation of basketball and understand the health benefits related to sports practice (cognitive dimension).`
  String get strategic_analysis {
    return Intl.message(
      'The student can analyse and adapt strategies to the game situation of basketball and understand the health benefits related to sports practice (cognitive dimension).',
      name: 'strategic_analysis',
      desc: '',
      args: [],
    );
  }

  /// `The student is enthusiastic about participating in physical education classes at school and is aware of his/her level of involvement (affective dimension).`
  String get enthusiastic_participation {
    return Intl.message(
      'The student is enthusiastic about participating in physical education classes at school and is aware of his/her level of involvement (affective dimension).',
      name: 'enthusiastic_participation',
      desc: '',
      args: [],
    );
  }

  /// `The student demonstrates independence and positive interpersonal skills that contribute to increased participation in extracurricular sporting activities (social dimension).`
  String get independent_and_socially_skilled {
    return Intl.message(
      'The student demonstrates independence and positive interpersonal skills that contribute to increased participation in extracurricular sporting activities (social dimension).',
      name: 'independent_and_socially_skilled',
      desc: '',
      args: [],
    );
  }

  /// `Preliminary level`
  String get preliminary_level {
    return Intl.message(
      'Preliminary level',
      name: 'preliminary_level',
      desc: '',
      args: [],
    );
  }

  /// `Developer level`
  String get developer_level {
    return Intl.message(
      'Developer level',
      name: 'developer_level',
      desc: '',
      args: [],
    );
  }

  /// `Advanced level`
  String get advanced_level {
    return Intl.message(
      'Advanced level',
      name: 'advanced_level',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Challenge 8! Assume the role of a physical education teacher of children 6-year-olds and choose from three different games for each physical activity session to teach a fundamental movement. Each game is classified according to three parameters, represented by three bottles: (I) appropriate motor skills background, (II) inclusion/teamwork, and (III) enjoyment. The score for each parameter ranges from 1 to 3 points and represents the level of water that will be poured into the bottle. To pass the challenge you must fill the three bottles by choosing the most appropriate game. Ready?`
  String get c8a1_instructions {
    return Intl.message(
      'Welcome to Challenge 8! Assume the role of a physical education teacher of children 6-year-olds and choose from three different games for each physical activity session to teach a fundamental movement. Each game is classified according to three parameters, represented by three bottles: (I) appropriate motor skills background, (II) inclusion/teamwork, and (III) enjoyment. The score for each parameter ranges from 1 to 3 points and represents the level of water that will be poured into the bottle. To pass the challenge you must fill the three bottles by choosing the most appropriate game. Ready?',
      name: 'c8a1_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Select the most appropriate option to achieve a balance between the three parameters.`
  String get c8a1_prompt {
    return Intl.message(
      'Select the most appropriate option to achieve a balance between the three parameters.',
      name: 'c8a1_prompt',
      desc: '',
      args: [],
    );
  }

  /// `That is not the right balance. Please try a different option.`
  String get c8a1_wrong {
    return Intl.message(
      'That is not the right balance. Please try a different option.',
      name: 'c8a1_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Please select an option.`
  String get c8a1_please_select_option {
    return Intl.message(
      'Please select an option.',
      name: 'c8a1_please_select_option',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the eighth challenge. Press 'Finish' to get your badge!`
  String get c8a1_finish_message {
    return Intl.message(
      'Well done! You have completed the eighth challenge. Press \'Finish\' to get your badge!',
      name: 'c8a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Appropriate motor skills background`
  String get appropriate_motor_skills_background {
    return Intl.message(
      'Appropriate motor skills background',
      name: 'appropriate_motor_skills_background',
      desc: '',
      args: [],
    );
  }

  /// `Inclusion/Teamwork`
  String get inclusion_teamwork {
    return Intl.message(
      'Inclusion/Teamwork',
      name: 'inclusion_teamwork',
      desc: '',
      args: [],
    );
  }

  /// `Enjoyment`
  String get enjoyment {
    return Intl.message(
      'Enjoyment',
      name: 'enjoyment',
      desc: '',
      args: [],
    );
  }

  /// `Balance activity`
  String get activity_balance {
    return Intl.message(
      'Balance activity',
      name: 'activity_balance',
      desc: '',
      args: [],
    );
  }

  /// `Children form a large circle in the centre of the playing area. Someone assumes an unstable position like a statue. All students in the circle perform the same balance, holding it for 3 seconds. When the time is up, the next child does the same.`
  String get activity_balance_option_1 {
    return Intl.message(
      'Children form a large circle in the centre of the playing area. Someone assumes an unstable position like a statue. All students in the circle perform the same balance, holding it for 3 seconds. When the time is up, the next child does the same.',
      name: 'activity_balance_option_1',
      desc: '',
      args: [],
    );
  }

  /// `Wheelbarrow race. Students in pairs. One teammate plays the role of the driver, and the other plays the role of the wheelbarrow. The driver holds on to the other player's ankles, while the latter walks with his hands.`
  String get activity_balance_option_2 {
    return Intl.message(
      'Wheelbarrow race. Students in pairs. One teammate plays the role of the driver, and the other plays the role of the wheelbarrow. The driver holds on to the other player\'s ankles, while the latter walks with his hands.',
      name: 'activity_balance_option_2',
      desc: '',
      args: [],
    );
  }

  /// `Children walk around a large area. They can change direction and speed but must avoid contact with others. When the teacher calls a number, children form groups only according to that number, making a circle. They must jump five times on one foot. Child/children without a group perform a static balance.`
  String get activity_balance_option_3 {
    return Intl.message(
      'Children walk around a large area. They can change direction and speed but must avoid contact with others. When the teacher calls a number, children form groups only according to that number, making a circle. They must jump five times on one foot. Child/children without a group perform a static balance.',
      name: 'activity_balance_option_3',
      desc: '',
      args: [],
    );
  }

  /// `Throwing activity`
  String get activity_throwing {
    return Intl.message(
      'Throwing activity',
      name: 'activity_throwing',
      desc: '',
      args: [],
    );
  }

  /// `Children form a large circle in the centre of the playing area. One of them has a sound ball. All children must close their eyes, except for the child with the ball who must roll it to another one, using both hands. When all have rolled the ball, they must use another part of the body, such as the hip, knee, and elbow.`
  String get activity_throwing_option_1 {
    return Intl.message(
      'Children form a large circle in the centre of the playing area. One of them has a sound ball. All children must close their eyes, except for the child with the ball who must roll it to another one, using both hands. When all have rolled the ball, they must use another part of the body, such as the hip, knee, and elbow.',
      name: 'activity_throwing_option_1',
      desc: '',
      args: [],
    );
  }

  /// `Children in groups of two/three, according to the number of students in the classroom, in front of a wall. One child must throw the ball against the wall and catch it again as many times as possible in twenty seconds. Other teammates count the seconds and the correct executions of the task.`
  String get activity_throwing_option_2 {
    return Intl.message(
      'Children in groups of two/three, according to the number of students in the classroom, in front of a wall. One child must throw the ball against the wall and catch it again as many times as possible in twenty seconds. Other teammates count the seconds and the correct executions of the task.',
      name: 'activity_throwing_option_2',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into two teams. The playing area is divided into two areas. Each team built three castles with cones and placed them at the end of the playing fields. Each team has five soft balls. The children must throw the balls trying to bring down the castles of the other team.`
  String get activity_throwing_option_3 {
    return Intl.message(
      'Children are divided into two teams. The playing area is divided into two areas. Each team built three castles with cones and placed them at the end of the playing fields. Each team has five soft balls. The children must throw the balls trying to bring down the castles of the other team.',
      name: 'activity_throwing_option_3',
      desc: '',
      args: [],
    );
  }

  /// `Striking with the hand`
  String get activity_striking {
    return Intl.message(
      'Striking with the hand',
      name: 'activity_striking',
      desc: '',
      args: [],
    );
  }

  /// `Children in groups of three/four, according to the number of students in the classroom. One balloon per group. Each group must move the balloon to the end of the playing area without holding onto it or letting it touch the ground. Each child must pass the balloon to a teammate before touching it again.`
  String get activity_striking_option_1 {
    return Intl.message(
      'Children in groups of three/four, according to the number of students in the classroom. One balloon per group. Each group must move the balloon to the end of the playing area without holding onto it or letting it touch the ground. Each child must pass the balloon to a teammate before touching it again.',
      name: 'activity_striking_option_1',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into pairs. Each group has a sponge ball and a towel. The pair hold the towel between them. The children must coordinate their movement to lift the towel, throw the ball into the air and catch it again on its return.`
  String get activity_striking_option_2 {
    return Intl.message(
      'Children are divided into pairs. Each group has a sponge ball and a towel. The pair hold the towel between them. The children must coordinate their movement to lift the towel, throw the ball into the air and catch it again on its return.',
      name: 'activity_striking_option_2',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into groups of four. Each group forms a circle and puts one hoop in the centre. Each child must pass a bouncy ball to the teammate by first bouncing it in the circle.`
  String get activity_striking_option_3 {
    return Intl.message(
      'Children are divided into groups of four. Each group forms a circle and puts one hoop in the centre. Each child must pass a bouncy ball to the teammate by first bouncing it in the circle.',
      name: 'activity_striking_option_3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Challenge 9! This challenge is based on the enabling environments (Almond and Lambden, 2016). Drag the factors influencing engagement in physical activity (in the center of the screen) to the right variables (blue circles).`
  String get c9a1_instructions {
    return Intl.message(
      'Welcome to Challenge 9! This challenge is based on the enabling environments (Almond and Lambden, 2016). Drag the factors influencing engagement in physical activity (in the center of the screen) to the right variables (blue circles).',
      name: 'c9a1_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Well done! For further information, read the scientific article in the news section.`
  String get c9a1_finish_message {
    return Intl.message(
      'Well done! For further information, read the scientific article in the news section.',
      name: 'c9a1_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Object Play`
  String get c9a1_object_play {
    return Intl.message(
      'Object Play',
      name: 'c9a1_object_play',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Play`
  String get c9a1_exercise_play {
    return Intl.message(
      'Exercise Play',
      name: 'c9a1_exercise_play',
      desc: '',
      args: [],
    );
  }

  /// `Expressive Movement`
  String get c9a1_expressive_movement {
    return Intl.message(
      'Expressive Movement',
      name: 'c9a1_expressive_movement',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor Play`
  String get c9a1_outdoor_play {
    return Intl.message(
      'Outdoor Play',
      name: 'c9a1_outdoor_play',
      desc: '',
      args: [],
    );
  }

  /// `Throwing`
  String get c9a1_throwing {
    return Intl.message(
      'Throwing',
      name: 'c9a1_throwing',
      desc: '',
      args: [],
    );
  }

  /// `Catching`
  String get c9a1_catching {
    return Intl.message(
      'Catching',
      name: 'c9a1_catching',
      desc: '',
      args: [],
    );
  }

  /// `Striking`
  String get c9a1_striking {
    return Intl.message(
      'Striking',
      name: 'c9a1_striking',
      desc: '',
      args: [],
    );
  }

  /// `Rough and Tumble`
  String get c9a1_rough_and_tumble {
    return Intl.message(
      'Rough and Tumble',
      name: 'c9a1_rough_and_tumble',
      desc: '',
      args: [],
    );
  }

  /// `Climbing`
  String get c9a1_climbing {
    return Intl.message(
      'Climbing',
      name: 'c9a1_climbing',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get c9a1_running {
    return Intl.message(
      'Running',
      name: 'c9a1_running',
      desc: '',
      args: [],
    );
  }

  /// `Chasing games`
  String get c9a1_chasing_games {
    return Intl.message(
      'Chasing games',
      name: 'c9a1_chasing_games',
      desc: '',
      args: [],
    );
  }

  /// `Bikes and scooters`
  String get c9a1_bikes_and_scooters {
    return Intl.message(
      'Bikes and scooters',
      name: 'c9a1_bikes_and_scooters',
      desc: '',
      args: [],
    );
  }

  /// `Pushing and pulling`
  String get c9a1_pushing_and_pulling {
    return Intl.message(
      'Pushing and pulling',
      name: 'c9a1_pushing_and_pulling',
      desc: '',
      args: [],
    );
  }

  /// `Dance`
  String get c9a1_dance {
    return Intl.message(
      'Dance',
      name: 'c9a1_dance',
      desc: '',
      args: [],
    );
  }

  /// `Gymnastics`
  String get c9a1_gymnastics {
    return Intl.message(
      'Gymnastics',
      name: 'c9a1_gymnastics',
      desc: '',
      args: [],
    );
  }

  /// `Action rhymes`
  String get c9a1_action_rhymes {
    return Intl.message(
      'Action rhymes',
      name: 'c9a1_action_rhymes',
      desc: '',
      args: [],
    );
  }

  /// `Songs and stories`
  String get c9a1_songs_and_stories {
    return Intl.message(
      'Songs and stories',
      name: 'c9a1_songs_and_stories',
      desc: '',
      args: [],
    );
  }

  /// `Natural surroundings`
  String get c9a1_natural_surroundings {
    return Intl.message(
      'Natural surroundings',
      name: 'c9a1_natural_surroundings',
      desc: '',
      args: [],
    );
  }

  /// `Rocks and Trees`
  String get c9a1_rocks_and_tress {
    return Intl.message(
      'Rocks and Trees',
      name: 'c9a1_rocks_and_tress',
      desc: '',
      args: [],
    );
  }

  /// `Challenges`
  String get c9a1_challenges {
    return Intl.message(
      'Challenges',
      name: 'c9a1_challenges',
      desc: '',
      args: [],
    );
  }

  /// `You are challenged to design a comprehensive physical education curriculum for a virtual school, incorporating both curricular and extra-curricular activities that promote physical literacy. The challenge is to balance various elements such as inclusivity, engagement, and educational outcomes. Μove each curriculum feature (shown at the bottom) to the correct or wrong box. Correct features must be moved to the 'Correct' box, and wrong features must be moved to the 'Wrong' box. Ready?`
  String get c9a2_intro_message {
    return Intl.message(
      'You are challenged to design a comprehensive physical education curriculum for a virtual school, incorporating both curricular and extra-curricular activities that promote physical literacy. The challenge is to balance various elements such as inclusivity, engagement, and educational outcomes. Μove each curriculum feature (shown at the bottom) to the correct or wrong box. Correct features must be moved to the \'Correct\' box, and wrong features must be moved to the \'Wrong\' box. Ready?',
      name: 'c9a2_intro_message',
      desc: '',
      args: [],
    );
  }

  /// `Drag each element to the right box.`
  String get c9a2_prompt {
    return Intl.message(
      'Drag each element to the right box.',
      name: 'c9a2_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the ninth challenge. Press 'Finish' to get your badge!`
  String get c9a2_finish_message {
    return Intl.message(
      'Well done! You have completed the ninth challenge. Press \'Finish\' to get your badge!',
      name: 'c9a2_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Correct`
  String get c9a2_correct {
    return Intl.message(
      'Correct',
      name: 'c9a2_correct',
      desc: '',
      args: [],
    );
  }

  /// `Wrong`
  String get c9a2_wrong {
    return Intl.message(
      'Wrong',
      name: 'c9a2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Activities balanced to students’ motor skills.`
  String get c9a2_activities_balanced {
    return Intl.message(
      'Activities balanced to students’ motor skills.',
      name: 'c9a2_activities_balanced',
      desc: '',
      args: [],
    );
  }

  /// `Coherence with country PE curriculum guidelines.`
  String get c9a2_pe_curriculum_guidelines {
    return Intl.message(
      'Coherence with country PE curriculum guidelines.',
      name: 'c9a2_pe_curriculum_guidelines',
      desc: '',
      args: [],
    );
  }

  /// `Games/activities to learn and develop students’ motor skills using music.`
  String get c9a2_music_motor_skills {
    return Intl.message(
      'Games/activities to learn and develop students’ motor skills using music.',
      name: 'c9a2_music_motor_skills',
      desc: '',
      args: [],
    );
  }

  /// `Activities focused on fitness, health, and well-being.`
  String get c9a2_fitness_health_wellbeing {
    return Intl.message(
      'Activities focused on fitness, health, and well-being.',
      name: 'c9a2_fitness_health_wellbeing',
      desc: '',
      args: [],
    );
  }

  /// `Exercises to evaluate students’ motor skills by administering specific tests.`
  String get c9a2_evaluate_motor_skills {
    return Intl.message(
      'Exercises to evaluate students’ motor skills by administering specific tests.',
      name: 'c9a2_evaluate_motor_skills',
      desc: '',
      args: [],
    );
  }

  /// `Outdoor walking with breaks for playing games.`
  String get c9a2_outdoor_play {
    return Intl.message(
      'Outdoor walking with breaks for playing games.',
      name: 'c9a2_outdoor_play',
      desc: '',
      args: [],
    );
  }

  /// `Activities to improve students’ motor skills oriented to sports practice.`
  String get c9a2_sports_oriented_motor_skills {
    return Intl.message(
      'Activities to improve students’ motor skills oriented to sports practice.',
      name: 'c9a2_sports_oriented_motor_skills',
      desc: '',
      args: [],
    );
  }

  /// `Activities to promote self-knowledge.`
  String get c9a2_promote_self_knowledge {
    return Intl.message(
      'Activities to promote self-knowledge.',
      name: 'c9a2_promote_self_knowledge',
      desc: '',
      args: [],
    );
  }

  /// `Group activities to enhance team spirit and socialization.`
  String get c9a2_team_spirit_socialization {
    return Intl.message(
      'Group activities to enhance team spirit and socialization.',
      name: 'c9a2_team_spirit_socialization',
      desc: '',
      args: [],
    );
  }

  /// `Activities to promote respect for the game rules and fair play.`
  String get c9a2_respect_game_rules {
    return Intl.message(
      'Activities to promote respect for the game rules and fair play.',
      name: 'c9a2_respect_game_rules',
      desc: '',
      args: [],
    );
  }

  /// `Games or game rules that require the participation of all students.`
  String get c9a2_inclusive_games {
    return Intl.message(
      'Games or game rules that require the participation of all students.',
      name: 'c9a2_inclusive_games',
      desc: '',
      args: [],
    );
  }

  /// `Enjoyment-oriented activities.`
  String get c9a2_enjoyment_oriented {
    return Intl.message(
      'Enjoyment-oriented activities.',
      name: 'c9a2_enjoyment_oriented',
      desc: '',
      args: [],
    );
  }

  /// `Use a wide range of teaching strategies.`
  String get c9a2_varied_teaching_strategies {
    return Intl.message(
      'Use a wide range of teaching strategies.',
      name: 'c9a2_varied_teaching_strategies',
      desc: '',
      args: [],
    );
  }

  /// `Ego-oriented activities.`
  String get c9a2_ego_oriented {
    return Intl.message(
      'Ego-oriented activities.',
      name: 'c9a2_ego_oriented',
      desc: '',
      args: [],
    );
  }

  /// `One-size-fits-all approach.`
  String get c9a2_one_size_fits_all {
    return Intl.message(
      'One-size-fits-all approach.',
      name: 'c9a2_one_size_fits_all',
      desc: '',
      args: [],
    );
  }

  /// `Summary definition of objectives.`
  String get c9a2_summary_objectives {
    return Intl.message(
      'Summary definition of objectives.',
      name: 'c9a2_summary_objectives',
      desc: '',
      args: [],
    );
  }

  /// `Activities geared towards the 'Win-at-all-costs' mentality.`
  String get c9a2_win_at_all_costs {
    return Intl.message(
      'Activities geared towards the \'Win-at-all-costs\' mentality.',
      name: 'c9a2_win_at_all_costs',
      desc: '',
      args: [],
    );
  }

  /// `Games with long queues of children.`
  String get c9a2_long_queues {
    return Intl.message(
      'Games with long queues of children.',
      name: 'c9a2_long_queues',
      desc: '',
      args: [],
    );
  }

  /// `Separate activities for males and females.`
  String get c9a2_gender_separated_activities {
    return Intl.message(
      'Separate activities for males and females.',
      name: 'c9a2_gender_separated_activities',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 10. Mosston's spectrum of teaching styles is a framework that categorizes teaching styles based on the degree of decision-making authority given to the teacher and the learner. The spectrum consists of 11 teaching styles, ranging from more teacher-centred to more student-centred approaches. Read the clues and identify the related teaching style to solve the puzzle. Ready?`
  String get c10a1_instructions {
    return Intl.message(
      'Welcome to challenge 10. Mosston\'s spectrum of teaching styles is a framework that categorizes teaching styles based on the degree of decision-making authority given to the teacher and the learner. The spectrum consists of 11 teaching styles, ranging from more teacher-centred to more student-centred approaches. Read the clues and identify the related teaching style to solve the puzzle. Ready?',
      name: 'c10a1_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You can now access the next challenge.`
  String get c10a1_finish {
    return Intl.message(
      'Well done! You can now access the next challenge.',
      name: 'c10a1_finish',
      desc: '',
      args: [],
    );
  }

  /// `Enter a letter`
  String get enter_letter {
    return Intl.message(
      'Enter a letter',
      name: 'enter_letter',
      desc: '',
      args: [],
    );
  }

  /// `Hint`
  String get hint {
    return Intl.message(
      'Hint',
      name: 'hint',
      desc: '',
      args: [],
    );
  }

  /// `Click on the letter boxes to fill in the word using the hint provided.`
  String get hint_instruction {
    return Intl.message(
      'Click on the letter boxes to fill in the word using the hint provided.',
      name: 'hint_instruction',
      desc: '',
      args: [],
    );
  }

  /// `COMMAND`
  String get term1 {
    return Intl.message(
      'COMMAND',
      name: 'term1',
      desc: '',
      args: [],
    );
  }

  /// `PRACTICE`
  String get term2 {
    return Intl.message(
      'PRACTICE',
      name: 'term2',
      desc: '',
      args: [],
    );
  }

  /// `RECIPROCAL`
  String get term3 {
    return Intl.message(
      'RECIPROCAL',
      name: 'term3',
      desc: '',
      args: [],
    );
  }

  /// `SELFCHECK`
  String get term4 {
    return Intl.message(
      'SELFCHECK',
      name: 'term4',
      desc: '',
      args: [],
    );
  }

  /// `INCLUSION`
  String get term5 {
    return Intl.message(
      'INCLUSION',
      name: 'term5',
      desc: '',
      args: [],
    );
  }

  /// `GUIDED`
  String get term6 {
    return Intl.message(
      'GUIDED',
      name: 'term6',
      desc: '',
      args: [],
    );
  }

  /// `CONVERGENT`
  String get term7 {
    return Intl.message(
      'CONVERGENT',
      name: 'term7',
      desc: '',
      args: [],
    );
  }

  /// `DIVERGENT`
  String get term8 {
    return Intl.message(
      'DIVERGENT',
      name: 'term8',
      desc: '',
      args: [],
    );
  }

  /// `DESIGNED`
  String get term9 {
    return Intl.message(
      'DESIGNED',
      name: 'term9',
      desc: '',
      args: [],
    );
  }

  /// `INITIATED`
  String get term10 {
    return Intl.message(
      'INITIATED',
      name: 'term10',
      desc: '',
      args: [],
    );
  }

  /// `SELFTEACHING`
  String get term11 {
    return Intl.message(
      'SELFTEACHING',
      name: 'term11',
      desc: '',
      args: [],
    );
  }

  /// `The teacher's directive control of students' learning activities.`
  String get term1_hint {
    return Intl.message(
      'The teacher\'s directive control of students\' learning activities.',
      name: 'term1_hint',
      desc: '',
      args: [],
    );
  }

  /// `Delegation of some decisions from the teacher to the student.`
  String get term2_hint {
    return Intl.message(
      'Delegation of some decisions from the teacher to the student.',
      name: 'term2_hint',
      desc: '',
      args: [],
    );
  }

  /// `Groups with assigned roles: practice, observe, evaluate, correct, and help.`
  String get term3_hint {
    return Intl.message(
      'Groups with assigned roles: practice, observe, evaluate, correct, and help.',
      name: 'term3_hint',
      desc: '',
      args: [],
    );
  }

  /// `Self-assessment of exercise execution and results.`
  String get term4_hint {
    return Intl.message(
      'Self-assessment of exercise execution and results.',
      name: 'term4_hint',
      desc: '',
      args: [],
    );
  }

  /// `Working together in groups to achieve common goals.`
  String get term5_hint {
    return Intl.message(
      'Working together in groups to achieve common goals.',
      name: 'term5_hint',
      desc: '',
      args: [],
    );
  }

  /// `The teacher leads students to independently discover solutions through questions.`
  String get term6_hint {
    return Intl.message(
      'The teacher leads students to independently discover solutions through questions.',
      name: 'term6_hint',
      desc: '',
      args: [],
    );
  }

  /// `Students analyze and develop strategies to solve teacher-presented problems.`
  String get term7_hint {
    return Intl.message(
      'Students analyze and develop strategies to solve teacher-presented problems.',
      name: 'term7_hint',
      desc: '',
      args: [],
    );
  }

  /// `Encourages creativity with self-created exercises.`
  String get term8_hint {
    return Intl.message(
      'Encourages creativity with self-created exercises.',
      name: 'term8_hint',
      desc: '',
      args: [],
    );
  }

  /// `A personalized program based on individual abilities, with teacher as consultant.`
  String get term9_hint {
    return Intl.message(
      'A personalized program based on individual abilities, with teacher as consultant.',
      name: 'term9_hint',
      desc: '',
      args: [],
    );
  }

  /// `Student-led, from design to execution, with teacher as consultant.`
  String get term10_hint {
    return Intl.message(
      'Student-led, from design to execution, with teacher as consultant.',
      name: 'term10_hint',
      desc: '',
      args: [],
    );
  }

  /// `Students plan, execute, and evaluate their learning.`
  String get term11_hint {
    return Intl.message(
      'Students plan, execute, and evaluate their learning.',
      name: 'term11_hint',
      desc: '',
      args: [],
    );
  }

  /// `You will assume the role of a PE teacher and have to match the lesson provided with the correct teaching style used to develop it. Ready?`
  String get c10a2_instructions {
    return Intl.message(
      'You will assume the role of a PE teacher and have to match the lesson provided with the correct teaching style used to develop it. Ready?',
      name: 'c10a2_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed the tenth challenge. Press 'Finish' to get your badge!`
  String get c10a2_finish_message {
    return Intl.message(
      'Well done! You have completed the tenth challenge. Press \'Finish\' to get your badge!',
      name: 'c10a2_finish_message',
      desc: '',
      args: [],
    );
  }

  /// `Command`
  String get command {
    return Intl.message(
      'Command',
      name: 'command',
      desc: '',
      args: [],
    );
  }

  /// `Guided Discovery`
  String get guided_discovery {
    return Intl.message(
      'Guided Discovery',
      name: 'guided_discovery',
      desc: '',
      args: [],
    );
  }

  /// `Self-Teaching`
  String get self_teaching {
    return Intl.message(
      'Self-Teaching',
      name: 'self_teaching',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve basic motor skills. Students must overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher demonstrates how to overcome each obstacle. The students start the course at the teacher's command, imitating the teacher's movement.`
  String get command_lesson_1 {
    return Intl.message(
      'The lesson aims to improve basic motor skills. Students must overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher demonstrates how to overcome each obstacle. The students start the course at the teacher\'s command, imitating the teacher\'s movement.',
      name: 'command_lesson_1',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve balance skills. The teacher demonstrates three yoga poses at a time (Balancing Table, Dancer, and Half Moon). Students must maintain a position for 15 seconds. The students change position at the teacher's command.`
  String get command_lesson_2 {
    return Intl.message(
      'The lesson aims to improve balance skills. The teacher demonstrates three yoga poses at a time (Balancing Table, Dancer, and Half Moon). Students must maintain a position for 15 seconds. The students change position at the teacher\'s command.',
      name: 'command_lesson_2',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve knowledge of one's own body. The teacher tells a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. Often the bears get itchy and have to scratch themselves. The teacher chooses when the bears are itchy and where they have to scratch.`
  String get command_lesson_3 {
    return Intl.message(
      'The lesson aims to improve knowledge of one\'s own body. The teacher tells a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. Often the bears get itchy and have to scratch themselves. The teacher chooses when the bears are itchy and where they have to scratch.',
      name: 'command_lesson_3',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve volleyball serving. The teacher demonstrates the volleyball services (basic underhand service, basic overhand serve, and jump serve). The teacher plans two exercises for each service (individual and in-pair exercises), explaining that students have to start with the basic underhand service, then the basic overhand serve, and at the end jump serve.`
  String get command_lesson_4 {
    return Intl.message(
      'The lesson aims to improve volleyball serving. The teacher demonstrates the volleyball services (basic underhand service, basic overhand serve, and jump serve). The teacher plans two exercises for each service (individual and in-pair exercises), explaining that students have to start with the basic underhand service, then the basic overhand serve, and at the end jump serve.',
      name: 'command_lesson_4',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve basic motor skills. Students have to overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher engages students in talk to help them reflect on which basic motor skills they can use to overcome the obstacles. The teacher also supports students' performance by asking questions to stimulate them to think about different strategies they can use to overcome the same obstacle.`
  String get discovery_lesson_1 {
    return Intl.message(
      'The lesson aims to improve basic motor skills. Students have to overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher engages students in talk to help them reflect on which basic motor skills they can use to overcome the obstacles. The teacher also supports students\' performance by asking questions to stimulate them to think about different strategies they can use to overcome the same obstacle.',
      name: 'discovery_lesson_1',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve balance skills. The teacher engages students in talk to help them reflect on the effects of yoga practice on balance. The teacher also supports students' pose development by asking questions to stimulate them to think about the level of difficulty needed to maintain a pose. Correct thinking and strategies are rewarded and reinforced.`
  String get discovery_lesson_2 {
    return Intl.message(
      'The lesson aims to improve balance skills. The teacher engages students in talk to help them reflect on the effects of yoga practice on balance. The teacher also supports students\' pose development by asking questions to stimulate them to think about the level of difficulty needed to maintain a pose. Correct thinking and strategies are rewarded and reinforced.',
      name: 'discovery_lesson_2',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve knowledge of one's own body. Students develop a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. The teacher asks several questions to invite students to develop their personalised bears day (from waking up to going to bed). The teacher also encourages students to think about which activities could be introduced in the story to improve knowledge of one's own body. Correct thinking and strategies are rewarded and reinforced.`
  String get discovery_lesson_3 {
    return Intl.message(
      'The lesson aims to improve knowledge of one\'s own body. Students develop a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. The teacher asks several questions to invite students to develop their personalised bears day (from waking up to going to bed). The teacher also encourages students to think about which activities could be introduced in the story to improve knowledge of one\'s own body. Correct thinking and strategies are rewarded and reinforced.',
      name: 'discovery_lesson_3',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve volleyball serving. The teacher engages students in talk to help them focus on how to use the sensations related to the service execution to perform better. The teacher also encourages the students to perceive which service is most comfortable for them, and the sensations felt performing it. Based on this, they have to adapt the other services to make them more comfortable. Correct thinking and strategies are rewarded and reinforced.`
  String get discovery_lesson_4 {
    return Intl.message(
      'The lesson aims to improve volleyball serving. The teacher engages students in talk to help them focus on how to use the sensations related to the service execution to perform better. The teacher also encourages the students to perceive which service is most comfortable for them, and the sensations felt performing it. Based on this, they have to adapt the other services to make them more comfortable. Correct thinking and strategies are rewarded and reinforced.',
      name: 'discovery_lesson_4',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve basic motor skills. The teacher provides information on basic motor skills (rolling, jumping, running, crawling). Students have to develop games to improve their basic motor skills.`
  String get self_teaching_lesson_1 {
    return Intl.message(
      'The lesson aims to improve basic motor skills. The teacher provides information on basic motor skills (rolling, jumping, running, crawling). Students have to develop games to improve their basic motor skills.',
      name: 'self_teaching_lesson_1',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve balance skills. The teacher provides information on the effects of yoga practice on balance. Students should look for some yoga exercises to do in class with everyone.`
  String get self_teaching_lesson_2 {
    return Intl.message(
      'The lesson aims to improve balance skills. The teacher provides information on the effects of yoga practice on balance. Students should look for some yoga exercises to do in class with everyone.',
      name: 'self_teaching_lesson_2',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve knowledge of one's own body. Students have to develop a story about bears who live in the forest and perform daily actions (eating, washing, rolling around). Students must impersonate the bears. Students have to find funny strategies to get them to perform movements that focus on the use of a specific body part. The teacher provides guidance when needed.`
  String get self_teaching_lesson_3 {
    return Intl.message(
      'The lesson aims to improve knowledge of one\'s own body. Students have to develop a story about bears who live in the forest and perform daily actions (eating, washing, rolling around). Students must impersonate the bears. Students have to find funny strategies to get them to perform movements that focus on the use of a specific body part. The teacher provides guidance when needed.',
      name: 'self_teaching_lesson_3',
      desc: '',
      args: [],
    );
  }

  /// `The lesson aims to improve volleyball serving. The teacher provides information on the volleyball services (basic underhand service, basic overhand serve, and jump serve). Students are free to work individually or in groups. They have to develop some exercises to train the volleyball services.`
  String get self_teaching_lesson_4 {
    return Intl.message(
      'The lesson aims to improve volleyball serving. The teacher provides information on the volleyball services (basic underhand service, basic overhand serve, and jump serve). Students are free to work individually or in groups. They have to develop some exercises to train the volleyball services.',
      name: 'self_teaching_lesson_4',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 11. You will assume the role of a PE teacher to develop a lesson based on a teaching pedagogical model provided. Choose the correct strategy to adopt the model and build the Physical Education Tower. Each model represents a tower floor. Be careful! If you make two mistakes, the tower floor will break, and you will have to start over. Ready?`
  String get c11a1_instructions {
    return Intl.message(
      'Welcome to challenge 11. You will assume the role of a PE teacher to develop a lesson based on a teaching pedagogical model provided. Choose the correct strategy to adopt the model and build the Physical Education Tower. Each model represents a tower floor. Be careful! If you make two mistakes, the tower floor will break, and you will have to start over. Ready?',
      name: 'c11a1_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Select the correct answer`
  String get c11_instruction {
    return Intl.message(
      'Select the correct answer',
      name: 'c11_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Teaching Games for Understanding model`
  String get c11_floor0_model {
    return Intl.message(
      'Teaching Games for Understanding model',
      name: 'c11_floor0_model',
      desc: '',
      args: [],
    );
  }

  /// `School gymnasium`
  String get c11_floor0_environment {
    return Intl.message(
      'School gymnasium',
      name: 'c11_floor0_environment',
      desc: '',
      args: [],
    );
  }

  /// `The model emphasizes the importance of gameplay and understanding. It promotes a student-centred environment, encouraging learners to explore and understand the game rules, tactics, and strategies, which, in turn, leads to a deeper appreciation and enjoyment of the game.`
  String get c11_floor0_statement {
    return Intl.message(
      'The model emphasizes the importance of gameplay and understanding. It promotes a student-centred environment, encouraging learners to explore and understand the game rules, tactics, and strategies, which, in turn, leads to a deeper appreciation and enjoyment of the game.',
      name: 'c11_floor0_statement',
      desc: '',
      args: [],
    );
  }

  /// `Children are scattered around the gym. A hula hoop is placed next to each child with a cone in the centre. The players must knock over the cone of other players with a ball or defend when it is attacked. Once everyone has attacked or defended, the second step begins.`
  String get c11_floor0_step1_instruction {
    return Intl.message(
      'Children are scattered around the gym. A hula hoop is placed next to each child with a cone in the centre. The players must knock over the cone of other players with a ball or defend when it is attacked. Once everyone has attacked or defended, the second step begins.',
      name: 'c11_floor0_step1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get c11_floor0_step1_correct {
    return Intl.message(
      'Proceed',
      name: 'c11_floor0_step1_correct',
      desc: '',
      args: [],
    );
  }

  /// `Once a cone is knocked over, the child moves it and the hula hoop to another part of the gym and continues to play. Step 2 lasts 10 minutes.`
  String get c11_floor0_step2_correct {
    return Intl.message(
      'Once a cone is knocked over, the child moves it and the hula hoop to another part of the gym and continues to play. Step 2 lasts 10 minutes.',
      name: 'c11_floor0_step2_correct',
      desc: '',
      args: [],
    );
  }

  /// `The child that knocks over the cone of an opponent gets 1 point. The first to get 5 points wins the game.`
  String get c11_floor0_step2_wrong {
    return Intl.message(
      'The child that knocks over the cone of an opponent gets 1 point. The first to get 5 points wins the game.',
      name: 'c11_floor0_step2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The player that knocks over the cone of another child, forms a team with them.`
  String get c11_floor0_step3_correct {
    return Intl.message(
      'The player that knocks over the cone of another child, forms a team with them.',
      name: 'c11_floor0_step3_correct',
      desc: '',
      args: [],
    );
  }

  /// `When a child’s cone is knocked over, the child is eliminated by the game. The last one left on the field wins.`
  String get c11_floor0_step3_wrong {
    return Intl.message(
      'When a child’s cone is knocked over, the child is eliminated by the game. The last one left on the field wins.',
      name: 'c11_floor0_step3_wrong',
      desc: '',
      args: [],
    );
  }

  /// `With the help of questions, comments, and game modifications from the teacher, students begin to work through the principles of play and identify key tactics and strategies that can lead to success in the game.`
  String get c11_floor0_step4_correct {
    return Intl.message(
      'With the help of questions, comments, and game modifications from the teacher, students begin to work through the principles of play and identify key tactics and strategies that can lead to success in the game.',
      name: 'c11_floor0_step4_correct',
      desc: '',
      args: [],
    );
  }

  /// `In order to improve knowledge of the key tactics and strategies to be used in the game, the teacher modifies the match rules by assigning specific tasks and providing strategies that can lead to winning the match.`
  String get c11_floor0_step4_wrong {
    return Intl.message(
      'In order to improve knowledge of the key tactics and strategies to be used in the game, the teacher modifies the match rules by assigning specific tasks and providing strategies that can lead to winning the match.',
      name: 'c11_floor0_step4_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher engages students in tactical talk to help them reflect on their decision made in the game to succeed in it (tactics used) (e.g. How are you succeeding in the game?).`
  String get c11_floor0_step5_correct {
    return Intl.message(
      'The teacher engages students in tactical talk to help them reflect on their decision made in the game to succeed in it (tactics used) (e.g. How are you succeeding in the game?).',
      name: 'c11_floor0_step5_correct',
      desc: '',
      args: [],
    );
  }

  /// `Children divided into two teams play a match trying to understand the principles of play and identify the key tactics and strategies that can lead to winning the match.`
  String get c11_floor0_step5_wrong {
    return Intl.message(
      'Children divided into two teams play a match trying to understand the principles of play and identify the key tactics and strategies that can lead to winning the match.',
      name: 'c11_floor0_step5_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher modifies the game to emphasize the skills that students have identified as essential for success.`
  String get c11_floor0_step6_correct {
    return Intl.message(
      'The teacher modifies the game to emphasize the skills that students have identified as essential for success.',
      name: 'c11_floor0_step6_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher divides the students into several groups based on class size and assigns specific tasks to improve the effectiveness of the technique to be used in the match.`
  String get c11_floor0_step6_wrong {
    return Intl.message(
      'The teacher divides the students into several groups based on class size and assigns specific tasks to improve the effectiveness of the technique to be used in the match.',
      name: 'c11_floor0_step6_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher observes the outcome of the students’ learning through the game by paying attention not only to the efficiency of the technique but also to the appropriateness of the response throughout the gameplay.`
  String get c11_floor0_step7_correct {
    return Intl.message(
      'The teacher observes the outcome of the students’ learning through the game by paying attention not only to the efficiency of the technique but also to the appropriateness of the response throughout the gameplay.',
      name: 'c11_floor0_step7_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher observes the outcome of the students’ learning through the game by paying attention to the efficiency of the technique and the results obtained during the match.`
  String get c11_floor0_step7_wrong {
    return Intl.message(
      'The teacher observes the outcome of the students’ learning through the game by paying attention to the efficiency of the technique and the results obtained during the match.',
      name: 'c11_floor0_step7_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Cooperative Learning model`
  String get c11_floor1_model {
    return Intl.message(
      'Cooperative Learning model',
      name: 'c11_floor1_model',
      desc: '',
      args: [],
    );
  }

  /// `School gymnasium`
  String get c11_floor1_environment {
    return Intl.message(
      'School gymnasium',
      name: 'c11_floor1_environment',
      desc: '',
      args: [],
    );
  }

  /// `The model takes a distinctly social perspective on learning, where students work collaboratively towards common goals. This model emphasises the development of social skills, communication, and teamwork, as well as individual accountability. Activities are designed so that students depend on one another to succeed, promoting an inclusive and supportive learning environment.`
  String get c11_floor1_statement {
    return Intl.message(
      'The model takes a distinctly social perspective on learning, where students work collaboratively towards common goals. This model emphasises the development of social skills, communication, and teamwork, as well as individual accountability. Activities are designed so that students depend on one another to succeed, promoting an inclusive and supportive learning environment.',
      name: 'c11_floor1_statement',
      desc: '',
      args: [],
    );
  }

  /// `In this challenge, you will help children develop motor skills by designing and navigating an obstacle course. Select the correct strategy for each step to proceed to the next one. If you make two mistakes, the challenge will restart. Are you ready?`
  String get c11_floor1_instruction {
    return Intl.message(
      'In this challenge, you will help children develop motor skills by designing and navigating an obstacle course. Select the correct strategy for each step to proceed to the next one. If you make two mistakes, the challenge will restart. Are you ready?',
      name: 'c11_floor1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `The teacher, helped by the children, develops an obstacle course. The children have to overcome an obstacle course using their motor skills (rolling, jumping, catching, throwing, running, crawling).`
  String get c11_floor1_step1_instruction {
    return Intl.message(
      'The teacher, helped by the children, develops an obstacle course. The children have to overcome an obstacle course using their motor skills (rolling, jumping, catching, throwing, running, crawling).',
      name: 'c11_floor1_step1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get c11_floor1_step1_correct {
    return Intl.message(
      'Proceed',
      name: 'c11_floor1_step1_correct',
      desc: '',
      args: [],
    );
  }

  /// `Children in pairs, one has to overcome the obstacles along the course and the other one guides with his voice the teammate.`
  String get c11_floor1_step2_correct {
    return Intl.message(
      'Children in pairs, one has to overcome the obstacles along the course and the other one guides with his voice the teammate.',
      name: 'c11_floor1_step2_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher and students decide together which motor skill to use to overcome each obstacle. One child at a time overcomes obstacles.`
  String get c11_floor1_step2_wrong {
    return Intl.message(
      'The teacher and students decide together which motor skill to use to overcome each obstacle. One child at a time overcomes obstacles.',
      name: 'c11_floor1_step2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles while avoiding using a body part of their choice (hands, legs, eyes, ...).`
  String get c11_floor1_step3_correct {
    return Intl.message(
      'Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles while avoiding using a body part of their choice (hands, legs, eyes, ...).',
      name: 'c11_floor1_step3_correct',
      desc: '',
      args: [],
    );
  }

  /// `Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles while avoiding using the eyes.`
  String get c11_floor1_step3_wrong {
    return Intl.message(
      'Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles while avoiding using the eyes.',
      name: 'c11_floor1_step3_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The children are divided into teams of four players. Before starting the course, the children decide together how to overcome each obstacle.`
  String get c11_floor1_step4_correct {
    return Intl.message(
      'The children are divided into teams of four players. Before starting the course, the children decide together how to overcome each obstacle.',
      name: 'c11_floor1_step4_correct',
      desc: '',
      args: [],
    );
  }

  /// `The children are divided into teams of four players. They must complete a relay. Each child has to overcome two obstacles to pass the baton. The first group to complete the course wins.`
  String get c11_floor1_step4_wrong {
    return Intl.message(
      'The children are divided into teams of four players. They must complete a relay. Each child has to overcome two obstacles to pass the baton. The first group to complete the course wins.',
      name: 'c11_floor1_step4_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into teams of three players. Two children have to hold a frisbee with a tennis ball on it. They must overcome the obstacle course without dropping the ball, while the third child guides them along the course suggesting how they can overcome the obstacles.`
  String get c11_floor1_step5_correct {
    return Intl.message(
      'Children are divided into teams of three players. Two children have to hold a frisbee with a tennis ball on it. They must overcome the obstacle course without dropping the ball, while the third child guides them along the course suggesting how they can overcome the obstacles.',
      name: 'c11_floor1_step5_correct',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into teams of three players. They hold a frisbee with a tennis ball on it and must overcome the obstacle course without dropping the ball. The teacher guides them along the course suggesting how they can overcome the obstacles.`
  String get c11_floor1_step5_wrong {
    return Intl.message(
      'Children are divided into teams of three players. They hold a frisbee with a tennis ball on it and must overcome the obstacle course without dropping the ball. The teacher guides them along the course suggesting how they can overcome the obstacles.',
      name: 'c11_floor1_step5_wrong',
      desc: '',
      args: [],
    );
  }

  /// `During the task execution, the teacher assesses students’ contribution to the group work and/or their performance.`
  String get c11_floor1_step6_correct {
    return Intl.message(
      'During the task execution, the teacher assesses students’ contribution to the group work and/or their performance.',
      name: 'c11_floor1_step6_correct',
      desc: '',
      args: [],
    );
  }

  /// `During the task execution, the teacher records the time taken to complete the task by each group and evaluates the students according to their performance.`
  String get c11_floor1_step6_wrong {
    return Intl.message(
      'During the task execution, the teacher records the time taken to complete the task by each group and evaluates the students according to their performance.',
      name: 'c11_floor1_step6_wrong',
      desc: '',
      args: [],
    );
  }

  /// `When all groups have performed the exercises, the teacher asks students to reflect on what they have learnt and how they can improve their ability to work as a group, sharing their experiences with others.`
  String get c11_floor1_step7_correct {
    return Intl.message(
      'When all groups have performed the exercises, the teacher asks students to reflect on what they have learnt and how they can improve their ability to work as a group, sharing their experiences with others.',
      name: 'c11_floor1_step7_correct',
      desc: '',
      args: [],
    );
  }

  /// `When all groups have performed the exercises, the teacher shares with them the students’ assessment of how they overcame the obstacles and how they can improve their ability to work as a group and their motor skills.`
  String get c11_floor1_step7_wrong {
    return Intl.message(
      'When all groups have performed the exercises, the teacher shares with them the students’ assessment of how they overcame the obstacles and how they can improve their ability to work as a group and their motor skills.',
      name: 'c11_floor1_step7_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Sport Education model`
  String get c11_floor2_model {
    return Intl.message(
      'Sport Education model',
      name: 'c11_floor2_model',
      desc: '',
      args: [],
    );
  }

  /// `School gymnasium`
  String get c11_floor2_environment {
    return Intl.message(
      'School gymnasium',
      name: 'c11_floor2_environment',
      desc: '',
      args: [],
    );
  }

  /// `This model is designed to replicate authentic sporting experiences, where students participate in seasons, take on roles such as players, coaches, and referees, and experience the culture of the sport.`
  String get c11_floor2_statement {
    return Intl.message(
      'This model is designed to replicate authentic sporting experiences, where students participate in seasons, take on roles such as players, coaches, and referees, and experience the culture of the sport.',
      name: 'c11_floor2_statement',
      desc: '',
      args: [],
    );
  }

  /// `In this challenge, you will help students plan and execute activities related to volleyball.`
  String get c11_floor2_instruction {
    return Intl.message(
      'In this challenge, you will help students plan and execute activities related to volleyball.',
      name: 'c11_floor2_instruction',
      desc: '',
      args: [],
    );
  }

  /// `The teacher and students are in a school gymnasium and have to schedule activities related to the learning of volleyball. The teacher explains the sport's features and the main rules.`
  String get c11_floor2_step1_instruction {
    return Intl.message(
      'The teacher and students are in a school gymnasium and have to schedule activities related to the learning of volleyball. The teacher explains the sport\'s features and the main rules.',
      name: 'c11_floor2_step1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get c11_floor2_step1_correct {
    return Intl.message(
      'Proceed',
      name: 'c11_floor2_step1_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher gives some information about the season concepts in sports competitions. The teacher also provides information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.`
  String get c11_floor2_step2_correct {
    return Intl.message(
      'The teacher gives some information about the season concepts in sports competitions. The teacher also provides information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.',
      name: 'c11_floor2_step2_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher gives some information about the season concepts in sports competitions. Then, students are divided into groups and have to look for information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.`
  String get c11_floor2_step2_wrong {
    return Intl.message(
      'The teacher gives some information about the season concepts in sports competitions. Then, students are divided into groups and have to look for information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.',
      name: 'c11_floor2_step2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The students are divided into groups. The teacher provides materials and resources to each group to plan the teamwork. Each group works to develop strategies and exercises to learn the mechanics of the sport and improve volleyball-related motor skills (passing, setting, spiking, blocking, digging, and serving).`
  String get c11_floor2_step3_correct {
    return Intl.message(
      'The students are divided into groups. The teacher provides materials and resources to each group to plan the teamwork. Each group works to develop strategies and exercises to learn the mechanics of the sport and improve volleyball-related motor skills (passing, setting, spiking, blocking, digging, and serving).',
      name: 'c11_floor2_step3_correct',
      desc: '',
      args: [],
    );
  }

  /// `Students are divided into groups. The teacher provides several materials and resources, assigning exercises to each group to learn the mechanics of the sport and improve the basic volleyball-related skills (passing, setting, spiking, blocking, digging, and serving). Every week they change skills to improve them all.`
  String get c11_floor2_step3_wrong {
    return Intl.message(
      'Students are divided into groups. The teacher provides several materials and resources, assigning exercises to each group to learn the mechanics of the sport and improve the basic volleyball-related skills (passing, setting, spiking, blocking, digging, and serving). Every week they change skills to improve them all.',
      name: 'c11_floor2_step3_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Each group is free to plan the teamwork. They can decide who the coach, captain, trainer, referee or players are and plan the activities related to each role.`
  String get c11_floor2_step4_correct {
    return Intl.message(
      'Each group is free to plan the teamwork. They can decide who the coach, captain, trainer, referee or players are and plan the activities related to each role.',
      name: 'c11_floor2_step4_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher supports students in planning the teamwork. The teacher and students plan together the activities and the students’ roles in the team. Therefore, they choose who will be the coach, captain, trainer, referee or players, to avoid disputes.`
  String get c11_floor2_step4_wrong {
    return Intl.message(
      'The teacher supports students in planning the teamwork. The teacher and students plan together the activities and the students’ roles in the team. Therefore, they choose who will be the coach, captain, trainer, referee or players, to avoid disputes.',
      name: 'c11_floor2_step4_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The team portfolio is a crucial component of the learning model. In the portfolio, students can describe the features of each team, such as the team’s name, members, colours, mascot, motto, student roles, and activity schedules. They can also provide information about the strengths and weaknesses of the team.`
  String get c11_floor2_step5_correct {
    return Intl.message(
      'The team portfolio is a crucial component of the learning model. In the portfolio, students can describe the features of each team, such as the team’s name, members, colours, mascot, motto, student roles, and activity schedules. They can also provide information about the strengths and weaknesses of the team.',
      name: 'c11_floor2_step5_correct',
      desc: '',
      args: [],
    );
  }

  /// `The team portfolio is a crucial component of the learning model. In the portfolio, the teacher can report useful information for student assessment (the team members, student roles, and activity schedules).`
  String get c11_floor2_step5_wrong {
    return Intl.message(
      'The team portfolio is a crucial component of the learning model. In the portfolio, the teacher can report useful information for student assessment (the team members, student roles, and activity schedules).',
      name: 'c11_floor2_step5_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The team portfolio can also be used to report information about the learning process, providing test results and reflections on individual and team improvement.`
  String get c11_floor2_step6_correct {
    return Intl.message(
      'The team portfolio can also be used to report information about the learning process, providing test results and reflections on individual and team improvement.',
      name: 'c11_floor2_step6_correct',
      desc: '',
      args: [],
    );
  }

  /// `Based on the portfolio contents of each team the teacher plans tests to evaluate the students’ knowledge and skills related to volleyball.`
  String get c11_floor2_step6_wrong {
    return Intl.message(
      'Based on the portfolio contents of each team the teacher plans tests to evaluate the students’ knowledge and skills related to volleyball.',
      name: 'c11_floor2_step6_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament to promote the values of the sport (fair play, friendship, respect, teamwork, ...).`
  String get c11_floor2_step7_correct {
    return Intl.message(
      'The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament to promote the values of the sport (fair play, friendship, respect, teamwork, ...).',
      name: 'c11_floor2_step7_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament. The class that will win can share the teamwork done with other students.`
  String get c11_floor2_step7_wrong {
    return Intl.message(
      'The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament. The class that will win can share the teamwork done with other students.',
      name: 'c11_floor2_step7_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Teaching Personal and Social Responsibility model`
  String get c11_floor3_model {
    return Intl.message(
      'Teaching Personal and Social Responsibility model',
      name: 'c11_floor3_model',
      desc: '',
      args: [],
    );
  }

  /// `School gymnasium`
  String get c11_floor3_environment {
    return Intl.message(
      'School gymnasium',
      name: 'c11_floor3_environment',
      desc: '',
      args: [],
    );
  }

  /// `It is a values-based approach that uses physical activity to teach life skills and promote personal and social responsibility. This model focuses on self-direction and positive social interaction, emphasizing respect, effort, self-improvement, and helping others.`
  String get c11_floor3_statement {
    return Intl.message(
      'It is a values-based approach that uses physical activity to teach life skills and promote personal and social responsibility. This model focuses on self-direction and positive social interaction, emphasizing respect, effort, self-improvement, and helping others.',
      name: 'c11_floor3_statement',
      desc: '',
      args: [],
    );
  }

  /// `In this challenge, you will help children learn motor skills and social responsibility through an obstacle course and teamwork. Select the correct strategy for each step to proceed.`
  String get c11_floor3_instruction {
    return Intl.message(
      'In this challenge, you will help children learn motor skills and social responsibility through an obstacle course and teamwork. Select the correct strategy for each step to proceed.',
      name: 'c11_floor3_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Children are divided into groups of three. The teacher, helped by the children, develops an obstacle course for each group. They also build at the end of each course a Jenga tower. The children have to overcome the obstacles using their motor skills (rolling, jumping, catching, throwing, running, crawling) and remove a piece from the tower.`
  String get c11_floor3_step1_instruction {
    return Intl.message(
      'Children are divided into groups of three. The teacher, helped by the children, develops an obstacle course for each group. They also build at the end of each course a Jenga tower. The children have to overcome the obstacles using their motor skills (rolling, jumping, catching, throwing, running, crawling) and remove a piece from the tower.',
      name: 'c11_floor3_step1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get c11_floor3_step1_correct {
    return Intl.message(
      'Proceed',
      name: 'c11_floor3_step1_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher explains that students will practice helping others by providing feedback to their teammates, providing specific help, saying something nice, and offering suggestions.`
  String get c11_floor3_step2_correct {
    return Intl.message(
      'The teacher explains that students will practice helping others by providing feedback to their teammates, providing specific help, saying something nice, and offering suggestions.',
      name: 'c11_floor3_step2_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher explains that two students will tell the third child how to overcome obstacles to finish the course as quickly as possible. When the child returns, another will start the course supported by the other two.`
  String get c11_floor3_step2_wrong {
    return Intl.message(
      'The teacher explains that two students will tell the third child how to overcome obstacles to finish the course as quickly as possible. When the child returns, another will start the course supported by the other two.',
      name: 'c11_floor3_step2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `While waiting for a turn, students have to help the teammate by providing feedback (be specific, say something nice, offer a suggestion).`
  String get c11_floor3_step3_correct {
    return Intl.message(
      'While waiting for a turn, students have to help the teammate by providing feedback (be specific, say something nice, offer a suggestion).',
      name: 'c11_floor3_step3_correct',
      desc: '',
      args: [],
    );
  }

  /// `While waiting for their turn, students have to incite their teammate to go fast, providing information on their opponents to see if they are going slow.`
  String get c11_floor3_step3_wrong {
    return Intl.message(
      'While waiting for their turn, students have to incite their teammate to go fast, providing information on their opponents to see if they are going slow.',
      name: 'c11_floor3_step3_wrong',
      desc: '',
      args: [],
    );
  }

  /// `During the task execution, the teacher assesses students’ feedback, how they provide it, and their performance in overcoming the obstacles.`
  String get c11_floor3_step4_correct {
    return Intl.message(
      'During the task execution, the teacher assesses students’ feedback, how they provide it, and their performance in overcoming the obstacles.',
      name: 'c11_floor3_step4_correct',
      desc: '',
      args: [],
    );
  }

  /// `During the task execution, the teacher assesses students by recording the time taken to complete the task and their performance in overcoming the obstacles.`
  String get c11_floor3_step4_wrong {
    return Intl.message(
      'During the task execution, the teacher assesses students by recording the time taken to complete the task and their performance in overcoming the obstacles.',
      name: 'c11_floor3_step4_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher gives the command to the students to stop and interacts with them, praising students who give good feedback to help others and providing general suggestions for improving the feedback.`
  String get c11_floor3_step5_correct {
    return Intl.message(
      'The teacher gives the command to the students to stop and interacts with them, praising students who give good feedback to help others and providing general suggestions for improving the feedback.',
      name: 'c11_floor3_step5_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher interacts with students, one group at a time, to provide general suggestions for improving the feedback.`
  String get c11_floor3_step5_wrong {
    return Intl.message(
      'The teacher interacts with students, one group at a time, to provide general suggestions for improving the feedback.',
      name: 'c11_floor3_step5_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The game restarts. The teacher assesses students’ feedback and how they changed it according to the suggestions.`
  String get c11_floor3_step6_correct {
    return Intl.message(
      'The game restarts. The teacher assesses students’ feedback and how they changed it according to the suggestions.',
      name: 'c11_floor3_step6_correct',
      desc: '',
      args: [],
    );
  }

  /// `During the task execution, the teacher assesses students’ performance in overcoming the obstacles.`
  String get c11_floor3_step6_wrong {
    return Intl.message(
      'During the task execution, the teacher assesses students’ performance in overcoming the obstacles.',
      name: 'c11_floor3_step6_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher engages in a talk with the students, explaining again the key points of social responsibility and asking them to share with their teammates how they felt when they gave or received feedback.`
  String get c11_floor3_step7_correct {
    return Intl.message(
      'The teacher engages in a talk with the students, explaining again the key points of social responsibility and asking them to share with their teammates how they felt when they gave or received feedback.',
      name: 'c11_floor3_step7_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher explains to the students the key points of social responsibility and provides a comparison between what they have done and how they could do it better.`
  String get c11_floor3_step7_wrong {
    return Intl.message(
      'The teacher explains to the students the key points of social responsibility and provides a comparison between what they have done and how they could do it better.',
      name: 'c11_floor3_step7_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Health-based PE model`
  String get c11_floor4_model {
    return Intl.message(
      'Health-based PE model',
      name: 'c11_floor4_model',
      desc: '',
      args: [],
    );
  }

  /// `School gymnasium`
  String get c11_floor4_environment {
    return Intl.message(
      'School gymnasium',
      name: 'c11_floor4_environment',
      desc: '',
      args: [],
    );
  }

  /// `The pedagogical approach integrates physical activity with health education, aiming to empower students with the knowledge, skills, and attitudes necessary for healthy living. It stresses the importance of physical fitness, nutrition, mental wellness, and the value of a lifelong commitment to active lifestyles.`
  String get c11_floor4_statement {
    return Intl.message(
      'The pedagogical approach integrates physical activity with health education, aiming to empower students with the knowledge, skills, and attitudes necessary for healthy living. It stresses the importance of physical fitness, nutrition, mental wellness, and the value of a lifelong commitment to active lifestyles.',
      name: 'c11_floor4_statement',
      desc: '',
      args: [],
    );
  }

  /// `In this challenge, you will guide students in understanding the relationship between physical activity and health through teamwork, goal-setting, and peer support. Select the correct strategy for each step to proceed.`
  String get c11_floor4_instruction {
    return Intl.message(
      'In this challenge, you will guide students in understanding the relationship between physical activity and health through teamwork, goal-setting, and peer support. Select the correct strategy for each step to proceed.',
      name: 'c11_floor4_instruction',
      desc: '',
      args: [],
    );
  }

  /// `The teacher and students are sitting in a circle. The teacher introduces the aim of the next three lessons explaining the relationship between physical activity and health.`
  String get c11_floor4_step1_instruction {
    return Intl.message(
      'The teacher and students are sitting in a circle. The teacher introduces the aim of the next three lessons explaining the relationship between physical activity and health.',
      name: 'c11_floor4_step1_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get c11_floor4_step1_correct {
    return Intl.message(
      'Proceed',
      name: 'c11_floor4_step1_correct',
      desc: '',
      args: [],
    );
  }

  /// `After providing information on the national and international guidelines for maintaining a healthy lifestyle, the teacher performs a physical test to show how to evaluate the individual’s fitness level and how to compare them with national standards.`
  String get c11_floor4_step2_correct {
    return Intl.message(
      'After providing information on the national and international guidelines for maintaining a healthy lifestyle, the teacher performs a physical test to show how to evaluate the individual’s fitness level and how to compare them with national standards.',
      name: 'c11_floor4_step2_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher provides detailed information on the national and international guidelines to students, where they can find them, how to self-evaluate their fitness level, and how to compare them with national standards (theoretical lesson).`
  String get c11_floor4_step2_wrong {
    return Intl.message(
      'The teacher provides detailed information on the national and international guidelines to students, where they can find them, how to self-evaluate their fitness level, and how to compare them with national standards (theoretical lesson).',
      name: 'c11_floor4_step2_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher encourages students’ teamwork to identify, set and achieve physical activity targets or challenges.`
  String get c11_floor4_step3_correct {
    return Intl.message(
      'The teacher encourages students’ teamwork to identify, set and achieve physical activity targets or challenges.',
      name: 'c11_floor4_step3_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher encourages each student to identify, set and achieve personalised physical activity targets or challenges based on test results.`
  String get c11_floor4_step3_wrong {
    return Intl.message(
      'The teacher encourages each student to identify, set and achieve personalised physical activity targets or challenges based on test results.',
      name: 'c11_floor4_step3_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher also encourages students to work in groups supporting their peers in physical activity participation.`
  String get c11_floor4_step4_correct {
    return Intl.message(
      'The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher also encourages students to work in groups supporting their peers in physical activity participation.',
      name: 'c11_floor4_step4_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher encourages individual work to maximise the exercise benefits.`
  String get c11_floor4_step4_wrong {
    return Intl.message(
      'The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher encourages individual work to maximise the exercise benefits.',
      name: 'c11_floor4_step4_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher encourages students to become critical movers, providing feedback and suggestions to peers.`
  String get c11_floor4_step5_correct {
    return Intl.message(
      'The teacher encourages students to become critical movers, providing feedback and suggestions to peers.',
      name: 'c11_floor4_step5_correct',
      desc: '',
      args: [],
    );
  }

  /// `The teacher avoids students being critical of each other, in order to avoid disputes.`
  String get c11_floor4_step5_wrong {
    return Intl.message(
      'The teacher avoids students being critical of each other, in order to avoid disputes.',
      name: 'c11_floor4_step5_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teacher must provide challenges to students to promote physical activity among their peers, but also among family members (within and beyond school).`
  String get c11_floor4_step6_correct {
    return Intl.message(
      'The teacher must provide challenges to students to promote physical activity among their peers, but also among family members (within and beyond school).',
      name: 'c11_floor4_step6_correct',
      desc: '',
      args: [],
    );
  }

  /// `The model does not require to consider activities beyond school.`
  String get c11_floor4_step6_wrong {
    return Intl.message(
      'The model does not require to consider activities beyond school.',
      name: 'c11_floor4_step6_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The teaching model emphasises teacher support in the identification of barriers to physical activity participation, as well as strategies to overcome them.`
  String get c11_floor4_step7_correct {
    return Intl.message(
      'The teaching model emphasises teacher support in the identification of barriers to physical activity participation, as well as strategies to overcome them.',
      name: 'c11_floor4_step7_correct',
      desc: '',
      args: [],
    );
  }

  /// `The model does not require that the teacher support students in the identification of barriers to physical activity participation, as well as strategies to overcome them.`
  String get c11_floor4_step7_wrong {
    return Intl.message(
      'The model does not require that the teacher support students in the identification of barriers to physical activity participation, as well as strategies to overcome them.',
      name: 'c11_floor4_step7_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Mistakes`
  String get c11_mistakes {
    return Intl.message(
      'Mistakes',
      name: 'c11_mistakes',
      desc: '',
      args: [],
    );
  }

  /// `You have made 2 mistakes in this model. The challenge will restart from this floor.`
  String get c11_mistakes_reached {
    return Intl.message(
      'You have made 2 mistakes in this model. The challenge will restart from this floor.',
      name: 'c11_mistakes_reached',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have successfully completed the tower. You can now access the next challenge.`
  String get c11_finish {
    return Intl.message(
      'Well done! You have successfully completed the tower. You can now access the next challenge.',
      name: 'c11_finish',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 12. You will assume the role of a PE teacher and develop two lessons for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes a change in the avatar's expression (from happy to angry). You can make three mistakes per lesson, after which the challenge will begin again. Ready?`
  String get c12a1_instructions {
    return Intl.message(
      'Welcome to challenge 12. You will assume the role of a PE teacher and develop two lessons for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes a change in the avatar\'s expression (from happy to angry). You can make three mistakes per lesson, after which the challenge will begin again. Ready?',
      name: 'c12a1_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have scheduled your lesson based on the class needs. To complete the challenge, you have to develop another lesson for a different class.`
  String get c12a1_finish {
    return Intl.message(
      'Well done! You have scheduled your lesson based on the class needs. To complete the challenge, you have to develop another lesson for a different class.',
      name: 'c12a1_finish',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! You've completed the game!`
  String get c12_completed {
    return Intl.message(
      'Congratulations! You\'ve completed the game!',
      name: 'c12_completed',
      desc: '',
      args: [],
    );
  }

  /// `You've made 3 mistakes. Game restarting!`
  String get c12_mistakes {
    return Intl.message(
      'You\'ve made 3 mistakes. Game restarting!',
      name: 'c12_mistakes',
      desc: '',
      args: [],
    );
  }

  /// `Restart`
  String get restart {
    return Intl.message(
      'Restart',
      name: 'restart',
      desc: '',
      args: [],
    );
  }

  /// `This is a class of 25 children 6-year-olds, one of them with Asperger's Syndrome. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. All the children are motivated when doing PE. The lesson aims to teach catching and throwing skills.`
  String get c12a2_instructions {
    return Intl.message(
      'This is a class of 25 children 6-year-olds, one of them with Asperger\'s Syndrome. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. All the children are motivated when doing PE. The lesson aims to teach catching and throwing skills.',
      name: 'c12a2_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have scheduled your lessons based on the class needs. You have completed the challenge!`
  String get c12a2_finish {
    return Intl.message(
      'Well done! You have scheduled your lessons based on the class needs. You have completed the challenge!',
      name: 'c12a2_finish',
      desc: '',
      args: [],
    );
  }

  /// `Chest pass exercise`
  String get c12a1_1_title {
    return Intl.message(
      'Chest pass exercise',
      name: 'c12a1_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick the correct equipment set.`
  String get c12a1_1_question {
    return Intl.message(
      'Pick the correct equipment set.',
      name: 'c12a1_1_question',
      desc: '',
      args: [],
    );
  }

  /// `Standard balls used in basketball sport.`
  String get c12a1_1_answer1 {
    return Intl.message(
      'Standard balls used in basketball sport.',
      name: 'c12a1_1_answer1',
      desc: '',
      args: [],
    );
  }

  /// `Balls of different weights for male and female students.`
  String get c12a1_1_answer2 {
    return Intl.message(
      'Balls of different weights for male and female students.',
      name: 'c12a1_1_answer2',
      desc: '',
      args: [],
    );
  }

  /// `Balls of different weights for students in wheelchairs.`
  String get c12a1_1_answer3 {
    return Intl.message(
      'Balls of different weights for students in wheelchairs.',
      name: 'c12a1_1_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Chest pass exercise (individual work)`
  String get c12a1_2_title {
    return Intl.message(
      'Chest pass exercise (individual work)',
      name: 'c12a1_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting and rules:\nA 1-meter square on a wall, 1 meter off the floor.\nA foot-foul line 2 meters from the wall.\nStudents must throw the ball inside the square and catch the rebound. The ball must be thrown from behind the line and the rebound must be caught behind the line. The ball cannot bounce before hitting the wall. Perform the exercise 5 times.\n\nAdaptation for students in wheelchairs:`
  String get c12a1_2_question {
    return Intl.message(
      'Setting and rules:\nA 1-meter square on a wall, 1 meter off the floor.\nA foot-foul line 2 meters from the wall.\nStudents must throw the ball inside the square and catch the rebound. The ball must be thrown from behind the line and the rebound must be caught behind the line. The ball cannot bounce before hitting the wall. Perform the exercise 5 times.\n\nAdaptation for students in wheelchairs:',
      name: 'c12a1_2_question',
      desc: '',
      args: [],
    );
  }

  /// `Not needed.`
  String get c12a1_2_answer1 {
    return Intl.message(
      'Not needed.',
      name: 'c12a1_2_answer1',
      desc: '',
      args: [],
    );
  }

  /// `The foot-foul line is 1 meter from the wall.`
  String get c12a1_2_answer2 {
    return Intl.message(
      'The foot-foul line is 1 meter from the wall.',
      name: 'c12a1_2_answer2',
      desc: '',
      args: [],
    );
  }

  /// `The square is drawn 0.5 meters off the floor.`
  String get c12a1_2_answer3 {
    return Intl.message(
      'The square is drawn 0.5 meters off the floor.',
      name: 'c12a1_2_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Chest pass exercise (teamwork)`
  String get c12a1_3_title {
    return Intl.message(
      'Chest pass exercise (teamwork)',
      name: 'c12a1_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting and rules (provided):\nStudents in pairs, 2 meters apart.\nStudents must throw the ball to their teammates. The ball cannot bounce. Perform the exercise 10 times.\nTeam building:`
  String get c12a1_3_question {
    return Intl.message(
      'Setting and rules (provided):\nStudents in pairs, 2 meters apart.\nStudents must throw the ball to their teammates. The ball cannot bounce. Perform the exercise 10 times.\nTeam building:',
      name: 'c12a1_3_question',
      desc: '',
      args: [],
    );
  }

  /// `Students in pairs. Each student in a wheelchair works with any classmate.`
  String get c12a1_3_answer1 {
    return Intl.message(
      'Students in pairs. Each student in a wheelchair works with any classmate.',
      name: 'c12a1_3_answer1',
      desc: '',
      args: [],
    );
  }

  /// `Students in pairs. Students in wheelchairs are in the same group.`
  String get c12a1_3_answer2 {
    return Intl.message(
      'Students in pairs. Students in wheelchairs are in the same group.',
      name: 'c12a1_3_answer2',
      desc: '',
      args: [],
    );
  }

  /// `Spot shot exercise`
  String get c12a1_4_title {
    return Intl.message(
      'Spot shot exercise',
      name: 'c12a1_4_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting and rules (provided):\nStudents work on a basketball field.\nStudents are divided into two groups.\nThree shooting areas (1.6 meters from the basketball hoop).\nEach team is divided into 3 subgroups, one for each shooting area. Students must perform a shot and move to another area. Each student must perform 4 shoots in each area to complete the task.\nAdaptation for students in wheelchairs:`
  String get c12a1_4_question {
    return Intl.message(
      'Setting and rules (provided):\nStudents work on a basketball field.\nStudents are divided into two groups.\nThree shooting areas (1.6 meters from the basketball hoop).\nEach team is divided into 3 subgroups, one for each shooting area. Students must perform a shot and move to another area. Each student must perform 4 shoots in each area to complete the task.\nAdaptation for students in wheelchairs:',
      name: 'c12a1_4_question',
      desc: '',
      args: [],
    );
  }

  /// `Not needed.`
  String get c12a1_4_answer1 {
    return Intl.message(
      'Not needed.',
      name: 'c12a1_4_answer1',
      desc: '',
      args: [],
    );
  }

  /// `The shooting areas are 1 meter from the basketball hoop.`
  String get c12a1_4_answer2 {
    return Intl.message(
      'The shooting areas are 1 meter from the basketball hoop.',
      name: 'c12a1_4_answer2',
      desc: '',
      args: [],
    );
  }

  /// `The students in wheelchairs can perform more shots than their teammates.`
  String get c12a1_4_answer3 {
    return Intl.message(
      'The students in wheelchairs can perform more shots than their teammates.',
      name: 'c12a1_4_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Equipment`
  String get c12a1_5_title {
    return Intl.message(
      'Equipment',
      name: 'c12a1_5_title',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get c12a1_5_question {
    return Intl.message(
      '',
      name: 'c12a1_5_question',
      desc: '',
      args: [],
    );
  }

  /// `Basketball hoops of different heights, balls of the same weight.`
  String get c12a1_5_answer1 {
    return Intl.message(
      'Basketball hoops of different heights, balls of the same weight.',
      name: 'c12a1_5_answer1',
      desc: '',
      args: [],
    );
  }

  /// `Basketball hoops of the same height, and balls of different weights for male.`
  String get c12a1_5_answer2 {
    return Intl.message(
      'Basketball hoops of the same height, and balls of different weights for male.',
      name: 'c12a1_5_answer2',
      desc: '',
      args: [],
    );
  }

  /// `Basketball hoops of different heights, and balls of different weights for students in wheelchairs.`
  String get c12a1_5_answer3 {
    return Intl.message(
      'Basketball hoops of different heights, and balls of different weights for students in wheelchairs.',
      name: 'c12a1_5_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Ten-meter dribble exercise:`
  String get c12a1_6_title {
    return Intl.message(
      'Ten-meter dribble exercise:',
      name: 'c12a1_6_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting and rules (provided):\nLine 10-meter long.\nSix cones on the line, 1.5 meters apart.\nStudents are divided into groups.\nThe students must dribble on the line as quickly as possible using only one hand and without hitting the cone with the ball.\nStudents must perform the exercise three times in non-consecutive turns.`
  String get c12a1_6_question {
    return Intl.message(
      'Setting and rules (provided):\nLine 10-meter long.\nSix cones on the line, 1.5 meters apart.\nStudents are divided into groups.\nThe students must dribble on the line as quickly as possible using only one hand and without hitting the cone with the ball.\nStudents must perform the exercise three times in non-consecutive turns.',
      name: 'c12a1_6_question',
      desc: '',
      args: [],
    );
  }

  /// `The dribbling execution needs to be adapted: bounce one time, trap the ball in lap, push wheels.`
  String get c12a1_6_answer1 {
    return Intl.message(
      'The dribbling execution needs to be adapted: bounce one time, trap the ball in lap, push wheels.',
      name: 'c12a1_6_answer1',
      desc: '',
      args: [],
    );
  }

  /// `Not needed.`
  String get c12a1_6_answer2 {
    return Intl.message(
      'Not needed.',
      name: 'c12a1_6_answer2',
      desc: '',
      args: [],
    );
  }

  /// `Three cones on the line for students in wheelchairs.`
  String get c12a1_6_answer3 {
    return Intl.message(
      'Three cones on the line for students in wheelchairs.',
      name: 'c12a1_6_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Catching and throwing activity`
  String get c12a2_1_title {
    return Intl.message(
      'Catching and throwing activity',
      name: 'c12a2_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Rules (provided): \nChildren in pairs. One child has to throw the ball to his teammate without dropping it.\nAdaptation for student with Asperger's Syndrome:`
  String get c12a2_1_question {
    return Intl.message(
      'Rules (provided): \nChildren in pairs. One child has to throw the ball to his teammate without dropping it.\nAdaptation for student with Asperger\'s Syndrome:',
      name: 'c12a2_1_question',
      desc: '',
      args: [],
    );
  }

  /// `The teacher shows a card with the actions needed to perform the task to the student with Asperger's Syndrome.`
  String get c12a2_1_answer1 {
    return Intl.message(
      'The teacher shows a card with the actions needed to perform the task to the student with Asperger\'s Syndrome.',
      name: 'c12a2_1_answer1',
      desc: '',
      args: [],
    );
  }

  /// `The teacher explains carefully how to perform the task through several demonstrations to the student with Asperger's Syndrome.`
  String get c12a2_1_answer2 {
    return Intl.message(
      'The teacher explains carefully how to perform the task through several demonstrations to the student with Asperger\'s Syndrome.',
      name: 'c12a2_1_answer2',
      desc: '',
      args: [],
    );
  }

  /// `Not needed.`
  String get c12a2_1_answer3 {
    return Intl.message(
      'Not needed.',
      name: 'c12a2_1_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Catching and throwing activity`
  String get c12a2_2_title {
    return Intl.message(
      'Catching and throwing activity',
      name: 'c12a2_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Rules (provided):\nChildren in pairs. One child has to throw the ball to his teammate without dropping it while walking near a line.\nAdaptation for student with Asperger's Syndrome:`
  String get c12a2_2_question {
    return Intl.message(
      'Rules (provided):\nChildren in pairs. One child has to throw the ball to his teammate without dropping it while walking near a line.\nAdaptation for student with Asperger\'s Syndrome:',
      name: 'c12a2_2_question',
      desc: '',
      args: [],
    );
  }

  /// `The teacher divides the task into two parts. In the first part, a student has to throw the ball to his teammate with Asperger's Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, a child has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).`
  String get c12a2_2_answer1 {
    return Intl.message(
      'The teacher divides the task into two parts. In the first part, a student has to throw the ball to his teammate with Asperger\'s Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, a child has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).',
      name: 'c12a2_2_answer1',
      desc: '',
      args: [],
    );
  }

  /// `The teacher divides the task into two parts. In the first part, the teacher has to throw the ball to his teammate with Asperger's Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, the teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).`
  String get c12a2_2_answer2 {
    return Intl.message(
      'The teacher divides the task into two parts. In the first part, the teacher has to throw the ball to his teammate with Asperger\'s Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, the teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).',
      name: 'c12a2_2_answer2',
      desc: '',
      args: [],
    );
  }

  /// `The teacher plays with the student with Asperger's Syndrome. The teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).`
  String get c12a2_2_answer3 {
    return Intl.message(
      'The teacher plays with the student with Asperger\'s Syndrome. The teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).',
      name: 'c12a2_2_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Catching and throwing activity`
  String get c12a2_3_title {
    return Intl.message(
      'Catching and throwing activity',
      name: 'c12a2_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Setting and rules (provided):\nThe gymnasium is divided into four parts. One game area in each part. Children in eight teams. Each playing area is divided into two fields. Each team built two castles with cones and placed them at the end of the playing fields. Each team has one soft ball. The children must throw the balls trying to bring down the castles of the other team. Before throwing the ball, they must perform at least three passes. All students must play with a lower level of voice. Whoever shouts receives a penalty. Adaptation for student with Asperger's Syndrome:`
  String get c12a2_3_question {
    return Intl.message(
      'Setting and rules (provided):\nThe gymnasium is divided into four parts. One game area in each part. Children in eight teams. Each playing area is divided into two fields. Each team built two castles with cones and placed them at the end of the playing fields. Each team has one soft ball. The children must throw the balls trying to bring down the castles of the other team. Before throwing the ball, they must perform at least three passes. All students must play with a lower level of voice. Whoever shouts receives a penalty. Adaptation for student with Asperger\'s Syndrome:',
      name: 'c12a2_3_question',
      desc: '',
      args: [],
    );
  }

  /// `Before throwing the ball, the students must pass the ball to the teammate with Asperger's Syndrome.`
  String get c12a2_3_answer1 {
    return Intl.message(
      'Before throwing the ball, the students must pass the ball to the teammate with Asperger\'s Syndrome.',
      name: 'c12a2_3_answer1',
      desc: '',
      args: [],
    );
  }

  /// `While the students play, the teacher plays the same game with the student with Asperger's Syndrome in a reserved play area.`
  String get c12a2_3_answer2 {
    return Intl.message(
      'While the students play, the teacher plays the same game with the student with Asperger\'s Syndrome in a reserved play area.',
      name: 'c12a2_3_answer2',
      desc: '',
      args: [],
    );
  }

  /// `The teacher plays in the team of the student with Asperger's Syndrome. Before throwing the ball, the student and the teacher must pass the ball to the teammate with Asperger's Syndrome.`
  String get c12a2_3_answer3 {
    return Intl.message(
      'The teacher plays in the team of the student with Asperger\'s Syndrome. Before throwing the ball, the student and the teacher must pass the ball to the teammate with Asperger\'s Syndrome.',
      name: 'c12a2_3_answer3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to challenge 13. You will assume the role of a PE teacher and develop a lesson for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes the loss of a heart in the avatar's life bar. You have 20 hearts available. If you lose all the hearts, you will restart the challenge. Ready?`
  String get c13a1_intro1 {
    return Intl.message(
      'Welcome to challenge 13. You will assume the role of a PE teacher and develop a lesson for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes the loss of a heart in the avatar\'s life bar. You have 20 hearts available. If you lose all the hearts, you will restart the challenge. Ready?',
      name: 'c13a1_intro1',
      desc: '',
      args: [],
    );
  }

  /// `This is a class of 30 children. They have some experience in gymnastics and dance from PE lessons in the early grades. They also have experience in traditional games, athletics, swimming, and winter sports. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. Most of the children are motivated when doing PE although a few children lack confidence. The school has a small gymnasium with some moveable apparatus (benches, boxes) that the children can use to balance on as well as floor mats to work on. Music can be used if required to add stimulus to the sequences. Work cards with examples of partner balances are available. These have descriptions and images of partner balances along with suggestions of how to get into and out of the balances. The children will have already selected a partner and will have been working on developing travelling with a partner (mirroring and matching movements, moving in different directions) and jumping combinations (using different types of jumps and different shapes). They have started to put a sequence together which they will build on over the following weeks. The lesson aims to encourage students to explore a range of partner balances, modify them if possible and then link them together as part of their partner sequence. The learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.`
  String get c13a1_intro2 {
    return Intl.message(
      'This is a class of 30 children. They have some experience in gymnastics and dance from PE lessons in the early grades. They also have experience in traditional games, athletics, swimming, and winter sports. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. Most of the children are motivated when doing PE although a few children lack confidence. The school has a small gymnasium with some moveable apparatus (benches, boxes) that the children can use to balance on as well as floor mats to work on. Music can be used if required to add stimulus to the sequences. Work cards with examples of partner balances are available. These have descriptions and images of partner balances along with suggestions of how to get into and out of the balances. The children will have already selected a partner and will have been working on developing travelling with a partner (mirroring and matching movements, moving in different directions) and jumping combinations (using different types of jumps and different shapes). They have started to put a sequence together which they will build on over the following weeks. The lesson aims to encourage students to explore a range of partner balances, modify them if possible and then link them together as part of their partner sequence. The learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.',
      name: 'c13a1_intro2',
      desc: '',
      args: [],
    );
  }

  /// `Now you have all the information to start developing lessons for your students. If you want to consult the characteristics, the purpose, and the learning outcomes of the lesson, you can consult me with a tap, and I will provide you with all this information.\nA hand icon    appears to indicate that the user must tap the Buddy. By tapping the Buddy, the following list of features will appear:\n●\tClass of 30 children with experience in traditional games, athletics, swimming and winter sports.\n●\t1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view.\n●\tThe school has a small gymnasium with some moveable apparatus (benches, boxes) that the children can use to balance on as well as floor mats to work on. Music can be used if required. Work cards with examples of partner balances are available. These have descriptions and images of partner balances along with suggestions of how to get into and out of the balances.\n●\tThe children will have already selected a partner and will have been working with a partner on mirroring and matching movements, moving in different directions, and jumping combinations.\n●\tThe children have started to put a sequence together which they will build on over the following weeks. \n●\tThe lesson aims to encourage students to explore a range of partner balances, modify them if possible and then link them together as part of their partner sequence.\n●\tThe learning outcomes for the lesson cover four areas:\no\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\no\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\no\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\no\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.`
  String get c13a1_intro3 {
    return Intl.message(
      'Now you have all the information to start developing lessons for your students. If you want to consult the characteristics, the purpose, and the learning outcomes of the lesson, you can consult me with a tap, and I will provide you with all this information.\nA hand icon    appears to indicate that the user must tap the Buddy. By tapping the Buddy, the following list of features will appear:\n●\tClass of 30 children with experience in traditional games, athletics, swimming and winter sports.\n●\t1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view.\n●\tThe school has a small gymnasium with some moveable apparatus (benches, boxes) that the children can use to balance on as well as floor mats to work on. Music can be used if required. Work cards with examples of partner balances are available. These have descriptions and images of partner balances along with suggestions of how to get into and out of the balances.\n●\tThe children will have already selected a partner and will have been working with a partner on mirroring and matching movements, moving in different directions, and jumping combinations.\n●\tThe children have started to put a sequence together which they will build on over the following weeks. \n●\tThe lesson aims to encourage students to explore a range of partner balances, modify them if possible and then link them together as part of their partner sequence.\n●\tThe learning outcomes for the lesson cover four areas:\no\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\no\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\no\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\no\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.',
      name: 'c13a1_intro3',
      desc: '',
      args: [],
    );
  }

  /// `🎉 Well done! You've selected the correct answers! 🎉`
  String get c13a1_well_done {
    return Intl.message(
      '🎉 Well done! You\'ve selected the correct answers! 🎉',
      name: 'c13a1_well_done',
      desc: '',
      args: [],
    );
  }

  /// `You have selected %1 incorrect answers.`
  String get c13a1_mistakes {
    return Intl.message(
      'You have selected %1 incorrect answers.',
      name: 'c13a1_mistakes',
      desc: '',
      args: [],
    );
  }

  /// `❌ You've lost all lives and the challenge will restart.`
  String get c13a1_game_over {
    return Intl.message(
      '❌ You\'ve lost all lives and the challenge will restart.',
      name: 'c13a1_game_over',
      desc: '',
      args: [],
    );
  }

  /// `Stage %1`
  String get c13a1_stage {
    return Intl.message(
      'Stage %1',
      name: 'c13a1_stage',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed this activity. One more to go to finish the last challenge!`
  String get c13a1_finish {
    return Intl.message(
      'Well done! You have completed this activity. One more to go to finish the last challenge!',
      name: 'c13a1_finish',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get c13_1_title {
    return Intl.message(
      'Introduction',
      name: 'c13_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Based on the information provided, choose 2 skills/qualities you are also focusing on developing:`
  String get c13_1_question {
    return Intl.message(
      'Based on the information provided, choose 2 skills/qualities you are also focusing on developing:',
      name: 'c13_1_question',
      desc: '',
      args: [],
    );
  }

  /// `Resilience`
  String get c13_1_correct_1 {
    return Intl.message(
      'Resilience',
      name: 'c13_1_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Independence`
  String get c13_1_correct_2 {
    return Intl.message(
      'Independence',
      name: 'c13_1_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `Communication`
  String get c13_1_correct_3 {
    return Intl.message(
      'Communication',
      name: 'c13_1_correct_3',
      desc: '',
      args: [],
    );
  }

  /// `Problem-Solving`
  String get c13_1_wrong_1 {
    return Intl.message(
      'Problem-Solving',
      name: 'c13_1_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Emotional Intelligence`
  String get c13_1_wrong_2 {
    return Intl.message(
      'Emotional Intelligence',
      name: 'c13_1_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Leadership`
  String get c13_1_wrong_3 {
    return Intl.message(
      'Leadership',
      name: 'c13_1_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Evaluation`
  String get c13_1_wrong_4 {
    return Intl.message(
      'Evaluation',
      name: 'c13_1_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `Sportspersonship`
  String get c13_1_wrong_5 {
    return Intl.message(
      'Sportspersonship',
      name: 'c13_1_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `Self-confidence`
  String get c13_1_wrong_6 {
    return Intl.message(
      'Self-confidence',
      name: 'c13_1_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `Teaching styles or models`
  String get c13_2_title {
    return Intl.message(
      'Teaching styles or models',
      name: 'c13_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Teaching Styles or Models: Based on Mosston’s Styles, choose 3 Styles that you could use to achieve the purpose of the lesson.`
  String get c13_2_question {
    return Intl.message(
      'Teaching Styles or Models: Based on Mosston’s Styles, choose 3 Styles that you could use to achieve the purpose of the lesson.',
      name: 'c13_2_question',
      desc: '',
      args: [],
    );
  }

  /// `Reciprocal`
  String get c13_2_correct_1 {
    return Intl.message(
      'Reciprocal',
      name: 'c13_2_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Self-Check`
  String get c13_2_correct_2 {
    return Intl.message(
      'Self-Check',
      name: 'c13_2_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `Divergent Discovery`
  String get c13_2_correct_3 {
    return Intl.message(
      'Divergent Discovery',
      name: 'c13_2_correct_3',
      desc: '',
      args: [],
    );
  }

  /// `Learner Designed`
  String get c13_2_correct_4 {
    return Intl.message(
      'Learner Designed',
      name: 'c13_2_correct_4',
      desc: '',
      args: [],
    );
  }

  /// `Command`
  String get c13_2_wrong_1 {
    return Intl.message(
      'Command',
      name: 'c13_2_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Practice`
  String get c13_2_wrong_2 {
    return Intl.message(
      'Practice',
      name: 'c13_2_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Inclusion`
  String get c13_2_wrong_3 {
    return Intl.message(
      'Inclusion',
      name: 'c13_2_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Guided Discovery`
  String get c13_2_wrong_4 {
    return Intl.message(
      'Guided Discovery',
      name: 'c13_2_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `Convergent Discovery`
  String get c13_2_wrong_5 {
    return Intl.message(
      'Convergent Discovery',
      name: 'c13_2_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `Learner Initiated`
  String get c13_2_wrong_6 {
    return Intl.message(
      'Learner Initiated',
      name: 'c13_2_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `Self-Teach`
  String get c13_2_wrong_7 {
    return Intl.message(
      'Self-Teach',
      name: 'c13_2_wrong_7',
      desc: '',
      args: [],
    );
  }

  /// `Teaching models`
  String get c13_3_title {
    return Intl.message(
      'Teaching models',
      name: 'c13_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Teaching models: based on the aim of the lesson, choose 1 teaching model to enhance students’ physical literacy.`
  String get c13_3_question {
    return Intl.message(
      'Teaching models: based on the aim of the lesson, choose 1 teaching model to enhance students’ physical literacy.',
      name: 'c13_3_question',
      desc: '',
      args: [],
    );
  }

  /// `Cooperative Education`
  String get c13_3_correct_1 {
    return Intl.message(
      'Cooperative Education',
      name: 'c13_3_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Sport Education`
  String get c13_3_wrong_1 {
    return Intl.message(
      'Sport Education',
      name: 'c13_3_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Teaching Personal Social Responsibility`
  String get c13_3_wrong_2 {
    return Intl.message(
      'Teaching Personal Social Responsibility',
      name: 'c13_3_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Health Based PE`
  String get c13_3_wrong_3 {
    return Intl.message(
      'Health Based PE',
      name: 'c13_3_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Dare`
  String get c13_4_title {
    return Intl.message(
      'Dare',
      name: 'c13_4_title',
      desc: '',
      args: [],
    );
  }

  /// `Dare: based on the aim of the lesson and the teaching model adopted, choose 1 dare that can help the students improve their skills.`
  String get c13_4_question {
    return Intl.message(
      'Dare: based on the aim of the lesson and the teaching model adopted, choose 1 dare that can help the students improve their skills.',
      name: 'c13_4_question',
      desc: '',
      args: [],
    );
  }

  /// `Children can choose the balances they want to do and how they link them into a sequence.`
  String get c13_4_correct_1 {
    return Intl.message(
      'Children can choose the balances they want to do and how they link them into a sequence.',
      name: 'c13_4_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Children are all challenged to do the same balances and sequences.`
  String get c13_4_wrong_1 {
    return Intl.message(
      'Children are all challenged to do the same balances and sequences.',
      name: 'c13_4_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Children are challenged to do the same balances but choose how to link them into a sequence.`
  String get c13_4_wrong_2 {
    return Intl.message(
      'Children are challenged to do the same balances but choose how to link them into a sequence.',
      name: 'c13_4_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get c13_5_title {
    return Intl.message(
      'Support',
      name: 'c13_5_title',
      desc: '',
      args: [],
    );
  }

  /// `Support: based on the aim of the lesson and the teaching model adopted, choose 1 support that can help the students to enhance their skills.`
  String get c13_5_question {
    return Intl.message(
      'Support: based on the aim of the lesson and the teaching model adopted, choose 1 support that can help the students to enhance their skills.',
      name: 'c13_5_question',
      desc: '',
      args: [],
    );
  }

  /// `Children are supported by themselves and worksheets that have pictures and text to describe the balances and how they might be linked together.`
  String get c13_5_correct_1 {
    return Intl.message(
      'Children are supported by themselves and worksheets that have pictures and text to describe the balances and how they might be linked together.',
      name: 'c13_5_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `The Teacher moves around the class to provide support and advice where appropriate.`
  String get c13_5_wrong_1 {
    return Intl.message(
      'The Teacher moves around the class to provide support and advice where appropriate.',
      name: 'c13_5_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Some students are nominated as support and they work with a group, providing advice.`
  String get c13_5_wrong_2 {
    return Intl.message(
      'Some students are nominated as support and they work with a group, providing advice.',
      name: 'c13_5_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Aspects`
  String get c13_6_title {
    return Intl.message(
      'Aspects',
      name: 'c13_6_title',
      desc: '',
      args: [],
    );
  }

  /// `Aspects: What would you be most likely to modify? Choose 2 elements that you can modify.`
  String get c13_6_question {
    return Intl.message(
      'Aspects: What would you be most likely to modify? Choose 2 elements that you can modify.',
      name: 'c13_6_question',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get c13_6_correct_1 {
    return Intl.message(
      'Activities',
      name: 'c13_6_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Equipment`
  String get c13_6_correct_2 {
    return Intl.message(
      'Equipment',
      name: 'c13_6_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `Spaces`
  String get c13_6_wrong_1 {
    return Intl.message(
      'Spaces',
      name: 'c13_6_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `People`
  String get c13_6_wrong_2 {
    return Intl.message(
      'People',
      name: 'c13_6_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Conditions`
  String get c13_6_wrong_3 {
    return Intl.message(
      'Conditions',
      name: 'c13_6_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get c13_6_wrong_4 {
    return Intl.message(
      'Time',
      name: 'c13_6_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get c13_7_title {
    return Intl.message(
      'Priority',
      name: 'c13_7_title',
      desc: '',
      args: [],
    );
  }

  /// `Priority: What would be your priority? Choose two priorities.`
  String get c13_7_question {
    return Intl.message(
      'Priority: What would be your priority? Choose two priorities.',
      name: 'c13_7_question',
      desc: '',
      args: [],
    );
  }

  /// `Maximum participation`
  String get c13_7_correct_1 {
    return Intl.message(
      'Maximum participation',
      name: 'c13_7_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Involvement`
  String get c13_7_correct_2 {
    return Intl.message(
      'Involvement',
      name: 'c13_7_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get c13_7_correct_3 {
    return Intl.message(
      'Success',
      name: 'c13_7_correct_3',
      desc: '',
      args: [],
    );
  }

  /// `Safety`
  String get c13_7_wrong_1 {
    return Intl.message(
      'Safety',
      name: 'c13_7_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Learning`
  String get c13_7_wrong_2 {
    return Intl.message(
      'Learning',
      name: 'c13_7_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Enjoyment`
  String get c13_7_wrong_3 {
    return Intl.message(
      'Enjoyment',
      name: 'c13_7_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Assessment strategy`
  String get c13_8_title {
    return Intl.message(
      'Assessment strategy',
      name: 'c13_8_title',
      desc: '',
      args: [],
    );
  }

  /// `Assessment strategy: choose the correct assessment strategy to evaluate your students' activity.`
  String get c13_8_question {
    return Intl.message(
      'Assessment strategy: choose the correct assessment strategy to evaluate your students\' activity.',
      name: 'c13_8_question',
      desc: '',
      args: [],
    );
  }

  /// `At the end of the lesson, the children are split into two. Half of the class performs their sequence and a pair from the observers provides feedback on what they did well and what they could improve, then the other half performs their sequence and has feedback provided by a pair from the observers.`
  String get c13_8_correct_1 {
    return Intl.message(
      'At the end of the lesson, the children are split into two. Half of the class performs their sequence and a pair from the observers provides feedback on what they did well and what they could improve, then the other half performs their sequence and has feedback provided by a pair from the observers.',
      name: 'c13_8_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `At the end of the lesson each pair has to perform their partner sequence in front of everyone and the teacher gives them a mark out of 10.`
  String get c13_8_wrong_1 {
    return Intl.message(
      'At the end of the lesson each pair has to perform their partner sequence in front of everyone and the teacher gives them a mark out of 10.',
      name: 'c13_8_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Students fill in a written sheet of paper explaining what they did well and what they could improve on in their partner sequence.`
  String get c13_8_wrong_2 {
    return Intl.message(
      'Students fill in a written sheet of paper explaining what they did well and what they could improve on in their partner sequence.',
      name: 'c13_8_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `You have to pass the last activity to pass the final challenge.  As I said previously, the learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.\nChoose 2 questions for each category.\n`
  String get c13a2_intro {
    return Intl.message(
      'You have to pass the last activity to pass the final challenge.  As I said previously, the learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.\nChoose 2 questions for each category.\n',
      name: 'c13a2_intro',
      desc: '',
      args: [],
    );
  }

  /// `Well done! You have completed challenge 13 so you have collected your badge! Congratulations!!! You have completed all challenges!`
  String get c13a2_finish {
    return Intl.message(
      'Well done! You have completed challenge 13 so you have collected your badge! Congratulations!!! You have completed all challenges!',
      name: 'c13a2_finish',
      desc: '',
      args: [],
    );
  }

  /// `Physical/Move`
  String get c13_9_title {
    return Intl.message(
      'Physical/Move',
      name: 'c13_9_title',
      desc: '',
      args: [],
    );
  }

  /// `Physical/Move: Choose 2 questions related to physical movement improvement.`
  String get c13_9_question {
    return Intl.message(
      'Physical/Move: Choose 2 questions related to physical movement improvement.',
      name: 'c13_9_question',
      desc: '',
      args: [],
    );
  }

  /// `What improvements have you made to your performance? How do you know?`
  String get c13_9_correct_1 {
    return Intl.message(
      'What improvements have you made to your performance? How do you know?',
      name: 'c13_9_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `What can you show now that you couldn’t before the lesson?`
  String get c13_9_correct_2 {
    return Intl.message(
      'What can you show now that you couldn’t before the lesson?',
      name: 'c13_9_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `What new skills did you learn today? Can you show me what the correct technique looks like?`
  String get c13_9_wrong_1 {
    return Intl.message(
      'What new skills did you learn today? Can you show me what the correct technique looks like?',
      name: 'c13_9_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `What new tactics did you learn today? Can you tell me why they are important?`
  String get c13_9_wrong_2 {
    return Intl.message(
      'What new tactics did you learn today? Can you tell me why they are important?',
      name: 'c13_9_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Did you develop any aspects of your fitness today? How will that help you and how could you train that further outside of PE lessons?`
  String get c13_9_wrong_3 {
    return Intl.message(
      'Did you develop any aspects of your fitness today? How will that help you and how could you train that further outside of PE lessons?',
      name: 'c13_9_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `What component of fitness did you apply most effectively in today’s lesson and when? What impact did that have?`
  String get c13_9_wrong_4 {
    return Intl.message(
      'What component of fitness did you apply most effectively in today’s lesson and when? What impact did that have?',
      name: 'c13_9_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `Using no words, demonstrate the teaching points from today to a partner.`
  String get c13_9_wrong_5 {
    return Intl.message(
      'Using no words, demonstrate the teaching points from today to a partner.',
      name: 'c13_9_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate yourself out of 10 for skilful movement today? What could improve your score?`
  String get c13_9_wrong_6 {
    return Intl.message(
      'How would you rate yourself out of 10 for skilful movement today? What could improve your score?',
      name: 'c13_9_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `If you were the coach, how would you teach the skill?`
  String get c13_9_wrong_7 {
    return Intl.message(
      'If you were the coach, how would you teach the skill?',
      name: 'c13_9_wrong_7',
      desc: '',
      args: [],
    );
  }

  /// `How can the movements/skills practiced in this lesson help you in other sports/activities?`
  String get c13_9_wrong_8 {
    return Intl.message(
      'How can the movements/skills practiced in this lesson help you in other sports/activities?',
      name: 'c13_9_wrong_8',
      desc: '',
      args: [],
    );
  }

  /// `Affective/Feel`
  String get c13_10_title {
    return Intl.message(
      'Affective/Feel',
      name: 'c13_10_title',
      desc: '',
      args: [],
    );
  }

  /// `Affective/Feel: Choose 2 questions related to emotional experiences during the lesson.`
  String get c13_10_question {
    return Intl.message(
      'Affective/Feel: Choose 2 questions related to emotional experiences during the lesson.',
      name: 'c13_10_question',
      desc: '',
      args: [],
    );
  }

  /// `How did it feel working with others today?`
  String get c13_10_correct_1 {
    return Intl.message(
      'How did it feel working with others today?',
      name: 'c13_10_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `How confident do you feel about participating in more of this activity?`
  String get c13_10_correct_2 {
    return Intl.message(
      'How confident do you feel about participating in more of this activity?',
      name: 'c13_10_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `What did you like most about today’s lesson? What was the best moment?`
  String get c13_10_wrong_1 {
    return Intl.message(
      'What did you like most about today’s lesson? What was the best moment?',
      name: 'c13_10_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Were there any elements of the lesson that you did not enjoy?`
  String get c13_10_wrong_2 {
    return Intl.message(
      'Were there any elements of the lesson that you did not enjoy?',
      name: 'c13_10_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `What do you wish we had done differently or more of or less of?`
  String get c13_10_wrong_3 {
    return Intl.message(
      'What do you wish we had done differently or more of or less of?',
      name: 'c13_10_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `What element of your PE lesson are you most proud of?`
  String get c13_10_wrong_4 {
    return Intl.message(
      'What element of your PE lesson are you most proud of?',
      name: 'c13_10_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `If you could repeat this lesson, how could you have made it more enjoyable?`
  String get c13_10_wrong_5 {
    return Intl.message(
      'If you could repeat this lesson, how could you have made it more enjoyable?',
      name: 'c13_10_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `Following on from today's lesson, what would you like to learn next?`
  String get c13_10_wrong_6 {
    return Intl.message(
      'Following on from today\'s lesson, what would you like to learn next?',
      name: 'c13_10_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `Do you feel valued in your team/group?`
  String get c13_10_wrong_7 {
    return Intl.message(
      'Do you feel valued in your team/group?',
      name: 'c13_10_wrong_7',
      desc: '',
      args: [],
    );
  }

  /// `How would you score this lesson out of 10 for fun? What could be done to improve that score?`
  String get c13_10_wrong_8 {
    return Intl.message(
      'How would you score this lesson out of 10 for fun? What could be done to improve that score?',
      name: 'c13_10_wrong_8',
      desc: '',
      args: [],
    );
  }

  /// `When did you demonstrate the most confidence in today’s lesson?`
  String get c13_10_wrong_9 {
    return Intl.message(
      'When did you demonstrate the most confidence in today’s lesson?',
      name: 'c13_10_wrong_9',
      desc: '',
      args: [],
    );
  }

  /// `When did you feel out of your comfort zone today?`
  String get c13_10_wrong_10 {
    return Intl.message(
      'When did you feel out of your comfort zone today?',
      name: 'c13_10_wrong_10',
      desc: '',
      args: [],
    );
  }

  /// `Did you feel safe in today’s lesson?`
  String get c13_10_wrong_11 {
    return Intl.message(
      'Did you feel safe in today’s lesson?',
      name: 'c13_10_wrong_11',
      desc: '',
      args: [],
    );
  }

  /// `Cognitive/Think`
  String get c13_11_title {
    return Intl.message(
      'Cognitive/Think',
      name: 'c13_11_title',
      desc: '',
      args: [],
    );
  }

  /// `Cognitive/Think: Choose 2 questions related to cognitive thinking and reflection.`
  String get c13_11_question {
    return Intl.message(
      'Cognitive/Think: Choose 2 questions related to cognitive thinking and reflection.',
      name: 'c13_11_question',
      desc: '',
      args: [],
    );
  }

  /// `What do you need to work on most to improve further?`
  String get c13_11_correct_1 {
    return Intl.message(
      'What do you need to work on most to improve further?',
      name: 'c13_11_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `What different roles could you fulfil in the lesson and what skills are needed for each?`
  String get c13_11_correct_2 {
    return Intl.message(
      'What different roles could you fulfil in the lesson and what skills are needed for each?',
      name: 'c13_11_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `What was the most valuable thing you learnt today? How will you use that learning in the future?`
  String get c13_11_wrong_1 {
    return Intl.message(
      'What was the most valuable thing you learnt today? How will you use that learning in the future?',
      name: 'c13_11_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `How could you do it differently next time?`
  String get c13_11_wrong_2 {
    return Intl.message(
      'How could you do it differently next time?',
      name: 'c13_11_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `What is the most important thing for you to remember from today? How will you remember it?`
  String get c13_11_wrong_3 {
    return Intl.message(
      'What is the most important thing for you to remember from today? How will you remember it?',
      name: 'c13_11_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `Is there anything you can do before our next lesson to develop further or practice what we have done today?`
  String get c13_11_wrong_4 {
    return Intl.message(
      'Is there anything you can do before our next lesson to develop further or practice what we have done today?',
      name: 'c13_11_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `Is there an aspect of this activity you would like to know more about?`
  String get c13_11_wrong_5 {
    return Intl.message(
      'Is there an aspect of this activity you would like to know more about?',
      name: 'c13_11_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `What rules or constraints could you add to make the lesson harder for you?`
  String get c13_11_wrong_6 {
    return Intl.message(
      'What rules or constraints could you add to make the lesson harder for you?',
      name: 'c13_11_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `What could you do to make the lesson easier for you?`
  String get c13_11_wrong_7 {
    return Intl.message(
      'What could you do to make the lesson easier for you?',
      name: 'c13_11_wrong_7',
      desc: '',
      args: [],
    );
  }

  /// `What will you do to be physically active between now and your next lesson?`
  String get c13_11_wrong_8 {
    return Intl.message(
      'What will you do to be physically active between now and your next lesson?',
      name: 'c13_11_wrong_8',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to find out more about?`
  String get c13_11_wrong_9 {
    return Intl.message(
      'What would you like to find out more about?',
      name: 'c13_11_wrong_9',
      desc: '',
      args: [],
    );
  }

  /// `If you were to teach today’s lesson, how might you do it?`
  String get c13_11_wrong_10 {
    return Intl.message(
      'If you were to teach today’s lesson, how might you do it?',
      name: 'c13_11_wrong_10',
      desc: '',
      args: [],
    );
  }

  /// `Social/Connect`
  String get c13_12_title {
    return Intl.message(
      'Social/Connect',
      name: 'c13_12_title',
      desc: '',
      args: [],
    );
  }

  /// `Social/Connect: Choose 2 questions related to social interactions during the lesson.`
  String get c13_12_question {
    return Intl.message(
      'Social/Connect: Choose 2 questions related to social interactions during the lesson.',
      name: 'c13_12_question',
      desc: '',
      args: [],
    );
  }

  /// `How well did you work with others?`
  String get c13_12_correct_1 {
    return Intl.message(
      'How well did you work with others?',
      name: 'c13_12_correct_1',
      desc: '',
      args: [],
    );
  }

  /// `Who showed the most creativity today? What impact did it have?`
  String get c13_12_correct_2 {
    return Intl.message(
      'Who showed the most creativity today? What impact did it have?',
      name: 'c13_12_correct_2',
      desc: '',
      args: [],
    );
  }

  /// `Who was the MVP (most valuable participant)? Why?`
  String get c13_12_wrong_1 {
    return Intl.message(
      'Who was the MVP (most valuable participant)? Why?',
      name: 'c13_12_wrong_1',
      desc: '',
      args: [],
    );
  }

  /// `Who demonstrated the best leadership characteristics in today’s lesson? How did they do this?`
  String get c13_12_wrong_2 {
    return Intl.message(
      'Who demonstrated the best leadership characteristics in today’s lesson? How did they do this?',
      name: 'c13_12_wrong_2',
      desc: '',
      args: [],
    );
  }

  /// `Did you display kindness and respect for others during the lesson? If so, how?`
  String get c13_12_wrong_3 {
    return Intl.message(
      'Did you display kindness and respect for others during the lesson? If so, how?',
      name: 'c13_12_wrong_3',
      desc: '',
      args: [],
    );
  }

  /// `How did relationships with other students impact your progress in this lesson?`
  String get c13_12_wrong_4 {
    return Intl.message(
      'How did relationships with other students impact your progress in this lesson?',
      name: 'c13_12_wrong_4',
      desc: '',
      args: [],
    );
  }

  /// `How would you teach this lesson to a friend?`
  String get c13_12_wrong_5 {
    return Intl.message(
      'How would you teach this lesson to a friend?',
      name: 'c13_12_wrong_5',
      desc: '',
      args: [],
    );
  }

  /// `Describe a moment in the lesson where you helped another student make progress.`
  String get c13_12_wrong_6 {
    return Intl.message(
      'Describe a moment in the lesson where you helped another student make progress.',
      name: 'c13_12_wrong_6',
      desc: '',
      args: [],
    );
  }

  /// `How did you contribute towards a shared goal today?`
  String get c13_12_wrong_7 {
    return Intl.message(
      'How did you contribute towards a shared goal today?',
      name: 'c13_12_wrong_7',
      desc: '',
      args: [],
    );
  }

  /// `How well did you communicate with others today?`
  String get c13_12_wrong_8 {
    return Intl.message(
      'How well did you communicate with others today?',
      name: 'c13_12_wrong_8',
      desc: '',
      args: [],
    );
  }

  /// `Who did you work well with today? Why?`
  String get c13_12_wrong_9 {
    return Intl.message(
      'Who did you work well with today? Why?',
      name: 'c13_12_wrong_9',
      desc: '',
      args: [],
    );
  }

  /// `Where can you access more opportunities to play or do what we learnt today?`
  String get c13_12_wrong_10 {
    return Intl.message(
      'Where can you access more opportunities to play or do what we learnt today?',
      name: 'c13_12_wrong_10',
      desc: '',
      args: [],
    );
  }

  /// `Who is your role model in this class? Why?`
  String get c13_12_wrong_11 {
    return Intl.message(
      'Who is your role model in this class? Why?',
      name: 'c13_12_wrong_11',
      desc: '',
      args: [],
    );
  }

  /// `Attributes`
  String get glossary_Attributes {
    return Intl.message(
      'Attributes',
      name: 'glossary_Attributes',
      desc: '',
      args: [],
    );
  }

  /// `Affective Domain`
  String get glossary_AffectiveDomain {
    return Intl.message(
      'Affective Domain',
      name: 'glossary_AffectiveDomain',
      desc: '',
      args: [],
    );
  }

  /// `Cognitive Domain`
  String get glossary_CognitiveDomain {
    return Intl.message(
      'Cognitive Domain',
      name: 'glossary_CognitiveDomain',
      desc: '',
      args: [],
    );
  }

  /// `Confidence`
  String get glossary_Confidence {
    return Intl.message(
      'Confidence',
      name: 'glossary_Confidence',
      desc: '',
      args: [],
    );
  }

  /// `Domains`
  String get glossary_Domains {
    return Intl.message(
      'Domains',
      name: 'glossary_Domains',
      desc: '',
      args: [],
    );
  }

  /// `Dualism`
  String get glossary_Dualism {
    return Intl.message(
      'Dualism',
      name: 'glossary_Dualism',
      desc: '',
      args: [],
    );
  }

  /// `Embodied`
  String get glossary_Embodied {
    return Intl.message(
      'Embodied',
      name: 'glossary_Embodied',
      desc: '',
      args: [],
    );
  }

  /// `Existentialism`
  String get glossary_Existentialism {
    return Intl.message(
      'Existentialism',
      name: 'glossary_Existentialism',
      desc: '',
      args: [],
    );
  }

  /// `Health Literacy`
  String get glossary_HealthLiteracy {
    return Intl.message(
      'Health Literacy',
      name: 'glossary_HealthLiteracy',
      desc: '',
      args: [],
    );
  }

  /// `Human Dimension`
  String get glossary_HumanDimension {
    return Intl.message(
      'Human Dimension',
      name: 'glossary_HumanDimension',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge and Understanding`
  String get glossary_KnowledgeAndUnderstanding {
    return Intl.message(
      'Knowledge and Understanding',
      name: 'glossary_KnowledgeAndUnderstanding',
      desc: '',
      args: [],
    );
  }

  /// `Literacy`
  String get glossary_Literacy {
    return Intl.message(
      'Literacy',
      name: 'glossary_Literacy',
      desc: '',
      args: [],
    );
  }

  /// `Monism`
  String get glossary_Monism {
    return Intl.message(
      'Monism',
      name: 'glossary_Monism',
      desc: '',
      args: [],
    );
  }

  /// `Motivation`
  String get glossary_Motivation {
    return Intl.message(
      'Motivation',
      name: 'glossary_Motivation',
      desc: '',
      args: [],
    );
  }

  /// `Movement Capacities`
  String get glossary_MovementCapacities {
    return Intl.message(
      'Movement Capacities',
      name: 'glossary_MovementCapacities',
      desc: '',
      args: [],
    );
  }

  /// `Movement Patterns`
  String get glossary_MovementPatterns {
    return Intl.message(
      'Movement Patterns',
      name: 'glossary_MovementPatterns',
      desc: '',
      args: [],
    );
  }

  /// `Movement Vocabulary`
  String get glossary_MovementVocabulary {
    return Intl.message(
      'Movement Vocabulary',
      name: 'glossary_MovementVocabulary',
      desc: '',
      args: [],
    );
  }

  /// `Phenomenology`
  String get glossary_Phenomenology {
    return Intl.message(
      'Phenomenology',
      name: 'glossary_Phenomenology',
      desc: '',
      args: [],
    );
  }

  /// `Physical Activity`
  String get glossary_PhysicalActivity {
    return Intl.message(
      'Physical Activity',
      name: 'glossary_PhysicalActivity',
      desc: '',
      args: [],
    );
  }

  /// `Physical Competence`
  String get glossary_PhysicalCompetence {
    return Intl.message(
      'Physical Competence',
      name: 'glossary_PhysicalCompetence',
      desc: '',
      args: [],
    );
  }

  /// `Physical Domain`
  String get glossary_PhysicalDomain {
    return Intl.message(
      'Physical Domain',
      name: 'glossary_PhysicalDomain',
      desc: '',
      args: [],
    );
  }

  /// `Physical Education`
  String get glossary_PhysicalEducation {
    return Intl.message(
      'Physical Education',
      name: 'glossary_PhysicalEducation',
      desc: '',
      args: [],
    );
  }

  /// `Physical Literacy`
  String get glossary_PhysicalLiteracy {
    return Intl.message(
      'Physical Literacy',
      name: 'glossary_PhysicalLiteracy',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get glossary_Sport {
    return Intl.message(
      'Sport',
      name: 'glossary_Sport',
      desc: '',
      args: [],
    );
  }

  /// `Are the constituent elements of physical literacy that are identified in the full definition of the concept. When developing physical literacy, individuals will discover that they have the potential to develop all the attributes identified in the full definition.`
  String get glossary_Attributes_desc {
    return Intl.message(
      'Are the constituent elements of physical literacy that are identified in the full definition of the concept. When developing physical literacy, individuals will discover that they have the potential to develop all the attributes identified in the full definition.',
      name: 'glossary_Attributes_desc',
      desc: '',
      args: [],
    );
  }

  /// `The affective domain refers to aspects of motivation, confidence, self-esteem, self-confidence and a positive sense of self, developed and nurtured in a range of environments.`
  String get glossary_AffectiveDomain_desc {
    return Intl.message(
      'The affective domain refers to aspects of motivation, confidence, self-esteem, self-confidence and a positive sense of self, developed and nurtured in a range of environments.',
      name: 'glossary_AffectiveDomain_desc',
      desc: '',
      args: [],
    );
  }

  /// `The cognitive domain refers to the knowledge and understanding of fitness and health including exercise, nutrition, sleep, and lifestyle, as well as the development of intelligent action, an understanding of movement, and application of creativity and imagination in a range of environments.`
  String get glossary_CognitiveDomain_desc {
    return Intl.message(
      'The cognitive domain refers to the knowledge and understanding of fitness and health including exercise, nutrition, sleep, and lifestyle, as well as the development of intelligent action, an understanding of movement, and application of creativity and imagination in a range of environments.',
      name: 'glossary_CognitiveDomain_desc',
      desc: '',
      args: [],
    );
  }

  /// `Can be described as the perception of one's own abilities.`
  String get glossary_Confidence_desc {
    return Intl.message(
      'Can be described as the perception of one\'s own abilities.',
      name: 'glossary_Confidence_desc',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy domains refer to the interrelated affective, physical, and cognitive domains that underpin the concept of physical literacy. The behavioral, social, and environmental domains are also referred to in some literature.`
  String get glossary_Domains_desc {
    return Intl.message(
      'Physical literacy domains refer to the interrelated affective, physical, and cognitive domains that underpin the concept of physical literacy. The behavioral, social, and environmental domains are also referred to in some literature.',
      name: 'glossary_Domains_desc',
      desc: '',
      args: [],
    );
  }

  /// `The view that human beings are comprised of two very different and separable 'parts,' being the 'body' and the 'mind'.`
  String get glossary_Dualism_desc {
    return Intl.message(
      'The view that human beings are comprised of two very different and separable \'parts,\' being the \'body\' and the \'mind\'.',
      name: 'glossary_Dualism_desc',
      desc: '',
      args: [],
    );
  }

  /// `In the context of physical literacy, the term embodiment is used specifically to describe the potential individuals have to interact with the environment via our embodied dimension. This covers both embodiment as-lived as well as embodiment as an instrument or object.`
  String get glossary_Embodied_desc {
    return Intl.message(
      'In the context of physical literacy, the term embodiment is used specifically to describe the potential individuals have to interact with the environment via our embodied dimension. This covers both embodiment as-lived as well as embodiment as an instrument or object.',
      name: 'glossary_Embodied_desc',
      desc: '',
      args: [],
    );
  }

  /// `Is a philosophy that is based on the principle that existence precedes essence. In other words, individuals make themselves as they interact with the world.`
  String get glossary_Existentialism_desc {
    return Intl.message(
      'Is a philosophy that is based on the principle that existence precedes essence. In other words, individuals make themselves as they interact with the world.',
      name: 'glossary_Existentialism_desc',
      desc: '',
      args: [],
    );
  }

  /// `The degree to which individuals and groups can obtain, process, understand, evaluate, and act upon information needed to make public health decisions that benefit the community.`
  String get glossary_HealthLiteracy_desc {
    return Intl.message(
      'The degree to which individuals and groups can obtain, process, understand, evaluate, and act upon information needed to make public health decisions that benefit the community.',
      name: 'glossary_HealthLiteracy_desc',
      desc: '',
      args: [],
    );
  }

  /// `An aspect of human being through which individuals can interact with the world and express themselves. Embodiment is one such dimension – hence, embodied dimension.`
  String get glossary_HumanDimension_desc {
    return Intl.message(
      'An aspect of human being through which individuals can interact with the world and express themselves. Embodiment is one such dimension – hence, embodied dimension.',
      name: 'glossary_HumanDimension_desc',
      desc: '',
      args: [],
    );
  }

  /// `Comprised of two main constituents, the first related to grasping essential principles of movement and performance. The second involves developing knowledge and understanding of fitness and health, including understanding the value of physical activity, exercise, appropriate diet, and the need for relaxation and sleep.`
  String get glossary_KnowledgeAndUnderstanding_desc {
    return Intl.message(
      'Comprised of two main constituents, the first related to grasping essential principles of movement and performance. The second involves developing knowledge and understanding of fitness and health, including understanding the value of physical activity, exercise, appropriate diet, and the need for relaxation and sleep.',
      name: 'glossary_KnowledgeAndUnderstanding_desc',
      desc: '',
      args: [],
    );
  }

  /// `Literacy is our embodied interaction with an environment. It includes the use of critical and creative thinking skills and processes, conveying information through various forms of communication, and applying knowledge and skills to make connections within and between various contexts.`
  String get glossary_Literacy_desc {
    return Intl.message(
      'Literacy is our embodied interaction with an environment. It includes the use of critical and creative thinking skills and processes, conveying information through various forms of communication, and applying knowledge and skills to make connections within and between various contexts.',
      name: 'glossary_Literacy_desc',
      desc: '',
      args: [],
    );
  }

  /// `The view that humans are an entity, a whole, and not divisible into separate 'parts,' such as the 'body' and the 'mind'. This is also referred to as a holistic view or holism, indicating that humans are an indivisible 'whole'.`
  String get glossary_Monism_desc {
    return Intl.message(
      'The view that humans are an entity, a whole, and not divisible into separate \'parts,\' such as the \'body\' and the \'mind\'. This is also referred to as a holistic view or holism, indicating that humans are an indivisible \'whole\'.',
      name: 'glossary_Monism_desc',
      desc: '',
      args: [],
    );
  }

  /// `Can be defined as the direction and intensity of one’s effort.`
  String get glossary_Motivation_desc {
    return Intl.message(
      'Can be defined as the direction and intensity of one’s effort.',
      name: 'glossary_Motivation_desc',
      desc: '',
      args: [],
    );
  }

  /// `The constituent abilities of articulate movement.`
  String get glossary_MovementCapacities_desc {
    return Intl.message(
      'The constituent abilities of articulate movement.',
      name: 'glossary_MovementCapacities_desc',
      desc: '',
      args: [],
    );
  }

  /// `General movement patterns comprise the total stock of movements of which the human is capable. The general movement patterns mastered by an individual may be referred to as their movement vocabulary. Specific movement patterns arise when refined movement patterns are applied within specific activity contexts and movement forms.`
  String get glossary_MovementPatterns_desc {
    return Intl.message(
      'General movement patterns comprise the total stock of movements of which the human is capable. The general movement patterns mastered by an individual may be referred to as their movement vocabulary. Specific movement patterns arise when refined movement patterns are applied within specific activity contexts and movement forms.',
      name: 'glossary_MovementPatterns_desc',
      desc: '',
      args: [],
    );
  }

  /// `Refer to movement patterns.`
  String get glossary_MovementVocabulary_desc {
    return Intl.message(
      'Refer to movement patterns.',
      name: 'glossary_MovementVocabulary_desc',
      desc: '',
      args: [],
    );
  }

  /// `Is a philosophy based on the principle that we as human beings give meaning to the world as we perceive it. Objects in the world have no meaning prior to an individual’s perception of that feature.`
  String get glossary_Phenomenology_desc {
    return Intl.message(
      'Is a philosophy based on the principle that we as human beings give meaning to the world as we perceive it. Objects in the world have no meaning prior to an individual’s perception of that feature.',
      name: 'glossary_Phenomenology_desc',
      desc: '',
      args: [],
    );
  }

  /// `Any bodily movement produced by skeletal muscles that requires energy expenditure.`
  String get glossary_PhysicalActivity_desc {
    return Intl.message(
      'Any bodily movement produced by skeletal muscles that requires energy expenditure.',
      name: 'glossary_PhysicalActivity_desc',
      desc: '',
      args: [],
    );
  }

  /// `Can be described as the sufficiency in movement vocabulary, movement capacities, and developed movement patterns, plus the deployment of these in a range of movement forms.`
  String get glossary_PhysicalCompetence_desc {
    return Intl.message(
      'Can be described as the sufficiency in movement vocabulary, movement capacities, and developed movement patterns, plus the deployment of these in a range of movement forms.',
      name: 'glossary_PhysicalCompetence_desc',
      desc: '',
      args: [],
    );
  }

  /// `The physical domain encourages the nurturing of physical competence in a range of environments in order to develop a rich and wide-ranging movement vocabulary.`
  String get glossary_PhysicalDomain_desc {
    return Intl.message(
      'The physical domain encourages the nurturing of physical competence in a range of environments in order to develop a rich and wide-ranging movement vocabulary.',
      name: 'glossary_PhysicalDomain_desc',
      desc: '',
      args: [],
    );
  }

  /// `Physical education is the school subject in which children do physical exercises or take part in physical games and sports.`
  String get glossary_PhysicalEducation_desc {
    return Intl.message(
      'Physical education is the school subject in which children do physical exercises or take part in physical games and sports.',
      name: 'glossary_PhysicalEducation_desc',
      desc: '',
      args: [],
    );
  }

  /// `Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.`
  String get glossary_PhysicalLiteracy_desc {
    return Intl.message(
      'Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.',
      name: 'glossary_PhysicalLiteracy_desc',
      desc: '',
      args: [],
    );
  }

  /// `Sport is most often used to refer to competitive games or physical activities. Typically, in this context, sports are governed by an agreed set of rules and require participants to learn and exhibit physical athleticism and skill. Sports are used within the Physical Education curriculum to provide learning experiences.`
  String get glossary_Sport_desc {
    return Intl.message(
      'Sport is most often used to refer to competitive games or physical activities. Typically, in this context, sports are governed by an agreed set of rules and require participants to learn and exhibit physical athleticism and skill. Sports are used within the Physical Education curriculum to provide learning experiences.',
      name: 'glossary_Sport_desc',
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
