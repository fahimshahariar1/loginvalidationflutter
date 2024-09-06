import 'package:flutter/material.dart';
import 'package:loginvalidationui/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool isObscure = true;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://img.freepik.com/free-vector/gradient-liquid-mobille-wallpaper_79603-461.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 25),
              child: Text(
                "Welcome \nBack",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Form(

                  key: formkey,

                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Can not be empty";
                          }
                          if (!value.contains("@")) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(

                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Can not be empty";
                          }
                          if (value.length < 3) {
                            return "Invalid Password";
                          }
                          return null;
                        },
                        controller: passController,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(Icons.visibility),
                            ),
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Forgot Password?"),
                      Spacer(),
                      MaterialButton(
                        minWidth: 350,
                        height: 40,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: Colors.blue,
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          text: TextSpan(
                              text: "Don't Have an Account?",
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " Sign Up",
                                    style: TextStyle(color: Colors.blue))
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
