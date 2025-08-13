import 'package:flutter/material.dart';
import 'package:waslny_rider/components/page_top.dart';
import 'package:waslny_rider/constants.dart';

class ShorotAhkamScreen extends StatelessWidget {
  const ShorotAhkamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PageTop(
            pageName: "الشروط والأحكام",
            width: 55,
          ),
          Container(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                "شروط والأحكام لتطبيق وصلني\n مرحبًا بك في تطبيق وصلني! تحكم هذه  "
                " استخدامك لتطبيقنا لحجز الرحلات. باستخدامك للتطبيق،  فإنك توافق على الالتزام بهذه الشروط. يُرجى قراءتها بعناية قبل المتابعة\n.١. تسجيل الحساب: يجب إنشاء حساب لاستخدام ميزات التطبيق مثل حجز الرحلات. أنت مسؤول عن تقديم معلومات دقيقة وحديثة أثناء التسجيل (مثل الاسم، رقم الهاتف، تفاصيل الدفع). يجب حماية بيانات حسابك (كلمة المرور، التفاصيل) وإبلاغنا فورًا عن أي استخدام غير مصرح به.٢. معلومات الخدمة والتسعير: نقدم تقديرات الأسعار بناءً على المسافة، الوقت، والطلب. قد تتغير التكلفة النهائية بسبب الازدحام، تغيير المسار، أو توقفات إضافية. قد تتغير الأسعار أو خيارات الخدمة (مثل أنواع الرحلات) دون إشعار مسبق. نحتفظ بالحق في إلغاء الرحلات المتأثرة بأخطاء تسعير أو مشاكل تقنية.٣. حجز الرحلات وتنفيذها: بحجزك لرحلة، فإنك توافق على دفع السعر المعروض أو المحسوب عند انتهاء الرحلة. نحتفظ بالحق في قبول، رفض، أو إلغاء الحجوزات بسبب نقص السائقين، مخاوف أمان، أو اشتباه في الاحتيال. السائقون مزودون خدمات مستقلون. نوفر لك التواصل معهم، لكننا لا نضمن توفرهم أو سائقين محددين.",
                style:
                    TextStyle(color: white, fontSize: 18, fontFamily: 'cairo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
