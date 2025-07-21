abstract class AuthSignupEvent{}
class AuthSignUpRequested extends AuthSignupEvent{
  final String name ;
  final String phone ;
  final String email;
  final String password ;
  final String ConformPassword;
  AuthSignUpRequested( this.name , this.phone,this.email,this.password,this.ConformPassword);
}