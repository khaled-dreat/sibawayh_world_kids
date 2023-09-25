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
                const WordCard(),
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
                  child: RecordBtn(),
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

class RecordBtn extends StatefulWidget {
  @override
  _RecordBtnState createState() => _RecordBtnState();
}

class _RecordBtnState extends State<RecordBtn> {
  double _counter = 0;

  bool tap = true;
  bool show = true;

  @override
  Widget build(BuildContext context) {
    ControolerRecorder pRecord = Provider.of<ControolerRecorder>(context);
    ControllerSpeechToText pSpeechToText =
        Provider.of<ControllerSpeechToText>(context);
    ControolerRecorder pRecordWithoutListen =
        Provider.of<ControolerRecorder>(context, listen: false);

    return Center(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHighlightChanged: (value) {
          tap = !value;
          show = false;
          if (tap == true) {
            if (pSpeechToText.isTranscribingForBtn) {
              Tweener({'x': 30})
                  .to({'x': 50}, 500)
                  .easing(Ease.linear.easeIn)
                  .onUpdate((obj) {
                    setState(() {
                      _counter = (obj['x']).round() * 1.0;
                    });
                  })
                  .onComplete((obj) {})
                  .start();
            } else {
              Tweener(
                {'x': 50},
              )
                  .to({'x': 30}, 200)
                  .easing(Ease.linear.easeIn)
                  .onUpdate((obj) {
                    setState(() {
                      _counter = (obj['x']).round() * 1.0;
                    });
                  })
                  .onComplete((obj) {})
                  .start();
            }
          }
        },
        onTapUp: (details) async {
          show = false;

          if (pSpeechToText.isTranscribingForBtn) {
            await pRecordWithoutListen.stopRecord();
            final audio = pRecord.getAudioContent();
            pSpeechToText.transcribe(audio, context);
          }
        },
        onTapDown: (details) async {
          if (pSpeechToText.isTranscribingForBtn) {
            await pRecordWithoutListen.startRecord();
          }
        },
        child: AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 2),
          height: tap ? 50.h : 100.h,
          width: tap ? 250.w : 120.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(92, 158, 158, 158),
                  spreadRadius: 19.r),
              BoxShadow(
                  color: AppColors.colorFromHex("65ab9b"), spreadRadius: 10.r),
              BoxShadow(
                  color: Color(0xFFFF5757).withOpacity(0.5),
                  offset: Offset(0, 5),
                  blurRadius: 30)
            ],
            color: AppColors.colorFromHex("edc48f"),
            borderRadius: tap
                ? BorderRadius.all(Radius.circular(20.r))
                : BorderRadius.circular(100.r),
          ),
          child: pSpeechToText.isTranscribing
              ? LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  colors: [Colors.red, Colors.green, Colors.blue],
                )
              : tap
                  ? Text(
                      "اختبر نفسك",
                      style: TextStyle(fontSize: 35.sp, color: Colors.white),
                    )
                  : SizedBox(
                      height: 60.h,
                      child: LoadingIndicator(
                        indicatorType: Indicator.lineScale,
                        colors: [Colors.red, Colors.green, Colors.blue],
                        strokeWidth: 2,
                      ),
                    ),
        ),
      ),
    );
  }
}
