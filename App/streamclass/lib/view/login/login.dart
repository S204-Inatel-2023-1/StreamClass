import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:streamclass/controller/userDB.dart';
import 'package:streamclass/core/appSize.dart';
import 'package:streamclass/view/home_page/home_page.dart';

class Login_widget extends StatefulWidget {
  const Login_widget({Key? key}) : super(key: key);

  @override
  State<Login_widget> createState() => _Login_widgetState();
}

class _Login_widgetState extends State<Login_widget> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  final styleText = TextStyle(fontSize: SizeText.textInput);
  bool hide = true;
  String? _senhaerror;
  String? _emailerror;
  Color _emailColor = Colors.white.withOpacity(.5);
  Color _senhaColor = Colors.white.withOpacity(.5);

  InputBorder bordas = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(66, 156, 216, 1),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(25.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.fromLTRB(20.sp, 30.sp, 20.sp, 40.sp),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Colors.blueAccent,
              Colors.transparent,
            ],
          ),
          image: DecorationImage(
            image: AssetImage(
              "assets/background.jpg",
            ),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stream Class",
              style: TextStyle(
                fontSize: 45.sp,
                color: Colors.white,
                fontFamily: 'JockeyOne',
              ),
            ),
            SizedBox(
              height: 60.sp,
              child: Image(
                image: AssetImage(
                  "assets/logo.png",
                ),
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Wrap(
                runSpacing: 1.h,
                children: [
                  Text(
                    "Acesse sua conta para continuar",
                    style: TextStyle(
                      fontSize: SizeText.textInput,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: _email,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedErrorBorder: bordas,
                      errorBorder: bordas,
                      errorText: _emailerror,
                      focusedBorder: bordas,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: _emailColor,
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(66, 156, 216, 1),
                      enabledBorder: bordas,
                    ),
                  ),
                  TextFormField(
                    controller: _senha,
                    obscureText: hide,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      focusedErrorBorder: bordas,
                      errorBorder: bordas,
                      errorText: _senhaerror,
                      focusedBorder: bordas,
                      hintText: "Senha",
                      hintStyle: TextStyle(
                        color: _senhaColor,
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(66, 156, 216, 1),
                      enabledBorder: bordas,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 5.0.w),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            hide = !hide;
                          }),
                          child: Icon(
                            hide
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_email.text.isEmpty || _email.text == null) {
                  setState(
                    () {
                      _emailerror = "Digite seu email";
                      _emailColor = Colors.red;
                    },
                  );
                }
                if (_senha.text.isEmpty || _senha.text == null) {
                  setState(
                    () {
                      _senhaerror = "Digite sua senha";
                      _senhaColor = Colors.red;
                    },
                  );
                }
                if (_email.text.isNotEmpty && _senha.text.isNotEmpty) {
                  _signin(_email.text, _senha.text);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                child: Text(
                  "Conectar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: SizeText.textInput,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Wrap(
                runSpacing: 0.5.h,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Criar conta para continuar",
                            style: TextStyle(
                              fontSize: SizeText.textInput,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 14.sp,
                            width: 14.sp,
                            child: Image(
                              image: AssetImage(
                                "assets/google.png",
                              ),
                            ),
                          ),
                          Text(
                            "  Conectar com Google     ",
                            style: TextStyle(
                              fontSize: SizeText.textInput,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(14, 8, 14, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 14.sp,
                            width: 14.sp,
                            child: Image(
                              image: AssetImage(
                                "assets/face.png",
                              ),
                            ),
                          ),
                          Text(
                            "  Conectar com Facebook",
                            style: TextStyle(
                              fontSize: SizeText.textInput,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _signin(String email, String senha) async {
    try {
      if (await UserDB().verificaEmail(email)) {
        if (await UserDB().verificaSenha(senha)) {
          await UserDB().login(email, senha).then((value) {
            setState(() {
              _emailColor = Colors.white.withOpacity(.5);
              _senhaColor = Colors.white.withOpacity(.5);
              _emailerror = null;
              _senhaerror = null;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            });
          });
        } else {
          setState(
            () {
              _senhaerror = "Senha errada";
              _senhaColor = Colors.red;
              _emailerror = null;
              _emailColor = Colors.white.withOpacity(.5);
            },
          );
        }
      } else {
        setState(
          () {
            _emailerror = "Email não encontrado";
            _emailColor = Colors.red;
            _senhaerror = null;
            _senhaColor = Colors.white.withOpacity(.5);
          },
        );
      }
    } catch (e) {
      setState(() {
        _emailColor = Colors.red;
        _emailerror = "Sem conexão";
        _senhaerror = null;
        _senhaColor = Colors.red;
      });
    }
  }
}
