import 'package:flutter/material.dart';
import 'package:movemate/constants.dart';
import 'package:movemate/utils/typography.dart';

import '../../../../colors.dart';
import '../../home/index.dart';

// import 'Rooms.dart';

class ProfileScreen extends StatefulWidget {
  bool? isback;
  ProfileScreen({this.isback});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Center(
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: textStore.Body16SemiBold(color: WHITE),
            ),
          ),

          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () => widget.isback == true
                  ? Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                      return DashboardEntry();
                    }), (Route<dynamic> route) => false)
                  : null,
              child: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/images/bckbtn.png')),
            ),
          ),
          // automaticallyImplyLeading: false,
          backgroundColor: PRIMARY40,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(children: [
            // DevicesGridDashboard(size: size),
            mediumSpace(),
            ScenesDashboard()
          ]),
        ),
        // bottomNavigationBar: CustomAppBar(),
      );
    });
  }

  Container GradientContainer(Size size) {
    return Container(
      height: size.height * .23,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          image: DecorationImage(
              image: AssetImage('assets/background/topsection.png'),
              fit: BoxFit.fill)),
    );
  }
}

class ScenesDashboard extends StatelessWidget {
  ScenesDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: PRIMARY40.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.person,
                            size: 20,
                            color: PRIMARY40,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Personal Info',
                      style: textStore.Body16Regular(color: GREY8)
                          .copyWith(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: GREY6,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  smallSpace(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: PRIMARY40.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.credit_card_outlined,
                            size: 20,
                            color: PRIMARY40,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Account Info',
                      style: textStore.Body16Regular(color: GREY8)
                          .copyWith(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: GREY6,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  smallSpace(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: PRIMARY40.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.settings,
                            size: 20,
                            color: PRIMARY40,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Settings',
                      style: textStore.Body16Regular(color: GREY8)
                          .copyWith(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: GREY6,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  smallSpace(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: PRIMARY40.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: PRIMARY40,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Refer a Friend',
                      style: textStore.Body16Regular(color: GREY8)
                          .copyWith(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: GREY6,
                      size: 20,
                    ),
                  ),
                  smallSpace(),
                  ListTile(
                    leading: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: PRIMARY40.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.question_mark_sharp,
                            color: PRIMARY40,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Get Help',
                      style: textStore.Body16Regular(color: GREY8)
                          .copyWith(fontSize: 17),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: GREY6,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                  mediumSpace(),
                  mediumSpace()
                ],
              )),
        ],
      ),
    );
  }
}
