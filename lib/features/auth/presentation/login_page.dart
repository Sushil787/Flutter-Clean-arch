import 'package:clean_arch/core/constants/route_constants.dart';
import 'package:clean_arch/di/di_setup.dart';
import 'package:clean_arch/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_arch/features/auth/presentation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// username controller
  final TextEditingController _usernameController = TextEditingController();

  /// password controller
  final TextEditingController _passwordController = TextEditingController();

  /// form key state
  final formKey = GlobalKey<FormState>();

  /// auth bloc
  final authBloc = getIt<AuthBloc>();
  @override
  void dispose() {
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: BlocProvider(
            create: (context) => authBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/09/CHANEL_THUMB_34302915-446e-4eb6-8eb1-ab1634e38378_1080x.jpg?auto=format&q=60&fit=max&w=930"),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        label(name: "Uname"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'uname',
                          controller: _usernameController,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        label(name: "password"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'password',
                          controller: _passwordController,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 42,
                ),
                _loadingButton(),
                _buildSignup()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignup() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            TextSpan(
              text: "\nSignup",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  BlocConsumer<AuthBloc, AuthState> _loadingButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Success) {
          context.go(RouteConstants.profileRoute);
        } else if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid Credential")));
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 50,
          width: double.maxFinite,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 86, 90, 97)),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  authBloc.add(AuthEvent.login(
                      uname: _usernameController.text.trim(),
                      password: _passwordController.text.trim()));
                }
              },
              child: state.maybeMap(
                loading: (_) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                orElse: () => const Text(
                  "login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              )),
        );
      },
    );
  }

  Widget label({required String name}) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 62, 56, 56),
          fontWeight: FontWeight.bold),
    );
  }
}
