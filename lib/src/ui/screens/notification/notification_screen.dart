import 'package:flutter/material.dart';
import 'package:recipe_app/src/ui/utils/helper_util.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 12),
              child: Text('Yeni', style: TextTypography.mH2),
            ),
            userActivity(
              name: 'Yusuf Erkan Darıyemez',
              activity: 'seni takip etti',
              time: '1h',
              urlProfile:
                  'https://avatars.githubusercontent.com/u/77965724?v=4',
              labelButton: 'Takip Et',
            ),
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 12),
              child: Text('Bugün', style: TextTypography.mH2),
            ),
            postActivity(
              user1: 'Ahmet Kaplan',
              user2: 'Müslüm Gürese',
              activity: 'tarifini beğendi',
              time: '20 min',
              urlProfile1:
                  'https://images.unsplash.com/photo-1520341280432-4749d4d7bcf9',
              urlProfile2:
                  'https://obs.ihu.edu.tr/pbs/zfoto.aspx?gkm=1011394502157331623528538384383843734332102331563524037364',
              urlPostImg:
                  'https://images.unsplash.com/photo-1576618148400-f54bed99fcfd',
            ),
            userActivity(
              name: 'Yusuf Erkan Darıyemez',
              activity: 'seni takip etti',
              time: '1h',
              urlProfile:
                  'https://avatars.githubusercontent.com/u/77965724?v=4',
              labelButton: 'Takip',
              disable: true,
            ),
            postActivity(
              user1: 'Murat Boz',
              user2: 'Ahmet Kaplan',
              activity: 'tarifini beğendi',
              time: '20 min',
              urlProfile1:
                  'https://images.unsplash.com/photo-1520341280432-4749d4d7bcf9',
              urlProfile2:
                  'https://obs.ihu.edu.tr/pbs/zfoto.aspx?gkm=1011394502157331623528538384383843734332102331563524037364',
              urlPostImg:
                  'https://images.unsplash.com/photo-1607478900766-efe13248b125',
            ),
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 12),
              child: Text('Dün', style: TextTypography.mH2),
            ),
            userActivity(
              name: 'Ahmet Kaplan',
              activity: 'seni takip etti',
              time: '1h',
              urlProfile:
                  'https://obs.ihu.edu.tr/pbs/zfoto.aspx?gkm=1011394502157331623528538384383843734332102331563524037364',
              labelButton: 'Takip Et',
            ),
            userActivity(
              name: 'Müslüm Gürses',
              activity: 'seni takip etti',
              time: '1h',
              urlProfile:
                  'https://images.unsplash.com/photo-1520341280432-4749d4d7bcf9',
              labelButton: 'Takip',
              disable: true,
            ),
          ],
        ),
      ),
    );
  }
}
