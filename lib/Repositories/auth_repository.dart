import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import '../Models/user.dart';

class SignUpFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  Future<String> signUp({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future<String>.value('Success');
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('''
    caught firebase auth exception\n
    ${e.code}\n
    ${e.message}
  ''');

      return Future<String>.value(e.message);
    } catch (error) {
      print('neki___' + error.toString());
      return Future<String>.value(error.toString());
    }
  }

  // Current Solution to just get error message, shame on me
  Future<String> getErrorMessage({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Future<String>.value(null);
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('''
    caught firebase auth exception\n
    ${e.code}\n
    ${e.message}
  ''');


      return Future<String>.value(e.message);
    } catch (error) {
      return Future<String>.value(error.toString());
    }
  }

  Future<String> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Future<String>.value('Success');
    } on firebase_auth.FirebaseAuthException catch (e) {
      print('''
    caught firebase auth exception\n
    ${e.code}\n
    ${e.message}
  ''');

      return Future<String>.value(e.message);
    } on Exception catch (e) {
      return Future<String>.value(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
