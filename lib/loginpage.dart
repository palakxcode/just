import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
//import 'package:device_preview/device_preview.dart';
import 'create_acc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(MaterialApp(
//       home: LoginApp(),
//     ));

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => LoginAppState();
}

class LoginAppState extends State<LoginApp> {
  bool _isObscure = true;
  final TextEditingController _regNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _saveCredentials(String regNumber, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('regNumber', regNumber);
    await prefs.setString('password', password);
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    _regNumberController.text = prefs.getString('regNumber') ?? '';
    _passwordController.text = prefs.getString('password') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;

    return MaterialApp(
      // //useInheritedMediaQuery: true,

      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      //home: const HomePage(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.062),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  GradientText(
                    'Login here',
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlusJakartaSans',
                    ),
                    textAlign: TextAlign.center,
                    colors: const [
                      Color.fromARGB(255, 45, 45, 255),
                      Color.fromARGB(255, 113, 174, 146),
                      Color.fromARGB(255, 56, 241, 53),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'PlusJakartaSans',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.15),
                  TextFormField(
                    controller: _regNumberController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                    ],
                    style: const TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontFamily: 'PlusJakartaSans',
                    ),
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Registration Number',
                      hintStyle: const TextStyle(color: Color(0xFF8A8A8A)),
                      prefixIcon: const Icon(Icons.person),
                      fillColor: const Color(0xFF1C2129),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    style: const TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontFamily: 'PlusJakartaSans',
                    ),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontFamily: 'PlusJakartaSans',
                      ),
                      prefixIcon: const Icon(Icons.key_sharp),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      fillColor: const Color(0xFF1C2129),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  TextButton(
                    //forgot pwd button
                    onPressed: () {
                      /////////////////
                    },
                    child: const Text(
                      'forgot password?',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3BBD39),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {
                      _saveCredentials(
                        _regNumberController.text,
                        _passwordController.text,
                      ).then((_) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const Screen2(), // sign in page screen
                        ));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4949D6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'PlusJakartaSans',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  TextButton(
                    //create acc button
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const Screen2(), //create account page screen
                      ));
                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 16.0,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
