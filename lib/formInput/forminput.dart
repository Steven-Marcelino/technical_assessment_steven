// ignore_for_file: prefer_const_constructors, duplicate_ignore, avoid_single_cascade_in_expression_statements, avoid_unnecessary_containers

part of 'input.dart';

class FormInput extends StatefulWidget {
  const FormInput({Key key}) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State {
  final _formKey = GlobalKey<FormState>();
  String nama = "";
  String email = "";
  String password = "";
  String konfirpassword = "";
  String gender;
  String date;
  String kota;

  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController konfirpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _loadUserData();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void pilihGender(String value) {
    setState(() {
      gender = value;
    });
  }

  List<String> listKota = [
    'Lampung',
    'Semarang',
    'Cilacap',
    'Bandung',
    'Palembang',
    'Jakarta'
  ];
  void pilihKota(String value) {
    setState(() {
      kota = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Form Input',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.black,
          ),
          textScaleFactor: 1,
        ),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () => Get.back(),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              // nama
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 70),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: namaController,
                        cursorColor: Color(0xFF6658F6),
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          labelText: "Nama*",
                          labelStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xFF6658F6),
                              width: 2,
                            ),
                          ),
                        ),
                        // validator: (nama) {
                        //   if (nama.isEmpty) {
                        //     return 'Nama Anda Belum Terisi';
                        //   }

                        //   return null;
                        // },
                        onSaved: (String nama) {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

                      //Email

                      TextFormField(
                        controller: emailController,
                        cursorColor: Color(0xFF6658F6),
                        decoration: InputDecoration(
                          hintText: "email@example.com",
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          labelText: "Email*",
                          labelStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xFF6658F6),
                              width: 2,
                            ),
                          ),
                        ),
                        // validator: (email) {
                        //   return null;
                        // },
                        onSaved: (String email) {},
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

                      // password
                      TextFormField(
                        controller: passwordController,
                        cursorColor: Color(0xFF6658F6),
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xFF6658F6),
                              width: 2,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordVisibility();
                            },
                            child: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isHidePassword
                                  ? Colors.grey
                                  : Color(0xFF6658F6),
                            ),
                          ),
                        ),

                        // validator: (passwordvalue) {
                        //   if (passwordvalue.isEmpty) {
                        //     return 'Kata Sandi Anda Belum Terisi';
                        //   }
                        //   if (passwordController.text !=
                        //       konfirpasswordController.text) {
                        //     return 'Kata Sandi Tidak Cocok';
                        //   }
                        //   password = passwordvalue;
                        //   return null;
                        // },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),

                      //konfirpassword
                      TextFormField(
                        controller: konfirpasswordController,
                        cursorColor: Color(0xFF6658F6),
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          hintText: "********",
                          hintStyle: TextStyle(
                              color: Color(0xFF9b9b9b),
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                          labelText: "Konfirmasi Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF9b9b9b)),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xFF6658F6),
                              width: 2,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordVisibility();
                            },
                            child: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isHidePassword
                                  ? Colors.grey
                                  : Color(0xFF6658F6),
                            ),
                          ),
                        ),
                        // validator: (konfirpasswordvalue) {
                        //   if (konfirpasswordvalue.isEmpty) {
                        //     return 'Kata Sandi Anda Belum Terisi';
                        //   }
                        //   if (passwordController.text !=
                        //       konfirpasswordController.text) {
                        //     return 'Kata Sandi Tidak Cocok';
                        //   }
                        //   konfirpassword = konfirpasswordvalue;
                        //   return null;
                        // },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              //gender
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: RadioListTile(
                      value: "Laki Laki",
                      groupValue: gender,
                      onChanged: (String value) {
                        setState(
                          () {
                            pilihGender(value);
                          },
                        );
                      },
                      title: Text("Laki Laki"),
                      activeColor: Color(0xFF6658F6),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: RadioListTile(
                      value: "Perempuan",
                      groupValue: gender,
                      onChanged: (String value) {
                        setState(
                          () {
                            pilihGender(value);
                          },
                        );
                      },
                      title: Text("Perempuan"),
                      activeColor: Color(0xFF6658F6),
                    ),
                  ),
                ],
              )),
              Container(
                padding: EdgeInsets.only(left: 20, right: 70),
                child: MyTextFieldDatePicker(
                  labelText: "Tanggal Lahir",
                  prefixIcon: Icon(Icons.date_range, color: Color(0xFF6658F6)),
                  suffixIcon:
                      Icon(Icons.arrow_drop_down, color: Color(0xFF6658F6)),
                  lastDate: DateTime(1800),
                  firstDate: DateTime(DateTime.now().year - 17,
                      DateTime.now().month, DateTime.now().day),
                  initialDate: DateTime(DateTime.now().year - 17,
                      DateTime.now().month, DateTime.now().day),
                  onDateChanged: (selectedDate) {
                    // Aksi yang diperlukan saat mengganti kalender
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              //kotaasal
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 70,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: kota,
                    hint: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Kota Kelahiran'),
                    ),
                    items: listKota.map((e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        pilihKota(value);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        side: BorderSide(
                          color: Color(0xFF6658F6),
                        ),
                        primary: Color(0xFF6658F6),
                      ),
                      child: Text(
                        "Simpan",
                        textScaleFactor: 1,
                      ),
                      onPressed: () {
                        if (namaController.text.trim() == "" &&
                            emailController.text.trim() == "" &&
                            passwordController.text.trim() == "" &&
                            konfirpasswordController.text.trim() == "" &&
                            gender == null) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Silahkan Isi Semua Kolom",
                          )..show(context);
                        } else if (namaController.text.trim() == "") {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Nama Anda Belum Terisi",
                          )..show(context);
                        } else if (emailController.text.trim() == "") {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Email Anda Belum Terisi",
                          )..show(context);
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(emailController.text)) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Email Tidak Valid",
                          )..show(context);
                        } else if (passwordController.text.trim() == "") {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Password Anda Belum Terisi",
                          )..show(context);
                        } else if (konfirpasswordController.text.trim() == "") {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Silahkan Isi Konfirmasi Password",
                          )..show(context);
                        } else if (passwordController.text !=
                            konfirpasswordController.text) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message:
                                "Password tidak cocok dengan konfirmasi password anda",
                          )..show(context);
                        } else if (gender == null) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Gender Belum Dimasukan",
                          )..show(context);
                        } else if (kota == null) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF6658F6),
                            message: "Masukan Kotal Kelahiran",
                          )..show(context);
                        } else {
                          _simpan();
                        }
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          side: BorderSide(
                            color: Color(0xFFF1F1F1),
                          ),
                          primary: Colors.white),
                      child: Text(
                        "Batal & Back",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        textScaleFactor: 1,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              // ignore: prefer_const_constructors
            ],
          ),
        ],
      ),
    );
  }

  void _simpan() async {
    if (_formKey.currentState.validate()) {
      setIntoSharedPreferences();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HasilInput()));
    }
  }

  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("kota", kota.toString());
    await prefs.setString("gender", gender.toString());
    await prefs.setString("nama", namaController.text);
    await prefs.setString("email", emailController.text);
    await prefs.setString("password", passwordController.text);
  }
}
