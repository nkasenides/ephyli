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

  /// `Click on the selection you think is correct.`
  String get c2a2_instruction {
    return Intl.message(
      'Click on the selection you think is correct.',
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
