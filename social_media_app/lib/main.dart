import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bloc/auth_cubit.dart';
import 'package:social_media_app/screens/posts_screen.dart';

import 'screens/chat_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/sing_in_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/posts_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await SentryFlutter.init((options) {
    options.dsn = 'https://469105f193dd4616b5dcc9e17a294776@o1264606.ingest.sentry.io/6447701';
  },
      // Init your App.
      appRunner: () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  Widget _buildHomeScreen() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snaphot) {
          if (snaphot.hasData) {
            return PostScreen();
          } else {
            return SignInScreen();
          }
        });
  }

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: _buildHomeScreen(),
        routes: {
          SignInScreen.id: (context) => const SignInScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          PostScreen.id: (context) => const PostScreen(),
          CreatePostScreen.id: (context) => const CreatePostScreen(),
          ChatScreen.id: (context) => const ChatScreen(),
        },
      ),
    );
  }
}
