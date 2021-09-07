import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:utp_app/src/helpers/storage.dart';
import 'package:utp_app/src/helpers/theme_utp.dart';
import 'package:utp_app/src/services/mobile_portal.service.dart';
import 'package:utp_app/src/widgets/mobile_portal/mobile_widgets.dart';

class Addkey extends StatefulWidget {
  
  final bool userType;
  
  Addkey({
    @required this.userType
  });
  
  @override
  _AddkeyState createState() => _AddkeyState();
}

class _AddkeyState extends State<Addkey> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  bool passwordVisibility;
  bool confirmPasswordVisibility;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  void _saveKey(BuildContext context, Storage storage) async {
    final bool isValid = formKey.currentState.validate();
    final bool isValidateForm = _validateForm(context);
    
    if(isValid && isValidateForm) {
      String key = confirmPasswordController.text;
      final mobilePortalService = new MobilePortalService();
      final encryptedKey = await mobilePortalService.getKey(key);
      storage.setEncryptedkey(encryptedKey);
    }
  }

  bool _validateForm(BuildContext context) {
    if(passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
        
        SnackBar(
          backgroundColor: Colors.red,
          elevation: 3,
          content: Row(
            children: [
              Icon(Icons.ac_unit_outlined),
              Text(' Las llaves ingresadas no coinciden.\n Revise por favor'),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11)
          ),
        )
      );
      return false;
    }
    
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    final applyColor = storage.darkMode ? colorUtp[200]: colorUtp[100];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('LLave Móvil'),
      ),
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Por ser la primera vez que ingresas a la UTP Móvil, deberás definir una llave móvil. Esta se solicitará cada vez que ingresas a esta opción. \n\nLa llave móvil debe de tener 4 números.',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontFamily: 'HelveticaNeue',
                        fontSize: 15
                      ),
                    ),
                  ),
                ] 
              ),
              Form(
                key: formKey,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Password
                        TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'LLave',
                            hintText: 'Ingrese su llave',
                            enabledBorder: _defineOutlineInputBorder(applyColor),
                            focusedBorder: _defineOutlineInputBorder(applyColor),
                            errorBorder: _defineOutlineInputBorder(Colors.red),
                            focusedErrorBorder: _defineOutlineInputBorder(Colors.red),
                            fillColor: applyColor,
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
                                : Icons.visibility_off_outlined,
                                size: 25
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          validator: (val) {
                            if(val.trim().length < 4) {
                              return 'El campo LLave debe de contener 4 números';
                            }
                            return null;
                          },
                        ),
                        // ConfirmPasssword
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: !confirmPasswordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirmar LLave',
                              hintText: 'Cornfirme su llave',
                              enabledBorder: _defineOutlineInputBorder(applyColor),
                              focusedBorder: _defineOutlineInputBorder(applyColor),
                              errorBorder: _defineOutlineInputBorder(Colors.red),
                              focusedErrorBorder: _defineOutlineInputBorder(Colors.red),
                              fillColor: applyColor,
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    confirmPasswordVisibility = !confirmPasswordVisibility;
                                  });
                                },
                                child: Icon(
                                  confirmPasswordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                                  size: 25
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4)
                            ],
                            validator: (val) {
                              if(val.trim().length < 4) {
                                return 'El campo Confirmar LLave debe de contener 4 números';
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
                                'Generar',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: applyColor,
                                onPrimary: Colors.white,
                                // shadowColor: Colors.red,
                                elevation: 3,
                                minimumSize: Size(200, 50)
                              ),
                              onPressed: () async {
                                _saveKey(context, storage);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
              )
            ],
          ),
        ),
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