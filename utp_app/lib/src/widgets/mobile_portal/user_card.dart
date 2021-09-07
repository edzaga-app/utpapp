import 'package:utp_app/src/widgets/mobile_portal/mobile_widgets.dart';

class UserCard extends StatelessWidget {
  final bool isStudent;
  final String title;
  final String subtitle;

  const UserCard({ 
    @required this.isStudent,
    @required this.title,
    @required this.subtitle
  });

  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<Storage>(context);
    String encryptedKey = storage.encryptedKey;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: this.isStudent ? EdgeInsets.fromLTRB(15, 100, 15, 15) : EdgeInsets.fromLTRB(15, 5, 15, 15),
      elevation: 20,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: !storage.darkMode 
              ? <Color>[Color.fromRGBO(20, 62, 105, 1), Color.fromRGBO(32, 129, 191, 1)] 
              : <Color>[Colors.grey[800], Colors.grey[700]],
          )
        ),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) =>  
                encryptedKey == '' ? Addkey(userType: isStudent) : Login(userType: isStudent)
              )
            );
          },
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(20, 2, 25, 2),
                title: Text(title, 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                  ),
                ),
                subtitle: Text(subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white60
                  )
                ),
                leading: Icon(
                  Icons.vpn_key_rounded,
                  color: Colors.white60,
                  size: 35,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}