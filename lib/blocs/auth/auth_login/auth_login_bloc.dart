
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repository/auth_firebase_repository.dart';
import 'auth_login_event.dart';
import 'auth_login_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.signIn(
          email: event.email,
          password: event.password,
        );
        if (user != null) {
          emit(AuthSuccessState());
        } else {
          emit(AuthFailureState("Login failed: User is null"));
        }
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });
  }
}
