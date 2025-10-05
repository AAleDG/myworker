class AuthUtils {
  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'network-request-failed':
        return 'Network error. Please try again later.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      default:
        return 'An undefined Error happened.';
    }
  }
}
