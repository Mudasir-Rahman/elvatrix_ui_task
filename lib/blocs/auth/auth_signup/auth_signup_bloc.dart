import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repository/auth_firebase_repository.dart';
import 'auth_signup_event.dart';
import 'auth_signup_state.dart';

class AuthSignupBloc extends Bloc<AuthSignupEvent, AuthSignupState> {
  final AuthRepository authRepository;

  AuthSignupBloc({required this.authRepository})
      : super(AuthSignupInitialState()) {
    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthSignupLoadingState());
      try {
        final user = await authRepository.signUp(
          email: event.email,
          password: event.password,
        );
        if (user != null) {
          emit(AuthSignupSuccessState());
        } else {
          emit(AuthSignupFailureState("Sign up failed: User is null"));
        }
      } catch (e) {
        emit(AuthSignupFailureState(e.toString()));
      }
    });
  }
}
