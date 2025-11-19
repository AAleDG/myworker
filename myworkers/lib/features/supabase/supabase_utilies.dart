import 'package:flutter/material.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SignUpStatus { successWithSession, awaitingConfirmation, error }

class SignUpResponse {
  final SignUpStatus status;
  final String? message;

  SignUpResponse(this.status, [this.message]);
}

class SupabaseUtilies {
  static String? lastSignInAt = '';

  Future<UserEntity?> signIn(String email, String password) async {
    try {
      final supabase = Supabase.instance.client;
      final value = await supabase.auth
          .signInWithPassword(email: email, password: password);

      if (value.session != null) {
        // Session created; now fetch user data from your 'user' table
        final row = await supabase
            .from('user')
            .select()
            .eq('email', email)
            .maybeSingle();

        if (row == null) {
          debugPrint('User data not found in table for email: $email');
          return null;
        }

        // Map row to UserEntity
        return UserEntity(
          uid: row['id']?.toString(),
          phoneNumber: row['phone_number'] as String?,
          cf: row['cf'] as String?,
          email: row['email'] as String?,
          name: row['name'] as String?,
          surname: row['surname'] as String?,
        );
      } else {
        debugPrint('Sign in failed: no session created');
        return null;
      }
    } on AuthException catch (e) {
      debugPrint('signIn auth error: $e');
      return null;
    } catch (e) {
      debugPrint('signIn error: $e');
      return null;
    }
  }

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
  /// Returns null if no valid session exists or user is not found.
  Future<User?> getCurrentUser() async {
    try {
      final supabase = Supabase.instance.client;
      // First check if a session exists
      final session = supabase.auth.currentSession;
      if (session == null) {
        debugPrint('getCurrentUser: No active session');
        return null;
      }
      final response = await supabase.auth.getUser();
      return response.user;
    } on AuthException catch (e) {
      if (e.statusCode == '403' || e.code == 'user_not_found') {
        debugPrint(
            'getCurrentUser: User not found (likely awaiting email confirmation)');
      } else {
        debugPrint('getCurrentUser error: $e');
      }
      return null;
    } catch (e) {
      debugPrint('getCurrentUser error: $e');
      return null;
    }
  }

  /// Checks if the currently logged user has confirmed email
  /// Returns false if no session, no user, or email not confirmed yet.
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
        password: password,
      );
      final session = res.session;
      if (session != null) {
        debugPrint('signInWithEmail: session created for $email');
      } else {
        debugPrint('signInWithEmail: no session (email not confirmed?)');
      }
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
