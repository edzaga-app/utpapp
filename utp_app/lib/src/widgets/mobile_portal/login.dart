import 'package:flutter/services.dart';
import 'package:utp_app/src/pages/student_portal/student_home.dart';
import 'package:utp_app/src/services/mobile_portal.service.dart';
import 'package:utp_app/src/widgets/mobile_portal/mobile_widgets.dart';

class Login extends StatefulWidget {
  final bool userType;

  Login({
    @required this.userType
  });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  bool passwordVisibility;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  void _login(BuildContext context, Storage storage) async {
    final bool isValid = formKey.currentState.validate();
    if(isValid) {
      _loadProgress();
      final mobilePortalService = new MobilePortalService();
      final token = await mobilePortalService.loginStudent(userController.text, passwordController.text);
      if (token.isEmpty) {
        Message(
          context,
          MessageType.error,
          "El Usuario y/o la contraseña son incorrectas. Vuelve a intentarlo"
        );
        _loadProgress();
        return;
      }
      storage.setToken(token);
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => StudentHome())
      );
      
    }

  }
  
  void _loadProgress() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final storage = Provider.of<Storage>(context);
    // final mode = widget.userType ? Text('hola Estudiante') : Text('hola Profesor');
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      key: scaffoldKey,
      body: isLoading 
      ? Center(
        child: Container(
          child: CircularProgressIndicator(
            color: colorTheme.colorScheme.secondary,
          )
        )
      )
      : Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: colorTheme.primaryColor,
              image: DecorationImage(
                alignment: Alignment(0,-0.91), //Alignment(0,-0.87),
                scale: 2.7,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0), 
                  BlendMode.dstOut
                ),
                image: Image.asset(
                  'assets/icons/splashutplogo300.png',
                  fit: BoxFit.cover,
                ).image,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.63,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: colorTheme.backgroundColor,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Iniciar Sesión',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'El usuario y la contraseña son los mismos que utilizas para ingresar al portal estudiantil',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                                fontSize: 13
                              ),
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: userController,
                                decoration: InputDecoration(
                                  labelText: 'Ingrese el usuario',
                                  hintText: 'Usuario',
                                  enabledBorder: _defineOutlineInputBorder(colorTheme.colorScheme.primary),
                                  focusedBorder: _defineOutlineInputBorder(colorTheme.colorScheme.primary),
                                  errorBorder: _defineOutlineInputBorder(Colors.red),
                                  focusedErrorBorder: _defineOutlineInputBorder(Colors.red),
                                  fillColor: colorTheme.colorScheme.primary,
                                  prefixIcon: Icon(Icons.perm_identity_rounded),
                                  suffixIcon: InkWell(
                                    child: Icon(
                                      Icons.lock_outline,
                                      size: 25
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (val) {
                                  if(val.trim().length == 0) {
                                    return 'El campo Usuario es obligatorio';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: TextFormField(
                                  controller: passwordController,
                                  obscureText: !passwordVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Ingrese su clave',
                                    hintText: 'Clave',
                                    enabledBorder: _defineOutlineInputBorder(colorTheme.colorScheme.primary),
                                    focusedBorder: _defineOutlineInputBorder(colorTheme.colorScheme.primary),
                                    errorBorder: _defineOutlineInputBorder(Colors.red),
                                    focusedErrorBorder: _defineOutlineInputBorder(Colors.red),
                                    fillColor: colorTheme.colorScheme.primary,
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          passwordVisibility = !passwordVisibility;
                                        });
                                      },
                                      child: Icon(
                                        passwordVisibility 
                                        ? Icons.visibility_outlined
                                        :Icons.visibility_off_outlined,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if(val.trim().length == 0) {
                                      return 'El campo clave es obligatorio';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    child: Text(
                                      'Ingresar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: colorTheme.primaryColor,
                                      onPrimary: Colors.white,
                                      elevation: 3,
                                      minimumSize: Size(200, 50)
                                    ),
                                    onPressed: () async {
                                      _login(context, storage);
                                    }, 
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ]
                  ),
                ),
              ),
            ),
          ),
          // Visibility(
          //   maintainSize: true,
          //   maintainAnimation: true,
          //   maintainState: true,
          //   visible: isLoading,
          //   child: Container(
          //     child: CircularProgressIndicator(),
          //   )
          // ),
        ],
      )
    );
  }

  OutlineInputBorder _defineOutlineInputBorder(Color applyColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: applyColor,
        width: 1
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    );
  }

}

