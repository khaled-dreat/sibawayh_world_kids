part of '../../../utils/import/app_import.dart';

class AppSnackBar {
  // ✅
  static void snackBarSuccess(BuildContext context, {required String msg}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: msg,
        backgroundColor: AppTheme.isDark(context)
            ? AppColors.darkModeSnack
            : AppColors.lightModeSnack,
        textStyle: TextStyle(
            color: AppColors.bgBlack,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp),
      ),
      displayDuration: const Duration(milliseconds: 1500),
    );
  }

  // * ❌
  static void snackBarError(BuildContext context, {required String msg}) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: msg,
        icon: Icon(Icons.sentiment_dissatisfied_outlined,
            color: const Color(0x15000000), size: 100.r),
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 22.sp, color: Colors.white),
      ),
      displayDuration: const Duration(seconds: 1),
    );
  }
}
