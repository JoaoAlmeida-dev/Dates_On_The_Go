import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSingIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;
  final Logger _logger = Logger();

  Future googleLogin() async {
    try {
      final googleUser = await googleSingIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      _logger.d('User Logged In');
    } catch (e) {
      _logger.e('Error while signing in with Google:\n' + e.toString());
    }

    notifyListeners();
  }

  Future googleLogout() async {
    await googleSingIn.disconnect();
    FirebaseAuth.instance.signOut();
    _logger.d('User Signed out');
  }
}
