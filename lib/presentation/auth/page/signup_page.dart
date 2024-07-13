import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone_using_bloc/common/widgets/appbar/appbar_button.dart';
import 'package:spotify_clone_using_bloc/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_using_bloc/core/config/assets/app_vectors.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/create_user_req.dart';
import 'package:spotify_clone_using_bloc/domain/usercases/auth/signup.dart';
import 'package:spotify_clone_using_bloc/presentation/auth/page/signin_page.dart';
import 'package:spotify_clone_using_bloc/presentation/home/pages/home_page.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BassicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: _signinText(context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 40,
          ),
          child: Column(
            children: [
              _registerText(),
              const Gap(50),
              _fullNameField(context: context),
              const Gap(20),
              _emailField(context: context),
              const Gap(20),
              _passwordField(context: context),
              const Gap(30),
              BasicAppButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                      fullName: _fullName.text,
                      email: _email.text,
                      password: _password.text,
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                title: "Create Account",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _fullNameField({required BuildContext context}) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(hintText: "Full Name")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField({required BuildContext context}) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(hintText: "Enter Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField({required BuildContext context}) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: "Enter Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do you have an account? ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninPage(),
                ),
              );
            },
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
