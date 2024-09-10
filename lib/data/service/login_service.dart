import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';

class LoginService {
  factory LoginService() => _instance;

  LoginService._internal();

  static final LoginService _instance = LoginService._internal();

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  // Stream<auth.User?> get statusChange => _auth.authStateChanges();

  late String? _verificationId = '';

  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            CustomDialog.showWarningDialog(
              'The provided phone number is not valid. ${e.message}',
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } on auth.FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<int> timeOut() async {
    return Future.delayed(Duration(seconds: 60));
  }

  Future<bool> verifyOtp({required String codeSms}) async {
    try {
      final userCredential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: codeSms,
        ),
      );
      return userCredential.additionalUserInfo!.isNewUser;
    } on auth.FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<String> getAccessToken() async {
    final user = _auth.currentUser;
    final token = await user!.getIdToken();
    return  token!;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
