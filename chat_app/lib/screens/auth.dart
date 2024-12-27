import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    try {
      if (_isLogin) {
        // log users in
        final userCredentials = await _firebase.signInWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
      } else {
        // create new user

        final userCredentials = await _firebase.createUserWithEmailAndPassword(email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
      }
      // on FirebaseAuthException setting to catch the specific error
    } on FirebaseAuthException catch (error) {
      // you can set specific error message for each case
      if (error.code == 'email-already-in-use') {
        // ...
      }

      // set default message to all error
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        // ensure the content is reacahble if the keyboard is open
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image Container
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              // Input Field
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // take as much space needed by the content
                        children: [
                          // EMAIL
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              // return an error message if invalid,
                              if (value == null || value.trim().isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address.';
                              }
                              // or return null if valid
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredEmail = newValue!; // no need to use setState, because not updating the UI
                            },
                          ),
                          // PASSWORD
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true, // to make the input not visible (shows as dot dot dot ...)
                            validator: (value) {
                              // return an error message if invalid,
                              if (value == null || value.trim().length < 6) {
                                return 'Password must be at least 6 characters long.';
                              }
                              // or return null if valid
                              return null;
                            },
                            onSaved: (newValue) {
                              _enteredPassword = newValue!; // no need to use setState, because not updating the UI
                            },
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            ),
                            child: Text(
                              _isLogin ? 'Login' : 'Signup',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin ? 'Create an account' : 'I already have an account',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
