import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/config/app_images.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';

import '../../../providers/auth_provider.dart';
import '../../../route/routes.dart';
import '../../../shared/app_helper.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({required this.email, Key ?key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<OtpScreen> {
  void _verifyOTP(String mail, BuildContext context) async {
    Provider.of<AuthProvider>(context, listen: false).verifyOpt(widget.email, otp).then((value) {
      if(value){
        Navigator.of(context).popAndPushNamed(AppRoutes.login);
        AppHelper.showInfoFlushBar(context,  'Votre mot de passe a été réinitialisé'
            'et un nouveau mot de passe est envoyé à : ${widget.email}');
      }else{
        AppHelper.showInfoFlushBar(context,  'Votre code n\'est pas valise, veuillez appuiez sur renvoyer un nouveau code',color: Colors.red);
      }
    });

  }
  void _receiveMail(String mail, BuildContext context) async {
    Provider.of<AuthProvider>(context, listen: false).forgotPassword(mail).then((value) {
      if(value){
        AppHelper.showInfoFlushBar(context,  'Un email vous a été envoyé pour réinitialiser votre mot de passe');
      }else{
        AppHelper.showInfoFlushBar(context,  'Veuillez vérifir votre mail : ${widget.email}',color: Colors.red);
      }
    });

  }



  String otp = '';

  @override
  void initState() {
    super.initState();
    otp='';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  AppImage.logo,
                  width: 180,
                  height: 180,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Veuillez entrer le code reçu par email ${widget.email}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _textFieldOTP(first: true, last: false ),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child:  Provider.of<AuthProvider>(context, listen: true).isLoading ?
                      const Center(child: CustomAppLoader(),)
                          : ElevatedButton(
                        onPressed: () {
                          _verifyOTP(widget.email, context);
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(AppColors.PRIMARY),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.PRIMARY),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verifier',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Vous n'avez pas réçu de code ?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {
                  _receiveMail(widget.email, context);
                },
                child: Text(
                  "Renvoyer un nouveau code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.PRIMARY,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return Container(
      height: 70,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {

            if(otp.length<4){
              otp =  "$otp"+value;
            }
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
              otp = otp.substring(0, otp.length - 1);
            }if(value.length==0 && first==true){
              otp='';
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppColors.PRIMARY),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
