import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class AuteurDictionary extends StatelessWidget {
  const AuteurDictionary({super.key});

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
          child: HtmlWidget('<h1 style="direction: rtl; text-align: center;"><strong><span style="color: #0000ff;">التعريف بصاحب المعجم (465-540هـ/1073-1145م) </span></strong></h1><h2 style="direction: rtl; text-align: right;">هو: <strong><span style="color: #ff0000;">أبو منصور موهوب بن أحمد بن محمد بن الخَضِر الجُواليقي البغدادي</span></strong>، أديب ولغوي، والجواليقي نسبة إلى الجواليق، جمع جُوالق، ولعل بعض أجداده كان يبيعها أو يعملها. والجُوالق كلمة معرّبة عن الفارسية (كَواله)، وتعني: العِدْل الكبير، وبالعربية الغِرارة وهي وعاء من الخيش توضع فيه الحبوب. ولد الجواليقي ونشأ في بغداد عام <span style="color: #ff0000;">465هـ</span>، كان إماماً في فنون الأدب، وهو من مفاخر بغداد، تلقى العلم صغيراً عن مشاهير شيوخ بغداد وكثير من علماء عصره الأعلام، منهم شيخ بغداد في عصره، أبو القاسم البُسْري (ت474هـ) الذي سمع منه الحديث، وأبو الفوارس طرّاد بن علي الزينبي، نقيب النقباء ومسند العراق (ت491هـ)، والخطيب التبريزي&nbsp;(ت502هـ)، والعلاء بن الحسن بن وهب بن الموصلايا، صاحب ديوان الإنشاء، أحد الكتّاب المعروفين (ت497هـ)، والقارئ البغدادي أبو محمد السّرّاج (ت500هـ)، صاحب كتاب &laquo;مصارع العشاق&raquo;، علاّمة زمانه، وأبو المعالي ثابت بن بندار (ت498هـ) وغيرهم. وهو متدين ثقة غزير الفضل وافر العقل مليح الخط كثير الضبط، صنف التصانيف المفيدة وانتشرت عنه، ومن أشهر مؤلفات الجواليقي:&nbsp; <span style="color: #00ff00;">&laquo;المعرَّب من الكلام الأعجمي على حروف المعجم&raquo;</span>. <span style="color: #00ff00;">&laquo;تكملة إصلاح ما تغلط فيه العامة&raquo;</span>. <span style="color: #00ff00;">&laquo;غلط الضعفاء من الفقهاء&raquo;</span>. <span style="color: #00ff00;">&laquo;شرح أدب الكاتب&raquo;</span> لابن قتيبة. وصنف للخليفة المقتفي لأمر الله الخليفة العباسي (ت555هـ) كتاباً لطيفاً في علم العروض. وينسب إليه من الشعر شيء قليل. توفي الجواليقي عام <span style="color: #ff0000;">540هـ</span> في بغداد، ودفن بباب حرب بعد أن صلى عليه قاضي القضاة الزينبي (ت563هـ) بجامع القصر.</h2><h3 style="direction: rtl; text-align: right;"><span style="color: #0000ff;">المرجع: الجواليقي، المعرّب من الكلام الأعجمي على حروف المعجم، تح: أحمد محمد شاكر. ابن خلكان، وفيات الأعيان، تح: إحسان عباس.&nbsp;</span></h3>',
                                          textStyle:
                                              TextStyle(color: Colors.black54),
                                        ),
        ),
      ),
    );
  }
}
