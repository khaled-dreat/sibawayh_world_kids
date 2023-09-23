part of '../utils/import/app_import.dart';

class ControllerSpeechToText extends ChangeNotifier {
  bool isTranscribing = false;
  bool isTranscribingForBtn = true;

  // * Use To Save The Text Return From  Google Clude
  String content = "";

  // * Change Content Value
  void changeContent(String value) {
    content = value;
    notifyListeners();
  }

  // * Change Is Transcribing Status
  void changeIsTranscribing(bool value) {
    isTranscribing = value;
    notifyListeners();
  }

  void changeisTranscribingForBtn(bool value) {
    isTranscribingForBtn = value;
    notifyListeners();
  }

  // * Speech to Text Google Clude Service
  void transcribe(List<int> audio, BuildContext context) async {
    try {
      dev.log("Speech to Text start");

      changeIsTranscribing(true);
      changeisTranscribingForBtn(false);
      final serviceAccount =
          ServiceAccount.fromString(r'''{ "type": "service_account",
  "project_id": "angelic-gift-398808",
  "private_key_id": "44e3eddc0b16373f2564cff2b5741cba25722601",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCKWU5t4jcObjAY\nrJskk8EvE7Q1AXy7wQw210oaYcbd3vmzjQL1TBWbaL1KllMzRfEZyMVIBPwKZ2CK\n0Wd7Xo2zEK6Vx/x//TT2IpVlpq7kxYpLCkfsKiNXkcQeGbm1WMPWgGHyabnN+tJf\nwx6489iwAOHwl1kC/zZgfkkOILfr+jr0pxRKwfrqXcmoujWsh/Fcc7frjU5LJn3M\nCw0DmRWVQF/6kDWu/vKCMcRFPbm6JToUJq6y9wHxHyLOLuDZK0OnjbGO/GHiQF0P\nltCTXOclFQOatjXIoJA+A731/HgsOdNBiqOPJx1AiQc2oJQ51OjR7Z1fCSdUFM0k\nTQOld191AgMBAAECggEADArO/ViR80MbE6K+lFX6HEdqSazZ9xvMHN/rdtVo8noM\noRjWl5RqUw8wXtQr5MwjOtvTdDve1mb+K8cja0UlL1912tq/+0IGgKAtAd6a3ZXm\nPjbkYMWgMuigugACPqs9zKd7Hxcd0bSR6Dz7KR0skNFa2U7LNCwTxx1m7YBikfsi\nrnF8tfnEvy+3pwV8WAB0ZYPC+0l/ST5BTbPfLDBWFlYIdEkmnpLuINti0ZORadJf\nC3XdJzdAOOrIdOTU0B0uR0A/Pr2vDwU9IeIKWOyU1jwWHWt/lcZLHzhZ36BX0+8G\nI1QLjdYFSWXOGgsvvAwtt66ewxPpGACrKzwAD3IrBwKBgQDAUn7k/Y4hHYeQ+fjl\nkA2TLgNB1eVUuKbGZ+WXNWfvMB8PMVb1A2HI6Rd6TUkeUUQ4rSNk7+fs+T0L0RPx\nHSuQkRpYWqTjYSA7nqratvrfr9rI24RkjrBEHSzdjHjgE75CwM/CKrn6DnDr5KQJ\nslGC+0691tgcESUHOT1C0w8uwwKBgQC4J/MiJ4HE+rPaXPu56LL8Dz4njERBV40h\n6IZx1MQb+dL+EE3JvJM8Uj3S0n0IfOGYSTI/JR5/+DgxE57Xuks1rrG0fAkl7kZt\nGRcIJlfaUe9tMCq/vArHhD4oDx9RoGYcME1uWxatPZQZ+xHM3oiL963/yiFf0Dg4\nFtqPmCtFZwKBgG6ghYGvIEyIMe0A/Vz/ie95bkI2iZ48QSKrrPNXsxtxMMyKcxyo\n/1yUR/7/6elYkceQQGXVYjF8BNOBRtlREDguX1sneOWafvIMiPcafiChhVY4f2Vg\ndqAXsDEYloc+lBjN1DQ6Y5QlLmtir8EsI5sWd+rXZKRwcD5BfK2tvnQFAoGAB+9w\nwqABL4O+DELFdhVY4ROnEf0xU796DWP/pxgL+0igluIM+AxwK8E/eL4pNRxsfCtr\nRt1KmykPAs5dod4dL4r/jU9q9X92+WyDWY6NapLtRj81GF35+O7x3rgIGXRX8g8C\nxyaVq5FjuFrhQXq1V5KspMEI/x/xzDjv4hAkjTECgYBJ0faXACD65vNRS4qVoNUi\nNw82I0SqjFoYU6IDKwoEltY/Y5DSe9NM2dH8eW2Rcm75xzpV3OB3Q1BNbl/OFT4E\nhpkHzfINQj/IWwsZSRQ/pzuMwd9Tzd7/xXImAepyKJ3r6iL6kiOQiG8NbgiGlHHf\nUMGauvK1KbFKRtKX01WkHQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "mervat@angelic-gift-398808.iam.gserviceaccount.com",
  "client_id": "115138938632147223593",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/mervat%40angelic-gift-398808.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"}''');
      final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
      final config = RecognitionConfig(
          encoding: AudioEncoding.LINEAR16,
          model: RecognitionModel.basic,
          audioChannelCount: 2,
          enableAutomaticPunctuation: true,
          sampleRateHertz: 44100,
          languageCode: 'ar');

      await speechToText.recognize(config, audio).then((value) {
        dev.log("info ${value.results.toString()}");

        changeContent(value.results
            .map((e) => e.alternatives.first.transcript)
            .join('\n'));
        dev.log(content);
      }).whenComplete(() {
        changeIsTranscribing(false);
        changeisTranscribingForBtn(true);
      });
      dev.log("Speech to Text start");
      checkPronStatus(context);
    } catch (e) {
      dev.log("Error Speeth to text : $e");
    }
  }

  // * Used to check pronunciation status
  void checkPronStatus(BuildContext context) {
    if (content != "") {
      if (content == "الف.") {
        AppSnackBar.snackBarSuccess(context, msg: "أحسنت أجابة صحيحية");
      } else {
        AppSnackBar.snackBarError(context,
            msg: "ركز أكثر وأعد الاستماع الى الحرف");
      }
    } else {
      AppSnackBar.noData(context, msg: "أعد المحاولة هناك خطاء");
    }
  }
}
/*

class Page1 extends StatefulWidget {
  static const String nameRoute = "Page1";
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Widget> get shapes => [
        Container(width: 100.w, height: 80.h, color: Colors.blue.shade700),
        Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.blue.shade300,
            )),
        Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: Colors.red.shade300,
            )),
      ];
  final List<Widget> shapesSelected = [
    Container(
      width: 180.w,
      height: 150.h,
      color: Colors.blue.shade700,
    ),
    Container(
        width: 180.w,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.blue.shade300,
        )),
    Container(
        width: 180.w,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Colors.red.shade300,
        )),
  ];
  int selectedShapeIndex = 0;
  void changeShape(int newIndex) {
    setState(() {
      selectedShapeIndex = newIndex;
      selectedShapeProparte(newIndex);
    });
  }

  int rounded = 0;
  Color colore = Colors.blue.shade700;
  void selectedShapeProparte(int newIndex) {
    switch (newIndex) {
      case 0:
        rounded = 0;
        colore = Colors.blue.shade700;
      case 1:
        rounded = 20;
        colore = Colors.blue.shade300;
      default:
        rounded = 100;
        colore = Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    InfoController pInfo = Provider.of<InfoController>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Animation'),
      body: Column(children: [
        // * Shapes
        Expanded(
          flex: 5,
          child: Column(children: [
            // todo : add provider for this text
            Text(pInfo.name),
            AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 180.w,
                height: 150.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(rounded.r),
                  color: colore,
                ))
          ]),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: shapes.asMap().entries.map(
              (e) {
                final index = e.key;
                final shape = e.value;
                return InkWell(onTap: () => changeShape(index), child: shape);
              },
            ).toList(),
          ),
        )
      ]),
    );
  }
}*/