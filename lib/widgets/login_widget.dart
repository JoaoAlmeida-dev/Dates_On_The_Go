import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../services/google_sign_in_provider.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const FlutterLogo(
            size: 120,
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            label: const Text('Sign Up With Google'),
            icon: const Icon(
              FontAwesomeIcons.google,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          RichText(
            text: const TextSpan(text: 'Already have an account? ', children: [
              TextSpan(
                  text: 'Log In',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ))
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
