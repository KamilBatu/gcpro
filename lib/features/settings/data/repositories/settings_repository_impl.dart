import 'package:gcpro/features/settings/data/datasource/settings_datasource.dart';

abstract class SettingsRepository {}

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl(this.settingsDatasource);
  final SettingsDatasource settingsDatasource;
}
