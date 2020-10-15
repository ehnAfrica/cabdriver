
import 'dart:math';

import 'package:cab_driver/datamodels/directiondetails.dart';
import 'package:cab_driver/globalvariables.dart';
import 'package:cab_driver/helpers/requesthelper.dart';
import 'package:cab_driver/widgets/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperMethods{


  static Future<DirectionDetails> getDirectionDetails(LatLng startPosition, LatLng endPosition) async{
    String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=${startPosition.latitude},${startPosition.longitude}&destination=${endPosition.latitude},${endPosition.longitude}&mode=driving&key=$mapKey';

    var response = await RequestHelper.getRequest(url);

    if(response == 'failed'){
      return null;
    }
    DirectionDetails directionDetails =  DirectionDetails();
    directionDetails.durationText = response['routes'][0]['legs'][0]['duration']['text'];
    directionDetails.durationValue = response['routes'][0]['legs'][0]['duration']['value'];

    directionDetails.distanceText = response['routes'][0]['legs'][0]['distance']['text'];
    directionDetails.distanceValue = response['routes'][0]['legs'][0]['distance']['value'];

    directionDetails.encodedPoints = response['routes'][0]['overview_polyline']['points'];

    return directionDetails;
  }
  static int estimateFares (DirectionDetails details, int durationValue){
    //per km o.3
    //per minute 0.5
    //base fare 3
    double baseFare = 50;
    double distanceFare = (details.distanceValue/1000)*50;
    double timeFare = (durationValue/60)*10;

    double totalFare = baseFare + distanceFare + timeFare;

    return totalFare.truncate();

  }
  static double generateRandomNumber(int max){
    var randomGenerator = Random();
    int radInt = randomGenerator.nextInt(max);

    return radInt.toDouble();
  }

  static void disableHomeTabLocationUpdates(){
    homeTabPositionStream.pause();
    Geofire.removeLocation(currentFirebaseUser.uid);
  }
  static void enableHomeTabLocationUpdates(){
    homeTabPositionStream.resume();
    Geofire.setLocation(currentFirebaseUser.uid, currentPosition.latitude, currentPosition.longitude);

  }
  static void showProgressDialog(context){

    showDialog(
      barrierDismissible: false,
        context: context,
         builder: (BuildContext context) => ProgressDialog(status: 'please wait',),
    );
  }
}