import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OmMaterialLocalizations extends DefaultMaterialLocalizations {
  @override
  String get okButtonLabel => 'Eeyyee';
  @override
  String get cancelButtonLabel => 'Haqi';
  @override
  String get closeButtonLabel => 'Cufi';
  @override
  String get cutButtonLabel => 'Cufaa';
}

class OmMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const OmMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'om';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return SynchronousFuture<MaterialLocalizations>(OmMaterialLocalizations());
  }

  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) => false;
}
