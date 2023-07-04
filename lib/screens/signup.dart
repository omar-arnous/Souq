import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:souq/providers/auth_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _namrController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool secureText = true;

  @override
  void dispose() {
    _namrController.dispose();
    _emailController.dispose();
    _confirmEmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void submit() async {
      final response = await ref.read(authProvider.notifier).signup(
            _namrController.text,
            _emailController.text,
            _confirmEmailController.text,
            _passwordController.text,
          );
      if (response) {
        context.go('/');
      }
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 48),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SignUp',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 36),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: _namrController,
                        decoration: const InputDecoration(
                          label: Text(
                            'UserName',
                          ),
                          prefixIcon: Icon(Icons.account_box_rounded),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff1DE9B6),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          label: Text(
                            'E-mail',
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff1DE9B6),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: _confirmEmailController,
                        decoration: const InputDecoration(
                          label: Text(
                            'confirm E-mail',
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: const Color(0xff1DE9B6),
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          label: const Text(
                            'Password',
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                secureText = !secureText;
                              });
                            },
                            icon: secureText
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                        cursorColor: const Color(0xff1DE9B6),
                        obscureText: secureText,
                        enableSuggestions: false,
                        autocorrect: false,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 36),
                      ElevatedButton(
                        onPressed: submit,
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
