import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DescriptionDictionary extends StatelessWidget {
  const DescriptionDictionary({super.key});

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
          child: HtmlWidget('<h1 style="direction: rtl; text-align: center;"><strong><span style="color: #3366ff;">وصـف المـعـجـم:</span></strong></h1><h2 style="text-align: right;">كتاب <span style="color: #ff0000;">"المعرَّب من الكلام الأعجمي على حروف المعجم"</span> <span style="color: #00ff00;">لأبي منصور موهوب بن أحمد الجواليقي</span> <span style="color: #ff0000;">(465هـ &ndash; 540هـ)</span> من أهم المراجع في بابه. فإن الألفاظ الأعجمية التي دخلت في اللغة العربية عبر العصور، وجرت على ألسنة الفصحاء، كانت مبثوثة في كتب اللغة، فجاء أبو منصور، وجمعها في كتاب مفرد، ورتّبها على حروف المعجم، فكان كتابه أكبر كتاب في ذلك العصر. طبع كتاب المعرب مرتين من قبل. طبعه أولاً المستشرق الألماني <span style="color: #ff0000;">إدورد زخاو</span>، وصدرت طبعته في ليبزيك سنة <span style="color: #00ff00;">1867م</span> مذيّلة بتعليقاته بالألمانية. ثمّ حقّقه المحدّث الكبير الأستاذ أحمد محمد شاكر رحمه الله عن عدّة نسخ تحقيقًا جيدًا. وظهرت نشرة الثانية سنة <span style="color: #00ff00;">1942م</span> بالقاهرة. وصدر الكتاب، عن دار القلم بدمشق، في طبعة جديدة أنيقة، تختلف عن الطبعتين السابقتين في طبيعتها، وتفوّقهما في جمالها وروعتها، فهي ليست تحقيقًا جديدًا لكتاب المعرب بالمعنى الاصطلاحي المحدث، فإنّ عمل المحقّق أن يجتهد في إخراج النص، كما صدر عن مؤلّفه، سليمًا من آفات التصحيف والتحريف، ليعتمد عليه العلماء والباحثون في دراساتهم المختلفة؛ وكان الأستاذ <span style="color: #ff0000;">أحمد شاكر</span> قد فرغ من ذلك في نشرته، وكانت الطبعة الخامسة&nbsp; <span style="color: #00ff00;">2020م</span> بتحقيقه <span style="color: #ff0000;">أحمد شاكر</span> نشرت من طرف دار الكتب والوثائق القومية بالقاهرة مصر. المرجع: ينظر: محمد أجمل الإصلاحي، كتاب بحوث ومقالات في اللغة والأدب وتقويم النصوص، ص: 423. وقال فيه الدكتور <span style="color: #ff0000;">أحمد عزام</span> " كتاب المعرّب من الكلام الأعجمي لأبي منصور موهوب بن أحمد الجواليقي أجمع ما عرفنا من الكتب التي ضبطت الألفاظ المعرّبة. جمع فيه مؤلفه ما عرب من الألفاظ الأعجمية إلى عصره وحرص على أن يبين اللغات التي أخذت منها الألفاظ، وأصول الألفاظ في هذه اللغات ما وسعه علمه، كما اجتهد أن يسند الأقوال إلى أصحابها من أئمة اللغة. ولم يأل جهدا في الاستشهاد بالآيات والأحاديث والشعر. ورتب ما جمع على حروف المعجم، تيسيرا للمستفيد".&nbsp;</h2><h3 style="direction: rtl; text-align: right;"><span style="color: #3366ff;">المرجع: مقدمة بقلم الدكتور عبد الوهاب عزام من كتاب المعرب للجواليقي تحقيق أحمد محمد شاكر، ص 03. </span></h3>',
                                          textStyle:
                                              TextStyle(color: Colors.black54),
                                        ),
        ),
      ),
    );
  }
}
