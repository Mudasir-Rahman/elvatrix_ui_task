abstract class AuthSignupState{}
class AuthSignupInitialState   extends AuthSignupState{}
class AuthSignupLoadingState extends AuthSignupState{}
class AuthSignupSuccessState extends AuthSignupState{}
class AuthSignupFailureState extends AuthSignupState{
final String message;
AuthSignupFailureState(this.message);
}