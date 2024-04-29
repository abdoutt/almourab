import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class IntroductionDictionaryLetter extends StatelessWidget {
  const IntroductionDictionaryLetter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin:  const EdgeInsets.only(top: 80.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical:10, horizontal: 3),
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child:  SingleChildScrollView(
          child: HtmlWidget('<h1 style="direction: rtl; text-align: center;"><strong><span style="color: #0000ff;">باب ما يُعْرَفُ من المُعَرَّبِ بائتلافِ الحروف: </span></strong></h1><h2 style="direction: rtl; text-align: right;">لم تجتمع الجيمُ والقافُ في كلمةٍ عربيةٍ، فمتى جاءتا في كلمة فاعلم أنها مُعَرَّبَةٌ. من ذلك <span style="color: #ff0000;">&laquo;جَلَوْيَقٌ&raquo;</span> و<span style="color: #ff0000;">&laquo;جَرَنْدَقٌ&raquo;</span> و<span style="color: #ff0000;">&laquo;الجَوْقُ&raquo;</span> و<span style="color: #ff0000;">&laquo;القَبَجُ&raquo;</span> ورجلٌ <span style="color: #ff0000;">&laquo;أَجْوَقُ&raquo;</span>. وستَرى ذلك مُفسَّرًا في مواضعه، إن شاء اللهُ [تعالى]. ولا تجتمع الصادُ والجيمُ في كلمةٍ عربيةٍ، من ذلك <span style="color: #ff0000;">&laquo;الجِصُّ&raquo;</span> و<span style="color: #ff0000;">&laquo;الصَّنْجَةُ&raquo;</span> و<span style="color: #ff0000;">&laquo;الصَّوْلَجَانُ&raquo;</span> ونحوُ ذلك. وليس في أصول أبنيةِ العربِ اسمٌ فيه نونٌ بعدها راءٌ. فإذا مَرَّ بك ذلك فاعلم أن ذلك الاسمَ معرَّبٌ. نحو <span style="color: #ff0000;">&laquo;نَرْجس&raquo;</span> و<span style="color: #ff0000;">&laquo;نَرْسٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نَوْرَجٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نِرْسِيَانٍ&raquo;</span> و<span style="color: #ff0000;">&laquo;نَرْجَةٍ&raquo;</span>، على ما تراه مفَسَّراً [في مواضعه]. وليس في كلامهم زاي بعد دالٍ إلا دَخِيلٌ، من ذلك: <span style="color: #ff0000;">&laquo;الهنْدَازُ&raquo;</span> و<span style="color: #ff0000;">&laquo;الـمُـهَنْدِزُ&raquo;</span> وأبدلوا الزَّايَ سينًا، فقالوا <span style="color: #ff0000;">&laquo;المهندس&raquo;</span>. ولم يَحْكِ أحدٌ من الثقاتِ كلمةً عربيةً مبنيةً من باءٍ وسينٍ وتاءٍ، فإذا جاء ذلك في كلمةٍ فهي دخيلٌ. فأمّا أمثلةُ العرب فأحسنُها ما بُنِي من الحروف الـمُتَباعِدَةِ المخارِجِ. وأخَفُّ الحروفِ حروفُ الذَّلَاقَةِ، وهي ستةٌ: ثلاثةٌ من طَرَفِ اللسانِ، وهي: <span style="color: #00ff00;">الراءُ</span>، و<span style="color: #00ff00;">النونُ</span>، و<span style="color: #00ff00;">اللامُ</span>، وثلاثةٌ من الشفتَيْنِ، وهي: <span style="color: #00ff00;">الفاءُ</span>، و<span style="color: #00ff00;">الباءُ</span>، والميمُ. ولهذا لا يَخلُو الرُّبَاعِي والخُماسيُّ منها، إلا ما كان من <span style="color: #ff0000;">&laquo;عَسْجَد&raquo;</span> فإن السين أشبهت النونَ، للصَّفِيرِ الذي فيها، والغُنّةِ التي في النونِ. فإذا جاءك مثالٌ خماسيٌّ أو رباعِيٌّ بغير حرفٍ أو حرفين من حروف الذَّلاقَة: فاعلمْ أنه ليس من كلامهم، مِثْلُ <span style="color: #ff0000;">&laquo;عَقْجَشٍ&raquo;</span> [و]<span style="color: #ff0000;">&laquo;حُظَائج&raquo;</span> ونحو ذلك. فهذه جملةٌ من القولِ في هذا الفَنِّ كافيةٌ. وقد رتَّبنا هذا الكتابَ على حروف الـمُعْجَم، ليَسْهُلَ مرامُهُ، ويَكْمُلَ نِظامُهُ.&nbsp;</h2><h3 style="direction: rtl; text-align: center;"><span style="color: #0000ff;">المرجع: الجواليقي، المعرب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب القومية، القاهرة، مصر، ط5، 2020م، ص: 10-11.</span></h3>',
                                          textStyle:
                                              TextStyle(color: Colors.black54),
                                        ),
        ),
      ),
    );
  }
}
