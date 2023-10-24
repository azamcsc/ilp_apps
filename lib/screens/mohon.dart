import 'package:flutter/material.dart';
import '../utils/const.dart';
import '../utils/function.dart';

class MohonPage extends StatefulWidget {
  final String email;
  final String nama;
  MohonPage({required this.email,required this.nama});
  @override
  _MohonPageState createState() => _MohonPageState();
}

class _MohonPageState extends State<MohonPage> {
  // Create controllers for the text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    nameController.text=widget.nama;
    emailController.text=widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.darkGreen,
        title: Text('Borang Keluar'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Your logo or image
                //  Image.asset('assets/icons/logo.png', width: 150, height: 150),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    labelText: 'Nama',
                  ),
                ),
                SizedBox(height: 10),
                // Email Text Field
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                // Email Text Field
                TextField(
                  controller: tujuanController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    labelText: 'Tujuan',
                  ),
                ),


                SizedBox(height: 20),

                // Login Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Constants.darkGreen,),
                      onPressed: () async{
                        screenLoadingx(context, "Please Wait..", "Try to add new record..", false, false, true);
                        // Handle login logic here
                        final email = emailController.text;
                        final name = nameController.text;
                        final tujuan = tujuanController.text;
                        var data = {
                          "email": email,
                          "name": name,
                          "tujuan": tujuan
                        };
                        // Validate and process login
                        var k = await fetchData("fetchdata","insertrekod",data);
                        // For demonstration purposes, we'll just print the values
                        print('Email: $email');
                        if(mounted){
                          Navigator.pop(context);
                          screenLoadingx(context, "Message", k['message'], true, false, false);
                        }

                      },
                      child: Text('Mohon',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    emailController.dispose();
    tujuanController.dispose();
    super.dispose();
  }
}
