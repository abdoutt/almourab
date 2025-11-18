import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:share_plus/share_plus.dart';

class AuteurDictionary extends StatelessWidget {
  const AuteurDictionary({super.key});
  Future<void> share() async {
    SharePlus.instance.share(ShareParams(
        title: "التعريف بصاحب المعجم",
        text:
            "التعريف بصاحب المعجم(465-540هـ/1073-1145م) هو: أبو منصور موهوب بن أحمد بن محمد بن الخَضِر الجُواليقي البغدادي، أديب ولغوي، والجواليقي نسبة إلى الجواليق، جمع جُوالق، ولعل بعض أجداده كان يبيعها أو يعملها. والجُوالق كلمة معرّبة عن الفارسية (كَواله)، وتعني: العِدْل الكبير، وبالعربية الغِرارة وهي وعاء من الخيش توضع فيه الحبوب، ولد الجواليقي ونشأ في بغداد،كان إماماً في فنون الأدب، وهو من مفاخر بغداد، تلقى العلم صغيراً عن مشاهير شيوخ بغداد وكثير من علماء عصره الأعلام، منهم شيخ بغداد في عصره، أبو القاسم البُسْري(ت474هـ) الذي سمع منه الحديث، وأبو الفوارس طرّاد بن علي الزينبي، نقيب النقباء ومسند العراق(ت491هـ)، والخطيب التبريزي(ت502هـ)، والعلاء بن الحسن بن وهب بن الموصلايا، صاحب ديوان الإنشاء، أحد الكتّاب المعروفين(ت497هـ)، والقارئ البغدادي أبو محمد السّرّاج(ت500هـ)، صاحب كتاب «مصارع العشاق»، علاّمة زمانه، وأبو المعالي ثابت بن بندار(ت498هـ) وغيرهم. وهو متدين ثقة غزير الفضل وافر العقل مليح الخط كثير الضبط، صنف التصانيف المفيدة وانتشرت عنه، ومن أشهر مؤلفات الجواليقي: «المعرَّب من الكلام الأعجمي على حروف المعجم». «تكملة إصلاح ما تغلط فيه العامة». «غلط الضعفاء من الفقهاء». «شرح أدب الكاتب» لابن قتيبة. وصنف للخليفة المقتفي لأمر الله الخليفة العباسي(ت555هـ) كتاباً لطيفاً في علم العروض. وينسب إليه من الشعر شيء قليل. توفي الجواليقي في بغداد، ودفن بباب حرب بعد أن صلى عليه قاضي القضاة الزينبي(ت563هـ) بجامع القصر. المصدر: الجواليقي، المعرب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب والوثائق القومية، القاهرة، ط5، 2020م، وابن خلكان، وفيات الأعيان وأنباء أبناء الزمان، تح: إحسان عباس، ج5، دار صادر، بيروت، لبنان، ط1، 1994م، ص 342."));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      margin: const EdgeInsets.only(top: 80.0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                  '<h1 style="direction: rtl; text-align: center;"><span style="color: #3366ff;">التعريف بصاحب المعجم</span></h1><h1 style="direction: rtl; text-align: center;"><span style="color: #ff0000;"><strong>(465-540هـ/1073-1145م)</strong> </span></h1><h2 style="direction: rtl; text-align: right;"><strong>هو:</strong> <strong>أبو منصور موهوب بن أحمد بن محمد بن الخَضِر الجُواليقي البغدادي</strong><strong>، أديب ولغوي</strong><strong>،</strong><strong> والجواليقي نسبة إلى الجواليق، جمع جُوالق، ولعل بعض أجداده كان يبيعها أو يعملها. والجُوالق كلمة معرّبة عن الفارسية (كَواله)، وتعني: العِدْل الكبير، وبالعربية الغِرارة وهي وعاء من الخيش توضع فيه الحبوب، ولد الجواليقي ونشأ في بغداد،كان إماماً في فنون الأدب، وهو من مفاخر بغداد، تلقى العلم صغيراً عن مشاهير شيوخ بغداد وكثير من علماء عصره الأعلام، منهم شيخ بغداد في عصره، أبو القاسم البُسْري</strong><span style="color: #ff0000;"><strong>(ت474هـ)</strong></span><strong> الذي سمع منه الحديث، وأبو الفوارس طرّاد بن علي الزينبي، نقيب النقباء ومسند العراق</strong><span style="color: #ff0000;"><strong>(ت491هـ)</strong></span><strong>،</strong> <strong>والخطيب التبريزي</strong><span style="color: #ff0000;"><strong>(ت502هـ)</strong></span><strong>، والعلاء بن الحسن بن وهب بن الموصلايا، صاحب ديوان الإنشاء، أحد الكتّاب المعروفين</strong><span style="color: #ff0000;"><strong>(ت497هـ)</strong></span><strong>، والقارئ البغدادي أبو محمد السّرّاج</strong><span style="color: #ff0000;"><strong>(ت500هـ)</strong></span><strong>، صاحب كتاب <span style="color: #008000;">&laquo;مصارع العشاق&raquo;</span>، علاّمة زمانه، وأبو المعالي ثابت بن بندار</strong><span style="color: #ff0000;"><strong>(ت498هـ)</strong></span><strong> وغيرهم.</strong> <strong>وهو متدين ثقة غزير الفضل وافر العقل مليح الخط كثير الضبط، صنف التصانيف المفيدة وانتشرت عنه، ومن أشهر مؤلفات الجواليقي: </strong><span style="color: #008000;"><strong>&laquo;</strong><strong>المعرَّب من الكلام الأعجمي على حروف المعجم&raquo;</strong></span><strong>. </strong><span style="color: #008000;"><strong>&laquo;تكملة إصلاح ما تغلط فيه العامة&raquo;</strong></span><strong>. </strong><span style="color: #008000;"><strong>&laquo;غلط الضعفاء من الفقهاء&raquo;</strong></span><strong>. </strong><span style="color: #008000;"><strong>&laquo;شرح أدب الكاتب&raquo;</strong></span><strong> لابن قتيبة. وصنف للخليفة المقتفي لأمر الله الخليفة العباسي</strong><span style="color: #ff0000;"><strong>(ت555هـ)</strong></span><strong> كتاباً لطيفاً في علم العروض. وينسب إليه من الشعر شيء قليل</strong><strong>.</strong><strong> توفي الجواليقي في بغداد، ودفن بباب حرب بعد أن صلى عليه قاضي القضاة الزينبي</strong><span style="color: #ff0000;"><strong>(ت563هـ)</strong></span><strong> بجامع القصر</strong><strong>.</strong></h2><h4 style="direction: rtl; text-align: right;"><span style="color: #3366ff;">ا<strong>لمصدر: </strong><strong>الجواليقي، المعرب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر، مطبعة دار الكتب والوثائق القومية، القاهرة، ط5، 2020م، و</strong><strong>ابن خلكان، وفيات الأعيان وأنباء أبناء الزمان، تح: إحسان عباس، ج5، دار صادر، بيروت، لبنان، ط1، 1994م، ص 342.</strong></span></h4>',
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
