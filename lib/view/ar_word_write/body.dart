part of '../../utils/import/app_import.dart';

class ArwordsWrite extends StatelessWidget {
  static const String nameRoute = "ArwordsWrite";
  const ArwordsWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImages.arBack,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.r),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HedarBtn(icon: Icons.view_list, isRight: false),
                        HedarBtn(
                            icon: Icons.keyboard_double_arrow_left_outlined,
                            isRight: false),
                      ]),
                ),
                WordCard(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NextPrevBtn(icon: Icons.chevron_left, isRight: true),
                    NextPrevBtn(
                        icon: Icons.chevron_right_rounded, isRight: false),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.r),
                  child: const RecordBtn(
                      icon: Icons.record_voice_over, isRight: false),
                ),
              ],
            ),
          )),
    );
  }
}

class NextPrevBtn extends StatelessWidget {
  final IconData icon;
  final bool isRight;

  const NextPrevBtn({
    super.key,
    required this.icon,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 40.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(149, 158, 158, 158),
              spreadRadius: 30.r),
          BoxShadow(
              color: const Color.fromARGB(255, 41, 93, 125),
              spreadRadius: 20.r),
          BoxShadow(color: Colors.blue.shade300, spreadRadius: 10.r),
        ],
        color: Colors.blue.shade500,
        borderRadius: isRight
            ? BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                topLeft: Radius.circular(20.r))
            : BorderRadius.only(
                bottomRight: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
      ),
      // ToDo : Center The Icon
      child: Icon(
        icon,
        size: 50.r,
        color: Colors.white,
      ),
    );
  }
}

class RecordBtn extends StatefulWidget {
  final IconData icon;
  final bool isRight;

  const RecordBtn({
    super.key,
    required this.icon,
    required this.isRight,
  });

  @override
  State<RecordBtn> createState() => _RecordBtnState();
}

class _RecordBtnState extends State<RecordBtn> {
  /* @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ControolerRecorder pRecord =
            Provider.of<ControolerRecorder>(context, listen: false);
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    ControolerRecorder pRecord = Provider.of<ControolerRecorder>(context);
    ControllerSpeechToText pSpeechToText =
        Provider.of<ControllerSpeechToText>(context);
    ControolerRecorder pRecordWithoutListen =
        Provider.of<ControolerRecorder>(context, listen: false);

    return InkWell(
        onTap: () async {
          AppSnackBar.snackBarSuccess(context, msg: "أجابتك صحيحة");
          if (pRecord._isRecording) {
            await pRecordWithoutListen.stopRecord();
            final audio = pRecord.getAudioContent();
            pSpeechToText.transcribe(audio);
          } else {
            await pRecordWithoutListen.startRecord();
          }
        },
        child: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: 250.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(92, 158, 158, 158),
                    spreadRadius: 19.r),
                BoxShadow(
                    color: AppColors.colorFromHex("65ab9b"),
                    spreadRadius: 10.r),
              ],
              color: AppColors.colorFromHex("edc48f"),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Text(
              "اختبر نفسك",
              style: TextStyle(fontSize: 35.sp, color: Colors.white),
            )));
  }
}

class HedarBtn extends StatelessWidget {
  final IconData icon;
  final bool isRight;

  const HedarBtn({
    super.key,
    required this.icon,
    required this.isRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 60.h,
        width: 70.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(92, 158, 158, 158),
                spreadRadius: 19.r),
            BoxShadow(
                color: AppColors.colorFromHex("65ab9b"), spreadRadius: 10.r),
          ],
          color: AppColors.colorFromHex("edc48f").withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Icon(
          icon,
          size: 50.r,
          color: AppColors.colorFromHex("edc48f"),
        ));
  }
}

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioPlayer player = AudioPlayer();

    return SizedBox(
      width: 228.w,
      height: 275.h,
      child: Stack(alignment: Alignment.bottomRight, children: [
        const Card(
          child: Image(image: AssetImage(AppImages.aWord)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(191, 158, 158, 158),
                    spreadRadius: 5.r,
                    blurStyle: BlurStyle.outer)
              ]),
          child: InkWell(
              onTap: () {
                player.setAsset(AppArAudio.a);
                player.play();
              },
              child: Icon(Icons.play_circle_fill,
                  color: Colors.white, size: 45.r)),
        )
      ]),
    );
  }
}
