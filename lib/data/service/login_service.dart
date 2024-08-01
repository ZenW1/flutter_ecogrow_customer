import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecogrow_customer/shared/constant/custom_dialog.dart';

class LoginService {
  factory LoginService() => _instance;

  LoginService._internal();

  static final LoginService _instance = LoginService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';


  Future<String> sendOtp({
    required String phoneNumber,
  }) async {
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
          print('codeSent');
          verificationId = this.verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('codeAutoRetrievalTimeout');
          verificationId = this.verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
      return 'Otp Sent';
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> verifyOtp({
    required String codeSms,
  }) async {
    try {
      final userCredential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: codeSms,
        ),
      );
      return userCredential.additionalUserInfo!.isNewUser;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
