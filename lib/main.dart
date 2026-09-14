import 'package:flutter/material.dart';

void main() {
  runApp(const OsonKadastrApp());
}

class OsonKadastrApp extends StatelessWidget {
  const OsonKadastrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oson Kadastr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ---------------- HUJJAT MODELI (BATAFSIL TAVSIF BILAN) ----------------
class RequiredDocument {
  final String simpleName;
  final String officialName;
  final String whatIsIt; // Bu qanday hujjat? (Oddiy tilda)
  final String insideContent; // Ichida nimalar yozilgan bo‘lishi shart?
  final String whereToGet; // Qayerdan olinadi yoki qanday topiladi?

  RequiredDocument({
    required this.simpleName,
    required this.officialName,
    required this.whatIsIt,
    required this.insideContent,
    required this.whereToGet,
  });
}

class KadastrService {
  final String id;
  final String titleSimple;
  final String titleOfficial;
  final String category;
  final String purpose;
  final String duration;
  final String cost;
  final List<RequiredDocument> docs;
  final List<String> illegalDemands;
  final String warningTip;

  KadastrService({
    required this.id,
    required this.titleSimple,
    required this.titleOfficial,
    required this.category,
    required this.purpose,
    required this.duration,
    required this.cost,
    required this.docs,
    required this.illegalDemands,
    required this.warningTip,
  });
}

// ---------------- 22 TA RASMIY XIZMAT VA CHUQUR HUJJATLAR TAVSIFI ----------------
final List<KadastrService> kadastrServices = [
  KadastrService(
    id: '1',
    titleSimple: 'Uy-joyga kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (turar joy) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Uyingiz yoki kvartirangizning devorlari, xonalari va yerini mutaxassis kelib o‘lchab, rasmiy elektron pasport va chizmasini tayyorlab berishi.',
    duration: 'Kvartira: 5 ish kuni; Yakka tartibdagi hovli uy: 8 ish kuni',
    cost: 'Uy maydoniga qarab hisoblanadi (Davlat SMS-kvitansiyasi orqali)',
    warningTip: 'Uy ichida noqonuniy o‘zboshimchalik bilan devor buzilgan yoki qo‘shimcha imorat solingan bo‘lsa, avval loyihani tasdiqlatish so‘raladi. Qo‘ldan naqd pul bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Mulk huquqini tasdiqlovchi hujjat',
        officialName: 'Huquq belgilovchi hujjat (Bitim, qaror, order)',
        whatIsIt: 'Siz bu uyga qanday qilib ega bo‘lib qolganingizni tasdiqlovchi eng asosiy davlat hujjati. Bu hujjatsiz uy sizniki hisoblanmaydi.',
        insideContent: '• Notarius muhri va reyestr raqami;\n• Sotuvchi va xaridor (yoki merosxo‘r)ning ism-familiyasi, pasport maʼlumotlari;\n• Mulkning aniq manzili (tuman, ko‘cha, uy raqami);\n• Mulk qaysi asosda (sotib olingan, hadya qilingan, meros qolgan yoki hokim qarori bilan berilgan) ekani yozilgan bo‘lishi shart.',
        whereToGet: 'Mulk oldi-sotdi bo‘lgan notariusdan, uyni ajratgan tuman hokimligidan yoki shahar davlat arxividan (agar yo‘qolgan bo‘lsa, dublikat olinadi).',
      ),
      RequiredDocument(
        simpleName: 'Pasport yoki ID-karta (JShSHIR)',
        officialName: 'Shaxsni tasdiqlovchi davlat hujjati',
        whatIsIt: 'Murojaat qilayotgan fuqaroning shaxsi va 14 xonali unikal JShSHIR raqamini tasdiqlovchi plastik karta yoki biometrik pasport.',
        insideContent: '• Fuqaroning fotosurati;\n• Ism, familiya, ota ismi;\n• Tug‘ilgan sanasi va 14 xonali JShSHIR kodi.',
        whereToGet: 'Yoningizda bo‘lishi kifoya. Nusxa talab qilinmaydi, faqat elektron skaner qilinadi.',
      ),
    ],
    illegalDemands: ['Mahalladan maʼlumotnoma (spravka)', 'Qo‘shnilar tilxati', 'Kommunal to‘lovlar cheki'],
  ),

  KadastrService(
    id: '2',
    titleSimple: 'Tadbirkorlik va noturar binolarga kadastr pasporti olish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Do‘kon, ofis, omborxona, ishlab chiqarish sexi kabi tadbirkorlik binolarining texnik o‘lchovlarini qilib, pasport rasmiylashtirish.',
    duration: '100 kv.mgacha — 5 ish kuni; 1000 kv.mgacha — 7 ish kuni',
    cost: 'Maydoni va toifasiga qarab tasdiqlangan davlat tarifi',
    warningTip: 'Faqat my.gov.uz yoki DXM orqali kelgan elektron invoysga to‘lov qiling.',
    docs: [
      RequiredDocument(
        simpleName: 'Noturar mulkka egalik hujjati',
        officialName: 'Oldi-sotdi shartnomasi / E-auksion bayonnomasi / Qaror',
        whatIsIt: 'Binoni xarid qilganingiz, auksionda yutib olganingiz yoki qurishga ruxsat berilganini tasdiqlovchi yuridik asos.',
        insideContent: '• Binoning maydoni, qavatlar soni, foydalanish maqsadi (savdo, xizmat ko‘rsatish, ishlab chiqarish);\n• Mulkdorning rekvizitlari va manzil.',
        whereToGet: 'E-auksion tizimidan yutuq bayonnomasi, notarius shartnomasi yoki DXM orqali berilgan ruxsatnomalar.',
      ),
      RequiredDocument(
        simpleName: 'Foydalanishga qabul qilish dalolatnomasi',
        officialName: 'Obyektni foydalanishga qabul qilish to‘g‘risidagi ruxsatnoma',
        whatIsIt: 'Bino yangi qurilgan bo‘lsa, qurilish nazorati inspeksiyasi va tegishli organlar bino xavfsiz qurilganini tasdiqlagan xulosasi.',
        insideContent: '• Qurilish loyiha chizmasi raqami;\n• Qabul qilish komissiyasi aʼzolarining elektron imzolari.',
        whereToGet: 'Tuman Qurilish bo‘limi va Davlat xizmatlari markazidan olinadi.',
      ),
    ],
    illegalDemands: ['Soliqdan qarz yo‘qligi maʼlumotnomasi', 'Hokimiyatning alohida yozma xati'],
  ),

  KadastrService(
    id: '3',
    titleSimple: 'Mulk huquqini davlat ro‘yxatidan o‘tkazish (Reyestrga kiritish)',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Notariusda uy sotib olganingizdan yoki meros olganingizdan keyin, sizni davlat bazasida rasman to‘laqonli yagona xo‘jayin qilib ro‘yxatga qo‘yish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'Diqqat! Notariusda shartnoma qilganingiz bilan ish bitmaydi. Agar uni kadastr reyestridan o‘tkazmasangiz, mulk sizning nomingizga rasman o‘tmagan hisoblanadi!',
    docs: [
      RequiredDocument(
        simpleName: 'Notarial shartnoma yoki sud hujjati',
        officialName: 'Oldi-sotdi, hadya shartnomasi yoki qonuniy kuchga kirgan sud hal qiluv qarori',
        whatIsIt: 'Uy sizga o‘tganini bildiruvchi gerbli, maxsus qatʼiy hisobdagi notarial qog‘oz yoki sud muhri bosilgan hujjat.',
        insideContent: '• Notarius muhri, gerbli blanka seriyasi va QR-kodi;\n• Mulkning to‘liq tavsifi, xarid narxi va avvalgi egasining maʼlumotlari.',
        whereToGet: 'Notarial idoradan bitim tuzilgan zahoti beriladi.',
      ),
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Elektron kadastr yig‘majildi',
        whatIsIt: 'Uyning chizmasi va xona o‘lchamlari jamlangan elektron hujjat.',
        insideContent: '• Kadastr raqami (masalan: 10:01:05:...);\n• Yer maydoni, yashash maydoni, qurilish osti maydoni.',
        whereToGet: 'Kadastr idorasi shakllantirgan elektron baza orqali avtomatik tortib olinadi.',
      ),
    ],
    illegalDemands: ['Notarius tasdiqlagan qog‘ozni hokimiyatga borib tasdiqlatish', 'Arxivdan qo‘shimcha spravka'],
  ),

  KadastrService(
    id: '4',
    titleSimple: 'Davlat reyestridan ko‘chirma olish (Mulkdorlik hujjati)',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish',
    category: 'Maʼlumotnoma',
    purpose: 'Hozirgi paytda ushbu uy yoki yer kimning nomida turganini isbotlab beruvchi QR-kodli rasmiy davlat hujjati.',
    duration: '1 ish kuni (ko‘p hollarda avtomatik)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Eski ko‘k muhrli qog‘ozlar o‘rniga hozir mana shu QR-kodli elektron ko‘chirma yagona yuridik kuchga ega.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Ko‘chmas mulk unikal kadastr raqami',
        whatIsIt: 'Har bir uyga beriladigan 10 xonali avtomat raqam (xuddi mashinaning davlat raqamidek).',
        insideContent: '• Viloyat, tuman, mahalla va aniq obyekt kodi aks etgan raqamlar qatori.',
        whereToGet: 'Uyning kadastr pasportidan yoki my.gov.uz profilidan ko‘riladi.',
      ),
    ],
    illegalDemands: ['Kadastr xodimining uyga shaxsan kelib tekshirishi'],
  ),

  KadastrService(
    id: '5',
    titleSimple: 'Nomida shaxsiy turar joy yo‘qligi haqida maʼlumotnoma',
    titleOfficial: 'Fuqaroning nomida shaxsiy turar joy mavjud yoki mavjud emasligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Davlatdan arzon uy-joy olish, subsidiya olish yoki yotoqxonadan joy olishda butun respublika bo‘yicha sizda uy yo‘qligini tasdiqlash.',
    duration: 'Avtomatik (real vaqt rejimida)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Agar nomingizda hatto 1/2 ulushli eski uy bo‘lsa ham, tizim "mulki bor" deb chiqaradi.',
    docs: [
      RequiredDocument(
        simpleName: 'Pasport / ID-karta (JShSHIR)',
        officialName: '14 xonali shaxsiy identifikatsiya raqami',
        whatIsIt: 'Sizning nomingizdagi barcha mulklarni qidirish uchun yagona kalit raqam.',
        insideContent: '• Familiya, ism, tug‘ilgan sana va JShSHIR.',
        whereToGet: 'ID-kartangizning orqa tomonida yozilgan bo‘ladi.',
      ),
    ],
    illegalDemands: ['Mahalladan uy-joyi yo‘qligi haqida spravka keltirish'],
  ),

  KadastrService(
    id: '6',
    titleSimple: 'Mulkda taqiq (Zapret) bor-yo‘qligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar mavjudligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Uyni sotib olishdan oldin, unga sud, MIB qarzdorligi, bank ipotekasi yoki tergov organi taqiq qo‘ymaganini tekshirish.',
    duration: 'Real vaqtda (1 kun)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Taqiqi bor uyni notariusda rasmiylashtirib bo‘lmaydi. Hech qachon taqiq yechilmasidan oldin birovga "zaklad" (zalatok) bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Uyning kadastr raqami',
        officialName: 'Ko‘chmas mulk kadastr raqami',
        whatIsIt: 'Sotib olinayotgan yoki tekshirilayotgan uyning raqami.',
        insideContent: '• Obyektning viloyat, tuman va hududiy shifri.',
        whereToGet: 'Uy egasining kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['MIBga borib qo‘lda imzo qo‘ydirib kelish talabi'],
  ),

  KadastrService(
    id: '7',
    titleSimple: 'Hovli yoki uyni ikkiga bo‘lish (Alohida qilish)',
    titleOfficial: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati',
    category: 'Chegaralar',
    purpose: 'Bitta umumiy hovlini ota-o‘g‘il yoki aka-uka o‘rtasida alohida mustaqil ikkita hovliga ajratish va har biriga alohida kadastr olish.',
    duration: '10 dan 15 ish kunigacha',
    cost: 'Maydoni va meʼmoriy chizmasiga asosan',
    warningTip: 'Bo‘lingan har ikkala tomonda ko‘chaga mustaqil chiqish darvozasi (yo‘li) bo‘lishi shart! Agar yo‘li bo‘lmasa, qonun bo‘yicha bo‘lish rad etiladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Taqsimlash kelishuvi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan mulkni bo‘lish shartnomasi / Sud ajrimi',
        whatIsIt: 'Egalar o‘rtasida uyni qaysi devordan ikkiga ajratishga kelishilgan rasmiy rozilik qog‘ozi.',
        insideContent: '• Mulkdorlarning shaxsiy maʼlumotlari;\n• Kimga qaysi xonalar va necha sotix yer tegishi;\n• Umumiy foydalanishdagi yo‘l va quvurlar chegarasi.',
        whereToGet: 'Notariusda tuziladi (agar o‘zaro nizo bo‘lsa, fuqarolik sudidan olinadi).',
      ),
      RequiredDocument(
        simpleName: 'Amaldagi umumiy kadastr pasporti',
        officialName: 'Asl kadastr yig‘majildi',
        whatIsIt: 'Uyning hozirgacha bo‘lgan yaxlit holatdagi kitobchasi yoki elektron pasporti.',
        insideContent: '• Butun yer uchastkasining umumiy chegaralari va binolar chizmasi.',
        whereToGet: 'Xonadon sohibining qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Kommunal xizmatlarning yangi hisob raqamlarini oldindan talab qilish'],
  ),

  KadastrService(
    id: '8',
    titleSimple: 'Ko‘p kvartirali uy oldidagi yerlarni rasmiylashtirish',
    titleOfficial: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatdan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Dom oldidagi maydon, bolalar maydonchasi yoki yashil hududni begona tadbirkorlar noqonuniy egallab olmasligi uchun dom egalarining umumiy mulki qilib qo‘yish.',
    duration: '10 ish kuni',
    cost: 'Bepul / Minimal davlat boji',
    warningTip: 'Bu yer alohida shaxsga sotilmaydi, faqat butun dom egalariga tegishli umumiy mulk bo‘ladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkdorlar yig‘ilishi bayonnomasi',
        officialName: 'Ko‘p kvartirali uy mulkdorlarining umumiy yig‘ilishi qarori',
        whatIsIt: 'Domda yashovchi aholining kamida 50% dan ortig‘i yerni rasmiylashtirishga ovoz berganligi qog‘ozi.',
        insideContent: '• Dom raqami va manzili;\n• Qatnashgan aholi ro‘yxati va ularning imzolari.',
        whereToGet: 'Boshqaruv servis kompaniyasi (BSHM) yoki mahalla yordamida tuziladi.',
      ),
    ],
    illegalDemands: ['Har bir xonadondan alohida pulli ariza talab qilish'],
  ),

  KadastrService(
    id: '9',
    titleSimple: 'Bino va inshootlar ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Noturar bino, ofis yoki sexni 1 yildan ortiq muddatga ijaraga berganda huquqni rasmiy mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: '1 yildan oshiq muddatli ijaralar kadastrda ro‘yxatdan o‘tmasa, sudda hech qanday kuchga ega bo‘lmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Ijara shartnomasi',
        officialName: 'Notarial yoki ikki tomonlama yozma ijara bitimi',
        whatIsIt: 'Ijara beruvchi va ijarachi o‘rtasidagi rasmiy shartnoma.',
        insideContent: '• Ijara muddati, oylik to‘lov miqdori;\n• Foydalanish maqsadi va tomonlar majburiyatlari.',
        whereToGet: 'Ijara munosabati tuzilganda notariusda yoki soliq tizimi orqali olinadi.',
      ),
    ],
    illegalDemands: ['Binoni qayta texnik inventarizatsiyadan o‘tkazish'],
  ),

  KadastrService(
    id: '10',
    titleSimple: 'Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Yer uchastkasini uzoq muddatli ijaraga olish shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Fermer, dehqon xo‘jaligi yoki bog‘dorchilik uchun ajratilgan yerni o‘z nomingizga rasmiy mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 baravari',
    warningTip: 'Faqat E-auksion yoki E-yer ochiq elektron tanlovida yutib olingan yerlar ro‘yxatga olinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron auksion/tanlov bayonnomasi',
        officialName: 'Yer uchastkasi ijara huquqini sotish bo‘yicha auksion bayonnomasi',
        whatIsIt: 'Davlat ochiq tanlovida siz g‘olib bo‘lganingizni tasdiqlovchi QR-kodli hujjat.',
        insideContent: '• Kontur raqamlari, yer maydoni (gektar), ijara berilgan muddat (masalan, 30 yil).',
        whereToGet: 'E-auksion.uz tizimidagi shaxsiy kabinetdan yuklab olinadi.',
      ),
    ],
    illegalDemands: ['Qishloq xo‘jaligi bo‘limidan qo‘shimcha rozilik xati'],
  ),

  KadastrService(
    id: '11',
    titleSimple: 'Ipoteka va garov huquqini ro‘yxatga olish / yechish',
    titleOfficial: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatga olish',
    category: 'Davlat ro‘yxati',
    purpose: 'Bankdan kredit olayotganda uyni garovga qo‘yish yoki kreditni to‘lab bo‘lgach, uydan taqiqni yechish.',
    duration: '1 ish kuni',
    cost: 'BHMning 50% miqdorida',
    warningTip: 'Kredit to‘liq so‘ndirilgach, bank xodimi tizim orqali taqiqni yechish arizasini darhol yuborishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Ipoteka shartnomasi',
        officialName: 'Notarial tasdiqlangan ipoteka shartnomasi',
        whatIsIt: 'Mulk qaysi bankka, qancha kredit evaziga garovga qo‘yilganini bildiruvchi shartnoma.',
        insideContent: '• Kredit summasi, qaytarish muddati va garovga qo‘yilgan uyning kadastr raqami.',
        whereToGet: 'Bank va notariusdan bir vaqtda beriladi.',
      ),
    ],
    illegalDemands: ['Bank xodimining DXMga shaxsan kelishi'],
  ),

  KadastrService(
    id: '12',
    titleSimple: 'Servitut kelishuvi (Qo‘shni yeridan yo‘l ochish)',
    titleOfficial: 'Servitut huquqini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Uyingizga kirish uchun qo‘shnining hovlisidan o‘tishga yoki suv/gaz quvuri tortishga ruxsatni qonuniylashtirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Servitut qonuniy rasmiylashtirilsa, qo‘shni o‘zgarib ketsa ham sizning o‘tish huquqingiz yo‘qolmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Servitut kelishuvi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan servitut shartnomasi',
        whatIsIt: 'Qo‘shnilar o‘rtasida yerning qaysi metrlaridan o‘tishga kelishilgan shartnoma.',
        insideContent: '• O‘tish yo‘lining eni, uzunligi, koordinatalari va to‘lov shartlari (agar pulli bo‘lsa).',
        whereToGet: 'Notariusda tuziladi yoki fuqarolik sudi qarori orqali belgilanadi.',
      ),
    ],
    illegalDemands: ['Qo‘shnining butun uyini qayta o‘lchash talabi'],
  ),

  KadastrService(
    id: '13',
    titleSimple: 'Ko‘p yillik bog‘ va daraxtzorlarga kadastr olish',
    titleOfficial: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish',
    category: 'Kadastr pasporti',
    purpose: 'Intensiv bog‘lar, mevali daraxtzorlar yoki plantatsiyalarni alohida mulk sifatida kadastrda hisobga olish.',
    duration: '5 ish kuni',
    cost: 'Bog‘ maydoniga qarab',
    warningTip: 'Bog‘ barpo etilgan yerga egalik yoki ijara hujjati bo‘lishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Bog‘ yerining hujjati',
        officialName: 'Yer uchastkasi ijara yoki egalik shartnomasi',
        whatIsIt: 'Bog‘ qaysi yerda joylashganini isbotlovchi davlat ko‘chirmasi.',
        insideContent: '• Maydoni, konturi, daraxt turlari (olma, yong‘oq va h.k.) va ekilgan yili.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Ekologiya inspeksiyasidan qo‘shimcha ruxsatnoma'],
  ),

  KadastrService(
    id: '14',
    titleSimple: 'Tadbirkorlik uchun yerni E-auksion orqali olish',
    titleOfficial: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish',
    category: 'Auksion',
    purpose: 'Bo‘sh turgan davlat yerlarini savdo, xizmat ko‘rsatish yoki sex qurish uchun halol, ochiq auksionda yutib olish.',
    duration: 'Auksion reglamenti bo‘yicha',
    cost: 'Auksionda shakllangan savdo bahosi',
    warningTip: 'Hokimning yer ajratish vakolati yo‘q! Birorta amaldorga "yer olib beraman" degan gapiga ishonib pul bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron raqamli imzo (ERI kalit)',
        officialName: 'ERI sertifikati',
        whatIsIt: 'Savdoda qatnashish va g‘oliblik bayonnomasini imzolash uchun USB-fleshkadagi elektron muhr.',
        insideContent: '• Tashkilot yoki fuqaro nomiga ochilgan raqamli kalit.',
        whereToGet: 'Davlat xizmatlari markazidan 10 daqiqada olinadi.',
      ),
    ],
    illegalDemands: ['Auksiondan keyin hokimiyatdan qo‘shimcha qaror kutish'],
  ),

  KadastrService(
    id: '15',
    titleSimple: 'Qishloq xo‘jaligi yerlarini ijaraga olish tanlovi',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallangan yerlarni elektron ochiq tanlov orqali berish',
    category: 'Yer uchastkasi',
    purpose: 'Ekin ekish, paxta-g‘alla, sabzavotchilik yoki issiqxona uchun yerlarni "E-yer" orqali ijaraga olish.',
    duration: 'Tanlov muddati asosida',
    cost: 'Tanlov shartlariga binoan',
    warningTip: 'G‘olib kompyuter tomonidan avtomatik ballar asosida aniqlanadi, inson omili yo‘q.',
    docs: [
      RequiredDocument(
        simpleName: 'Fermerlik biznes-rejasi',
        officialName: 'Yer uchastkasidan samarali foydalanish taklifi',
        whatIsIt: 'Yerda nima yetishtirmoqchisiz, qancha ish o‘rni yaratasiz, shular ko‘rsatilgan reja.',
        insideContent: '• Ekin turlari, kiritiladigan investitsiya miqdori va ish o‘rinlari soni.',
        whereToGet: 'Ariza beruvchining o‘zi yoki konsalting firmasi tayyorlaydi.',
      ),
    ],
    illegalDemands: ['Qishloq xo‘jaligi bo‘limidan alohida xat'],
  ),

  KadastrService(
    id: '16',
    titleSimple: 'Eski va yangi kadastr raqamlarini solishtirish',
    titleOfficial: 'Ko‘chmas mulkning yangilangan kadastr raqami to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Eski hujjatlaringizda yozilgan eski raqam yangi elektron tizimda qaysi raqamga o‘zgarganini tasdiqlash.',
    duration: 'Avtomatik (1 ish kuni)',
    cost: 'Bepul',
    warningTip: 'Notarius yoki bankda eski pasportingiz tizimda chiqmay qolsa, shu maʼlumotnoma orqali ish bitadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Eski kadastr daftarchasi',
        officialName: 'Eski namunadagi texnik pasport',
        whatIsIt: 'Ilgari berilgan ko‘k yoki qizil muhrli qog‘oz daftarcha.',
        insideContent: '• Eski kadastr kodi va uy manzili.',
        whereToGet: 'Uy arxiv hujjatlari orasida saqlangan bo‘ladi.',
      ),
    ],
    illegalDemands: ['Kadastr xodimini chaqirib pul to‘lash'],
  ),

  KadastrService(
    id: '17',
    titleSimple: 'Uyga rasmiy ko‘cha nomi va manzil berish',
    titleOfficial: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish',
    category: 'Davlat ro‘yxati',
    purpose: 'Yangi qurilgan uyga tuman hokimiyati tomonidan rasmiy ko‘cha nomi va uy raqami (masalan: Mustaqillik ko‘chasi, 25-uy) berilishi.',
    duration: '3 ish kuni',
    cost: 'Bepul',
    warningTip: 'Ko‘cha nomi o‘zgarganda kadastr hujjatlarini shoshilib yangilash shart emas, baza buni o‘zi taniydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Mulk kadastr yig‘majildi',
        whatIsIt: 'Uyning joylashgan koordinatalarini ko‘rsatuvchi hujjat.',
        insideContent: '• Obyektning amaldagi xaritasi va geografik o‘rni.',
        whereToGet: 'Mulkdorning qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Mahalladan ko‘cha nomi haqida spravka keltirish'],
  ),

  KadastrService(
    id: '18',
    titleSimple: 'Uy buzilishga (Snos) tushgan-tushmaganligini aniqlash',
    titleOfficial: 'Ko‘chmas mulkning bosh rejaga asosan buzilishga tushganligi haqida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Shahar bosh rejasiga ko‘ra, ushbu uy o‘rnida kelajakda yo‘l, ko‘prik yoki yangi binolar qurilishi rejalashtirilganini tekshirish.',
    duration: '3 ish kuni',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Uy sotib olayotganda albatta bu maʼlumotnomani oling! Snosga tushgan uylarga notarius cheklov qo‘yishi mumkin.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Obyekt kadastr raqami',
        whatIsIt: 'Tekshirilayotgan xonadonning raqami.',
        insideContent: '• Aniq joylashuv koordinatasi.',
        whereToGet: 'Kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['Arxitektura bo‘limiga shaxsan borib yozma ruxsat olish'],
  ),

  KadastrService(
    id: '19',
    titleSimple: 'Mulk buzilganda kadastr hisobidan chiqarish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini ro‘yxatdan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Eski uy buzilib o‘rniga yangi qurilayotganda yoki yong‘in tufayli yo‘q bo‘lganda, eski uyni bazadan o‘chirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Agar buzilgan uyni bazadan chiqarmasangiz, yo‘q uy uchun sizga har yili soliq hisoblanaveradi.',
    docs: [
      RequiredDocument(
        simpleName: 'Buzilganlik dalolatnomasi',
        officialName: 'Bino mavjud emasligi to‘g‘risidagi komissiya dalolatnomasi',
        whatIsIt: 'Bino joyida haqiqatda yo‘qligini tasdiqlovchi qog‘oz.',
        insideContent: '• Mahalla faollari va kadastr xodimi tomonidan tuzilgan foto-dalolatnoma.',
        whereToGet: 'Tuman kadastr bo‘limi va mahalladan tuziladi.',
      ),
    ],
    illegalDemands: ['Eski orderlarni arxivdan qayta talab qilish'],
  ),

  KadastrService(
    id: '20',
    titleSimple: 'Topografik va geodezik xaritalar olish',
    titleOfficial: 'Davlat kartografiya-geodeziya fondidan maʼlumotlar taqdim etish',
    category: 'Geodeziya',
    purpose: 'Katta inshootlar, korxonalar yoki yo‘l qurilish loyihalari uchun aniq geodezik balandliklar va xaritalarni olish.',
    duration: '5 ish kuni',
    cost: 'Xarita hajmiga qarab shartnoma asosida',
    warningTip: 'Qurilishdan oldin aniq geodezik maʼlumot olinsa, yer osti quvurlariga shikast yetmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Loyiha texnik topshirig‘i',
        officialName: 'Tashkilot buyurtmasi va loyihalash ruxsatnomasi',
        whatIsIt: 'Qaysi hududning xaritasi nima sababdan kerakligini tasdiqlovchi rasmiy so‘rov.',
        insideContent: '• Koordinata chegaralari va masshtab (1:500, 1:2000).',
        whereToGet: 'Loyiha tashkiloti tomonidan taqdim etiladi.',
      ),
    ],
    illegalDemands: ['Litsenziyasiz shaxslar xizmatidan foydalanishga majburlash'],
  ),

  KadastrService(
    id: '21',
    titleSimple: 'Bino ostidagi yerni xususiylashtirish (Sotib olish)',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish',
    category: 'Xususiylashtirish',
    purpose: 'O‘zingizga qarashli xususiy bino, do‘kon yoki uyingiz turgan davlat yerini bir umrlik shaxsiy xususiy mulk qilib sotib olish.',
    duration: '10 ish kuni',
    cost: 'Yer solig‘ining karrali stavkasida',
    warningTip: 'Xususiylashtirilgan yer — daxlsiz mulk. Uni hech kim hech qachon "davlat ehtiyoji" deb arzimagan pulga tortib ololmaydi!',
    docs: [
      RequiredDocument(
        simpleName: 'Binoga bo‘lgan mulkchilik ko‘chirmasi',
        officialName: 'Bino kadastr pasporti va ro‘yxatdan o‘tganlik hujjati',
        whatIsIt: 'Yer ustidagi bino sizning xususiy mulkingiz ekanini tasdiqlovchi hujjat.',
        insideContent: '• Bino maydoni, kadastr raqami va foydalanish maqsadi.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Hokimiyatning alohida yozma ruxsati'],
  ),

  KadastrService(
    id: '22',
    titleSimple: 'Hujjatsiz uylarni qonuniylashtirish (Amnistiya)',
    titleOfficial: 'O‘zboshimchalik bilan egallangan yer va ularda qurilgan binolarga huquqlarni eʼtirof etish',
    category: 'Qonuniylashtirish',
    purpose: 'Ko‘p yillardan beri yashab kelayotgan, lekin hech qanday hujjati bo‘lmagan xonadonlarga amaldagi qonun bo‘yicha qonuniy kadastr berish.',
    duration: 'Reja-grafik asosida (xatlov davomida)',
    cost: 'Bir martalik qonuniy to‘lov asosida',
    warningTip: 'DIQQAT: Hech kimga "men uyingizni tezlashtirib kadastr qilib beraman" degan firibgarlarga pul bermang! Hududlar bosqichma-bosqich, dron orqali va mahallama-mahalla qonuniy xatlovdan o‘tkaziladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uzoq yillik to‘lovlar va dalillar',
        officialName: 'Yer/mulk solig‘i to‘langanlik cheklari, elektr, gaz to‘lov daftarlari',
        whatIsIt: 'Siz ushbu uyni kecha yoki bugun emas, ko‘p yillardan buyon egallab, unda yashab kelayotganingizni tasdiqlovchi barcha cheklar.',
        insideContent: '• To‘lov qilingan sana (kamida bir necha yil oldingi);\n• To‘lovchi ism-familiyasi va manzil.',
        whereToGet: 'Shaxsiy arxiv daftarlari, bank cheklari yoki Payme/Click arxivlaridan.',
      ),
    ],
    illegalDemands: ['Vositachilik haqlari', 'Norasmiy pul yig‘ishlar'],
  ),
];

// ---------------- ALOHIDA: "HUJJATLAR QOMUSI" (LUG‘AT) MAʼLUMOTLARI ----------------
class DocVocabulary {
  final String term;
  final String simpleExplanation;
  final String whatIsInside;
  final String whereToFind;

  DocVocabulary({
    required this.term,
    required this.simpleExplanation,
    required this.whatIsInside,
    required this.whereToFind,
  });
}

final List<DocVocabulary> docVocabularies = [
  DocVocabulary(
    term: 'Hokim Qarori (Qaror nima?)',
    simpleExplanation: 'Tuman yoki shahar hokimi tomonidan maʼlum bir fuqaro yoki korxonaga yer ajratish, uy qurishga ruxsat berish haqida chiqarilgan rasmiy buyruq qog‘ozi. (Hozirda yangi yer ajratish vakolati bekor bo‘lgan, faqat eski qarorlar kuchga ega).',
    whatIsInside: '• Qaror qabul qilingan sana va tuman hokimining imzosi hamda dumaloq muhri;\n• Kimga, qancha yer va qanday maqsadda (turar joy yoki tadbirkorlik uchun) berilgani;\n• Yerning aniq joylashuvi va kontur raqami.',
    whereToFind: 'Agar qo‘lingizdagi asl nusxa yo‘qolgan bo‘lsa, tegishli tuman hokimligining devonxonasidan yoki viloyat davlat arxividan tasdiqlangan nusxasi olinadi.',
  ),
  DocVocabulary(
    term: 'Oldi-sotdi shartnomasi nima?',
    simpleExplanation: 'Siz uyni birovdan pul to‘lab sotib olganingizda, notarius ishtirokida imzolanadigan eng asosiy gerbli qog‘oz.',
    whatIsInside: '• Sotuvchi va xaridorning to‘liq pasport maʼlumotlari;\n• Mulkning aniq manzili va sotilgan umumiy narxi;\n• Notariusning gerbli muhri, maxsus qatʼiy seriya raqami va reyestr yozuvi.',
    whereToFind: 'Shartnoma tuzilgan xususiy yoki davlat notarial idorasidan (dublikat sifatida olinishi mumkin).',
  ),
  DocVocabulary(
    term: 'Mulk huquqi ko‘chirmasi (Vipiska) nima?',
    simpleExplanation: 'Ilgari berilgan qog‘oz guvohnomalar o‘rniga hozir beriladigan yagona elektron QR-kodli hujjat. Bu hujjat hozirgi daqiqada uy kimga tegishli ekanini isbotlaydi.',
    whatIsInside: '• Ko‘chmas mulkning unikal kadastr raqami;\n• Hozirgi qonuniy egasining F.I.Sh;\n• Mulkning toifasi, maydoni va haqiqiy ekanini tasdiqlovchi maxsus QR-kod.',
    whereToFind: 'my.gov.uz portali orqali 1 daqiqada yuklab olinadi yoki Davlat xizmatlari markazidan olinadi.',
  ),
  DocVocabulary(
    term: 'Meros guvohnomasi nima?',
    simpleExplanation: 'Uy egasi vafot etganidan so‘ng, uning uyi farzandlariga yoki qonuniy merosxo‘rlariga qolganini tasdiqlovchi rasmiy notarial hujjat.',
    whatIsInside: '• Meros qoldiruvchining o‘lim haqidagi guvohnomasi rekvizitlari;\n• Merosxo‘rlarning qarindoshlik darajasi va ularga tekkan mulk ulushi (masalan, 1/2 qismi).',
    whereToFind: 'Meros ishi ochilgan davlat notarial idorasidan olinadi.',
  ),
  DocVocabulary(
    term: 'Kadastr pasporti nima?',
    simpleExplanation: 'Uyingizning "texnik pasporti". Unda uyingiz necha xonadan iboratligi, devorlari qanday g‘ishtdan qurilgani, hovlingiz necha sotix ekani va xaritasi chizilgan bo‘ladi.',
    whatIsInside: '• Uyning umumiy va yashash maydoni chizmasi;\n• Kommunikatsiya tarmoqlari (suv, gaz, elektr) borligi;\n• Bino qurilgan yil va texnik ko‘rsatkichlar.',
    whereToFind: 'Kadastr filiali mutaxassislari tomonidan o‘lchab tuziladi va elektron formatda taqdim etiladi.',
  ),
];

// ---------------- BOSH SAHIFA ----------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Barchasi';
  String _searchQuery = '';

  final List<String> _categories = [
    'Barchasi',
    'Kadastr pasporti',
    'Davlat ro‘yxati',
    'Maʼlumotnoma',
    'Yer uchastkasi',
    'Auksion',
    'Xususiylashtirish',
    'Qonuniylashtirish',
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = kadastrServices.where((s) {
      final matchesCategory = _selectedCategory == 'Barchasi' || s.category == _selectedCategory;
      final matchesSearch = s.titleSimple.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          s.titleOfficial.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Oson Kadastr', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.white),
            tooltip: 'Hujjatlar nima? (Xalq tili qomusi)',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VocabularyScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'Muallif bilan aloqa',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0D47A1)),
              accountName: Text('Oson Kadastr', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              accountEmail: Text('Xalqchil huquqiy yo‘riqnoma'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.home_work, color: Color(0xFF0D47A1), size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list_alt, color: Color(0xFF0D47A1)),
              title: const Text('22 ta barcha davlat xizmati'),
              subtitle: const Text('To‘liq rasmiy ro‘yxat'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.indigo),
              title: const Text('Hujjatlar nima? (Qomus)'),
              subtitle: const Text('Qaror, shartnoma, ko‘chirma tushunchasi'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const VocabularyScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.green),
              title: const Text('Kadastr agentligi Call-markazi'),
              subtitle: const Text('Ishonch telefoni: 1097'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Kadastr agentligi ishonch telefoni: 1097')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.orange),
              title: const Text('Dastur yaratuvchisi'),
              subtitle: const Text('Muxriddin Elbegiyev (+998 33 911 22 22)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Xizmat yoki hujjat nomini qidiring...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0D47A1)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF81C784)),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield, color: Color(0xFF2E7D32), size: 26),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Har bir talab qilinadigan hujjat ustiga bosing — ichida nimalar yozilgan bo‘lishi shartligi sodda tilda chiqadi!',
                    style: TextStyle(color: Color(0xFF1B5E20), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    label: Text(cat, style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black87)),
                    selected: isSelected,
                    selectedColor: const Color(0xFF0D47A1),
                    onSelected: (val) => setState(() => _selectedCategory = cat),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final item = filtered[i];
                return Card(
                  elevation: 1.5,
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFE3F2FD),
                      child: Text(item.id, style: const TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
                    ),
                    title: Text(item.titleSimple, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 2),
                        Text(item.titleOfficial, style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(4)),
                              child: Text(item.category, style: const TextStyle(fontSize: 10, color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text('Muddati: ${item.duration}', overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: Colors.blueGrey)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailScreen(service: item)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- ALOHIDA HUJJATLAR LUG‘ATI (QOMUS) EKRANI ----------------
class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Hujjatlar nima? (Sodda qomus)', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: docVocabularies.length,
        itemBuilder: (context, i) {
          final item = docVocabularies[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              initiallyExpanded: i == 0,
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE3F2FD),
                child: Icon(Icons.description, color: Color(0xFF0D47A1)),
              ),
              title: Text(item.term, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: const Text('Batafsil tushuntirishni ochish', style: TextStyle(fontSize: 11, color: Colors.grey)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      const Text('Oddiy xalq tilida tushuntirish:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      const SizedBox(height: 4),
                      Text(item.simpleExplanation, style: const TextStyle(fontSize: 13, height: 1.3)),
                      const SizedBox(height: 10),
                      const Text('Bu hujjatning ichida nimalar yozilgan bo‘lishi shart?', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
                      const SizedBox(height: 4),
                      Text(item.whatIsInside, style: const TextStyle(fontSize: 12, height: 1.3, color: Colors.black87)),
                      const SizedBox(height: 10),
                      const Text('Agar yo‘qolgan bo‘lsa qayerdan topiladi?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                      const SizedBox(height: 4),
                      Text(item.whereToFind, style: const TextStyle(fontSize: 12, height: 1.3)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// ---------------- TAFSILOTLAR EKRANI ----------------
class DetailScreen extends StatelessWidget {
  final KadastrService service;
  const DetailScreen({super.key, required this.service});

  void _showDocumentDetail(BuildContext context, RequiredDocument doc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFE8F5E9),
                    child: Icon(Icons.find_in_page, color: Colors.green),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      doc.simpleName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                ],
              ),
              const Divider(height: 24),
              const Text('Rasmiy davlat tilidagi nomi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
              Text(doc.officialName, style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic)),
              const SizedBox(height: 14),
              const Text('Bu qanday hujjat? (Oddiy tilda):', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
              const SizedBox(height: 4),
              Text(doc.whatIsIt, style: const TextStyle(fontSize: 13, height: 1.35)),
              const SizedBox(height: 14),
              const Text('Hujjat ichida nimalar yozilgan bo‘lishi shart?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(8)),
                child: Text(doc.insideContent, style: const TextStyle(fontSize: 12, height: 1.35)),
              ),
              const SizedBox(height: 14),
              const Text('Qayerdan olasiz yoki yo‘qolgan bo‘lsa nima qilasiz?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 4),
              Text(doc.whereToGet, style: const TextStyle(fontSize: 13, height: 1.3)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), foregroundColor: Colors.white),
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Tushundim'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(service.titleSimple, style: const TextStyle(color: Colors.white, fontSize: 15)),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.white,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('Hujjatlarim yetarlimi? Tekshirish', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CheckScreen(service: service)),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bu xizmat nima uchun kerak?', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
                const SizedBox(height: 6),
                Text(service.purpose, style: const TextStyle(height: 1.3)),
                const Divider(height: 20),
                Text('Bitish muddati: ${service.duration}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('To‘lov: ${service.cost}', style: const TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orange.shade300),
            ),
            child: Text(service.warningTip, style: const TextStyle(color: Color(0xFFBF360C), fontWeight: FontWeight.bold, fontSize: 13)),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Talab qilinadigan hujjatlar:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Text('(Bosing va o‘qing)', style: TextStyle(fontSize: 11, color: Colors.blue.shade800, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          ...service.docs.map((d) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => _showDocumentDetail(context, d),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFE3F2FD),
                      child: Icon(Icons.info, color: Color(0xFF0D47A1), size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.simpleName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0D47A1))),
                          const SizedBox(height: 2),
                          Text('Qayerdan olinadi: ${d.whereToGet}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.touch_app, size: 18, color: Colors.blueGrey),
                  ],
                ),
              ),
            ),
          )),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bularni talab qilishga HAQLARI YO‘Q:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                const SizedBox(height: 6),
                ...service.illegalDemands.map((il) => Text('• $il', style: const TextStyle(color: Color(0xFFB71C1C)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- CHECKLIST EKRANI ----------------
class CheckScreen extends StatefulWidget {
  final KadastrService service;
  const CheckScreen({super.key, required this.service});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  late Map<int, bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = {for (int i = 0; i < widget.service.docs.length; i++) i: false};
  }

  @override
  Widget build(BuildContext context) {
    int total = widget.service.docs.length;
    int count = _checked.values.where((v) => v).length;
    bool isComplete = total == count;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Hujjatlarim yetarlimi?', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Qo‘lingizda bor hujjatlarni belgilang:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...List.generate(widget.service.docs.length, (i) {
            final doc = widget.service.docs[i];
            final val = _checked[i] ?? false;
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: CheckboxListTile(
                value: val,
                title: Text(doc.simpleName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Qayerdan: ${doc.whereToGet}'),
                onChanged: (newVal) => setState(() => _checked[i] = newVal ?? false),
              ),
            );
          }),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isComplete ? const Color(0xFFE8F5E9) : const Color(0xFFFFFDE7),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isComplete ? Colors.green : Colors.amber.shade700),
            ),
            child: Column(
              children: [
                Icon(isComplete ? Icons.check_circle : Icons.info, color: isComplete ? Colors.green : Colors.amber.shade900, size: 36),
                const SizedBox(height: 8),
                Text(
                  isComplete ? 'Hujjatlaringiz to‘liq!' : 'Hujjatlar to‘liq emas ($count / $total)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isComplete ? Colors.green.shade900 : Colors.amber.shade900),
                ),
                const SizedBox(height: 6),
                Text(
                  isComplete
                      ? 'Endi bemalol Davlat xizmatlari markaziga borishingiz yoki my.gov.uz orqali ariza yuborishingiz mumkin. Hech kim sizdan ortiqcha qog‘oz talab qila olmaydi.'
                      : 'Belgilanmagan hujjatlarni yuqorida ko‘rsatilgan joydan olib, keyin murojaat qiling.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ---------------- DASTUR YARATUVCHISI VA ALOQA EKRANI ----------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Dastur yaratuvchisi va Aloqa', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFF0D47A1),
                    child: Icon(Icons.person, size: 44, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Muxriddin Elbegiyev',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Dastur yaratuvchisi va loyiha muallifi',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  Divider(height: 28),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFE8F5E9),
                      child: Icon(Icons.phone, color: Colors.green),
                    ),
                    title: Text('Telefon raqam', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: Text(
                      '+998 33 911 22 22',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFE1F5FE),
                      child: Icon(Icons.send, color: Colors.lightBlue),
                    ),
                    title: Text('Telegram aloqa', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: Text(
                      '+998 33 911 22 22',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            elevation: 1.5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE8F5E9),
                child: Icon(Icons.support_agent, color: Colors.green),
              ),
              title: Text('Kadastr agentligi Call-markazi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text('Rasmiy ishonch telefoni: 1097\n(Davlat xizmatlari yuzasidan rasmiy murojaatlar uchun)'),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            elevation: 1.5,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flag_outlined, color: Color(0xFF0D47A1)),
                      SizedBox(width: 8),
                      Text('Loyihaning maqsadi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ushbu mobil ilova O‘zbekiston Respublikasi fuqarolarining kadastr sohasidagi barcha 22 ta davlat xizmati bo‘yicha huquqiy savodxonligini oshirish, korrupsiya va ortiqcha byurokratiyaga chek qo‘yish hamda har bir murojaatni qonuniy, ortiqcha xarajatsiz hal qilishlariga yordam berish maqsadida yaratilgan.',
                    style: TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
