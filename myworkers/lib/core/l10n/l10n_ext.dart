import 'package:flutter/widgets.dart';
import 'package:myworkers/core/l10n/arb/core_localizations.dart';

extension CoreLocalizationsX on BuildContext {
  CoreLocalizations get l10nCore => CoreLocalizations.of(this);
}
