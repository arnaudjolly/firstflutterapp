import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'environment.dart';
import 'github_oauth.dart';
import 'src/github_login.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.filename);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'GitHub Client'),
    );
  }

}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GithubLoginWidget(
      builder: (context, httpClient) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: const Center(
            child: Text(
              'You are logged in to GitHub!',
            ),
          ),
        );
      },
      githubClientId: Environment.githubClientId,
      githubClientSecret: Environment.githubClientSecret,
      githubScopes: githubScopes,
    );
  }
}

