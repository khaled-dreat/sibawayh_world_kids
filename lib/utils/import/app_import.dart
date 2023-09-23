import 'dart:async';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_speech/google_speech.dart';
import 'package:google_speech/speech_client_authenticator.dart';
import 'package:mervat_app/utils/constant/app_audio.dart';
import 'package:mervat_app/utils/constant/app_images.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

// ? **************** Show & AS ***********************
import 'dart:developer' as dev;
import 'dart:io' as io;

import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

//   **************** Mervat App ***********************
part '../../app_start/mervat_app.dart';

// !  **************** View ***********************
part '../../view/home/body.dart';
part '../../view/ar_section/body.dart';
part '../../view/ar_word_section/body.dart';
part '../../view/ar_word_write/body.dart';

// ? **************** Utils ***********************
part '../routes/app_routes.dart';
part '../theme/app_colors.dart';
part '../theme/app_theme_hoose.dart';
part '../language/app_lang.dart';
part '../language/app_lang_config.dart';
part '../services/app_permission.dart';
part '../services/app_storege_management.dart';
part '../../view/widgets/snackbar/app_snackbar.dart';
part '../theme/app_theme.dart';
part '../language/app_lang_key.dart';

//  **************** Wdgets ***********************
part '../../view/home/widgets/appbar/appbar_home.dart';
part '../../view/home/widgets/sections_learn_card/sections_learn_card.dart';
part '../../view/widgets/tost/app_tost.dart';

// ? **************** Controller ***********************
part '../../controller/c_record.dart';
part '../../controller/c_speech_to_text.dart';
