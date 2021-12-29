// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace

part of 'input.dart';

class HasilInput extends StatefulWidget {
  const HasilInput({Key key}) : super(key: key);

  @override
  _HasilInputState createState() => _HasilInputState();
}

class _HasilInputState extends State<HasilInput> {
  // ignore: unused_field
  int _counter = 0;

  PanelController _pc2 = PanelController();
  bool _visible = true;

  String nama;
  String email;
  String password;
  String gender;
  String date;
  String kota;

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
    _getFromSharedPreferences();
  }

  void _getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _pc2.open();
      nama = prefs.getString("nama");
      email = prefs.getString("email");
      gender = prefs.getString("gender");
      password = prefs.getString("password");
      date = prefs.getString("date");
      kota = prefs.getString("kota");
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Sukses",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 25),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: LottieBuilder.asset("assets/success.json"),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            visible: _visible,
            child: SlidingUpPanel(
              controller: _pc2,
              panel: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.grey[400],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Lengkap : $nama",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          Text(
                            "Kota Lahir : $kota",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          Text(
                            "Tanggal Lahir : $date",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          Text(
                            "E-mail : $email",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          Text(
                            "Jenis Kelamin : $gender",
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 25,
                                        vertical: 10,
                                      ),
                                      side: BorderSide(
                                        color: Color(0xFF6658F6),
                                      ),
                                      primary: Color(0xFF6658F6),
                                    ),
                                    child: Text(
                                      "Kembali Menu Utama",
                                      textScaleFactor: 1,
                                    ),
                                    onPressed: () {
                                      Get.offAll(() => MainPage());
                                      // Navigator.push(context,
                                      //     MaterialPageRoute(builder: (context) => FormInput()));
                                    }),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              collapsed: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: radius),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.grey[400],
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              borderRadius: radius,
            ),
          ),
        ],
      ),
    );
  }
}
