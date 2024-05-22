import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uol_info/constants/icons.dart';
import 'package:uol_info/global/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uol_info/constants/icons.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green], // Example gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SERVICES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0, // Adjust letter spacing for better readability
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 2,
                    offset: Offset(1, 1), // Shadow position
                  ),
                ],
              ),
            ),
          ),
        ),

        backgroundColor: Colors.teal[700],
        elevation: 8.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Row(
              children: [
                Expanded(
                  child: HomeDetailContainer(
                    imageUrl: AppIcons.appicon,
                    label: 'University Website',
                    onTap: () {
                      _launchURL('https://uol.edu.pk/');
                    },
                  ),
                ),
              ],
            ),
              SizedBox(height: 20),
             Row(
               children: [
                 Expanded(
                   child: HomeDetailContainer(
                     imageUrl: AppIcons.theHub,
                     label: 'Hub Portal',
                     onTap: () {
                       _launchURL(
                           'https://hub.uol.edu.pk/sap/bc/ui5_ui5/ui2/ushell/shells/abap/Fiorilaunchpad.html');
                     },
                   ),
                 ),
               ],
             ),
              SizedBox(height: 20),
Row(
  children: [
   Expanded(child:  HomeDetailContainer(
     imageUrl: AppIcons.Slate,
     label: 'Slate Portal',
     onTap: () {
       _launchURL('https://slate.uol.edu.pk/');
     },
   ))
  ],
),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: CareerContainer()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HomeDetailContainer extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  const HomeDetailContainer({
    required this.imageUrl,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              imageUrl,

              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Use contrast color
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black87, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
                decoration: TextDecoration.underline,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CareerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCareerOptions(context);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(AppIcons.career),
         //   Icon(Icons.work, size: 50, color: Colors.teal),
            SizedBox(height: 10),
            Text(
              'Career Opportunities',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Contrast color
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black87, // Shadow color
                    offset: Offset(2.0, 2.0), // Shadow offset
                  ),
                ],
                decoration: TextDecoration.underline,
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _showCareerOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Career Options'),
        content: Text('Do you want to visit the website or send an email?'),
        actions: [
          TextButton(
            onPressed: () {
              _launchURL('https://careers.uol.edu.pk/');
              Navigator.pop(context);
            },
            child: Text('Visit Website'),
          ),
          TextButton(
            onPressed: () {
              _sendEmail('careerservices@cscl.uol.edu.pk');
              Navigator.pop(context);
            },
            child: Text('Send Email'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendEmail(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not send email to $email';
    }
  }
}
