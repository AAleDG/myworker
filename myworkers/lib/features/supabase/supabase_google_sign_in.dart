import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseGoogleSignIn {
static Future<AuthResponse> googleSignIn() async {
  /// Web Client ID that you registered with Google Cloud.
  const webClientId =
      '1031565178527-13hobu0br3q7ore1d6ihm9a5im8qk4r2.apps.googleusercontent.com';

  /// TODO: update the iOS client ID with your own.
  ///
  /// iOS Client ID that you registered with Google Cloud.
  const iosClientId =
      '1031565178527-43h4lfpdard9p7sui5vvojq3kblblndn.apps.googleusercontent.com';

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.

  final GoogleSignIn signIn = GoogleSignIn.instance;

  // At the start of your app, initialize the GoogleSignIn instance
  unawaited(
    signIn.initialize(
      clientId: iosClientId,
      serverClientId: webClientId,
    ),
  );

  // Perform the sign in
  final googleAccount = await signIn.authenticate();
  final googleAuthorization =
      await googleAccount.authorizationClient.authorizationForScopes([]);
  final googleAuthentication = googleAccount.authentication;
  final idToken = googleAuthentication.idToken;
  final accessToken = googleAuthorization!.accessToken;

  if (idToken == null) {
    throw 'No ID Token found.';
  }
  final supabase = Supabase.instance.client;

  return await supabase.auth.signInWithIdToken(
    provider: OAuthProvider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
}
}
