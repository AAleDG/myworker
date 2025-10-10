import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myworkers/features/firebase/auth_utils.dart';

// Google Sign-In Service Class
class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static String errorCode = '';
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            '915601686359-v6plrh0pam9brg1o39lorlaqjkj8chh3.apps.googleusercontent.com',
      );
    }
    isInitialize = true;
  }

  static Future<UserCredential> loginUser(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        final userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': userCredential.user!.uid,
            'name': 'prova12',
            'email': email,
          });
        }
        log("Successfully logged in user with email: ${userCredential.user!.email}");
        return userCredential;
      } else {
        log('No user found for that email.');
        throw FirebaseAuthException(code: "user-not-found");
      }
    } on FirebaseAuthException catch (e) {
      errorCode = AuthUtils.getErrorMessage(e.code);
      log('Error logging in user: $e');
      rethrow;
    }
  }

  // Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      initSignIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);
      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user != null) {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': user.uid,
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'photoURL': user.photoURL ?? '',
            'provider': 'google',
            'phoneNumber': user.phoneNumber ?? '',
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
      return userCredential;
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      log('Error signing out: $e');
      rethrow;
    }
  }

  // Get current user
  static User? getCurrentUser() => _auth.currentUser;

  Future<void> registerNewUser(
    String email,
    String password,
    String surname,
    String name,
    String cf,
    String phone,
  ) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: 'prova12',
      );
      log("Successfully registered user with email: ${userCredential.user!.email}");
      final User? user = userCredential.user;
      if (user != null) {
        final userDoc =
            FirebaseFirestore.instance.collection('users').doc(user.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            'uid': user.uid,
            'name': name,
            'email': email,
            'photoURL': user.photoURL ?? '',
            'provider': 'register',
            'surname': surname,
            'cf': cf,
            'phoneNumber': phone,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
    } catch (e) {
      log("Error registering user: $e");
    }
  }
}
