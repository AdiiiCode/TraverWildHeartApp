import 'package:final_project_tourism/LoginSignups/LoginPage.dart';
import 'package:flutter/material.dart';
class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({Key? key,required this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                  'Welcome to WildHerart Adventures',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                const Text(
                  'Travel and Explore with us',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter OTP';
                        }
                        return null;
                      },
                    decoration: const InputDecoration(
                      hintText: 'Enter One-Time-Password',
                      prefixIcon: Icon(Icons.output),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    shape: const BeveledRectangleBorder(),
                    side: const BorderSide(color: Colors.black, width: 0.2),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                  },
                  child: const Text(
                    'Confirm OTP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
