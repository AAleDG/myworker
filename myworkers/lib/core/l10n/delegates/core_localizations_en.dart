import 'core_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CoreLocalizationsEn extends CoreLocalizations {
  CoreLocalizationsEn([String locale = 'en']) : super(locale);

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
  String get loginPageHintTextErrorEmptyPassword => 'Inserisci una password valida!';

  @override
  String get loginPageHintTextValidPassword => 'La password deve essere di almeno 8 caratteri';

  @override
  String get loginPageRememberMe => 'Ricorda i dati di accesso';

  @override
  String get loginPageAccessButtonText => 'Accedi';
}
