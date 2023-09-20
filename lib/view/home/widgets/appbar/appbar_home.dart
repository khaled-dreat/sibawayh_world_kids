part of '../../../../utils/import/app_import.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red.shade300,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35.r),
              bottomRight: Radius.circular(35.r))),
      child: SizedBox(
        height: 120.h,
        child: Center(
          child: Text(
            "تطبيق ميرفات",
            style: TextStyle(color: Colors.yellow, fontSize: 35.sp),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height + kTextTabBarHeight);
}
