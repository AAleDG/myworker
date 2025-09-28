import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_localizations_en.dart';
import 'core_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CoreLocalizations
/// returned by `CoreLocalizations.of(context)`.
///
/// Applications need to include `CoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'delegates/core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreLocalizations.localizationsDelegates,
///   supportedLocales: CoreLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CoreLocalizations.supportedLocales
/// property.
abstract class CoreLocalizations {
  CoreLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreLocalizations of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations)!;
  }

  static const LocalizationsDelegate<CoreLocalizations> delegate =
      _CoreLocalizationsDelegate();

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
    Locale('en'),
    Locale('it')
  ];

  /// No description provided for @splashPageTitle.
  ///
  /// In it, this message translates to:
  /// **'Benvenuto in AF Progettazioni!'**
  String get splashPageTitle;

  /// No description provided for @splashPageAccessButtonText.
  ///
  /// In it, this message translates to:
  /// **'Login'**
  String get splashPageAccessButtonText;

  /// No description provided for @splashPageRegisterButtonText.
  ///
  /// In it, this message translates to:
  /// **'Registrati'**
  String get splashPageRegisterButtonText;

  /// No description provided for @confirmButtonText.
  ///
  /// In it, this message translates to:
  /// **'Conferma'**
  String get confirmButtonText;

  /// No description provided for @loginPageTitle.
  ///
  /// In it, this message translates to:
  /// **'Inserisci i tuoi dati'**
  String get loginPageTitle;

  /// No description provided for @loginPageEmailHint.
  ///
  /// In it, this message translates to:
  /// **'Inserisci la tua email'**
  String get loginPageEmailHint;

  /// No description provided for @loginPagePasswordHint.
  ///
  /// In it, this message translates to:
  /// **'Inserisci la tua password'**
  String get loginPagePasswordHint;

  /// No description provided for @loginPageHintTextErrorEmptyEmail.
  ///
  /// In it, this message translates to:
  /// **'Inserisci un\'email valida!'**
  String get loginPageHintTextErrorEmptyEmail;

  /// No description provided for @loginPageHintTextValidEmail.
  ///
  /// In it, this message translates to:
  /// **'Email non valida'**
  String get loginPageHintTextValidEmail;

  /// No description provided for @loginPageHintTextErrorEmptyPassword.
  ///
  /// In it, this message translates to:
  /// **'Inserisci una password valida!'**
  String get loginPageHintTextErrorEmptyPassword;

  /// No description provided for @loginPageHintTextValidPassword.
  ///
  /// In it, this message translates to:
  /// **'La password deve essere di almeno 8 caratteri'**
  String get loginPageHintTextValidPassword;

  /// No description provided for @loginPageRememberMe.
  ///
  /// In it, this message translates to:
  /// **'Ricorda i dati di accesso'**
  String get loginPageRememberMe;

  /// No description provided for @loginPageAccessButtonText.
  ///
  /// In it, this message translates to:
  /// **'Accedi'**
  String get loginPageAccessButtonText;

  /// No description provided for @registrationPageTitle.
  ///
  /// In it, this message translates to:
  /// **'Registra i tuoi dati'**
  String get registrationPageTitle;

  /// No description provided for @registrationPageHintName.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il tuo nome'**
  String get registrationPageHintName;

  /// No description provided for @registrationPageHintSurname.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il tuo cognome'**
  String get registrationPageHintSurname;

  /// No description provided for @registrationPageHintCF.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il tuo CF'**
  String get registrationPageHintCF;

  /// No description provided for @registrationPageHintGender.
  ///
  /// In it, this message translates to:
  /// **'Seleziona il tuo genere'**
  String get registrationPageHintGender;

  /// No description provided for @registrationPageHintPhoneConfirm.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il numero di conferma'**
  String get registrationPageHintPhoneConfirm;

  /// No description provided for @registrationPageHintPhone.
  ///
  /// In it, this message translates to:
  /// **'Inserisci il tuo numero di telefono'**
  String get registrationPageHintPhone;
}

class _CoreLocalizationsDelegate
    extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(
        lookupCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}

CoreLocalizations lookupCoreLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CoreLocalizationsEn();
    case 'it':
      return CoreLocalizationsIt();
  }

  throw FlutterError(
      'CoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
