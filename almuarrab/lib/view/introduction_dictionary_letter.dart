import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class IntroductionDictionaryLetter extends StatelessWidget {
  const IntroductionDictionaryLetter({super.key});
  Future<void> share() async {
    await FlutterShare.share(
      title: "باب ما يعرف من المعرب بائتلاف الحروف",
      text:"بَاب مَا يُعْرَفُ مِنَ المُعَرَّبِ بِائْتِلَافِ الحُرُوف: لم تجتمع الجيمُ والقافُ في كلمةٍ عربيةٍ، فمتى جاءتا في كلمة فاعلم أنها مُعَرَّبَةٌ. من ذلك «جَلَوْبقٌ» و«جَرَنْدَقٌ» و«الجَوْقُ» و«القَبَجُ» ورجلٌ «أَجْوَقُ». وستَرى ذلك مُفسَّرًا في مواضعه، إن شاء اللهُ [تعالى]. ولا تجتمع الصادُ والجيمُ في كلمةٍ عربيةٍ، من ذلك «الجِصُّ» و«الصَّنْجَةُ» و«الصَّوْلَجَانُ» ونحوُ ذلك. وليس في أصول أبنيةِ العربِ اسمٌ فيه نونٌ بعدها راءٌ. فإذا مَرَّ بك ذلك فاعلم أن ذلك الاسمَ معرَّبٌ. نحو «نَرْجس» و«نَرْسٍ» و«نَوْرَجٍ» و«نِرْسِيَانٍ» و«نَرْجَةٍ»، على ما تراه مفَسَّراً [في مواضعه]. وليس في كلامهم زاي بعد دالٍ إلا دَخِيلٌ، من ذلك: «الهنْدَازُ» و«الـمُـهَنْدِزُ» وأبدلوا الزَّايَ سينًا، فقالوا «المهندس». ولم يَحْكِ أحدٌ من الثقاتِ كلمةً عربيةً مبنيةً من باءٍ وسينٍ وتاءٍ، فإذا جاء ذلك في كلمةٍ فهي دخيلٌ. فأمّا أمثلةُ العرب فأحسنُها ما بُنِي من الحروف الـمُتَباعِدَةِ المخارِجِ. وأخَفُّ الحروفِ حروفُ الذَّلَاقَةِ، وهي ستةٌ: ثلاثةٌ من طَرَفِ اللسانِ، وهي: الراءُ، والنونُ، واللامُ، وثلاثةٌ من الشفتَيْنِ، وهي: الفاءُ، والباءُ، والميمُ. ولهذا لا يَخلُو الرُّبَاعِي والخُماسيُّ منها، إلا ما كان من «عَسْجَد» فإن السين أشبهت النونَ، للصَّفِيرِ الذي فيها، والغُنّةِ التي في النونِ. فإذا جاءك مثالٌ خماسيٌّ أو رباعِيٌّ بغير حرفٍ أو حرفين من حروف الذَّلاقَة: فاعلمْ أنه ليس من كلامهم، مِثْلُ «عَقْجَشٍ» [و]«حُظَائج» ونحو ذلك. فهذه جملةٌ من القولِ في هذا الفَنِّ كافيةٌ. وقد رتَّبنا هذا الكتابَ على حروف الـمُعْجَم، ليَسْهُلَ مرامُهُ، ويَكْمُلَ نِظامُهُ.  المصدر: الجواليقي، المعرّب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب القومية، القاهرة، مصر، ط5، 2020م، ص: 10-11.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 80.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child:  HtmlWidget(
                  '<h1 style="direction: rtl; text-align: center;"><span style="color: #0000ff;">بَابُ مَا يُعْرَفُ مِنَ المُعَرَّبِ بِائْتِلَافِ الحُرُوف</span></h1><h2 style="direction: rtl; text-align: justify;">لم تَجتمع الجيمُ والقافُ في كلمةٍ عربيةٍ، فمتى جاءتا في كلمة فاعلم أنها <span style="color: #008000;">مُعَرَّبَةٌ</span>. من ذلك <span style="color: #ff0000;">&laquo;جَلَوْبقٌ&raquo;</span> و<span style="color: #ff0000;">&laquo;جَرَنْدَقٌ&raquo;</span> و<span style="color: #ff0000;">&laquo;الجَوْقُ&raquo;</span> و<span style="color: #ff0000;">&laquo;القَبَجُ&raquo;</span> ورجلٌ <span style="color: #ff0000;">&laquo;أَجْوَقُ&raquo;</span>. وستَرى ذلك مُفسَّرًا في مواضعه، إن شاء اللهُ [تعالى]. ولا تجتمع الصادُ والجيمُ في كلمةٍ عربيةٍ، من ذلك <span style="color: #ff0000;">&laquo;الجِصُّ&raquo;</span> و<span style="color: #ff0000;">&laquo;الصَّنْجَةُ&raquo;</span> و<span style="color: #ff0000;">&laquo;الصَّوْلَجَانُ&raquo;</span> ونحوُ ذلك. وليس في أصول أبنيةِ العربِ اسمٌ فيه نونٌ بعدها راءٌ. فإذا مَرَّ بك ذلك فاعلم أن ذلك الاسمَ معرَّبٌ. نحو <span style="color: #ff0000;">&laquo;نَرْجس&raquo;</span> و<span style="color: #ff0000;">&laquo;نَرْسٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نَوْرَجٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نِرْسِيَانٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نَرْجَةٍ&raquo;</span>، على ما تراه مفَسَّراً [في مواضعه]. وليس في كلامهم زاي بعد دالٍ إلا <span style="color: #008000;">دَخِيلٌ</span>، من ذلك: <span style="color: #ff0000;">&laquo;الهنْدَازُ&raquo;</span> و<span style="color: #ff0000;">&laquo;الـمُهَنْدِزُ&raquo;</span> وأبدلوا الزَّايَ سينًا، فقالوا <span style="color: #ff0000;">&laquo;المهندس&raquo;</span>. ولم يَحْكِ أحدٌ من الثقاتِ كلمةً عربيةً مبنيةً من <span style="color: #008000;">باءٍ وسينٍ وتاءٍ</span>، فإذا جاء ذلك في كلمةٍ فهي <span style="color: #008000;">دخيلٌ</span>. فأمّا أمثلةُ العرب فأحسنُها ما بُنِي من الحروف الـمُتَباعِدَةِ المخارِجِ. وأخَفُّ الحروفِ حروفُ الذَّلَاقَةِ، وهي ستةٌ: ثلاثةٌ من طَرَفِ اللسانِ، وهي: <span style="color: #008000;">الراءُ، والنونُ، واللامُ،</span> وثلاثةٌ من الشفتَيْنِ، وهي: <span style="color: #008000;">الفاءُ، والباءُ، والميمُ.</span> ولهذا لا يَخلُو الرُّبَاعِي والخُماسيُّ منها، إلا ما كان من <span style="color: #ff0000;">&laquo;عَسْجَد&raquo;</span> فإن السين أشبهت النونَ، للصَّفِيرِ الذي فيها، والغُنّةِ التي في النونِ. فإذا جاءك مثالٌ خماسيٌّ أو رباعِيٌّ بغير حرفٍ أو حرفين من حروف الذَّلاقَة: فاعلمْ أنه ليس من كلامهم، مِثْلُ <span style="color: #ff0000;">&laquo;عَقْجَشٍ&raquo;</span> [و]<span style="color: #ff0000;">&laquo;حُظَائج&raquo;</span> ونحو ذلك. فهذه جملةٌ من القولِ في هذا الفَنِّ كافيةٌ. وقد رتَّبنا هذا الكتابَ على حروف الـمُعْجَم، ليَسْهُلَ مرامُهُ، ويَكْمُلَ نِظامُهُ.</h2><h4 style="direction: rtl; text-align: right;"><span style="color: #0000ff;">المصدر: الجواليقي، المعرّب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب القومية، القاهرة، مصر، ط5، 2020م، ص: 10-11.</span></h4>',
                  textStyle: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                  share();
                },
                child: Image.asset("assets/icons/share_icon.png"),
              ))
        ],
      ),
    );
  }
}
