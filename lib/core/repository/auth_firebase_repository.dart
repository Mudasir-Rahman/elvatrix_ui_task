import 'package:firebase_auth/firebase_auth.dart';
class AuthRepository{
  final FirebaseAuth firebaseAuth;
  AuthRepository({FirebaseAuth? firebaseAuth}):
      firebaseAuth=firebaseAuth?? FirebaseAuth.instance;
  Future<User?> signIn({required String email ,required String password}) async{
    final result= await firebaseAuth.signInWithEmailAndPassword(email: email,
        password: password);
  return result.user;
  }
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

}