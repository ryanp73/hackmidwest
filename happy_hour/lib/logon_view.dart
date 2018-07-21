import 'package:flutter/material.dart';

class LogonView extends StatefulWidget {
  @override
  LogonViewState createState() {
    return LogonViewState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class LogonViewState extends State<LogonView> {
  // Create a global key that will uniquely identify the `Form` widget
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final key = new GlobalKey<ScaffoldState>();
  final emailController = new TextEditingController();
  final pwController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(' in login_view.build');
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            _doLogin();
            //Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.redAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      controller: pwController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    // Build a Form widget using the _formKey we created above
    return Scaffold(
        key: key,
        appBar: AppBar(title: Text("Login"), backgroundColor: Colors.redAccent),
        body: GestureDetector(
          onTap: () => FocusScope
              .of(context)
              .requestFocus(new FocusNode()), // hide keyboard
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)
                  ],
                ),
                SizedBox(height: 24.0),
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 12.0),
                loginButton,
                // forgotLabel
              ],
            ),
          ),
        ));
  }

  void _doLogin() async {
    if(emailController.text != null && emailController.text != '' && emailController.text != '' && pwController.text != null){
      Navigator.of(context).pop();
    }
    else{
      final snackBar = new SnackBar(content: Text('invalid credentials, try again'), duration: Duration(milliseconds: 500),);
      key.currentState.showSnackBar(snackBar);
    }
  }
}

    /*var client = http.Client();
    var response = await client.post(url, body: data, headers: {'HTGSports-Token': baseKey});
    print(response.body);
*/
    //  url = '${baseUrl}eventCanEnterScores/$eventId?format=json';
    //   print(url);
    //  response = await client.get(url, headers: {'HTGSports-Token': baseKey});
    //  print(response.body);

    //  client.close();

    /*  var client = new JsonServiceClient(url);
    //  client.baseUrl = url;
    Map<String, String> h = { "HTGSports-Token" : baseKey};
    client.headers = h;

    //   client.requestFilter= (req) => req.headers.add("HTGSports-Token", baseKey);

    try {
      var auth = await client.postToUrl(url, data);
      print('auth = ${auth.toString()}');
      print('is auth?' + (auth['UserSess']['IsAuthenticated']  ? 'true' : 'false'));
    }on Exception catch (e) {
      print('error $e');
    } catch (e) {
      print('last man standing error handler: $e');
    }

    var eventId = 5958;
    url = '${baseUrl}/eventCanEnterScores/$eventId?format=json';

    var canEdit = await client.getAs<bool>(url);
    print('can edit? $canEdit');*/
