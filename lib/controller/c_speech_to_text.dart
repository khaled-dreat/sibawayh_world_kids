part of '../utils/import/app_import.dart';

class ControllerSpeechToText extends ChangeNotifier {
  bool isTranscribing = false;
  bool isTranscribingForBtn = true;
  final AudioPlayer player = AudioPlayer();

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
      player.setAsset(AppSounds.time);
      player.setLoopMode(LoopMode.all);
      player.play();
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
      player.setLoopMode(LoopMode.off);
    } catch (e) {
      dev.log("Error Speeth to text : $e");
    }
  }

  // * Used to check pronunciation status
  void checkPronStatus(BuildContext context) {
    if (content != "") {
      if (content == "الف.") {
        player.setAsset(AppSounds.success);

        AppSnackBar.snackBarSuccess(context, msg: "أحسنت أجابة صحيحية");
      } else {
        player.setAsset(AppSounds.fail);

        AppSnackBar.snackBarError(context,
            msg: "ركز أكثر وأعد الاستماع الى الحرف");
      }
    } else {
      player.setAsset(AppSounds.error);
      AppSnackBar.noData(context, msg: "أعد المحاولة هناك خطاء");
    }

    player.play();
  }
}
