// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'core_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class CoreLocalizationsIt extends CoreLocalizations {
  CoreLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get splashPageTitle => 'Benvenuto in AF Progettazioni!';

  @override
  String get splashPageAccessButtonText => 'Login';

  @override
  String get splashPageRegisterButtonText => 'Registrati';

  @override
  String get confirmButtonText => 'Conferma';

  @override
  String get loginPageTitle => 'Inserisci i tuoi dati';

  @override
  String get loginPageEmailHint => 'Inserisci la tua email';

  @override
  String get loginPagePasswordHint => 'Inserisci la tua password';

  @override
  String get loginPageHintTextErrorEmptyEmail => 'Inserisci un\'email valida!';

  @override
  String get loginPageHintTextValidEmail => 'Email non valida';

  @override
  String get loginPageHintTextErrorEmptyPassword =>
      'Inserisci una password valida!';

  @override
  String get loginPageHintTextValidPassword =>
      'La password deve essere di almeno 8 caratteri';

  @override
  String get loginPageRememberMe => 'Ricorda i dati di accesso';

  @override
  String get loginPageAccessButtonText => 'Accedi';

  @override
  String get registrationPageTitle => 'Registra i tuoi dati';

  @override
  String get registrationPageHintName => 'Inserisci il tuo nome';

  @override
  String get registrationPageHintSurname => 'Inserisci il tuo cognome';

  @override
  String get registrationPageHintCF => 'Inserisci il tuo CF';

  @override
  String get registrationPageHintGender => 'Seleziona il tuo genere';

  @override
  String get registrationPageHintPhoneConfirm =>
      'Inserisci il numero di conferma';

  @override
  String get registrationPageHintPhone => 'Inserisci il tuo numero di telefono';

  @override
  String get registrationNameErrorEmpty => 'Inserisci un nome valido!';

  @override
  String get registrationSurnameErrorEmpty => 'Inserisci un cognome valido!';

  @override
  String get registrationCFErrorEmpty => 'Inserisci un codice fiscale valido!';

  @override
  String get registrationCFValidError =>
      'Il codice fiscale deve essere di 16 caratteri!';

  @override
  String get registrationGenderErrorEmpty => 'Seleziona un genere valido!';

  @override
  String get registrationPhoneErrorEmpty =>
      'Inserisci un numero di telefono valido!';

  @override
  String get registrationPhoneLengthError =>
      'Il numero di telefono deve essere di almeno 10 cifre!';

  @override
  String get loginTextWithGoogle => 'Accedi con Google';

  @override
  String get homePagePersonalInfo => 'Info Personali';

  @override
  String get homePageRequest => 'Richieste';

  @override
  String get homePageProfile => 'Profilo';

  @override
  String get loginBackButton => 'Torna indietro';
}
