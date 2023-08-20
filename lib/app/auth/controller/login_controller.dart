// ignore_for_file: avoid_print

import 'package:carstore/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController smsCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxString verificationId = ''.obs;
  String truncatedCode = '';

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAndToNamed(Routes.appBottomBar);
      }
    } catch (e) {
      print("Google sign-in error: $e");
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final AccessToken? result =
          (await FacebookAuth.instance.login()) as AccessToken?;

      if (result != null) {
        final OAuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.token);

        await FirebaseAuth.instance.signInWithCredential(facebookCredential);
        Get.offAndToNamed(Routes.appBottomBar);
      }
    } catch (e) {
      print("Facebook sign-in error: $e");
    }
  }

  Future<void> signInWithTwitter(BuildContext context) async {
    try {
      final twitterLogin = TwitterLogin(
        apiKey: 'cyp5iT9R3r84aswGTRgPiF0Qq',
        apiSecretKey: 'AH5uBzDRrCWV8RLjkxlGS0gUcMQo7roHDFV4Fr25Ugm8t3YFme',
        redirectURI: 'https://twitter.com/?logout=1691617192172',
      );

      final authResult = await twitterLogin.login();

      if (authResult.status == TwitterLoginStatus.loggedIn) {
        final AuthCredential twitterCredential = TwitterAuthProvider.credential(
          accessToken: authResult.authToken!,
          secret: authResult.authTokenSecret!,
        );

        await FirebaseAuth.instance.signInWithCredential(twitterCredential);
        Get.offAndToNamed(Routes.appBottomBar);
      }
    } catch (e) {
      print("Twitter sign-in error: $e");
    }
  }

  Future<void> verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumberController.text,
      codeSent: (String vId, int? resendToken) => {
        Get.toNamed(Routes.loginVerification),
        verificationId.value = vId,
        // truncatedCode = verificationId.value.substring(0, 4),
        print('verificationId: ${verificationId.value}')
      },
      codeAutoRetrievalTimeout: (String vId) => {verificationId.value = vId},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential).then((value) => {
              print('Phone Auth Verification Successfully'),
            });
      },
      verificationFailed: (FirebaseAuthException error) {
        print('Phone Auth Verification Failed: ${error.message}');
      },
    );
    print(phoneNumberController.value);
  }

  Future<void> signInWithPhoneNumber() async {
    print('verificationId: ${verificationId.value}');
    print('truncatedCode: $truncatedCode');
    print('smsCodeController: $smsCodeController');
    if (smsCodeController.text == truncatedCode) {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsCodeController.text,
      );

      try {
        await _auth.signInWithCredential(credential);
        Get.toNamed(Routes.loginInfo);
      } catch (error) {
        print('Phone Auth Error: $error');
      }
    } else {
      // Code is incorrect, show error to the user
      print('Incorrect Verification Code');
    }
  }
}
