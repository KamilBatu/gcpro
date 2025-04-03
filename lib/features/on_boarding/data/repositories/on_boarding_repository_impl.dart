import 'package:gcpro/features/on_boarding/data/datasource/on_boarding_datasource.dart';

abstract class OnboardingRepository {}

class OnboardingRepositoryImpl extends OnboardingRepository {
  OnboardingRepositoryImpl(this.onboardingDatasource);
  final OnboardingDatasource onboardingDatasource;
}
