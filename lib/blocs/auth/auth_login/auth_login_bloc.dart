import 'package:flutter/material.dart';
import 'auth_login_event.dart';
import 'auth_login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AuthBloc extends Bloc<AuthEvent , AuthState>{
  //this is for calling the .signInWitEmailAndPassword
  final  FirebaseAuth auth=FirebaseAuth.instance;
  // here AuthBloc start from Initial State
  AuthBloc() : super(AuthInitialState()){
    on<LoginRequested>((event ,emit)async{
      emit(AuthLoadingState());
      try{
      await auth.signInWithEmailAndPassword(email: event.email,
          password: event.password);

      emit(AuthSuccessState());
    }
    catch(e) {
      emit(AuthFailureState(e.toString()));
    }
    });
  }

}