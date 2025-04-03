import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalErrorState {

  GlobalErrorState({
    this.errorMessage = '',
    this.hasError = false,
  });
  final String errorMessage;
  final bool hasError;

  GlobalErrorState copyWith({String? errorMessage, bool? hasError}) {
    return GlobalErrorState(
      errorMessage: errorMessage ?? this.errorMessage,
      hasError: hasError ?? this.hasError,
    );
  }
}

final globalErrorNotifierProvider = StateNotifierProvider<GlobalErrorNotifier, GlobalErrorState>(
  (ref) {
    return GlobalErrorNotifier();
  },
  name: 'globalErrorNotifierProvider',
);

final globalErrorProvider = Provider<GlobalErrorState>(
  (ref) {
    // ref.listen(authStateNotifierProvider, (previous, next) {
    //   if (next is Failure) {
    //     ref.read(globalErrorNotifierProvider.notifier).setError(next.exception.message.toString());
    //   }
    // });

    return ref.watch(globalErrorNotifierProvider);
  },
  name: 'globalErrorProvider',
);

class GlobalErrorNotifier extends StateNotifier<GlobalErrorState> {
  GlobalErrorNotifier() : super(GlobalErrorState());

  void setError(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage, hasError: true);
  }

  void clearError() {
    state = state.copyWith(errorMessage: '', hasError: false);
  }
}
