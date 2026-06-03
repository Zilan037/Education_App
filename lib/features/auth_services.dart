import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<User?> register(
      String name,
      String email,
      String password,
      String role,
      ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      if (user == null) return null;

      await _db.collection("users").doc(user.uid).set({
        "uid": user.uid,
        "name": name,
        "email": email,
        "role": role,
        "createdAt": FieldValue.serverTimestamp(),
      });

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception("${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw Exception("${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser =
      await googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
      await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      if (user != null) {
        final doc =
        await _db.collection("users").doc(user.uid).get();

        if (!doc.exists) {
          await _db.collection("users").doc(user.uid).set({
            "uid": user.uid,
            "name": user.displayName ?? "",
            "email": user.email ?? "",
            "role": "student",
            "createdAt": FieldValue.serverTimestamp(),
          });
        }
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception("${e.code}: ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
