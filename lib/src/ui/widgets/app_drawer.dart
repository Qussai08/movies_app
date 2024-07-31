import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/ui/widgets/title_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsetsDirectional.only(top: 36.h, start: 16.w),
        children: [
          SizedBox(height: 16.h),
          const TitleText(label: 'QMovies'),
          ListTile(
            title: const Text('Now Showing'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
