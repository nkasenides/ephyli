import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('el'),
    Locale.fromSubtags(
        languageCode: 'el', countryCode: 'nicos', scriptCode: 'backup'),
    Locale('en'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ePhyLi!'**
  String get tagline;

  /// No description provided for @welcomeText.
  ///
  /// In en, this message translates to:
  /// **'Your journey into Physical Literacy is going to start!'**
  String get welcomeText;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @greek.
  ///
  /// In en, this message translates to:
  /// **'Greek'**
  String get greek;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @luxenbourgese.
  ///
  /// In en, this message translates to:
  /// **'Luxenbourgese'**
  String get luxenbourgese;

  /// No description provided for @polish.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get polish;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @whatIsYourName.
  ///
  /// In en, this message translates to:
  /// **'What is your name?'**
  String get whatIsYourName;

  /// No description provided for @customizeAvatar.
  ///
  /// In en, this message translates to:
  /// **'Customize your avatar'**
  String get customizeAvatar;

  /// No description provided for @pleaseProvideAValue.
  ///
  /// In en, this message translates to:
  /// **'Please provide a value'**
  String get pleaseProvideAValue;

  /// No description provided for @invalidPersonName.
  ///
  /// In en, this message translates to:
  /// **'Invalid name'**
  String get invalidPersonName;

  /// No description provided for @ePhyLiBuddy.
  ///
  /// In en, this message translates to:
  /// **'ePhyLi Buddy'**
  String get ePhyLiBuddy;

  /// No description provided for @ePhyLiBuddyIntroHeadline.
  ///
  /// In en, this message translates to:
  /// **'Your ePhyLi buddy'**
  String get ePhyLiBuddyIntroHeadline;

  /// No description provided for @buddyIntro.
  ///
  /// In en, this message translates to:
  /// **'This is your ePhyLi buddy. They can help you with valuable information about the game, and guide you to complete our challenges. Select your buddy by clicking on the arrows below and then click \'Proceed\'.'**
  String get buddyIntro;

  /// No description provided for @buddy_description.
  ///
  /// In en, this message translates to:
  /// **'You can also call me if you need help with an activity. I can provide extra help or hints.'**
  String get buddy_description;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @news_description.
  ///
  /// In en, this message translates to:
  /// **'Here you can read news articles, posts, and more, related to Physical Literacy.'**
  String get news_description;

  /// No description provided for @glossary.
  ///
  /// In en, this message translates to:
  /// **'Glossary'**
  String get glossary;

  /// No description provided for @glossary_description.
  ///
  /// In en, this message translates to:
  /// **'You can find terminology related to Physical Literacy in the Glossary.'**
  String get glossary_description;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profile_description.
  ///
  /// In en, this message translates to:
  /// **'You can also manage your profile and preferences here.'**
  String get profile_description;

  /// No description provided for @tutorial_text.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ePhyLi, your journey into Physical Literacy is going to start!\n\nEmbark on a unique mission to transform your life through knowledge, activity, and community. Navigate through challenges, and unlock the secrets of a healthy lifestyle. Your task is not just to play but to evolve, learning about physical health and well-being. Solve tasks and challenges, make impactful choices, and chart your progress in an engaging world where every step counts towards your ultimate goal: mastering Physical Literacy.\n\nReady to begin your adventure?'**
  String get tutorial_text;

  /// No description provided for @ready_letsgo.
  ///
  /// In en, this message translates to:
  /// **'Yes, let\'s go!'**
  String get ready_letsgo;

  /// No description provided for @tutorial_text_buddy.
  ///
  /// In en, this message translates to:
  /// **'Hi, I am your ePhyLi buddy, a virtual companion designed to guide and assist you throughout the game. Let me introduce you to the game with a brief tutorial.'**
  String get tutorial_text_buddy;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @tutorialTextChallenges.
  ///
  /// In en, this message translates to:
  /// **'Well done! Now I am going to explain how you can start playing. The game consists of several challenges that you must complete in order.\n\nI have already unlocked the first challenge for you. Once you complete a challenge, the next will be unlocked. Each challenge will reward you with points, which can help you level up your avatar. You can also gather badges through the challenges, or various other activities, by interacting with the various features of the app.'**
  String get tutorialTextChallenges;

  /// No description provided for @exploreChallenges.
  ///
  /// In en, this message translates to:
  /// **'Ok, let\'s explore the challenges!'**
  String get exploreChallenges;

  /// No description provided for @challengesTextTutorial.
  ///
  /// In en, this message translates to:
  /// **'These are the challenges you must complete. Each of these challenges may consist of multiple activities, and once you complete all activities in a challenge, I will unlock the next challenge for you. Always remember to use my help if you get stuck in an activity, and remember to use the resources in the news and glossary sections.\n\nOur tutorial is finished. I think you are ready to get started!'**
  String get challengesTextTutorial;

  /// No description provided for @challengesTextNormal.
  ///
  /// In en, this message translates to:
  /// **'You have completed %1 out of %2 challenges so far. Would you like to try the next challenge?'**
  String get challengesTextNormal;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @newBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Badge collected'**
  String get newBadgeTitle;

  /// No description provided for @newBadgeText.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have received a new badge. Well done!'**
  String get newBadgeText;

  /// No description provided for @viewBadges.
  ///
  /// In en, this message translates to:
  /// **'View badges'**
  String get viewBadges;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @activities.
  ///
  /// In en, this message translates to:
  /// **'activities'**
  String get activities;

  /// No description provided for @challengesTextNormalInitial.
  ///
  /// In en, this message translates to:
  /// **'Hey %1! It\'s time to get started! Would you like to try the next challenge?'**
  String get challengesTextNormalInitial;

  /// No description provided for @challengesTextFinishedAll.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have completed all the challenges. Would you like to replay any of them?'**
  String get challengesTextFinishedAll;

  /// No description provided for @nextChallengeUnlocked.
  ///
  /// In en, this message translates to:
  /// **'The next challenge has been unlocked.'**
  String get nextChallengeUnlocked;

  /// No description provided for @challengeLocked.
  ///
  /// In en, this message translates to:
  /// **'This challenge is locked'**
  String get challengeLocked;

  /// No description provided for @challengeLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'This challenge is locked. Complete the previous challenges to unlock.'**
  String get challengeLockedMessage;

  /// No description provided for @activityLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'This activity is locked. Complete the previous activities to unlock.'**
  String get activityLockedMessage;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred.'**
  String get error;

  /// No description provided for @lets_start.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start!'**
  String get lets_start;

  /// No description provided for @resetGame.
  ///
  /// In en, this message translates to:
  /// **'Reset game'**
  String get resetGame;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// No description provided for @resetLoseProgressMessage.
  ///
  /// In en, this message translates to:
  /// **'This will reset your current progress.'**
  String get resetLoseProgressMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @gameOver.
  ///
  /// In en, this message translates to:
  /// **'Game over'**
  String get gameOver;

  /// No description provided for @alreadyPlayedActivity.
  ///
  /// In en, this message translates to:
  /// **'You have already participated in this activity. Would you like to replay it?'**
  String get alreadyPlayedActivity;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @unableToStartActivity.
  ///
  /// In en, this message translates to:
  /// **'Error - This activity cannot be started.'**
  String get unableToStartActivity;

  /// No description provided for @clickOnImageToZoom.
  ///
  /// In en, this message translates to:
  /// **'Press the image to zoom in for more detail.'**
  String get clickOnImageToZoom;

  /// No description provided for @clickToViewArticle.
  ///
  /// In en, this message translates to:
  /// **'Click here to read the article'**
  String get clickToViewArticle;

  /// No description provided for @clickOKToContinue.
  ///
  /// In en, this message translates to:
  /// **'Click OK to continue'**
  String get clickOKToContinue;

  /// No description provided for @challenges_unlocked.
  ///
  /// In en, this message translates to:
  /// **'%1 challenge(s) were unlocked!'**
  String get challenges_unlocked;

  /// No description provided for @screen_flip_notice.
  ///
  /// In en, this message translates to:
  /// **'Your screen will change to landscape mode for this activity.'**
  String get screen_flip_notice;

  /// No description provided for @drop_here.
  ///
  /// In en, this message translates to:
  /// **'Drop here'**
  String get drop_here;

  /// No description provided for @available_cards.
  ///
  /// In en, this message translates to:
  /// **'Available cards'**
  String get available_cards;

  /// No description provided for @dragging.
  ///
  /// In en, this message translates to:
  /// **'Dragging...'**
  String get dragging;

  /// No description provided for @well_done.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get well_done;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get try_again;

  /// No description provided for @check_solution.
  ///
  /// In en, this message translates to:
  /// **'Check solution'**
  String get check_solution;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @pleaseTurnDevice.
  ///
  /// In en, this message translates to:
  /// **'Please rotate your device.'**
  String get pleaseTurnDevice;

  /// No description provided for @badges_view_title.
  ///
  /// In en, this message translates to:
  /// **'Your badges'**
  String get badges_view_title;

  /// No description provided for @you_have_earned_badge.
  ///
  /// In en, this message translates to:
  /// **'You have earned this badge. Well done!'**
  String get you_have_earned_badge;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @glossary_instructions.
  ///
  /// In en, this message translates to:
  /// **'This is a glossary - a list of terms related to physical literacy and their descriptions. Scroll through the list below to find the term you need and click it to view its description.'**
  String get glossary_instructions;

  /// No description provided for @under_construction.
  ///
  /// In en, this message translates to:
  /// **'Under construction'**
  String get under_construction;

  /// No description provided for @enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enter_name;

  /// No description provided for @pick_avatar.
  ///
  /// In en, this message translates to:
  /// **'Customize your avatar'**
  String get pick_avatar;

  /// No description provided for @pick_buddy.
  ///
  /// In en, this message translates to:
  /// **'Select your ePhyLi buddy'**
  String get pick_buddy;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @no_badges_yet.
  ///
  /// In en, this message translates to:
  /// **'You have not earned any badges yet. Complete some challenges to earn badges.'**
  String get no_badges_yet;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @project_description.
  ///
  /// In en, this message translates to:
  /// **'ePhyLi is an Erasmus+ Sport funded project that aims to promote physical literacy and healthy lifestyles through digital materials for university students.'**
  String get project_description;

  /// No description provided for @visit_website.
  ///
  /// In en, this message translates to:
  /// **'Visit the project\'s website'**
  String get visit_website;

  /// No description provided for @about_the_app.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get about_the_app;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get change_language;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacy_policy;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @c1a1_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 1. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?'**
  String get c1a1_welcome;

  /// No description provided for @c1a1_congrats.
  ///
  /// In en, this message translates to:
  /// **'Well done! All concepts are correctly matched to the related descriptions.'**
  String get c1a1_congrats;

  /// No description provided for @c1a1_reading_instruction.
  ///
  /// In en, this message translates to:
  /// **'Read the scientific article extract reported below to start the next step of the challenge.'**
  String get c1a1_reading_instruction;

  /// No description provided for @c1a1_5mistakesReset.
  ///
  /// In en, this message translates to:
  /// **'You have made 5 mistakes, and the game will restart.'**
  String get c1a1_5mistakesReset;

  /// No description provided for @c1a2_bubble1.
  ///
  /// In en, this message translates to:
  /// **'Advances in technology and lifestyle changes'**
  String get c1a2_bubble1;

  /// No description provided for @c1a2_bubble2.
  ///
  /// In en, this message translates to:
  /// **'minimize the need for physical interaction with the environment.'**
  String get c1a2_bubble2;

  /// No description provided for @c1a2_bubble3.
  ///
  /// In en, this message translates to:
  /// **'For example, public or private transport decreases the need for (physical) movement to get around.'**
  String get c1a2_bubble3;

  /// No description provided for @c1a2_bubble4.
  ///
  /// In en, this message translates to:
  /// **'This leads to an increased risk of developing pathologies.'**
  String get c1a2_bubble4;

  /// No description provided for @c1a2_bubble5.
  ///
  /// In en, this message translates to:
  /// **'Sedentary behaviours affect health, but they also have profound implications for mental and emotional well-being.'**
  String get c1a2_bubble5;

  /// No description provided for @c1a2_bubbles_instructions.
  ///
  /// In en, this message translates to:
  /// **'Read and then press each bubble to reveal the next.'**
  String get c1a2_bubbles_instructions;

  /// No description provided for @c1a2_finish.
  ///
  /// In en, this message translates to:
  /// **'Rekindling our relationship with physical activity and the environment is imperative to leading a healthy and fulfilling life. Read this scientific article to find out more.'**
  String get c1a2_finish;

  /// No description provided for @c2a1_intro_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the end of the XIX century. Arrange the cards on the golden timeline matching the concept of Physical Literacy with the historical data. Ready? Let\'s start!'**
  String get c2a1_intro_message;

  /// No description provided for @c2a1_term1.
  ///
  /// In en, this message translates to:
  /// **'American Army Captain used the word “Physical Literacy” to describe the physicality or movement quality of an indigenous culture.'**
  String get c2a1_term1;

  /// No description provided for @c2a1_term2.
  ///
  /// In en, this message translates to:
  /// **'American educators stated: “We must prepare for physical literacy as well as for mental literacy”, responding to an upcoming era of modernization and army recruitment.'**
  String get c2a1_term2;

  /// No description provided for @c2a1_term3.
  ///
  /// In en, this message translates to:
  /// **'Margaret Whitehead promotes discussion on the Physical Literacy concept.'**
  String get c2a1_term3;

  /// No description provided for @c2a1_term4.
  ///
  /// In en, this message translates to:
  /// **'The word \'Physical Literacy\' was used to describe \'A disciplined command over the body\'.'**
  String get c2a1_term4;

  /// No description provided for @c2a1_term5.
  ///
  /// In en, this message translates to:
  /// **'Margaret Whitehead published a scientific article in the European Journal of Physical Education to promote an open debate on the Physical Literacy concept.'**
  String get c2a1_term5;

  /// No description provided for @c2a1_term6.
  ///
  /// In en, this message translates to:
  /// **'Holistic approach to the concept of Physical Literacy, identifying four dimensions: physical, emotional, social and cognitive dimensions.'**
  String get c2a1_term6;

  /// No description provided for @c2a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! All the cards are correctly arranged! Let\'s move on to the next activity.'**
  String get c2a1_finish_message;

  /// No description provided for @c2a2_intro_message.
  ///
  /// In en, this message translates to:
  /// **'In recent years, different countries have adopted different definitions of physical literacy. In the following activity you must link the definition of physical literacy to the country in which it is adopted.'**
  String get c2a2_intro_message;

  /// No description provided for @c2a2_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You have finished this challenge!'**
  String get c2a2_finish_message;

  /// No description provided for @c2a2_instruction.
  ///
  /// In en, this message translates to:
  /// **'Who adopted the above definition? Click on the selection you think is correct.'**
  String get c2a2_instruction;

  /// No description provided for @c2a2_term1.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.'**
  String get c2a2_term1;

  /// No description provided for @c2a2_term2.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy is about building the skills, knowledge, and behaviors that give us the confidence and motivation to lead active lives.'**
  String get c2a2_term2;

  /// No description provided for @c2a2_term3.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy is the ability, confidence, and desire to be physically active for life.'**
  String get c2a2_term3;

  /// No description provided for @c2a2_term4.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy is our relationship with movement and physical activity throughout life.'**
  String get c2a2_term4;

  /// No description provided for @c2a2_option1.
  ///
  /// In en, this message translates to:
  /// **'IPLA, Ireland, Northern Ireland, Canada'**
  String get c2a2_option1;

  /// No description provided for @c2a2_option2.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get c2a2_option2;

  /// No description provided for @c2a2_option3.
  ///
  /// In en, this message translates to:
  /// **'USA'**
  String get c2a2_option3;

  /// No description provided for @c2a2_option4.
  ///
  /// In en, this message translates to:
  /// **'England'**
  String get c2a2_option4;

  /// No description provided for @c3a1_intro_message.
  ///
  /// In en, this message translates to:
  /// **'Arrange the cards in chronological order (top to bottom), matching the Jurbala’s spiral of physical literacy development. Ready?'**
  String get c3a1_intro_message;

  /// No description provided for @c3a1_activity_message.
  ///
  /// In en, this message translates to:
  /// **'Drag the cards to sort them in the correct order based on Jurbala’s spiral of physical literacy. You can scroll through the slots on the top or the cards at the bottom to see all options.'**
  String get c3a1_activity_message;

  /// No description provided for @c3a1_success.
  ///
  /// In en, this message translates to:
  /// **'Well done! You sorted the cards correctly!'**
  String get c3a1_success;

  /// No description provided for @c3a1_fail.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{There are no mistakes.} =1{There is 1 mistake in the card order.} other{There are {count} mistakes in the card order.}}'**
  String c3a1_fail(num count);

  /// No description provided for @c3a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you have finished the challenge. Click \'Finish\' to earn a badge!'**
  String get c3a1_finish_message;

  /// No description provided for @c3a1_term1.
  ///
  /// In en, this message translates to:
  /// **'Enriched movement environment'**
  String get c3a1_term1;

  /// No description provided for @c3a1_term2.
  ///
  /// In en, this message translates to:
  /// **'Extensive developmental participation'**
  String get c3a1_term2;

  /// No description provided for @c3a1_term3.
  ///
  /// In en, this message translates to:
  /// **'Increased movement repertoire'**
  String get c3a1_term3;

  /// No description provided for @c3a1_term4.
  ///
  /// In en, this message translates to:
  /// **'Improved proficiency across repertoire'**
  String get c3a1_term4;

  /// No description provided for @c3a1_term5.
  ///
  /// In en, this message translates to:
  /// **'Improved adaptability to new movements'**
  String get c3a1_term5;

  /// No description provided for @c3a1_term6.
  ///
  /// In en, this message translates to:
  /// **'Increased self-efficacy'**
  String get c3a1_term6;

  /// No description provided for @c3a1_term7.
  ///
  /// In en, this message translates to:
  /// **'Increased disposition to try new activities'**
  String get c3a1_term7;

  /// No description provided for @c3a1_term8.
  ///
  /// In en, this message translates to:
  /// **'Increased success in new activities'**
  String get c3a1_term8;

  /// No description provided for @c3a1_term9.
  ///
  /// In en, this message translates to:
  /// **'Retention in new activities'**
  String get c3a1_term9;

  /// No description provided for @c3a1_term10.
  ///
  /// In en, this message translates to:
  /// **'Increased participation'**
  String get c3a1_term10;

  /// No description provided for @c3a1_term11.
  ///
  /// In en, this message translates to:
  /// **'Improved health'**
  String get c3a1_term11;

  /// No description provided for @c3a1_term12.
  ///
  /// In en, this message translates to:
  /// **'Improved quality of life'**
  String get c3a1_term12;

  /// No description provided for @c4a1_intro_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Challenge 4. You will be immersed in different real-life scenarios. Think about the factors or strategies that influence the motivation to engage in physical activity/movement. You need to pick the factors which apply to each scenario. In each scenario there can be more than one factor which applies. Ready?'**
  String get c4a1_intro_message;

  /// No description provided for @c4a1_instruction_message.
  ///
  /// In en, this message translates to:
  /// **'It\'s a sunny Sunday. Decide which leisure activity would be best for a child. Click on the qualities shown on the screen for each activity, trying to identify which ones could be proposed to increase the child\'s Physical Literacy. Be careful! If you click on the wrong quality your selection will be reset. When you are finished, click \'Check solution\' to check your solution.'**
  String get c4a1_instruction_message;

  /// No description provided for @c4a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the activity. Let\'s move on!'**
  String get c4a1_finish_message;

  /// No description provided for @c4a1_category_funny.
  ///
  /// In en, this message translates to:
  /// **'Fun'**
  String get c4a1_category_funny;

  /// No description provided for @c4a1_category_social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get c4a1_category_social;

  /// No description provided for @c4a1_category_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get c4a1_category_active;

  /// No description provided for @c4a1_category_movements.
  ///
  /// In en, this message translates to:
  /// **'Includes different movements'**
  String get c4a1_category_movements;

  /// No description provided for @c4a1_term1.
  ///
  /// In en, this message translates to:
  /// **'Playing video games using tablet, smartphone or PC, or watching TV alone.'**
  String get c4a1_term1;

  /// No description provided for @c4a1_term2.
  ///
  /// In en, this message translates to:
  /// **'Playing cards with friends at home'**
  String get c4a1_term2;

  /// No description provided for @c4a1_term3.
  ///
  /// In en, this message translates to:
  /// **'Gardening with family members'**
  String get c4a1_term3;

  /// No description provided for @c4a1_term4.
  ///
  /// In en, this message translates to:
  /// **'Playing with dog'**
  String get c4a1_term4;

  /// No description provided for @c4a1_term5.
  ///
  /// In en, this message translates to:
  /// **'Telling stories sitting on the sofa'**
  String get c4a1_term5;

  /// No description provided for @c4a1_term6.
  ///
  /// In en, this message translates to:
  /// **'Walking in the neighbourhood with family members'**
  String get c4a1_term6;

  /// No description provided for @c4a2_instruction_message.
  ///
  /// In en, this message translates to:
  /// **'It\'s a sunny elementary school day. Assume the role of a PE teacher and assign qualities to each activity to identify which ones could be proposed to your students to improve their Physical Literacy during the breaks.'**
  String get c4a2_instruction_message;

  /// No description provided for @c4a2_term1.
  ///
  /// In en, this message translates to:
  /// **'Playing with tablet and smartphone.'**
  String get c4a2_term1;

  /// No description provided for @c4a2_term2.
  ///
  /// In en, this message translates to:
  /// **'Drawing and painting'**
  String get c4a2_term2;

  /// No description provided for @c4a2_term3.
  ///
  /// In en, this message translates to:
  /// **'Telling stories while sitting on the schoolyard'**
  String get c4a2_term3;

  /// No description provided for @c4a2_term4.
  ///
  /// In en, this message translates to:
  /// **'Telling a story that requires children to imitate movements of animals'**
  String get c4a2_term4;

  /// No description provided for @c4a2_term5.
  ///
  /// In en, this message translates to:
  /// **'Playing with a ball'**
  String get c4a2_term5;

  /// No description provided for @c4a2_term6.
  ///
  /// In en, this message translates to:
  /// **'Playing seek and hide'**
  String get c4a2_term6;

  /// No description provided for @c4a3_intro_message.
  ///
  /// In en, this message translates to:
  /// **'Our third scenario is based on the ecological model of the determinants of physical activity. In the next activity, you need to match each factor with its correct category.'**
  String get c4a3_intro_message;

  /// No description provided for @c4a3_instruction_message.
  ///
  /// In en, this message translates to:
  /// **'Move the factors in the middle circle influencing engagement in physical activity to the right variables (outter circles).'**
  String get c4a3_instruction_message;

  /// No description provided for @c4a3_info_message.
  ///
  /// In en, this message translates to:
  /// **'Here is a quick reminder of how the model looks. You can click on the image to zoom in.'**
  String get c4a3_info_message;

  /// No description provided for @c4a3_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the fourth challenge. Press \'Finish\' to get your badge!'**
  String get c4a3_finish_message;

  /// No description provided for @individual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get individual;

  /// No description provided for @social_environment.
  ///
  /// In en, this message translates to:
  /// **'Social environment'**
  String get social_environment;

  /// No description provided for @organizations_and_institutions.
  ///
  /// In en, this message translates to:
  /// **'Organizations and institutions'**
  String get organizations_and_institutions;

  /// No description provided for @physical_environment.
  ///
  /// In en, this message translates to:
  /// **'Physical environment'**
  String get physical_environment;

  /// No description provided for @regional_or_national_policy.
  ///
  /// In en, this message translates to:
  /// **'Regional or national policy'**
  String get regional_or_national_policy;

  /// No description provided for @culture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get culture;

  /// No description provided for @motivation.
  ///
  /// In en, this message translates to:
  /// **'Motivation'**
  String get motivation;

  /// No description provided for @beliefs.
  ///
  /// In en, this message translates to:
  /// **'Beliefs'**
  String get beliefs;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @self_efficacy.
  ///
  /// In en, this message translates to:
  /// **'Self-efficacy'**
  String get self_efficacy;

  /// No description provided for @family.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get family;

  /// No description provided for @friends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get friends;

  /// No description provided for @cultural_norms.
  ///
  /// In en, this message translates to:
  /// **'Cultural norms'**
  String get cultural_norms;

  /// No description provided for @colleagues.
  ///
  /// In en, this message translates to:
  /// **'Colleagues'**
  String get colleagues;

  /// No description provided for @schools.
  ///
  /// In en, this message translates to:
  /// **'Schools'**
  String get schools;

  /// No description provided for @community_clubs.
  ///
  /// In en, this message translates to:
  /// **'Community Clubs'**
  String get community_clubs;

  /// No description provided for @organizations.
  ///
  /// In en, this message translates to:
  /// **'Organisations'**
  String get organizations;

  /// No description provided for @workplace.
  ///
  /// In en, this message translates to:
  /// **'Workplace'**
  String get workplace;

  /// No description provided for @built_environment.
  ///
  /// In en, this message translates to:
  /// **'Built environment'**
  String get built_environment;

  /// No description provided for @active_opportunities.
  ///
  /// In en, this message translates to:
  /// **'Active travel opportunities '**
  String get active_opportunities;

  /// No description provided for @parks_recreation.
  ///
  /// In en, this message translates to:
  /// **'Parks and recreation facilities'**
  String get parks_recreation;

  /// No description provided for @natural_spaces.
  ///
  /// In en, this message translates to:
  /// **'Natural spaces '**
  String get natural_spaces;

  /// No description provided for @transport_systems.
  ///
  /// In en, this message translates to:
  /// **'Transport systems'**
  String get transport_systems;

  /// No description provided for @health_sector.
  ///
  /// In en, this message translates to:
  /// **'Health sector'**
  String get health_sector;

  /// No description provided for @education_school.
  ///
  /// In en, this message translates to:
  /// **'Education and school sector'**
  String get education_school;

  /// No description provided for @organized_sport.
  ///
  /// In en, this message translates to:
  /// **'Organised sport sector'**
  String get organized_sport;

  /// No description provided for @national.
  ///
  /// In en, this message translates to:
  /// **'National'**
  String get national;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @c5a1_intro_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Challenge 5. You are challenged to complete the diagram which follows by filling in the missing elements. Click on the yellow boxes and then pick the right element for that part of the diagram. Ready?'**
  String get c5a1_intro_message;

  /// No description provided for @c5a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the fifth challenge. Press \'Finish\' to get your badge!'**
  String get c5a1_finish_message;

  /// No description provided for @c5a1_instruction_title.
  ///
  /// In en, this message translates to:
  /// **'Choose element'**
  String get c5a1_instruction_title;

  /// No description provided for @c5a1_instruction_place.
  ///
  /// In en, this message translates to:
  /// **'Click the element you would like to place in this area:'**
  String get c5a1_instruction_place;

  /// No description provided for @c5a1_help.
  ///
  /// In en, this message translates to:
  /// **'Click on the yellow boxes to fill in the empty parts of the diagram.'**
  String get c5a1_help;

  /// No description provided for @currentElement.
  ///
  /// In en, this message translates to:
  /// **'Selected element:'**
  String get currentElement;

  /// No description provided for @c6a1_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 6. Match the concepts presented below to the appropriate descriptions. Be careful! If you make five mistakes, the challenge will restart from the beginning. Ready?'**
  String get c6a1_welcome;

  /// No description provided for @c6a1_congrats.
  ///
  /// In en, this message translates to:
  /// **'Well done! All concepts are correctly matched to the related descriptions. Click \'Finish\' to earn a badge.'**
  String get c6a1_congrats;

  /// No description provided for @c7a1_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 7. You will be shown scenarios representing the progression levels of a student\'s sports practice in relation to the four physical literacy dimensions (physical, affective, social, and cognitive). For each scenario, you need to identify the correct progression level by dragging the scenario to the correct level. Ready?'**
  String get c7a1_welcome;

  /// No description provided for @c7a1_instruction.
  ///
  /// In en, this message translates to:
  /// **'Identify the correct level for this scenario:'**
  String get c7a1_instruction;

  /// No description provided for @c7a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the seventh challenge. Press \'Finish\' to get your badge!'**
  String get c7a1_finish_message;

  /// No description provided for @limited_motor_skills.
  ///
  /// In en, this message translates to:
  /// **'The student has very limited motor skills and has difficulty approaching the basic movements of volleyball (physical dimension).'**
  String get limited_motor_skills;

  /// No description provided for @lack_of_rules_knowledge.
  ///
  /// In en, this message translates to:
  /// **'The student does not know the rules of the basketball game and does not know the health benefits related to sports practice (cognitive dimension).'**
  String get lack_of_rules_knowledge;

  /// No description provided for @lack_of_motivation.
  ///
  /// In en, this message translates to:
  /// **'The student does not want to participate in PE lessons at school because he/she is not confident or motivated enough (affective dimension).'**
  String get lack_of_motivation;

  /// No description provided for @lack_of_social_support.
  ///
  /// In en, this message translates to:
  /// **'The student does not have relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).'**
  String get lack_of_social_support;

  /// No description provided for @developing_motor_skills.
  ///
  /// In en, this message translates to:
  /// **'The student is developing basic motor skills in volleyball and has a greater awareness of his/her own physical abilities (physical dimension).'**
  String get developing_motor_skills;

  /// No description provided for @basic_rules_knowledge.
  ///
  /// In en, this message translates to:
  /// **'The student can describe the rules of the basketball game and understand the health benefits related to sports practice (cognitive dimension).'**
  String get basic_rules_knowledge;

  /// No description provided for @wants_to_participate.
  ///
  /// In en, this message translates to:
  /// **'The student wants to participate in physical education classes at school and is aware of the possibility of improvement (affective dimension).'**
  String get wants_to_participate;

  /// No description provided for @positive_social_support.
  ///
  /// In en, this message translates to:
  /// **'The student is building positive relationships that stimulate and support him/her in participating in extracurricular sports activities (social dimension).'**
  String get positive_social_support;

  /// No description provided for @adapts_to_game.
  ///
  /// In en, this message translates to:
  /// **'The student knows how to adapt to the game situations of volleyball and is physically capable of dealing with them (physical dimension).'**
  String get adapts_to_game;

  /// No description provided for @strategic_analysis.
  ///
  /// In en, this message translates to:
  /// **'The student can analyse and adapt strategies to the game situation of basketball and understand the health benefits related to sports practice (cognitive dimension).'**
  String get strategic_analysis;

  /// No description provided for @enthusiastic_participation.
  ///
  /// In en, this message translates to:
  /// **'The student is enthusiastic about participating in physical education classes at school and is aware of his/her level of involvement (affective dimension).'**
  String get enthusiastic_participation;

  /// No description provided for @independent_and_socially_skilled.
  ///
  /// In en, this message translates to:
  /// **'The student demonstrates independence and positive interpersonal skills that contribute to increased participation in extracurricular sporting activities (social dimension).'**
  String get independent_and_socially_skilled;

  /// No description provided for @preliminary_level.
  ///
  /// In en, this message translates to:
  /// **'Preliminary level'**
  String get preliminary_level;

  /// No description provided for @developer_level.
  ///
  /// In en, this message translates to:
  /// **'Developer level'**
  String get developer_level;

  /// No description provided for @advanced_level.
  ///
  /// In en, this message translates to:
  /// **'Advanced level'**
  String get advanced_level;

  /// No description provided for @c8a1_instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Challenge 8! Assume the role of a physical education teacher of children 6-year-olds and choose from three different games for each physical activity session to teach a fundamental movement. Each game is classified according to three parameters, represented by three bottles: (I) appropriate motor skills background, (II) inclusion/teamwork, and (III) enjoyment. The score for each parameter ranges from 1 to 3 points and represents the level of water that will be poured into the bottle. To pass the challenge you must fill the three bottles by choosing the most appropriate game. Ready?'**
  String get c8a1_instructions;

  /// No description provided for @c8a1_prompt.
  ///
  /// In en, this message translates to:
  /// **'Select the most appropriate option to achieve a balance between the three parameters.'**
  String get c8a1_prompt;

  /// No description provided for @c8a1_wrong.
  ///
  /// In en, this message translates to:
  /// **'That is not the right balance. Please try a different option.'**
  String get c8a1_wrong;

  /// No description provided for @c8a1_please_select_option.
  ///
  /// In en, this message translates to:
  /// **'Please select an option.'**
  String get c8a1_please_select_option;

  /// No description provided for @c8a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the eighth challenge. Press \'Finish\' to get your badge!'**
  String get c8a1_finish_message;

  /// No description provided for @appropriate_motor_skills_background.
  ///
  /// In en, this message translates to:
  /// **'Appropriate motor skills background'**
  String get appropriate_motor_skills_background;

  /// No description provided for @inclusion_teamwork.
  ///
  /// In en, this message translates to:
  /// **'Inclusion/Teamwork'**
  String get inclusion_teamwork;

  /// No description provided for @enjoyment.
  ///
  /// In en, this message translates to:
  /// **'Enjoyment'**
  String get enjoyment;

  /// No description provided for @activity_balance.
  ///
  /// In en, this message translates to:
  /// **'Balance activity'**
  String get activity_balance;

  /// No description provided for @activity_balance_option_1.
  ///
  /// In en, this message translates to:
  /// **'The children form a large circle in the middle of the playground. One of them suggests a balancing exercise. The other children in the circle imitate him and hold the position for 3 seconds. When the time is up, it is another child\'s turn.'**
  String get activity_balance_option_1;

  /// No description provided for @activity_balance_option_2.
  ///
  /// In en, this message translates to:
  /// **'Wheelbarrow race. Students in pairs. One teammate plays the role of the driver, and the other plays the role of the wheelbarrow. The driver holds on to the other player\'s ankles, while the latter walks with his hands.'**
  String get activity_balance_option_2;

  /// No description provided for @activity_balance_option_3.
  ///
  /// In en, this message translates to:
  /// **'Children walk around a large area. They can change direction and speed but must avoid contact with others. When the teacher calls a number, children form groups only according to that number, making a circle. They must jump five times on one foot. Child/children without a group perform a static balance.'**
  String get activity_balance_option_3;

  /// No description provided for @activity_throwing.
  ///
  /// In en, this message translates to:
  /// **'Throwing activity'**
  String get activity_throwing;

  /// No description provided for @activity_throwing_option_1.
  ///
  /// In en, this message translates to:
  /// **'Children form a large circle in the centre of the playing area. One of them has a sound ball. All children must close their eyes, except for the child with the ball who must roll it to another one, using both hands. When all have rolled the ball, they must use another part of the body, such as the hip, knee, and elbow.'**
  String get activity_throwing_option_1;

  /// No description provided for @activity_throwing_option_2.
  ///
  /// In en, this message translates to:
  /// **'Children in groups of two/three, according to the number of students in the classroom, in front of a wall. One child must throw the ball against the wall and catch it again as many times as possible in twenty seconds. Other teammates count the seconds and the correct executions of the task.'**
  String get activity_throwing_option_2;

  /// No description provided for @activity_throwing_option_3.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into two teams. The playing area is divided into two areas. Each team built three castles with cones and placed them at the end of the playing fields. Each team has five soft balls. The children must throw the balls trying to bring down the castles of the other team.'**
  String get activity_throwing_option_3;

  /// No description provided for @activity_striking.
  ///
  /// In en, this message translates to:
  /// **'Striking with the hand'**
  String get activity_striking;

  /// No description provided for @activity_striking_option_1.
  ///
  /// In en, this message translates to:
  /// **'Children in groups of three/four, according to the number of students in the classroom. One balloon per group. Each group must move the balloon to the end of the playing area without holding onto it or letting it touch the ground. Each child must pass the balloon to a teammate before touching it again.'**
  String get activity_striking_option_1;

  /// No description provided for @activity_striking_option_2.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into pairs. Each group has a sponge ball and a towel. The pair hold the towel between them. The children must coordinate their movement to lift the towel, throw the ball into the air and catch it again on its return.'**
  String get activity_striking_option_2;

  /// No description provided for @activity_striking_option_3.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into groups of four. Each group forms a circle and puts one hoop in the centre. Each child must pass a bouncy ball to the teammate by first bouncing it in the circle.'**
  String get activity_striking_option_3;

  /// No description provided for @c9a1_instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Challenge 9! This challenge is based on the enabling environments (Almond and Lambden, 2016). Drag the factors influencing engagement in physical activity (in the center of the screen) to the right variable in the outter circles.'**
  String get c9a1_instructions;

  /// No description provided for @c9a1_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! For further information, read the scientific article in the news section.'**
  String get c9a1_finish_message;

  /// No description provided for @c9a1_object_play.
  ///
  /// In en, this message translates to:
  /// **'Object Play'**
  String get c9a1_object_play;

  /// No description provided for @c9a1_exercise_play.
  ///
  /// In en, this message translates to:
  /// **'Exercise Play'**
  String get c9a1_exercise_play;

  /// No description provided for @c9a1_expressive_movement.
  ///
  /// In en, this message translates to:
  /// **'Expressive Movement'**
  String get c9a1_expressive_movement;

  /// No description provided for @c9a1_outdoor_play.
  ///
  /// In en, this message translates to:
  /// **'Outdoor Play'**
  String get c9a1_outdoor_play;

  /// No description provided for @c9a1_throwing.
  ///
  /// In en, this message translates to:
  /// **'Throwing'**
  String get c9a1_throwing;

  /// No description provided for @c9a1_catching.
  ///
  /// In en, this message translates to:
  /// **'Catching'**
  String get c9a1_catching;

  /// No description provided for @c9a1_striking.
  ///
  /// In en, this message translates to:
  /// **'Striking'**
  String get c9a1_striking;

  /// No description provided for @c9a1_rough_and_tumble.
  ///
  /// In en, this message translates to:
  /// **'Rough and Tumble'**
  String get c9a1_rough_and_tumble;

  /// No description provided for @c9a1_climbing.
  ///
  /// In en, this message translates to:
  /// **'Climbing'**
  String get c9a1_climbing;

  /// No description provided for @c9a1_running.
  ///
  /// In en, this message translates to:
  /// **'Running'**
  String get c9a1_running;

  /// No description provided for @c9a1_chasing_games.
  ///
  /// In en, this message translates to:
  /// **'Chasing games'**
  String get c9a1_chasing_games;

  /// No description provided for @c9a1_bikes_and_scooters.
  ///
  /// In en, this message translates to:
  /// **'Bikes and scooters'**
  String get c9a1_bikes_and_scooters;

  /// No description provided for @c9a1_pushing_and_pulling.
  ///
  /// In en, this message translates to:
  /// **'Pushing and pulling'**
  String get c9a1_pushing_and_pulling;

  /// No description provided for @c9a1_dance.
  ///
  /// In en, this message translates to:
  /// **'Dance'**
  String get c9a1_dance;

  /// No description provided for @c9a1_gymnastics.
  ///
  /// In en, this message translates to:
  /// **'Gymnastics'**
  String get c9a1_gymnastics;

  /// No description provided for @c9a1_action_rhymes.
  ///
  /// In en, this message translates to:
  /// **'Action rhymes'**
  String get c9a1_action_rhymes;

  /// No description provided for @c9a1_songs_and_stories.
  ///
  /// In en, this message translates to:
  /// **'Songs and stories'**
  String get c9a1_songs_and_stories;

  /// No description provided for @c9a1_natural_surroundings.
  ///
  /// In en, this message translates to:
  /// **'Natural surroundings'**
  String get c9a1_natural_surroundings;

  /// No description provided for @c9a1_rocks_and_tress.
  ///
  /// In en, this message translates to:
  /// **'Rocks and Trees'**
  String get c9a1_rocks_and_tress;

  /// No description provided for @c9a1_challenges.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get c9a1_challenges;

  /// No description provided for @c9a2_intro_message.
  ///
  /// In en, this message translates to:
  /// **'You are challenged to design a comprehensive physical education curriculum, incorporating both curricular and extra-curricular activities that promote physical literacy. The challenge is to balance various elements such as inclusivity, engagement, and educational outcomes. Μove each curriculum feature (shown at the bottom) to the correct or wrong box. Correct features must be moved to the \'Correct\' box, and wrong features must be moved to the \'Wrong\' box. Ready?'**
  String get c9a2_intro_message;

  /// No description provided for @c9a2_prompt.
  ///
  /// In en, this message translates to:
  /// **'Drag each feature to the right box.'**
  String get c9a2_prompt;

  /// No description provided for @c9a2_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the ninth challenge. Press \'Finish\' to get your badge!'**
  String get c9a2_finish_message;

  /// No description provided for @c9a2_correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get c9a2_correct;

  /// No description provided for @c9a2_wrong.
  ///
  /// In en, this message translates to:
  /// **'Wrong'**
  String get c9a2_wrong;

  /// No description provided for @c9a2_activities_balanced.
  ///
  /// In en, this message translates to:
  /// **'Activities balanced to students’ motor skills.'**
  String get c9a2_activities_balanced;

  /// No description provided for @c9a2_pe_curriculum_guidelines.
  ///
  /// In en, this message translates to:
  /// **'Coherence with country PE curriculum guidelines.'**
  String get c9a2_pe_curriculum_guidelines;

  /// No description provided for @c9a2_music_motor_skills.
  ///
  /// In en, this message translates to:
  /// **'Games/activities to learn and develop students’ motor skills using music.'**
  String get c9a2_music_motor_skills;

  /// No description provided for @c9a2_fitness_health_wellbeing.
  ///
  /// In en, this message translates to:
  /// **'Activities focused on fitness, health, and well-being.'**
  String get c9a2_fitness_health_wellbeing;

  /// No description provided for @c9a2_evaluate_motor_skills.
  ///
  /// In en, this message translates to:
  /// **'Exercises to evaluate students’ motor skills by administering specific tests.'**
  String get c9a2_evaluate_motor_skills;

  /// No description provided for @c9a2_outdoor_play.
  ///
  /// In en, this message translates to:
  /// **'Outdoor walking with breaks for playing games.'**
  String get c9a2_outdoor_play;

  /// No description provided for @c9a2_sports_oriented_motor_skills.
  ///
  /// In en, this message translates to:
  /// **'Activities to improve students’ motor skills oriented to sports practice.'**
  String get c9a2_sports_oriented_motor_skills;

  /// No description provided for @c9a2_promote_self_knowledge.
  ///
  /// In en, this message translates to:
  /// **'Activities to promote self-knowledge.'**
  String get c9a2_promote_self_knowledge;

  /// No description provided for @c9a2_team_spirit_socialization.
  ///
  /// In en, this message translates to:
  /// **'Group activities to enhance team spirit and socialization.'**
  String get c9a2_team_spirit_socialization;

  /// No description provided for @c9a2_respect_game_rules.
  ///
  /// In en, this message translates to:
  /// **'Activities to promote respect for the game rules and fair play.'**
  String get c9a2_respect_game_rules;

  /// No description provided for @c9a2_inclusive_games.
  ///
  /// In en, this message translates to:
  /// **'Games or game rules that require the participation of all students.'**
  String get c9a2_inclusive_games;

  /// No description provided for @c9a2_enjoyment_oriented.
  ///
  /// In en, this message translates to:
  /// **'Enjoyment-oriented activities.'**
  String get c9a2_enjoyment_oriented;

  /// No description provided for @c9a2_varied_teaching_strategies.
  ///
  /// In en, this message translates to:
  /// **'Use a wide range of teaching strategies.'**
  String get c9a2_varied_teaching_strategies;

  /// No description provided for @c9a2_ego_oriented.
  ///
  /// In en, this message translates to:
  /// **'Ego-oriented activities.'**
  String get c9a2_ego_oriented;

  /// No description provided for @c9a2_one_size_fits_all.
  ///
  /// In en, this message translates to:
  /// **'One-size-fits-all approach.'**
  String get c9a2_one_size_fits_all;

  /// No description provided for @c9a2_summary_objectives.
  ///
  /// In en, this message translates to:
  /// **'Summary definition of objectives.'**
  String get c9a2_summary_objectives;

  /// No description provided for @c9a2_win_at_all_costs.
  ///
  /// In en, this message translates to:
  /// **'Activities geared towards the \'Win-at-all-costs\' mentality.'**
  String get c9a2_win_at_all_costs;

  /// No description provided for @c9a2_long_queues.
  ///
  /// In en, this message translates to:
  /// **'Games with long queues of children.'**
  String get c9a2_long_queues;

  /// No description provided for @c9a2_gender_separated_activities.
  ///
  /// In en, this message translates to:
  /// **'Separate activities for males and females.'**
  String get c9a2_gender_separated_activities;

  /// No description provided for @c10a1_instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 10. Mosston\'s spectrum of teaching styles is a framework that categorizes teaching styles based on the degree of decision-making authority given to the teacher and the learner. The spectrum consists of 11 teaching styles, ranging from more teacher-centred to more student-centred approaches. Read the clues and identify the related teaching style to solve the puzzle. Ready?'**
  String get c10a1_instructions;

  /// No description provided for @c10a1_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You can now access the next challenge.'**
  String get c10a1_finish;

  /// No description provided for @enter_letter.
  ///
  /// In en, this message translates to:
  /// **'Enter a letter'**
  String get enter_letter;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// No description provided for @hint_instruction.
  ///
  /// In en, this message translates to:
  /// **'Click on the box to add the missing letter and complete the word'**
  String get hint_instruction;

  /// No description provided for @term1.
  ///
  /// In en, this message translates to:
  /// **'COMMAND'**
  String get term1;

  /// No description provided for @term2.
  ///
  /// In en, this message translates to:
  /// **'PRACTICE'**
  String get term2;

  /// No description provided for @term3.
  ///
  /// In en, this message translates to:
  /// **'RECIPROCAL'**
  String get term3;

  /// No description provided for @term4.
  ///
  /// In en, this message translates to:
  /// **'SELFCHECK'**
  String get term4;

  /// No description provided for @term5.
  ///
  /// In en, this message translates to:
  /// **'INCLUSION'**
  String get term5;

  /// No description provided for @term6.
  ///
  /// In en, this message translates to:
  /// **'GUIDED'**
  String get term6;

  /// No description provided for @term7.
  ///
  /// In en, this message translates to:
  /// **'CONVERGENT'**
  String get term7;

  /// No description provided for @term8.
  ///
  /// In en, this message translates to:
  /// **'DIVERGENT'**
  String get term8;

  /// No description provided for @term9.
  ///
  /// In en, this message translates to:
  /// **'DESIGNED'**
  String get term9;

  /// No description provided for @term10.
  ///
  /// In en, this message translates to:
  /// **'INITIATED'**
  String get term10;

  /// No description provided for @term11.
  ///
  /// In en, this message translates to:
  /// **'SELFTEACHING'**
  String get term11;

  /// No description provided for @term1_hint.
  ///
  /// In en, this message translates to:
  /// **'The teacher\'s directive control of students\' learning activities.'**
  String get term1_hint;

  /// No description provided for @term2_hint.
  ///
  /// In en, this message translates to:
  /// **'Delegation of some decisions from the teacher to the student.'**
  String get term2_hint;

  /// No description provided for @term3_hint.
  ///
  /// In en, this message translates to:
  /// **'Groups of students with assigned roles: practice, observe, evaluate, correct, and help.'**
  String get term3_hint;

  /// No description provided for @term4_hint.
  ///
  /// In en, this message translates to:
  /// **'Self-assessment of exercise execution and results.'**
  String get term4_hint;

  /// No description provided for @term5_hint.
  ///
  /// In en, this message translates to:
  /// **'Working together in groups to achieve common goals.'**
  String get term5_hint;

  /// No description provided for @term6_hint.
  ///
  /// In en, this message translates to:
  /// **'The teacher leads students to independently discover solutions through questions.'**
  String get term6_hint;

  /// No description provided for @term7_hint.
  ///
  /// In en, this message translates to:
  /// **'Students analyze and develop strategies to solve teacher-presented problems.'**
  String get term7_hint;

  /// No description provided for @term8_hint.
  ///
  /// In en, this message translates to:
  /// **'Encourages creativity with self-created exercises.'**
  String get term8_hint;

  /// No description provided for @term9_hint.
  ///
  /// In en, this message translates to:
  /// **'A personalized program based on individual abilities, with teacher as consultant.'**
  String get term9_hint;

  /// No description provided for @term10_hint.
  ///
  /// In en, this message translates to:
  /// **'Student-led, from design to execution, with teacher as consultant.'**
  String get term10_hint;

  /// No description provided for @term11_hint.
  ///
  /// In en, this message translates to:
  /// **'Students plan, execute, and evaluate their learning.'**
  String get term11_hint;

  /// No description provided for @c10a2_instructions.
  ///
  /// In en, this message translates to:
  /// **'You will assume the role of a PE teacher and have to match the lesson provided with the correct teaching style used to develop it. Ready?'**
  String get c10a2_instructions;

  /// No description provided for @c10a2_finish_message.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed the tenth challenge. Press \'Finish\' to get your badge!'**
  String get c10a2_finish_message;

  /// No description provided for @command.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get command;

  /// No description provided for @guided_discovery.
  ///
  /// In en, this message translates to:
  /// **'Guided Discovery'**
  String get guided_discovery;

  /// No description provided for @self_teaching.
  ///
  /// In en, this message translates to:
  /// **'Self-Teaching'**
  String get self_teaching;

  /// No description provided for @command_lesson_1.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve basic motor skills. Students must overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher demonstrates how to overcome each obstacle. The students start the course at the teacher\'s command, imitating the teacher\'s movement.'**
  String get command_lesson_1;

  /// No description provided for @command_lesson_2.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve balance skills. The teacher demonstrates three yoga poses at a time (Balancing Table, Dancer, and Half Moon). Students must maintain a position for 15 seconds. The students change position at the teacher\'s command.'**
  String get command_lesson_2;

  /// No description provided for @command_lesson_3.
  ///
  /// In en, this message translates to:
  /// **'The class aims to improve knowledge of one\'s own body. The teacher narrates a story about bears in the forest who perform different actions (eating, washing and rolling). The pupils are encouraged to impersonate the bears and perform these actions according to the teacher\'s instructions.'**
  String get command_lesson_3;

  /// No description provided for @command_lesson_4.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve volleyball serving. The teacher demonstrates the volleyball services (basic underhand service, basic overhand serve, and jump serve). The teacher plans two exercises for each service (individual and in-pair exercises), explaining that students have to start with the basic underhand service, then the basic overhand serve, and at the end jump serve.'**
  String get command_lesson_4;

  /// No description provided for @discovery_lesson_1.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve basic motor skills. Students have to overcome an obstacle course using their basic motor skills (rolling, jumping, running, crawling). The teacher engages students in talk to help them reflect on which basic motor skills they can use to overcome the obstacles. The teacher also supports students\' performance by asking questions to stimulate them to think about different strategies they can use to overcome the same obstacle.'**
  String get discovery_lesson_1;

  /// No description provided for @discovery_lesson_2.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve balance skills. The teacher engages students in talk to help them reflect on the effects of yoga practice on balance. The teacher also supports students\' pose development by asking questions to stimulate them to think about the level of difficulty needed to maintain a pose. Correct thinking and strategies are rewarded and reinforced.'**
  String get discovery_lesson_2;

  /// No description provided for @discovery_lesson_3.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve knowledge of one\'s own body. Students develop a story about bears who walk around in the forest and perform certain actions (eating, washing, rolling around). Students must impersonate the bears. The teacher asks several questions to invite students to develop their personalised bears day (from waking up to going to bed). The teacher also encourages students to think about which activities could be introduced in the story to improve knowledge of one\'s own body. Correct thinking and strategies are rewarded and reinforced.'**
  String get discovery_lesson_3;

  /// No description provided for @discovery_lesson_4.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve volleyball serving. The teacher engages students in talk to help them focus on how to use the sensations related to the service execution to perform better. The teacher also encourages the students to perceive which service is most comfortable for them, and the sensations felt performing it. Based on this, they have to adapt the other services to make them more comfortable. Correct thinking and strategies are rewarded and reinforced.'**
  String get discovery_lesson_4;

  /// No description provided for @self_teaching_lesson_1.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve basic motor skills. The teacher provides information on basic motor skills (rolling, jumping, running, crawling). Students have to develop games to improve their basic motor skills.'**
  String get self_teaching_lesson_1;

  /// No description provided for @self_teaching_lesson_2.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve balance skills. The teacher provides information on the effects of yoga practice on balance. Students should look for some yoga exercises to do in class with everyone.'**
  String get self_teaching_lesson_2;

  /// No description provided for @self_teaching_lesson_3.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve knowledge of one\'s own body. Students have to develop a story about bears who live in the forest and perform daily actions (eating, washing, rolling around). Students must impersonate the bears. Students have to find funny strategies to get them to perform movements that focus on the use of a specific body part. The teacher provides guidance when needed.'**
  String get self_teaching_lesson_3;

  /// No description provided for @self_teaching_lesson_4.
  ///
  /// In en, this message translates to:
  /// **'The lesson aims to improve volleyball serving. The teacher provides information on the volleyball services (basic underhand service, basic overhand serve, and jump serve). Students are free to work individually or in groups. They have to develop some exercises to train the volleyball services.'**
  String get self_teaching_lesson_4;

  /// No description provided for @c11a1_instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 11. You will assume the role of a PE teacher to develop a lesson based on a teaching pedagogical model provided. Choose the correct strategy to adopt the model and build the Physical Education Tower. Each model represents a tower floor. Be careful! If you make two mistakes, the tower floor will break, and you will have to start over. Ready?'**
  String get c11a1_instructions;

  /// No description provided for @c11_instruction.
  ///
  /// In en, this message translates to:
  /// **'Select the correct answer'**
  String get c11_instruction;

  /// No description provided for @c11_floor0_model.
  ///
  /// In en, this message translates to:
  /// **'Teaching Games for Understanding model'**
  String get c11_floor0_model;

  /// No description provided for @c11_floor0_environment.
  ///
  /// In en, this message translates to:
  /// **'School gymnasium'**
  String get c11_floor0_environment;

  /// No description provided for @c11_floor0_statement.
  ///
  /// In en, this message translates to:
  /// **'The model emphasizes the importance of gameplay and understanding. It promotes a student-centred environment, encouraging learners to explore and understand the game rules, tactics, and strategies, which, in turn, leads to a deeper appreciation and enjoyment of the game.'**
  String get c11_floor0_statement;

  /// No description provided for @c11_floor0_step1_instruction.
  ///
  /// In en, this message translates to:
  /// **'Children are scattered around the gym. A hula hoop is placed next to each child with a cone in the centre. The players must knock over the cone of other players with a ball or defend when it is attacked. Once everyone has attacked or defended, the second step begins.'**
  String get c11_floor0_step1_instruction;

  /// No description provided for @c11_floor0_step1_correct.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get c11_floor0_step1_correct;

  /// No description provided for @c11_floor0_step2_correct.
  ///
  /// In en, this message translates to:
  /// **'Once a cone is knocked over, the child moves it and the hula hoop to another part of the gym and continues to play. Step 2 lasts 10 minutes.'**
  String get c11_floor0_step2_correct;

  /// No description provided for @c11_floor0_step2_wrong.
  ///
  /// In en, this message translates to:
  /// **'The child that knocks over the cone of an opponent gets 1 point. The first to get 5 points wins the game.'**
  String get c11_floor0_step2_wrong;

  /// No description provided for @c11_floor0_step3_correct.
  ///
  /// In en, this message translates to:
  /// **'The player that knocks over the cone of another child, forms a team with them.'**
  String get c11_floor0_step3_correct;

  /// No description provided for @c11_floor0_step3_wrong.
  ///
  /// In en, this message translates to:
  /// **'When a child’s cone is knocked over, the child is eliminated by the game. The last one left on the field wins.'**
  String get c11_floor0_step3_wrong;

  /// No description provided for @c11_floor0_step4_correct.
  ///
  /// In en, this message translates to:
  /// **'With the help of questions, comments, and game modifications from the teacher, students begin to work through the principles of play and identify key tactics and strategies that can lead to success in the game.'**
  String get c11_floor0_step4_correct;

  /// No description provided for @c11_floor0_step4_wrong.
  ///
  /// In en, this message translates to:
  /// **'In order to improve knowledge of the key tactics and strategies to be used in the game, the teacher modifies the match rules by assigning specific tasks and providing strategies that can lead to winning the match.'**
  String get c11_floor0_step4_wrong;

  /// No description provided for @c11_floor0_step5_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher engages students in tactical talk to help them reflect on their decision made in the game to succeed in it (tactics used) (e.g. How are you succeeding in the game?).'**
  String get c11_floor0_step5_correct;

  /// No description provided for @c11_floor0_step5_wrong.
  ///
  /// In en, this message translates to:
  /// **'Children divided into two teams play a match trying to understand the principles of play and identify the key tactics and strategies that can lead to winning the match.'**
  String get c11_floor0_step5_wrong;

  /// No description provided for @c11_floor0_step6_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher modifies the game to emphasize the skills that students have identified as essential for success.'**
  String get c11_floor0_step6_correct;

  /// No description provided for @c11_floor0_step6_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher divides the students into several groups based on class size and assigns specific tasks to improve the effectiveness of the technique to be used in the match.'**
  String get c11_floor0_step6_wrong;

  /// No description provided for @c11_floor0_step7_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher observes the outcome of the students’ learning through the game by paying attention not only to the efficiency of the technique but also to the appropriateness of the response throughout the gameplay.'**
  String get c11_floor0_step7_correct;

  /// No description provided for @c11_floor0_step7_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher observes the outcome of the students’ learning through the game by paying attention to the efficiency of the technique and the results obtained during the match.'**
  String get c11_floor0_step7_wrong;

  /// No description provided for @c11_floor1_model.
  ///
  /// In en, this message translates to:
  /// **'Cooperative Learning model'**
  String get c11_floor1_model;

  /// No description provided for @c11_floor1_environment.
  ///
  /// In en, this message translates to:
  /// **'School gymnasium'**
  String get c11_floor1_environment;

  /// No description provided for @c11_floor1_statement.
  ///
  /// In en, this message translates to:
  /// **'The model takes a distinctly social perspective on learning, where students work collaboratively towards common goals. This model emphasises the development of social skills, communication, and teamwork, as well as individual accountability. Activities are designed so that students depend on one another to succeed, promoting an inclusive and supportive learning environment.'**
  String get c11_floor1_statement;

  /// No description provided for @c11_floor1_instruction.
  ///
  /// In en, this message translates to:
  /// **'In this challenge, you will help children develop motor skills by designing and navigating an obstacle course. Select the correct strategy for each step to proceed to the next one. If you make two mistakes, the challenge will restart. Are you ready?'**
  String get c11_floor1_instruction;

  /// No description provided for @c11_floor1_step1_instruction.
  ///
  /// In en, this message translates to:
  /// **'The teacher, helped by the children, develops an obstacle course. The children have to overcome an obstacle course using their motor skills (rolling, jumping, catching, throwing, running, crawling).'**
  String get c11_floor1_step1_instruction;

  /// No description provided for @c11_floor1_step1_correct.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get c11_floor1_step1_correct;

  /// No description provided for @c11_floor1_step2_correct.
  ///
  /// In en, this message translates to:
  /// **'Children in pairs, one has to overcome the obstacles along the course and the other one guides with his voice the teammate.'**
  String get c11_floor1_step2_correct;

  /// No description provided for @c11_floor1_step2_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher and students decide together which motor skill to use to overcome each obstacle. One child at a time overcomes obstacles.'**
  String get c11_floor1_step2_wrong;

  /// No description provided for @c11_floor1_step3_correct.
  ///
  /// In en, this message translates to:
  /// **'Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles while avoiding using a body part of their choice (hands, legs, eyes, ...).'**
  String get c11_floor1_step3_correct;

  /// No description provided for @c11_floor1_step3_wrong.
  ///
  /// In en, this message translates to:
  /// **'Children in pairs. A child has to overcome the obstacles along the course and the other guides them. The teacher asks the teams to overcome the obstacles with their eyes closed.'**
  String get c11_floor1_step3_wrong;

  /// No description provided for @c11_floor1_step4_correct.
  ///
  /// In en, this message translates to:
  /// **'The children are divided into teams of four players. Before starting the course, the children decide together how to overcome each obstacle.'**
  String get c11_floor1_step4_correct;

  /// No description provided for @c11_floor1_step4_wrong.
  ///
  /// In en, this message translates to:
  /// **'The children are divided into teams of four players. They must complete a relay. Each child has to overcome two obstacles to pass the baton. The first group to complete the course wins.'**
  String get c11_floor1_step4_wrong;

  /// No description provided for @c11_floor1_step5_correct.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into teams of three players. Two children have to hold a frisbee with a tennis ball on it. They must overcome the obstacle course without dropping the ball, while the third child guides them along the course suggesting how they can overcome the obstacles.'**
  String get c11_floor1_step5_correct;

  /// No description provided for @c11_floor1_step5_wrong.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into teams of three players. They hold a frisbee with a tennis ball on it and must overcome the obstacle course without dropping the ball. The teacher guides them along the course suggesting how they can overcome the obstacles.'**
  String get c11_floor1_step5_wrong;

  /// No description provided for @c11_floor1_step6_correct.
  ///
  /// In en, this message translates to:
  /// **'During the task execution, the teacher assesses students’ contribution to the group work and/or their performance.'**
  String get c11_floor1_step6_correct;

  /// No description provided for @c11_floor1_step6_wrong.
  ///
  /// In en, this message translates to:
  /// **'During the task execution, the teacher records the time taken to complete the task by each group and evaluates the students according to their performance.'**
  String get c11_floor1_step6_wrong;

  /// No description provided for @c11_floor1_step7_correct.
  ///
  /// In en, this message translates to:
  /// **'When all groups have performed the exercises, the teacher asks students to reflect on what they have learnt and how they can improve their ability to work as a group, sharing their experiences with others.'**
  String get c11_floor1_step7_correct;

  /// No description provided for @c11_floor1_step7_wrong.
  ///
  /// In en, this message translates to:
  /// **'When all groups have performed the exercises, the teacher shares with them the students’ assessment of how they overcame the obstacles and how they can improve their ability to work as a group and their motor skills.'**
  String get c11_floor1_step7_wrong;

  /// No description provided for @c11_floor2_model.
  ///
  /// In en, this message translates to:
  /// **'Sport Education model'**
  String get c11_floor2_model;

  /// No description provided for @c11_floor2_environment.
  ///
  /// In en, this message translates to:
  /// **'School gymnasium'**
  String get c11_floor2_environment;

  /// No description provided for @c11_floor2_statement.
  ///
  /// In en, this message translates to:
  /// **'This model is designed to replicate authentic sporting experiences, where students participate in seasons, take on roles such as players, coaches, and referees, and experience the culture of the sport.'**
  String get c11_floor2_statement;

  /// No description provided for @c11_floor2_instruction.
  ///
  /// In en, this message translates to:
  /// **'In this challenge, you will help students plan and execute activities related to volleyball.'**
  String get c11_floor2_instruction;

  /// No description provided for @c11_floor2_step1_instruction.
  ///
  /// In en, this message translates to:
  /// **'The teacher and students are in a school gymnasium and have to schedule activities related to the learning of volleyball. The teacher explains the sport\'s features and the main rules.'**
  String get c11_floor2_step1_instruction;

  /// No description provided for @c11_floor2_step1_correct.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get c11_floor2_step1_correct;

  /// No description provided for @c11_floor2_step2_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher gives some information about the season concepts in sports competitions. The teacher also provides information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.'**
  String get c11_floor2_step2_correct;

  /// No description provided for @c11_floor2_step2_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher gives some information about the season concepts in sports competitions. Then, students are divided into groups and have to look for information on the sport-related activities usually performed during the pre-, main-, and post-season activities in volleyball.'**
  String get c11_floor2_step2_wrong;

  /// No description provided for @c11_floor2_step3_correct.
  ///
  /// In en, this message translates to:
  /// **'The students are divided into groups. The teacher provides materials and resources to each group to plan the teamwork. Each group works to develop strategies and exercises to learn the mechanics of the sport and improve volleyball-related motor skills (passing, setting, spiking, blocking, digging, and serving).'**
  String get c11_floor2_step3_correct;

  /// No description provided for @c11_floor2_step3_wrong.
  ///
  /// In en, this message translates to:
  /// **'Students are divided into groups. The teacher provides several materials and resources, assigning exercises to each group to learn the mechanics of the sport and improve the basic volleyball-related skills (passing, setting, spiking, blocking, digging, and serving). Every week they change skills to improve them all.'**
  String get c11_floor2_step3_wrong;

  /// No description provided for @c11_floor2_step4_correct.
  ///
  /// In en, this message translates to:
  /// **'Each group is free to plan the teamwork. They can decide who the coach, captain, trainer, referee or players are and plan the activities related to each role.'**
  String get c11_floor2_step4_correct;

  /// No description provided for @c11_floor2_step4_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher supports students in planning the teamwork. The teacher and students plan together the activities and the students’ roles in the team. Therefore, they choose who will be the coach, captain, trainer, referee or players, to avoid disputes.'**
  String get c11_floor2_step4_wrong;

  /// No description provided for @c11_floor2_step5_correct.
  ///
  /// In en, this message translates to:
  /// **'The team portfolio is a crucial component of the learning model. In the portfolio, students can describe the features of each team, such as the team’s name, members, colours, mascot, motto, student roles, and activity schedules. They can also provide information about the strengths and weaknesses of the team.'**
  String get c11_floor2_step5_correct;

  /// No description provided for @c11_floor2_step5_wrong.
  ///
  /// In en, this message translates to:
  /// **'The team portfolio is a crucial component of the learning model. In the portfolio, the teacher can report useful information for student assessment (the team members, student roles, and activity schedules).'**
  String get c11_floor2_step5_wrong;

  /// No description provided for @c11_floor2_step6_correct.
  ///
  /// In en, this message translates to:
  /// **'The team portfolio can also be used to report information about the learning process, providing test results and reflections on individual and team improvement.'**
  String get c11_floor2_step6_correct;

  /// No description provided for @c11_floor2_step6_wrong.
  ///
  /// In en, this message translates to:
  /// **'Based on the portfolio contents of each team the teacher plans tests to evaluate the students’ knowledge and skills related to volleyball.'**
  String get c11_floor2_step6_wrong;

  /// No description provided for @c11_floor2_step7_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament to promote the values of the sport (fair play, friendship, respect, teamwork, ...).'**
  String get c11_floor2_step7_correct;

  /// No description provided for @c11_floor2_step7_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher can work with colleagues from the same school to plan together the resources, materials, lessons, and unit structures that can be used in the school classes. At the end of the academic year, the teachers plan a tournament. The class that will win can share the teamwork done with other students.'**
  String get c11_floor2_step7_wrong;

  /// No description provided for @c11_floor3_model.
  ///
  /// In en, this message translates to:
  /// **'Teaching Personal and Social Responsibility model'**
  String get c11_floor3_model;

  /// No description provided for @c11_floor3_environment.
  ///
  /// In en, this message translates to:
  /// **'School gymnasium'**
  String get c11_floor3_environment;

  /// No description provided for @c11_floor3_statement.
  ///
  /// In en, this message translates to:
  /// **'It is a values-based approach that uses physical activity to teach life skills and promote personal and social responsibility. This model focuses on self-direction and positive social interaction, emphasizing respect, effort, self-improvement, and helping others.'**
  String get c11_floor3_statement;

  /// No description provided for @c11_floor3_instruction.
  ///
  /// In en, this message translates to:
  /// **'In this challenge, you will help children learn motor skills and social responsibility through an obstacle course and teamwork. Select the correct strategy for each step to proceed.'**
  String get c11_floor3_instruction;

  /// No description provided for @c11_floor3_step1_instruction.
  ///
  /// In en, this message translates to:
  /// **'Children are divided into groups of three. The teacher, helped by the children, develops an obstacle course for each group. They also build at the end of each course a Jenga tower. The children have to overcome the obstacles using their motor skills (rolling, jumping, catching, throwing, running, crawling) and remove a piece from the tower.'**
  String get c11_floor3_step1_instruction;

  /// No description provided for @c11_floor3_step1_correct.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get c11_floor3_step1_correct;

  /// No description provided for @c11_floor3_step2_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher explains that students will practice helping others by providing feedback to their teammates, providing specific help, saying something nice, and offering suggestions.'**
  String get c11_floor3_step2_correct;

  /// No description provided for @c11_floor3_step2_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher explains that two students will tell the third child how to overcome obstacles to finish the course as quickly as possible. When the child returns, another will start the course supported by the other two.'**
  String get c11_floor3_step2_wrong;

  /// No description provided for @c11_floor3_step3_correct.
  ///
  /// In en, this message translates to:
  /// **'While waiting for a turn, students have to help the teammate by providing feedback (be specific, say something nice, offer a suggestion).'**
  String get c11_floor3_step3_correct;

  /// No description provided for @c11_floor3_step3_wrong.
  ///
  /// In en, this message translates to:
  /// **'While waiting for their turn, students have to incite their teammate to go fast, providing information on their opponents to see if they are going slow.'**
  String get c11_floor3_step3_wrong;

  /// No description provided for @c11_floor3_step4_correct.
  ///
  /// In en, this message translates to:
  /// **'During the task execution, the teacher assesses students’ feedback, how they provide it, and their performance in overcoming the obstacles.'**
  String get c11_floor3_step4_correct;

  /// No description provided for @c11_floor3_step4_wrong.
  ///
  /// In en, this message translates to:
  /// **'During the task execution, the teacher assesses students by recording the time taken to complete the task and their performance in overcoming the obstacles.'**
  String get c11_floor3_step4_wrong;

  /// No description provided for @c11_floor3_step5_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher gives the command to the students to stop and interacts with them, praising students who give good feedback to help others and providing general suggestions for improving the feedback.'**
  String get c11_floor3_step5_correct;

  /// No description provided for @c11_floor3_step5_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher interacts with students, one group at a time, to provide general suggestions for improving the feedback.'**
  String get c11_floor3_step5_wrong;

  /// No description provided for @c11_floor3_step6_correct.
  ///
  /// In en, this message translates to:
  /// **'The game restarts. The teacher assesses students’ feedback and how they changed it according to the suggestions.'**
  String get c11_floor3_step6_correct;

  /// No description provided for @c11_floor3_step6_wrong.
  ///
  /// In en, this message translates to:
  /// **'During the task execution, the teacher assesses students’ performance in overcoming the obstacles.'**
  String get c11_floor3_step6_wrong;

  /// No description provided for @c11_floor3_step7_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher engages in a talk with the students, explaining again the key points of social responsibility and asking them to share with their teammates how they felt when they gave or received feedback.'**
  String get c11_floor3_step7_correct;

  /// No description provided for @c11_floor3_step7_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher explains to the students the key points of social responsibility and provides a comparison between what they have done and how they could do it better.'**
  String get c11_floor3_step7_wrong;

  /// No description provided for @c11_floor4_model.
  ///
  /// In en, this message translates to:
  /// **'Health-based PE model'**
  String get c11_floor4_model;

  /// No description provided for @c11_floor4_environment.
  ///
  /// In en, this message translates to:
  /// **'School gymnasium'**
  String get c11_floor4_environment;

  /// No description provided for @c11_floor4_statement.
  ///
  /// In en, this message translates to:
  /// **'The pedagogical approach integrates physical activity with health education, aiming to empower students with the knowledge, skills, and attitudes necessary for healthy living. It stresses the importance of physical fitness, nutrition, mental wellness, and the value of a lifelong commitment to active lifestyles.'**
  String get c11_floor4_statement;

  /// No description provided for @c11_floor4_instruction.
  ///
  /// In en, this message translates to:
  /// **'In this challenge, you will guide students in understanding the relationship between physical activity and health through teamwork, goal-setting, and peer support. Select the correct strategy for each step to proceed.'**
  String get c11_floor4_instruction;

  /// No description provided for @c11_floor4_step1_instruction.
  ///
  /// In en, this message translates to:
  /// **'The teacher and students are sitting in a circle. The teacher introduces the aim of the next three lessons explaining the relationship between physical activity and health.'**
  String get c11_floor4_step1_instruction;

  /// No description provided for @c11_floor4_step1_correct.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get c11_floor4_step1_correct;

  /// No description provided for @c11_floor4_step2_correct.
  ///
  /// In en, this message translates to:
  /// **'After providing information on the national and international guidelines for maintaining a healthy lifestyle, the teacher performs a physical test to show how to evaluate the individual’s fitness level and how to compare them with national standards.'**
  String get c11_floor4_step2_correct;

  /// No description provided for @c11_floor4_step2_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher provides detailed information on the national and international guidelines to students, where they can find them, how to self-evaluate their fitness level, and how to compare them with national standards (theoretical lesson).'**
  String get c11_floor4_step2_wrong;

  /// No description provided for @c11_floor4_step3_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher encourages students’ teamwork to identify, set and achieve physical activity targets or challenges.'**
  String get c11_floor4_step3_correct;

  /// No description provided for @c11_floor4_step3_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher encourages each student to identify, set and achieve personalised physical activity targets or challenges based on test results.'**
  String get c11_floor4_step3_wrong;

  /// No description provided for @c11_floor4_step4_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher also encourages students to work in groups supporting their peers in physical activity participation.'**
  String get c11_floor4_step4_correct;

  /// No description provided for @c11_floor4_step4_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher provides exercise examples that can be performed by students to reach the physical activity levels promoted by the national/international guidelines. The teacher encourages individual work to maximise the exercise benefits.'**
  String get c11_floor4_step4_wrong;

  /// No description provided for @c11_floor4_step5_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher encourages students to become critical movers, providing feedback and suggestions to peers.'**
  String get c11_floor4_step5_correct;

  /// No description provided for @c11_floor4_step5_wrong.
  ///
  /// In en, this message translates to:
  /// **'The teacher avoids students being critical of each other, in order to avoid disputes.'**
  String get c11_floor4_step5_wrong;

  /// No description provided for @c11_floor4_step6_correct.
  ///
  /// In en, this message translates to:
  /// **'The teacher must provide challenges to students to promote physical activity among their peers, but also among family members (within and beyond school).'**
  String get c11_floor4_step6_correct;

  /// No description provided for @c11_floor4_step6_wrong.
  ///
  /// In en, this message translates to:
  /// **'The model does not require to consider activities beyond school.'**
  String get c11_floor4_step6_wrong;

  /// No description provided for @c11_floor4_step7_correct.
  ///
  /// In en, this message translates to:
  /// **'The teaching model emphasises teacher support in the identification of barriers to physical activity participation, as well as strategies to overcome them.'**
  String get c11_floor4_step7_correct;

  /// No description provided for @c11_floor4_step7_wrong.
  ///
  /// In en, this message translates to:
  /// **'The model does not require that the teacher support students in the identification of barriers to physical activity participation, as well as strategies to overcome them.'**
  String get c11_floor4_step7_wrong;

  /// No description provided for @c11_mistakes.
  ///
  /// In en, this message translates to:
  /// **'Mistakes'**
  String get c11_mistakes;

  /// No description provided for @c11_mistakes_reached.
  ///
  /// In en, this message translates to:
  /// **'You have made 2 mistakes in this model. The challenge will restart from this floor.'**
  String get c11_mistakes_reached;

  /// No description provided for @c11_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have successfully completed the tower. You can now access the next challenge.'**
  String get c11_finish;

  /// No description provided for @c12a1_instructions.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 12. You will assume the role of a PE teacher and develop two lessons for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes a change in the avatar\'s expression (from happy to angry). You can make three mistakes per lesson, after which the challenge will begin again. Ready?'**
  String get c12a1_instructions;

  /// No description provided for @c12a1_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have scheduled your lesson based on the class needs. To complete the challenge, you have to develop another lesson for a different class.'**
  String get c12a1_finish;

  /// No description provided for @c12_completed.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve completed the game!'**
  String get c12_completed;

  /// No description provided for @c12_mistakes.
  ///
  /// In en, this message translates to:
  /// **'You\'ve made 3 mistakes. Game restarting!'**
  String get c12_mistakes;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @c12a2_instructions.
  ///
  /// In en, this message translates to:
  /// **'This is a class of 25 children 6-year-olds, one of them with Asperger\'s Syndrome. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. All the children are motivated when doing PE. The lesson aims to teach catching and throwing skills.'**
  String get c12a2_instructions;

  /// No description provided for @c12a2_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have scheduled your lessons based on the class needs. You have completed the challenge!'**
  String get c12a2_finish;

  /// No description provided for @c12a1_1_title.
  ///
  /// In en, this message translates to:
  /// **'Chest pass exercise'**
  String get c12a1_1_title;

  /// No description provided for @c12a1_1_question.
  ///
  /// In en, this message translates to:
  /// **'Pick the correct equipment set.'**
  String get c12a1_1_question;

  /// No description provided for @c12a1_1_answer1.
  ///
  /// In en, this message translates to:
  /// **'Standard balls used in basketball sport.'**
  String get c12a1_1_answer1;

  /// No description provided for @c12a1_1_answer2.
  ///
  /// In en, this message translates to:
  /// **'Balls of different weights for male and female students.'**
  String get c12a1_1_answer2;

  /// No description provided for @c12a1_1_answer3.
  ///
  /// In en, this message translates to:
  /// **'Balls of different weights for students in wheelchairs.'**
  String get c12a1_1_answer3;

  /// No description provided for @c12a1_2_title.
  ///
  /// In en, this message translates to:
  /// **'Chest pass exercise (individual work)'**
  String get c12a1_2_title;

  /// No description provided for @c12a1_2_question.
  ///
  /// In en, this message translates to:
  /// **'Setting and rules:\nA 1-meter square on a wall, 1 meter off the floor.\nA foot-foul line 2 meters from the wall.\nStudents must throw the ball inside the square and catch the rebound. The ball must be thrown from behind the line and the rebound must be caught behind the line. The ball cannot bounce before hitting the wall. Perform the exercise 5 times.\n\nAdaptation for students in wheelchairs:'**
  String get c12a1_2_question;

  /// No description provided for @c12a1_2_answer1.
  ///
  /// In en, this message translates to:
  /// **'Not needed.'**
  String get c12a1_2_answer1;

  /// No description provided for @c12a1_2_answer2.
  ///
  /// In en, this message translates to:
  /// **'The foot-foul line is 1 meter from the wall.'**
  String get c12a1_2_answer2;

  /// No description provided for @c12a1_2_answer3.
  ///
  /// In en, this message translates to:
  /// **'The square is drawn 0.5 meters off the floor.'**
  String get c12a1_2_answer3;

  /// No description provided for @c12a1_3_title.
  ///
  /// In en, this message translates to:
  /// **'Chest pass exercise (teamwork)'**
  String get c12a1_3_title;

  /// No description provided for @c12a1_3_question.
  ///
  /// In en, this message translates to:
  /// **'Setting and rules:\nStudents in pairs, 2 meters apart.\nStudents must throw the ball to their teammates. The ball cannot bounce. Perform the exercise 10 times.\nTeam building:'**
  String get c12a1_3_question;

  /// No description provided for @c12a1_3_answer1.
  ///
  /// In en, this message translates to:
  /// **'Students in pairs. Each student in a wheelchair works with any classmate.'**
  String get c12a1_3_answer1;

  /// No description provided for @c12a1_3_answer2.
  ///
  /// In en, this message translates to:
  /// **'Students in pairs. Students in wheelchairs are in the same group.'**
  String get c12a1_3_answer2;

  /// No description provided for @c12a1_4_title.
  ///
  /// In en, this message translates to:
  /// **'Spot shot exercise'**
  String get c12a1_4_title;

  /// No description provided for @c12a1_4_question.
  ///
  /// In en, this message translates to:
  /// **'Setting and rules:\nStudents work on a basketball field.\nStudents are divided into two groups.\nThree shooting areas (1.6 meters from the basketball hoop).\nEach team is divided into 3 subgroups, one for each shooting area. Students must perform a shot and move to another area. Each student must perform 4 shoots in each area to complete the task.\nAdaptation for students in wheelchairs:'**
  String get c12a1_4_question;

  /// No description provided for @c12a1_4_answer1.
  ///
  /// In en, this message translates to:
  /// **'Not needed.'**
  String get c12a1_4_answer1;

  /// No description provided for @c12a1_4_answer2.
  ///
  /// In en, this message translates to:
  /// **'The shooting areas are 1 meter from the basketball hoop.'**
  String get c12a1_4_answer2;

  /// No description provided for @c12a1_4_answer3.
  ///
  /// In en, this message translates to:
  /// **'The students in wheelchairs can perform more shots than their teammates.'**
  String get c12a1_4_answer3;

  /// No description provided for @c12a1_5_title.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get c12a1_5_title;

  /// No description provided for @c12a1_5_question.
  ///
  /// In en, this message translates to:
  /// **''**
  String get c12a1_5_question;

  /// No description provided for @c12a1_5_answer1.
  ///
  /// In en, this message translates to:
  /// **'Basketball hoops of different heights, balls of the same weight.'**
  String get c12a1_5_answer1;

  /// No description provided for @c12a1_5_answer2.
  ///
  /// In en, this message translates to:
  /// **'Basketball hoops of the same height, and balls of different weights for male.'**
  String get c12a1_5_answer2;

  /// No description provided for @c12a1_5_answer3.
  ///
  /// In en, this message translates to:
  /// **'Basketball hoops of different heights, and balls of different weights for students in wheelchairs.'**
  String get c12a1_5_answer3;

  /// No description provided for @c12a1_6_title.
  ///
  /// In en, this message translates to:
  /// **'Ten-meter dribble exercise:'**
  String get c12a1_6_title;

  /// No description provided for @c12a1_6_question.
  ///
  /// In en, this message translates to:
  /// **'Setting and rules:\nLine 10-meter long.\nSix cones on the line, 1.5 meters apart.\nStudents are divided into groups.\nThe students must dribble on the line as quickly as possible using only one hand and without hitting the cone with the ball.\nStudents must perform the exercise three times in non-consecutive turns.'**
  String get c12a1_6_question;

  /// No description provided for @c12a1_6_answer1.
  ///
  /// In en, this message translates to:
  /// **'The dribbling execution needs to be adapted: bounce one time, trap the ball in lap, push wheels.'**
  String get c12a1_6_answer1;

  /// No description provided for @c12a1_6_answer2.
  ///
  /// In en, this message translates to:
  /// **'Not needed.'**
  String get c12a1_6_answer2;

  /// No description provided for @c12a1_6_answer3.
  ///
  /// In en, this message translates to:
  /// **'Three cones on the line for students in wheelchairs.'**
  String get c12a1_6_answer3;

  /// No description provided for @c12a2_1_title.
  ///
  /// In en, this message translates to:
  /// **'Catching and throwing activity'**
  String get c12a2_1_title;

  /// No description provided for @c12a2_1_question.
  ///
  /// In en, this message translates to:
  /// **'Rules: \nChildren in pairs. One child has to throw the ball to his teammate without dropping it.\nAdaptation for student with Asperger\'s Syndrome:'**
  String get c12a2_1_question;

  /// No description provided for @c12a2_1_answer1.
  ///
  /// In en, this message translates to:
  /// **'The teacher shows a card with the actions needed to perform the task to the student with Asperger\'s Syndrome.'**
  String get c12a2_1_answer1;

  /// No description provided for @c12a2_1_answer2.
  ///
  /// In en, this message translates to:
  /// **'The teacher explains carefully how to perform the task through several demonstrations to the student with Asperger\'s Syndrome.'**
  String get c12a2_1_answer2;

  /// No description provided for @c12a2_1_answer3.
  ///
  /// In en, this message translates to:
  /// **'Not needed.'**
  String get c12a2_1_answer3;

  /// No description provided for @c12a2_2_title.
  ///
  /// In en, this message translates to:
  /// **'Catching and throwing activity'**
  String get c12a2_2_title;

  /// No description provided for @c12a2_2_question.
  ///
  /// In en, this message translates to:
  /// **'Rules:\nChildren in pairs. One child has to throw the ball to his teammate without dropping it while walking near a line.\nAdaptation for student with Asperger\'s Syndrome:'**
  String get c12a2_2_question;

  /// No description provided for @c12a2_2_answer1.
  ///
  /// In en, this message translates to:
  /// **'The teacher divides the task into two parts. In the first part, a student has to throw the ball to his teammate with Asperger\'s Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, a child has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).'**
  String get c12a2_2_answer1;

  /// No description provided for @c12a2_2_answer2.
  ///
  /// In en, this message translates to:
  /// **'The teacher divides the task into two parts. In the first part, the teacher has to throw the ball to his teammate with Asperger\'s Syndrome, the latter takes 5 steps and throws it back to his teammate (and so on). In the second part, the teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).'**
  String get c12a2_2_answer2;

  /// No description provided for @c12a2_2_answer3.
  ///
  /// In en, this message translates to:
  /// **'The teacher plays with the student with Asperger\'s Syndrome. The teacher has to throw the ball to his teammate without dropping it while walking, the latter catches it and throws it back to his teammate (without stopping).'**
  String get c12a2_2_answer3;

  /// No description provided for @c12a2_3_title.
  ///
  /// In en, this message translates to:
  /// **'Catching and throwing activity'**
  String get c12a2_3_title;

  /// No description provided for @c12a2_3_question.
  ///
  /// In en, this message translates to:
  /// **'Setting and rules:\nThe gymnasium is divided into four parts. One game area in each part. Children in eight teams. Each playing area is divided into two fields. Each team built two castles with cones and placed them at the end of the playing fields. Each team has one soft ball. The children must throw the balls trying to bring down the castles of the other team. Before throwing the ball, they must perform at least three passes. All students must play with a lower level of voice. Whoever shouts receives a penalty. Adaptation for student with Asperger\'s Syndrome:'**
  String get c12a2_3_question;

  /// No description provided for @c12a2_3_answer1.
  ///
  /// In en, this message translates to:
  /// **'Before throwing the ball, the students must pass the ball to the teammate with Asperger\'s Syndrome.'**
  String get c12a2_3_answer1;

  /// No description provided for @c12a2_3_answer2.
  ///
  /// In en, this message translates to:
  /// **'While the students play, the teacher plays the same game with the student with Asperger\'s Syndrome in a reserved play area.'**
  String get c12a2_3_answer2;

  /// No description provided for @c12a2_3_answer3.
  ///
  /// In en, this message translates to:
  /// **'The teacher plays in the team of the student with Asperger\'s Syndrome. Before throwing the ball, the student and the teacher must pass the ball to the teammate with Asperger\'s Syndrome.'**
  String get c12a2_3_answer3;

  /// No description provided for @c13a1_intro1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to challenge 13. You will assume the role of a PE teacher and develop a lesson for your students. I will provide you with some information about the characteristics of your class, the purpose of the lesson and the learning outcomes that will help you in developing the lesson. Be careful, a wrong answer causes the loss of a heart in the avatar\'s life bar. You have 20 hearts available. If you lose all the hearts, you will restart the challenge. Ready?'**
  String get c13a1_intro1;

  /// No description provided for @c13a1_intro2.
  ///
  /// In en, this message translates to:
  /// **'This is a class of 30 children. They have some experience in gymnastics and dance from PE lessons in the early grades. They also have experience in traditional games, athletics, swimming, and winter sports. Within the class there is a normal range of abilities where approximately 1/3 of the class are quite competent at gymnastics, 1/3 are OK and 1/3 are less competent from a practical point of view. Most of the children are motivated when doing PE although a few children lack confidence. The school has a small gymnasium with some moveable apparatus (benches, boxes) that the children can use to balance on as well as floor mats to work on. Music can be used if required to add stimulus to the sequences. Work cards with examples of partner balances are available. These have descriptions and images of partner balances along with suggestions of how to get into and out of the balances. The children will have already selected a partner and will have been working on developing travelling with a partner (mirroring and matching movements, moving in different directions) and jumping combinations (using different types of jumps and different shapes). They have started to put a sequence together which they will build on over the following weeks. The lesson aims to encourage students to explore a range of partner balances, modify them if possible and then link them together as part of their partner sequence. The learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.'**
  String get c13a1_intro2;

  /// No description provided for @c13a1_intro3.
  ///
  /// In en, this message translates to:
  /// **'Now you have all the information to start developing lessons for your students. If you want to consult the characteristics, the purpose, and the learning outcomes of the lesson, you can consult me with a tap, and I will provide you with all this information.'**
  String get c13a1_intro3;

  /// No description provided for @c13a1_well_done.
  ///
  /// In en, this message translates to:
  /// **'🎉 Well done! You\'ve selected the correct answers! 🎉'**
  String get c13a1_well_done;

  /// No description provided for @c13a1_mistakes.
  ///
  /// In en, this message translates to:
  /// **'You have selected %1 incorrect answers.'**
  String get c13a1_mistakes;

  /// No description provided for @c13a1_game_over.
  ///
  /// In en, this message translates to:
  /// **'❌ You\'ve lost all lives and the challenge will restart.'**
  String get c13a1_game_over;

  /// No description provided for @c13a1_stage.
  ///
  /// In en, this message translates to:
  /// **'Stage %1'**
  String get c13a1_stage;

  /// No description provided for @c13a1_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed this activity. One more to go to finish the last challenge!'**
  String get c13a1_finish;

  /// No description provided for @c13_1_title.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get c13_1_title;

  /// No description provided for @c13_1_question.
  ///
  /// In en, this message translates to:
  /// **'Based on the information provided, choose 2 skills/qualities you are also focusing on developing:'**
  String get c13_1_question;

  /// No description provided for @c13_1_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Resilience'**
  String get c13_1_correct_1;

  /// No description provided for @c13_1_correct_2.
  ///
  /// In en, this message translates to:
  /// **'Independence'**
  String get c13_1_correct_2;

  /// No description provided for @c13_1_correct_3.
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get c13_1_correct_3;

  /// No description provided for @c13_1_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Problem-Solving'**
  String get c13_1_wrong_1;

  /// No description provided for @c13_1_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Emotional Intelligence'**
  String get c13_1_wrong_2;

  /// No description provided for @c13_1_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Leadership'**
  String get c13_1_wrong_3;

  /// No description provided for @c13_1_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'Evaluation'**
  String get c13_1_wrong_4;

  /// No description provided for @c13_1_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'Sportspersonship'**
  String get c13_1_wrong_5;

  /// No description provided for @c13_1_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'Self-confidence'**
  String get c13_1_wrong_6;

  /// No description provided for @c13_2_title.
  ///
  /// In en, this message translates to:
  /// **'Teaching styles or models'**
  String get c13_2_title;

  /// No description provided for @c13_2_question.
  ///
  /// In en, this message translates to:
  /// **'Teaching Styles or Models: Based on Mosston’s Styles, choose 3 Styles that you could use to achieve the purpose of the lesson.'**
  String get c13_2_question;

  /// No description provided for @c13_2_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Reciprocal'**
  String get c13_2_correct_1;

  /// No description provided for @c13_2_correct_2.
  ///
  /// In en, this message translates to:
  /// **'Self-Check'**
  String get c13_2_correct_2;

  /// No description provided for @c13_2_correct_3.
  ///
  /// In en, this message translates to:
  /// **'Divergent Discovery'**
  String get c13_2_correct_3;

  /// No description provided for @c13_2_correct_4.
  ///
  /// In en, this message translates to:
  /// **'Learner Designed'**
  String get c13_2_correct_4;

  /// No description provided for @c13_2_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get c13_2_wrong_1;

  /// No description provided for @c13_2_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get c13_2_wrong_2;

  /// No description provided for @c13_2_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Inclusion'**
  String get c13_2_wrong_3;

  /// No description provided for @c13_2_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'Guided Discovery'**
  String get c13_2_wrong_4;

  /// No description provided for @c13_2_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'Convergent Discovery'**
  String get c13_2_wrong_5;

  /// No description provided for @c13_2_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'Learner Initiated'**
  String get c13_2_wrong_6;

  /// No description provided for @c13_2_wrong_7.
  ///
  /// In en, this message translates to:
  /// **'Self-Teach'**
  String get c13_2_wrong_7;

  /// No description provided for @c13_3_title.
  ///
  /// In en, this message translates to:
  /// **'Teaching models'**
  String get c13_3_title;

  /// No description provided for @c13_3_question.
  ///
  /// In en, this message translates to:
  /// **'Teaching models: based on the aim of the lesson, choose 1 teaching model to enhance students’ physical literacy.'**
  String get c13_3_question;

  /// No description provided for @c13_3_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Cooperative Education'**
  String get c13_3_correct_1;

  /// No description provided for @c13_3_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Sport Education'**
  String get c13_3_wrong_1;

  /// No description provided for @c13_3_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Teaching Personal Social Responsibility'**
  String get c13_3_wrong_2;

  /// No description provided for @c13_3_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Health Based PE'**
  String get c13_3_wrong_3;

  /// No description provided for @c13_4_title.
  ///
  /// In en, this message translates to:
  /// **'Dare'**
  String get c13_4_title;

  /// No description provided for @c13_4_question.
  ///
  /// In en, this message translates to:
  /// **'Dare: based on the aim of the lesson and the teaching model adopted, choose 1 dare that can help the students improve their skills.'**
  String get c13_4_question;

  /// No description provided for @c13_4_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Children can choose the balances they want to do and how they link them into a sequence.'**
  String get c13_4_correct_1;

  /// No description provided for @c13_4_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Children are all challenged to do the same balances and sequences.'**
  String get c13_4_wrong_1;

  /// No description provided for @c13_4_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Children are challenged to do the same balances but choose how to link them into a sequence.'**
  String get c13_4_wrong_2;

  /// No description provided for @c13_5_title.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get c13_5_title;

  /// No description provided for @c13_5_question.
  ///
  /// In en, this message translates to:
  /// **'Support: based on the aim of the lesson and the teaching model adopted, choose 1 support that can help the students to enhance their skills.'**
  String get c13_5_question;

  /// No description provided for @c13_5_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Children are supported by themselves and worksheets that have pictures and text to describe the balances and how they might be linked together.'**
  String get c13_5_correct_1;

  /// No description provided for @c13_5_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'The Teacher moves around the class to provide support and advice where appropriate.'**
  String get c13_5_wrong_1;

  /// No description provided for @c13_5_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Some students are nominated as support and they work with a group, providing advice.'**
  String get c13_5_wrong_2;

  /// No description provided for @c13_6_title.
  ///
  /// In en, this message translates to:
  /// **'Aspects'**
  String get c13_6_title;

  /// No description provided for @c13_6_question.
  ///
  /// In en, this message translates to:
  /// **'Aspects: What would you be most likely to modify? Choose 2 elements that you can modify.'**
  String get c13_6_question;

  /// No description provided for @c13_6_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get c13_6_correct_1;

  /// No description provided for @c13_6_correct_2.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get c13_6_correct_2;

  /// No description provided for @c13_6_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Spaces'**
  String get c13_6_wrong_1;

  /// No description provided for @c13_6_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get c13_6_wrong_2;

  /// No description provided for @c13_6_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get c13_6_wrong_3;

  /// No description provided for @c13_6_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get c13_6_wrong_4;

  /// No description provided for @c13_7_title.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get c13_7_title;

  /// No description provided for @c13_7_question.
  ///
  /// In en, this message translates to:
  /// **'Priority: What would be your priority? Choose two priorities.'**
  String get c13_7_question;

  /// No description provided for @c13_7_correct_1.
  ///
  /// In en, this message translates to:
  /// **'Maximum participation'**
  String get c13_7_correct_1;

  /// No description provided for @c13_7_correct_2.
  ///
  /// In en, this message translates to:
  /// **'Involvement'**
  String get c13_7_correct_2;

  /// No description provided for @c13_7_correct_3.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get c13_7_correct_3;

  /// No description provided for @c13_7_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Safety'**
  String get c13_7_wrong_1;

  /// No description provided for @c13_7_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get c13_7_wrong_2;

  /// No description provided for @c13_7_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Enjoyment'**
  String get c13_7_wrong_3;

  /// No description provided for @c13_8_title.
  ///
  /// In en, this message translates to:
  /// **'Assessment strategy'**
  String get c13_8_title;

  /// No description provided for @c13_8_question.
  ///
  /// In en, this message translates to:
  /// **'Assessment strategy: choose the correct assessment strategy to evaluate your students\' activity.'**
  String get c13_8_question;

  /// No description provided for @c13_8_correct_1.
  ///
  /// In en, this message translates to:
  /// **'At the end of the lesson, the children are split into two. Half of the class performs their sequence and a pair from the observers provides feedback on what they did well and what they could improve, then the other half performs their sequence and has feedback provided by a pair from the observers.'**
  String get c13_8_correct_1;

  /// No description provided for @c13_8_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'At the end of the lesson each pair has to perform their partner sequence in front of everyone and the teacher gives them a mark out of 10.'**
  String get c13_8_wrong_1;

  /// No description provided for @c13_8_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Students fill in a written sheet of paper explaining what they did well and what they could improve on in their partner sequence.'**
  String get c13_8_wrong_2;

  /// No description provided for @c13a2_intro.
  ///
  /// In en, this message translates to:
  /// **'You have to pass the last activity to pass the final challenge.  As I said previously, the learning outcomes for the lesson cover four areas:\n1.\tPhysical/Move – To perform a variety of challenging partner balances that can be linked to their partner sequence.\n2.\tAffective/Feel – To gain confidence in performing increasingly challenging partner balances and motivation to try more challenging partner balances.\n3.\tCognitive/Think – To consider examples of partner balances and create their own versions, which will link into their partner sequence.\n4.\tSocial/Connect - To work cooperatively in creating and refining challenging partner balances that are added to their partner sequence.\nChoose 2 questions for each category.\n'**
  String get c13a2_intro;

  /// No description provided for @c13a2_finish.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have completed challenge 13 so you have collected your badge! Congratulations!!! You have completed all challenges!'**
  String get c13a2_finish;

  /// No description provided for @c13_9_title.
  ///
  /// In en, this message translates to:
  /// **'Physical/Move'**
  String get c13_9_title;

  /// No description provided for @c13_9_question.
  ///
  /// In en, this message translates to:
  /// **'Physical/Move: Choose 2 questions related to physical movement improvement.'**
  String get c13_9_question;

  /// No description provided for @c13_9_correct_1.
  ///
  /// In en, this message translates to:
  /// **'What improvements have you made to your performance? How do you know?'**
  String get c13_9_correct_1;

  /// No description provided for @c13_9_correct_2.
  ///
  /// In en, this message translates to:
  /// **'What can you show now that you couldn’t before the lesson?'**
  String get c13_9_correct_2;

  /// No description provided for @c13_9_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'What new skills did you learn today? Can you show me what the correct technique looks like?'**
  String get c13_9_wrong_1;

  /// No description provided for @c13_9_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'What new tactics did you learn today? Can you tell me why they are important?'**
  String get c13_9_wrong_2;

  /// No description provided for @c13_9_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Did you develop any aspects of your fitness today? How will that help you and how could you train that further outside of PE lessons?'**
  String get c13_9_wrong_3;

  /// No description provided for @c13_9_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'What component of fitness did you apply most effectively in today’s lesson and when? What impact did that have?'**
  String get c13_9_wrong_4;

  /// No description provided for @c13_9_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'Using no words, demonstrate the teaching points from today to a partner.'**
  String get c13_9_wrong_5;

  /// No description provided for @c13_9_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'How would you rate yourself out of 10 for skilful movement today? What could improve your score?'**
  String get c13_9_wrong_6;

  /// No description provided for @c13_9_wrong_7.
  ///
  /// In en, this message translates to:
  /// **'If you were the coach, how would you teach the skill?'**
  String get c13_9_wrong_7;

  /// No description provided for @c13_9_wrong_8.
  ///
  /// In en, this message translates to:
  /// **'How can the movements/skills practiced in this lesson help you in other sports/activities?'**
  String get c13_9_wrong_8;

  /// No description provided for @c13_10_title.
  ///
  /// In en, this message translates to:
  /// **'Affective/Feel'**
  String get c13_10_title;

  /// No description provided for @c13_10_question.
  ///
  /// In en, this message translates to:
  /// **'Affective/Feel: Choose 2 questions related to emotional experiences during the lesson.'**
  String get c13_10_question;

  /// No description provided for @c13_10_correct_1.
  ///
  /// In en, this message translates to:
  /// **'How did it feel working with others today?'**
  String get c13_10_correct_1;

  /// No description provided for @c13_10_correct_2.
  ///
  /// In en, this message translates to:
  /// **'How confident do you feel about participating in more of this activity?'**
  String get c13_10_correct_2;

  /// No description provided for @c13_10_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'What did you like most about today’s lesson? What was the best moment?'**
  String get c13_10_wrong_1;

  /// No description provided for @c13_10_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Were there any elements of the lesson that you did not enjoy?'**
  String get c13_10_wrong_2;

  /// No description provided for @c13_10_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'What do you wish we had done differently or more of or less of?'**
  String get c13_10_wrong_3;

  /// No description provided for @c13_10_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'What element of your PE lesson are you most proud of?'**
  String get c13_10_wrong_4;

  /// No description provided for @c13_10_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'If you could repeat this lesson, how could you have made it more enjoyable?'**
  String get c13_10_wrong_5;

  /// No description provided for @c13_10_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'Following on from today\'s lesson, what would you like to learn next?'**
  String get c13_10_wrong_6;

  /// No description provided for @c13_10_wrong_7.
  ///
  /// In en, this message translates to:
  /// **'Do you feel valued in your team/group?'**
  String get c13_10_wrong_7;

  /// No description provided for @c13_10_wrong_8.
  ///
  /// In en, this message translates to:
  /// **'How would you score this lesson out of 10 for fun? What could be done to improve that score?'**
  String get c13_10_wrong_8;

  /// No description provided for @c13_10_wrong_9.
  ///
  /// In en, this message translates to:
  /// **'When did you demonstrate the most confidence in today’s lesson?'**
  String get c13_10_wrong_9;

  /// No description provided for @c13_10_wrong_10.
  ///
  /// In en, this message translates to:
  /// **'When did you feel out of your comfort zone today?'**
  String get c13_10_wrong_10;

  /// No description provided for @c13_10_wrong_11.
  ///
  /// In en, this message translates to:
  /// **'Did you feel safe in today’s lesson?'**
  String get c13_10_wrong_11;

  /// No description provided for @c13_11_title.
  ///
  /// In en, this message translates to:
  /// **'Cognitive/Think'**
  String get c13_11_title;

  /// No description provided for @c13_11_question.
  ///
  /// In en, this message translates to:
  /// **'Cognitive/Think: Choose 2 questions related to cognitive thinking and reflection.'**
  String get c13_11_question;

  /// No description provided for @c13_11_correct_1.
  ///
  /// In en, this message translates to:
  /// **'What do you need to work on most to improve further?'**
  String get c13_11_correct_1;

  /// No description provided for @c13_11_correct_2.
  ///
  /// In en, this message translates to:
  /// **'What different roles could you fulfil in the lesson and what skills are needed for each?'**
  String get c13_11_correct_2;

  /// No description provided for @c13_11_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'What was the most valuable thing you learnt today? How will you use that learning in the future?'**
  String get c13_11_wrong_1;

  /// No description provided for @c13_11_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'How could you do it differently next time?'**
  String get c13_11_wrong_2;

  /// No description provided for @c13_11_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'What is the most important thing for you to remember from today? How will you remember it?'**
  String get c13_11_wrong_3;

  /// No description provided for @c13_11_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'Is there anything you can do before our next lesson to develop further or practice what we have done today?'**
  String get c13_11_wrong_4;

  /// No description provided for @c13_11_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'Is there an aspect of this activity you would like to know more about?'**
  String get c13_11_wrong_5;

  /// No description provided for @c13_11_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'What rules or constraints could you add to make the lesson harder for you?'**
  String get c13_11_wrong_6;

  /// No description provided for @c13_11_wrong_7.
  ///
  /// In en, this message translates to:
  /// **'What could you do to make the lesson easier for you?'**
  String get c13_11_wrong_7;

  /// No description provided for @c13_11_wrong_8.
  ///
  /// In en, this message translates to:
  /// **'What will you do to be physically active between now and your next lesson?'**
  String get c13_11_wrong_8;

  /// No description provided for @c13_11_wrong_9.
  ///
  /// In en, this message translates to:
  /// **'What would you like to find out more about?'**
  String get c13_11_wrong_9;

  /// No description provided for @c13_11_wrong_10.
  ///
  /// In en, this message translates to:
  /// **'If you were to teach today’s lesson, how might you do it?'**
  String get c13_11_wrong_10;

  /// No description provided for @c13_12_title.
  ///
  /// In en, this message translates to:
  /// **'Social/Connect'**
  String get c13_12_title;

  /// No description provided for @c13_12_question.
  ///
  /// In en, this message translates to:
  /// **'Social/Connect: Choose 2 questions related to social interactions during the lesson.'**
  String get c13_12_question;

  /// No description provided for @c13_12_correct_1.
  ///
  /// In en, this message translates to:
  /// **'How well did you work with others?'**
  String get c13_12_correct_1;

  /// No description provided for @c13_12_correct_2.
  ///
  /// In en, this message translates to:
  /// **'Who showed the most creativity today? What impact did it have?'**
  String get c13_12_correct_2;

  /// No description provided for @c13_12_wrong_1.
  ///
  /// In en, this message translates to:
  /// **'Who was the MVP (most valuable participant)? Why?'**
  String get c13_12_wrong_1;

  /// No description provided for @c13_12_wrong_2.
  ///
  /// In en, this message translates to:
  /// **'Who demonstrated the best leadership characteristics in today’s lesson? How did they do this?'**
  String get c13_12_wrong_2;

  /// No description provided for @c13_12_wrong_3.
  ///
  /// In en, this message translates to:
  /// **'Did you display kindness and respect for others during the lesson? If so, how?'**
  String get c13_12_wrong_3;

  /// No description provided for @c13_12_wrong_4.
  ///
  /// In en, this message translates to:
  /// **'How did relationships with other students impact your progress in this lesson?'**
  String get c13_12_wrong_4;

  /// No description provided for @c13_12_wrong_5.
  ///
  /// In en, this message translates to:
  /// **'How would you teach this lesson to a friend?'**
  String get c13_12_wrong_5;

  /// No description provided for @c13_12_wrong_6.
  ///
  /// In en, this message translates to:
  /// **'Describe a moment in the lesson where you helped another student make progress.'**
  String get c13_12_wrong_6;

  /// No description provided for @c13_12_wrong_7.
  ///
  /// In en, this message translates to:
  /// **'How did you contribute towards a shared goal today?'**
  String get c13_12_wrong_7;

  /// No description provided for @c13_12_wrong_8.
  ///
  /// In en, this message translates to:
  /// **'How well did you communicate with others today?'**
  String get c13_12_wrong_8;

  /// No description provided for @c13_12_wrong_9.
  ///
  /// In en, this message translates to:
  /// **'Who did you work well with today? Why?'**
  String get c13_12_wrong_9;

  /// No description provided for @c13_12_wrong_10.
  ///
  /// In en, this message translates to:
  /// **'Where can you access more opportunities to play or do what we learnt today?'**
  String get c13_12_wrong_10;

  /// No description provided for @c13_12_wrong_11.
  ///
  /// In en, this message translates to:
  /// **'Who is your role model in this class? Why?'**
  String get c13_12_wrong_11;

  /// No description provided for @c13_lives_remaining.
  ///
  /// In en, this message translates to:
  /// **'Lives remaining'**
  String get c13_lives_remaining;

  /// No description provided for @glossary_Attributes.
  ///
  /// In en, this message translates to:
  /// **'Attributes'**
  String get glossary_Attributes;

  /// No description provided for @glossary_AffectiveDomain.
  ///
  /// In en, this message translates to:
  /// **'Affective Domain'**
  String get glossary_AffectiveDomain;

  /// No description provided for @glossary_CognitiveDomain.
  ///
  /// In en, this message translates to:
  /// **'Cognitive Domain'**
  String get glossary_CognitiveDomain;

  /// No description provided for @glossary_Confidence.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get glossary_Confidence;

  /// No description provided for @glossary_Domains.
  ///
  /// In en, this message translates to:
  /// **'Domains'**
  String get glossary_Domains;

  /// No description provided for @glossary_Dualism.
  ///
  /// In en, this message translates to:
  /// **'Dualism'**
  String get glossary_Dualism;

  /// No description provided for @glossary_Embodied.
  ///
  /// In en, this message translates to:
  /// **'Embodied'**
  String get glossary_Embodied;

  /// No description provided for @glossary_Existentialism.
  ///
  /// In en, this message translates to:
  /// **'Existentialism'**
  String get glossary_Existentialism;

  /// No description provided for @glossary_HealthLiteracy.
  ///
  /// In en, this message translates to:
  /// **'Health Literacy'**
  String get glossary_HealthLiteracy;

  /// No description provided for @glossary_HumanDimension.
  ///
  /// In en, this message translates to:
  /// **'Human Dimension'**
  String get glossary_HumanDimension;

  /// No description provided for @glossary_KnowledgeAndUnderstanding.
  ///
  /// In en, this message translates to:
  /// **'Knowledge and Understanding'**
  String get glossary_KnowledgeAndUnderstanding;

  /// No description provided for @glossary_Literacy.
  ///
  /// In en, this message translates to:
  /// **'Literacy'**
  String get glossary_Literacy;

  /// No description provided for @glossary_Monism.
  ///
  /// In en, this message translates to:
  /// **'Monism'**
  String get glossary_Monism;

  /// No description provided for @glossary_Motivation.
  ///
  /// In en, this message translates to:
  /// **'Motivation'**
  String get glossary_Motivation;

  /// No description provided for @glossary_MovementCapacities.
  ///
  /// In en, this message translates to:
  /// **'Movement Capacities'**
  String get glossary_MovementCapacities;

  /// No description provided for @glossary_MovementPatterns.
  ///
  /// In en, this message translates to:
  /// **'Movement Patterns'**
  String get glossary_MovementPatterns;

  /// No description provided for @glossary_MovementVocabulary.
  ///
  /// In en, this message translates to:
  /// **'Movement Vocabulary'**
  String get glossary_MovementVocabulary;

  /// No description provided for @glossary_Phenomenology.
  ///
  /// In en, this message translates to:
  /// **'Phenomenology'**
  String get glossary_Phenomenology;

  /// No description provided for @glossary_PhysicalActivity.
  ///
  /// In en, this message translates to:
  /// **'Physical Activity'**
  String get glossary_PhysicalActivity;

  /// No description provided for @glossary_PhysicalCompetence.
  ///
  /// In en, this message translates to:
  /// **'Physical Competence'**
  String get glossary_PhysicalCompetence;

  /// No description provided for @glossary_PhysicalDomain.
  ///
  /// In en, this message translates to:
  /// **'Physical Domain'**
  String get glossary_PhysicalDomain;

  /// No description provided for @glossary_PhysicalEducation.
  ///
  /// In en, this message translates to:
  /// **'Physical Education'**
  String get glossary_PhysicalEducation;

  /// No description provided for @glossary_PhysicalLiteracy.
  ///
  /// In en, this message translates to:
  /// **'Physical Literacy'**
  String get glossary_PhysicalLiteracy;

  /// No description provided for @glossary_Sport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get glossary_Sport;

  /// No description provided for @glossary_Attributes_desc.
  ///
  /// In en, this message translates to:
  /// **'Are the constituent elements of physical literacy that are identified in the full definition of the concept. When developing physical literacy, individuals will discover that they have the potential to develop all the attributes identified in the full definition.'**
  String get glossary_Attributes_desc;

  /// No description provided for @glossary_AffectiveDomain_desc.
  ///
  /// In en, this message translates to:
  /// **'The affective domain refers to aspects of motivation, confidence, self-esteem, self-confidence and a positive sense of self, developed and nurtured in a range of environments.'**
  String get glossary_AffectiveDomain_desc;

  /// No description provided for @glossary_CognitiveDomain_desc.
  ///
  /// In en, this message translates to:
  /// **'The cognitive domain refers to the knowledge and understanding of fitness and health including exercise, nutrition, sleep, and lifestyle, as well as the development of intelligent action, an understanding of movement, and application of creativity and imagination in a range of environments.'**
  String get glossary_CognitiveDomain_desc;

  /// No description provided for @glossary_Confidence_desc.
  ///
  /// In en, this message translates to:
  /// **'Can be described as the perception of one\'s own abilities.'**
  String get glossary_Confidence_desc;

  /// No description provided for @glossary_Domains_desc.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy domains refer to the interrelated affective, physical, and cognitive domains that underpin the concept of physical literacy. The behavioral, social, and environmental domains are also referred to in some literature.'**
  String get glossary_Domains_desc;

  /// No description provided for @glossary_Dualism_desc.
  ///
  /// In en, this message translates to:
  /// **'The view that human beings are comprised of two very different and separable \'parts,\' being the \'body\' and the \'mind\'.'**
  String get glossary_Dualism_desc;

  /// No description provided for @glossary_Embodied_desc.
  ///
  /// In en, this message translates to:
  /// **'In the context of physical literacy, the term embodiment is used specifically to describe the potential individuals have to interact with the environment via our embodied dimension. This covers both embodiment as-lived as well as embodiment as an instrument or object.'**
  String get glossary_Embodied_desc;

  /// No description provided for @glossary_Existentialism_desc.
  ///
  /// In en, this message translates to:
  /// **'Is a philosophy that is based on the principle that existence precedes essence. In other words, individuals make themselves as they interact with the world.'**
  String get glossary_Existentialism_desc;

  /// No description provided for @glossary_HealthLiteracy_desc.
  ///
  /// In en, this message translates to:
  /// **'The degree to which individuals and groups can obtain, process, understand, evaluate, and act upon information needed to make public health decisions that benefit the community.'**
  String get glossary_HealthLiteracy_desc;

  /// No description provided for @glossary_HumanDimension_desc.
  ///
  /// In en, this message translates to:
  /// **'An aspect of human being through which individuals can interact with the world and express themselves. Embodiment is one such dimension – hence, embodied dimension.'**
  String get glossary_HumanDimension_desc;

  /// No description provided for @glossary_KnowledgeAndUnderstanding_desc.
  ///
  /// In en, this message translates to:
  /// **'Comprised of two main constituents, the first related to grasping essential principles of movement and performance. The second involves developing knowledge and understanding of fitness and health, including understanding the value of physical activity, exercise, appropriate diet, and the need for relaxation and sleep.'**
  String get glossary_KnowledgeAndUnderstanding_desc;

  /// No description provided for @glossary_Literacy_desc.
  ///
  /// In en, this message translates to:
  /// **'Literacy is our embodied interaction with an environment. It includes the use of critical and creative thinking skills and processes, conveying information through various forms of communication, and applying knowledge and skills to make connections within and between various contexts.'**
  String get glossary_Literacy_desc;

  /// No description provided for @glossary_Monism_desc.
  ///
  /// In en, this message translates to:
  /// **'The view that humans are an entity, a whole, and not divisible into separate \'parts,\' such as the \'body\' and the \'mind\'. This is also referred to as a holistic view or holism, indicating that humans are an indivisible \'whole\'.'**
  String get glossary_Monism_desc;

  /// No description provided for @glossary_Motivation_desc.
  ///
  /// In en, this message translates to:
  /// **'Can be defined as the direction and intensity of one’s effort.'**
  String get glossary_Motivation_desc;

  /// No description provided for @glossary_MovementCapacities_desc.
  ///
  /// In en, this message translates to:
  /// **'The constituent abilities of articulate movement.'**
  String get glossary_MovementCapacities_desc;

  /// No description provided for @glossary_MovementPatterns_desc.
  ///
  /// In en, this message translates to:
  /// **'General movement patterns comprise the total stock of movements of which the human is capable. The general movement patterns mastered by an individual may be referred to as their movement vocabulary. Specific movement patterns arise when refined movement patterns are applied within specific activity contexts and movement forms.'**
  String get glossary_MovementPatterns_desc;

  /// No description provided for @glossary_MovementVocabulary_desc.
  ///
  /// In en, this message translates to:
  /// **'Refer to movement patterns.'**
  String get glossary_MovementVocabulary_desc;

  /// No description provided for @glossary_Phenomenology_desc.
  ///
  /// In en, this message translates to:
  /// **'Is a philosophy based on the principle that we as human beings give meaning to the world as we perceive it. Objects in the world have no meaning prior to an individual’s perception of that feature.'**
  String get glossary_Phenomenology_desc;

  /// No description provided for @glossary_PhysicalActivity_desc.
  ///
  /// In en, this message translates to:
  /// **'Any bodily movement produced by skeletal muscles that requires energy expenditure.'**
  String get glossary_PhysicalActivity_desc;

  /// No description provided for @glossary_PhysicalCompetence_desc.
  ///
  /// In en, this message translates to:
  /// **'Can be described as the sufficiency in movement vocabulary, movement capacities, and developed movement patterns, plus the deployment of these in a range of movement forms.'**
  String get glossary_PhysicalCompetence_desc;

  /// No description provided for @glossary_PhysicalDomain_desc.
  ///
  /// In en, this message translates to:
  /// **'The physical domain encourages the nurturing of physical competence in a range of environments in order to develop a rich and wide-ranging movement vocabulary.'**
  String get glossary_PhysicalDomain_desc;

  /// No description provided for @glossary_PhysicalEducation_desc.
  ///
  /// In en, this message translates to:
  /// **'Physical education is the school subject in which children do physical exercises or take part in physical games and sports.'**
  String get glossary_PhysicalEducation_desc;

  /// No description provided for @glossary_PhysicalLiteracy_desc.
  ///
  /// In en, this message translates to:
  /// **'Physical literacy can be described as the motivation, confidence, physical competence, knowledge, and understanding to value and take responsibility for engagement in physical activities for life.'**
  String get glossary_PhysicalLiteracy_desc;

  /// No description provided for @glossary_Sport_desc.
  ///
  /// In en, this message translates to:
  /// **'Sport is most often used to refer to competitive games or physical activities. Typically, in this context, sports are governed by an agreed set of rules and require participants to learn and exhibit physical athleticism and skill. Sports are used within the Physical Education curriculum to provide learning experiences.'**
  String get glossary_Sport_desc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['el', 'en', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'el_backup_nicos':
      return AppLocalizationsElBackupNicos();
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
