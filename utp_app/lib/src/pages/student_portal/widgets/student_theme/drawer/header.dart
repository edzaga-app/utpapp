import '../../student_theme/student_theme_widgets.dart';

class Header extends StatefulWidget {
  final Map<String, dynamic> student;

  Header({
    @required this.student
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Provider.of<Storage>(context);
    
    return UserAccountsDrawerHeader(
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomRight,
          colors: storage.darkMode ? [colorUtp[200], colorUtp[200]] : [colorUtp[100], colorUtp[50]]
        )
      ),
      accountName: Text(
        widget.student['name'] ?? 'Bienvenido Estudiante Utp',
        style: TextStyle(
          fontSize: 15,
          color: Colors.white
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: widget.student['photo'] != null ? MemoryImage(widget.student['photo']) : AssetImage('assets/images/logo-utp.jpg'),
        radius: 90.0,
        backgroundColor: Colors.white
      ),
      accountEmail: Text(
        widget.student['program'] ?? widget.student['email'],
        style: TextStyle(
          color: Colors.white
        )
      ),
      otherAccountsPictures: <Widget>[
        // IconButton(
        //   icon: storage.darkMode ? 
        //     Icon(Icons.wb_sunny_rounded, color: Colors.white) : 
        //     Icon(Icons.nights_stay_rounded, color: Colors.white), 
        //   onPressed: () {
        //       storage.toggleChangeTheme();
        //   }
        // )
      ],
    );

    
      
  }
}


class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Path path = new Path();
    // // path start with (0.0, 0.0) point
    // path.lineTo(0.0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0.0);
    // return path;
    Path path = new Path();
    path.lineTo(0, size.height);

    final firstStart = Offset(size.width / 5, size.height);
    final firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
      firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy
    );

    final secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    final secondEnd = Offset(size.width, size.height - 5);
    path.quadraticBezierTo(
      secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;

    // debugPrint(size.width.toString());
    // var path = new Path();
    // path.lineTo(0.0, size.height); //start path with this if you are making at bottom
    // var firstStart = Offset(size.width / 5, size.height);
    // //fist point of quadratic bezier curve
    // var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    // //second point of quadratic bezier curve
    // path.quadraticBezierTo(firstStart.dx, firstStart.dy,
    //     firstEnd.dx, firstEnd.dy);

    // var secondStart = Offset(size.width - (size.width / 3.24),
    //     size.height - 105);
    // //third point of quadratic bezier curve
    // var secondEnd = Offset(size.width, size.height - 10);
    // //fourth point of quadratic bezier curve
    // path.quadraticBezierTo(secondStart.dx, secondStart.dy,
    //     secondEnd.dx, secondEnd.dy);
    // path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    // path.close();
    // return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}