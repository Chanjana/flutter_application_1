import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  // dont't gorget to add firebasea auth and google sign in package
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn(); // Prompt user to select a Google account for sign-in
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount
                .authentication; // Retrieve authentication tokens
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        ); // Create AuthCredential using Google authentication tokens
        await auth.signInWithCredential(
            authCredential); // Sign in to Firebase with AuthCredential
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

// for sign out
  googleSignOut() async {
    await googleSignIn.signOut(); // Sign out from GoogleSignIn
    auth.signOut(); // Sign out from FirebaseAuth
  }
}
