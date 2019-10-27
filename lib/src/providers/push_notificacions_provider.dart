import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProvider{

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;

  initNotifications(){
    
    _firebaseMessaging.requestNotificationPermissions();
    
    _firebaseMessaging.getToken().then((token){
      
      print('===== FCM Token =====');
      print( token );

      //dBULJ22v-RE:APA91bGn1H6PyJepKxCRgeW92Z8eYCdX9JIF7XwQnS-vh5Yw4wsvTz9-yPN5YZ29KOVyYiEHlWdv3inTJfgvN17kbmb2sxsGwdL3fqjw0fmcDK7vdwdfNSt6Rzn4c4n2FFYYdRNzTfmk

    });
    

    _firebaseMessaging.configure(

      onMessage: ( info ) {
        
        print('===== On Message =====');
        print( info );

        String argumento = 'no-data';
        if(Platform.isAndroid ){
          argumento = info ['data']['Profesor'] ?? 'no-data';
        }

        _mensajesStreamController.sink.add(argumento);

      },

      onLaunch:  ( info ) {

        print('===== On Launch =====');
        print( info );


      },

      onResume:  ( info ) {

        print('===== On Resume =====');
        print( info );

        //final noti = info['data']['Profesor'];
        //print( noti );
      }


    );


  }

  dispose(){
    _mensajesStreamController?.close();
  }

}