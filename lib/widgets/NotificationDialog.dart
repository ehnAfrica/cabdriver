import 'package:cab_driver/brand_colors.dart';
import 'package:cab_driver/widgets/BrandDivider.dart';
import 'package:cab_driver/widgets/TaxiOutlineButton.dart';
import 'package:flutter/material.dart';

import 'TaxiButton.dart';

class NotificationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(4),
          width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0,),
            Image.asset('images/taxi.png', width: 100,),
            SizedBox(height: 16.0,),
            Text('NEW TRIP REQUEST', style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 18),),

            SizedBox(height: 30.0,),

            Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                   children: <Widget>[
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Image.asset('images/pickicon.png', height: 16, width: 16,),
                         SizedBox(width: 18.0,),

                         Text('TRM DRIVE', style: TextStyle(fontSize: 18),)
                       ],
                     ),
                     SizedBox(height: 15.0,),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Image.asset('images/desticon.png', height: 16, width: 16,),
                         SizedBox(width: 18.0,),
                         Text('LUNGA LUNGA', style: TextStyle(fontSize: 18),),
                       ],
                     )
                   ],
            ),),

            SizedBox(height: 20,),

            BrandDivider(),

            SizedBox(height: 8,),

            Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          child: TaxiOutlineButton(
                            title: 'DECLINE',
                            color: BrandColors.colorPrimary,
                            onPressed: () async{

                            },
                          ),
                        ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        child: TaxiButton(
                          title: 'ACCEPT',
                          color: BrandColors.colorGreen,
                          onPressed: () async{

                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  ],
            ),)
          ],
        ),
      ),
    );
  }
}
