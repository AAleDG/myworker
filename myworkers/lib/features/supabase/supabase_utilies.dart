import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SignUpStatus { successWithSession, awaitingConfirmation, error }

class SignUpResponse {
  final SignUpStatus status;
  final String? message;

  SignUpResponse(this.status, [this.message]);
}

class SupabaseUtilies {
  static String? lastSignInAt = '';

  /// Sign up. Returns structured response indicating if a session was created
  /// (some Supabase setups auto-login) or if the user must confirm email.
  Future<SignUpResponse> signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      final supabase = Supabase.instance.client;
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: 'salmo12',
      );
      final Session? session = res.session;
      lastSignInAt = session?.user.lastSignInAt;
      debugPrint('Signed up');
      debugPrint('Session: $session');
      if (session != null) {
        return SignUpResponse(SignUpStatus.successWithSession);
      }
      // No session -> likely awaiting email confirmation
      return SignUpResponse(SignUpStatus.awaitingConfirmation);
    } on AuthException catch (e) {
      debugPrint('Auth failed: $e');
      return SignUpResponse(SignUpStatus.error, e.message);
    } catch (e) {
      debugPrint('Unknown Exception: $e');
      return SignUpResponse(SignUpStatus.error, e.toString());
    }
  }

  /// Refresh and return the latest user record from Supabase
  Future<User?> getCurrentUser() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.auth.getUser();
      return response.user;
    } catch (e) {
      debugPrint('getCurrentUser error: $e');
      return null;
    }
  }

  /// Checks if the currently logged user has confirmed email
  Future<bool> isEmailConfirmed() async {
    final user = await getCurrentUser();
    if (user == null) return false;
    // Supabase user has 'emailConfirmedAt' field which can be null
    final confirmedAt = user.emailConfirmedAt;
    return confirmedAt != null;
  }

  /// Try to sign in with email and password. Returns true if session created.
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      final supabase = Supabase.instance.client;
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: 'salmo12',
      );
      final session = res.session;
      return session != null;
    } on AuthException catch (e) {
      debugPrint('signIn failed: $e');
      return false;
    } catch (e) {
      debugPrint('signIn unknown error: $e');
      return false;
    }
  }
}
