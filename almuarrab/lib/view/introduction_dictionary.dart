import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class IntroductionDictionary extends StatelessWidget {
  const IntroductionDictionary({super.key});

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
          child: HtmlWidget('<h1 style="text-align: center;"><span style="color: #0000ff;"><strong>المقدمة</strong></span></h1> <h2 style="direction: rtl;"><strong> لبسـم الله الرحمان الرحيم<span class=""> قال الشيخُ الإِمامُ الأجلُّ الأوحدُ العالم. </span><span class="" style="color: #ff0000;">أبو منصورٍ موهوبُ بنُ أحمدَ بن مـحمد بن الخَضِرِ </span><span class="">[الجوالِيقي]</span><span class=""> أطال اللهُ بقاءَه، وحَرَس مُدَّته وحَوْبَاءَهُ: هذا كتابٌ نذكرُ فيه ما تكلمتْ به العرب من الكلام الأعجميِّ، ونطق به القرآنُ الـمَـجِيد، ووردَ في أخبار الرسولِ صلى الله عليه وسلم والصحابة والتابعين، رضوانُ الله عليهم [أجمعين]، وذَكَرتْهُ العربُ في أشعارها وأخبارِها. ليُعْرَفَ الدخيل من الصَّرِيح. ففي معرفة ذلك فائدةٌ جليلةٌ، وهي أن يحترِس المشْتَقُّ فلا يجعلَ شيئًا من لغة العرب لشيءٍ من لغة العجمِ. فقد قال [أبوبكر] بنُ السَرَّاجِ في رسالته في الاشتقاق، في <span style="color: #00ff00;">(باب ما يَجبُ على الناظر في الاشتقاق أن يَتَوقَّاهُ ويحترسَ منه)</span>:</span> <span class="">&laquo;مِمّا ينبغي أن يَحْذَرَ منه كلَّ الحَذَرِ أن يَشْتَقَّ من لغة العرب لشيءٍ من لغة العجمِ، فيكونَ بمنزلة من ادَّعَى أن الطيرَ وَلَدُ الحُوتِ&raquo;.</span> <span class="">[وحُكِيَ عن أبي عليٍّ قال: رأيتُ أبا بكرٍ يُدِيرُ هذه اللفظةَ <span style="color: #ff0000;">&laquo;بُوصِيٌّ&raquo;</span> ليَشْتَقَّها، فقلتُ: أين تذهبُ، إنّها <span style="color: #00ff00;">فارسيةٌ</span>، إنما هو <span style="color: #ff0000;">&laquo;بُوزيد&raquo;</span> وهو اسمُ جَدِّنَا! قال: ومعناهُ: السَّالمُ. فقال أبوبكرٍ: فَرَّجْتَ عَنِّي]. فأمّا ما ورد منه في القرآن، فقد اختلفَ فيه أهلُ العلم: [فـ]ــقال بعضهم: كتابُ الله [تعالی] ليس فيه شيءٌ من غَير العربيَّةِ. أخبرنِي غيرُ واحدٍ عن الحسن بن أحمدَ عن دَعْلَجٍ عن علي بن عبد العزيز عن أبي عُبَيْدٍ قال: سمعت أبا عُبَيْدة يقول: من زعم أن في القرآن لسانًا سوى العربية فقد أَعْظَمَ عَلى اللهِ القولَ. واحتج بقوله تعالى:<span style="color: #00ff00;">(إنا جعلناه قرآنا عربيا)</span></span> <span class="">، </span><span class="">سورة الزخرف (3).</span> <span class="">قال أبو عبيد: وروي عن ابن عباس ومجاهد وعكْرِمَةَ وغيرهم، في أحرف كثيرة: أنه من غير لسان العرب، مثل<span style="color: #ff0000;">&laquo;سجِّيل&raquo; </span></span><span class="">و</span><span class="" style="color: #ff0000;">&laquo;المِشْکاةِ&raquo;</span><span class=""> و<span style="color: #ff0000;">&laquo;اليَمِّ&raquo;</span></span> <span class="">و</span><span class="" style="color: #ff0000;">&laquo;الطور&raquo;</span><span class=""> و<span style="color: #ff0000;">&laquo;أَبَارِيقَ&raquo;</span></span> و<span style="color: #ff0000;">&laquo;إسْتَبْرقٍ&raquo;</span><span class=""> وغير</span><span class=""> ذلك. فهؤلاء أعلم بالتأويل من أبي عبيدة. ولكنهم ذهبوا إلى مذهب، وذهب هذا إلى غيره. وكلاهما مصيبٌ إن شاء الله تعالی، وذلك: أن هذه الحروف بغير لسان العرب في الأصلِ، فقال أولئك على الأصل، ثم لفظتْ به العرب بألسنتها، فعرَّبَتْه، فصار عربيًّا بتعريبها إيَّاه، فهي عربيةٌ في هذه الحال، أعجميةُ الأصلِ. فهذا القولُ يُصَدِّقُ الفريقين جميعًا. والأسماء المعَرَّبةُ [في الصَّرْفِ وتركِه] على ضربين: أحدُهما لا يُعْتَدُّ بعُجْمَتِه، وهو ما أُدخل عليه لام التَّعريفِ، نحو</span> <span style="color: #ff0000;">&laquo;الدِّيباج&raquo;</span> و<span style="color: #ff0000;">&laquo;الدِّيوان&raquo;</span><span class="">. والثاني: <strong>ما يُعْتَدُّ</strong> <strong>بعجمته</strong>. وهو ما لم يُدْخلُوا عليه لامَ التعريفِ كـ<span style="color: #ff0000;">&laquo;ـموسی&raquo;</span></span><span class=""> و</span><span class="" style="color: #ff0000;">&laquo;عيسی&raquo;</span><span class="">.</span></strong></h2> <h3 style="text-align: right;"><span class="">المرجع: الجواليقي، المعرب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب والوثائق القومية، القاهرة، ط5، 2020م، ص:3-4-5.&nbsp;</span></h3><p>"</p>',
                                          textStyle:
                                              TextStyle(color: Colors.black54),
                                        ),
        ),
      ),
    );
  }
}
