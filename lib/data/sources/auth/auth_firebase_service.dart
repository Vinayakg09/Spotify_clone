import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/model/auth/create_user_req.dart';
import 'package:spotify_clone/data/model/auth/signIn_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserReq createUserReq);

  Future<Either> signIn(SignInUserReq signInUserReq);
}

class AuthFireBaseImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserReq.email, password: signInUserReq.password);

      return const Right("SignIn successfull");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "invalid-email") {
        message = "User not found with that email";
      } else if (e.code == 'invalid-credential') {
        message = "Wrong password";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection("Users").add({
        'name' : createUserReq.fullName,
        'email' : data.user?.email,
      });

      return const Right("SignUp was successfull");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "weak-password") {
        message = "Password provoded is too weak";
      } else if (e.code == 'email-already-used') {
        message = "An Account already exit with that email.";
      }
      return Left(message);
    }
  }
}
