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
