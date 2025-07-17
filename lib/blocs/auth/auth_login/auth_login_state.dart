abstract class  AuthState{}
class  AuthInitialState extends AuthState{}
class  AuthLoadingState extends AuthState{}
class  AuthSuccessState extends AuthState{}
class   AuthFailureState extends AuthState{
  final String message ;
  AuthFailureState(this.message);
}
