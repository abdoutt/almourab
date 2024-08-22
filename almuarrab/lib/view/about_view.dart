import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 80.0),
      decoration: const BoxDecoration(color:Colors.transparent,  ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                            "جامعة الشهيد حمه لخضر - الوادي-الجزائر",
                            style: TextStyle(fontSize: 18),
                          ),
                           SizedBox(
                            height: 2,
                          ),
                          Text(
                            "الطالبة: مسعودة مراد",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                           Text(
                            "المشرف: الأستاذ الدكتور محمد بن يحي",
                            style: TextStyle(fontSize: 18),
                          ),
                          
                         
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "عنوان الكتاب",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "المعرّب من الكلام الأعجمي على حروف المعجم",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المؤلف",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "أبو منصور الجواليقي (465هـ-540هـ)",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "المحقق",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "أحمد محمد شاكر",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "تاريخ الإصدار",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "الطبعة الخامسة تاريخ الإصدار: 1441هـ/2020م",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "دار النشر",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "دار الكتب والوثائق القومية بالقاهرة",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "نسخة التطبيق",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "1.0.0+3",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "البريد الإلكتروني للتواصل",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "merad.messaouda@gmail.com",
                            style: TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          
            
            const SizedBox(
              height: 25,
            ),
            const Text(
              "جميع حقوق الطبع والنشر محفوظة 2023 / 2024",
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
