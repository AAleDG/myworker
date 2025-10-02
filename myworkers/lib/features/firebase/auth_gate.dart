import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // User? get currentUser => _auth.currentUser;

  // Future<UserCredential> signInWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);

  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception("${e.message ?? ''} ${e.code}");
  //   }
  // }

  // Future<UserCredential> signUpWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     UserCredential? userCredential = await _auth
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception("${e.message ?? ''} ${e.code}");
  //   }
  // }

  // signOut(BuildContext context) async {
  //   GoogleSignIn googleSignIn = GoogleSignIn(
  //       clientId:
  //           '915601686359-v6plrh0pam9brg1o39lorlaqjkj8chh3.apps.googleusercontent.com');
  //   await googleSignIn.disconnect();
  //   await googleSignIn.signOut();
  //   return await _auth.signOut().then((_) {
  //     AutoRouter.of(context).push(const InitialRoute());
  //   });
  // }

//   static Future<void> signInWithGoogleSilently() async {
//   try {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signInSilently();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       await FirebaseAuth.instance.signInWithCredential(credential);
//     }
//   } catch (error) {
//     throw error;
//   }
// }

  Future<UserCredential> signInWithGoogleFirebase() async {
    await _ensureGoogleSignInInitialized();

    // Authenticate with Google
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
      scopeHint: ['email'],
    );

    // Get authorization for Firebase scopes if needed
    final authClient = _googleSignIn.authorizationClient;
    final authorization = await authClient.authorizationForScopes(['email']);

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: authorization?.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Update local state
    _currentUser = googleUser;

    return userCredential;
  }

  GoogleSignInAccount? _currentUser;
  GoogleSignInAccount? get currentUser => _currentUser;

  bool get isSignedIn => _currentUser != null;

  Future<void> signIn() async {
    try {
      _currentUser = await signInWithGoogle();
      // Manually notify listeners or update state
    } catch (error) {
      _currentUser = null;
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _currentUser = null;
  }

  Future<String?> getAccessTokenForScopes(List<String> scopes) async {
    await _ensureGoogleSignInInitialized();

    try {
      final authClient = _googleSignIn.authorizationClient;

      // Try to get existing authorization
      var authorization = await authClient.authorizationForScopes(scopes);

      if (authorization == null) {
        // Request new authorization from user
        authorization = await authClient.authorizeScopes(scopes);
      }

      return authorization?.accessToken;
    } catch (error) {
      print('Failed to get access token for scopes: $error');
      return null;
    }
  }

  GoogleSignInAuthentication getAuthTokens(GoogleSignInAccount account) {
    // authentication is now synchronous
    return account.authentication;
  }

  Future<GoogleSignInAccount?> attemptSilentSignIn() async {
    await _ensureGoogleSignInInitialized();

    try {
      // attemptLightweightAuthentication can return Future or immediate result
      final result = _googleSignIn.attemptLightweightAuthentication();

      // Handle both sync and async returns
      if (result is Future<GoogleSignInAccount?>) {
        return await result;
      } else {
        return result as GoogleSignInAccount?;
      }
    } catch (error) {
      print('Silent sign-in failed: $error');
      return null;
    }
  }

  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  AuthService() {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  /// Always check Google sign in initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<GoogleSignInAccount> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();

    try {
      // authenticate() throws exceptions instead of returning null
      final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email'], // Specify required scopes
      );
      return account;
    } on GoogleSignInException catch (e) {
      rethrow;
    } catch (error) {
      print('Unexpected Google Sign-In error: $error');
      rethrow;
    }
  }
}
