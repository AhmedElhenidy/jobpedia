import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }
  String get locale {
    return Intl.message('en', name: 'locale');
  }
  String get drawerHome {
    return Intl.message('Home', name: 'drawerHome');
  }
  String get drawerSave {
    return Intl.message('Save', name: 'drawerSave');
  }
  String get drawerCategories {
    return Intl.message('Categories', name: 'drawerCategories');
  }
  String get drawerMagazine {
    return Intl.message('Our Magazine', name: 'drawerMagazine');
  }
  String get drawerAboutUs {
    return Intl.message('About Us', name: 'drawerAboutUs');
  }
  String get drawerContactUs {
    return Intl.message('Contact Us', name: 'drawerContactUs');
  }
  String get drawerShare {
    return Intl.message('Share', name: 'drawerShare');
  }
  String get drawerWelcome {
    return Intl.message('Welcome to', name: 'drawerWelcome');
  }
  String get drawerTravel {
    return Intl.message('Travel news', name: 'drawerTravel');
  }
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);


}