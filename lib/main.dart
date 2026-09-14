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

// ---------------- MODEL ----------------
class RequiredDocument {
  final String simpleName;
  final String officialName;
  final String whereToGet;
  final String explanation;

  RequiredDocument({
    required this.simpleName,
    required this.officialName,
    required this.whereToGet,
    required this.explanation,
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

// ---------------- JAMI 22 TA RASMIY KADASTR DAVLAT XIZMATLARI ----------------
final List<KadastrService> kadastrServices = [
  // 1
  KadastrService(
    id: '1',
    titleSimple: 'Turar joyga kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (turar joy) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Kvartira yoki yakka tartibdagi hovli uyning texnik parametrlarini o‘lchab, elektron kadastr pasportini berish.',
    duration: 'Kvartira: 5 ish kuni; Hovli uy: 8 ish kuni',
    cost: 'Maydoniga qarab (invoys/SMS orqali to‘lanadi)',
    warningTip: 'Uyingizda o‘zboshimchalik bilan noqonuniy qo‘shimcha qurilma qilinmagan bo‘lishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulk huquqini tasdiqlovchi hujjat',
        officialName: 'Huquq belgilovchi hujjat',
        whereToGet: 'Notarius, tuman hokimligi yoki davlat arxividan',
        explanation: 'Shartnoma, meros hujjati, order yoki tuman hokimi qarori.',
      ),
      RequiredDocument(
        simpleName: 'Pasport yoki ID karta',
        officialName: 'Shaxsni tasdiqlovchi hujjat (JShSHIR)',
        whereToGet: 'Yoningizda bo‘lishi kifoya',
        explanation: 'JShSHIR orqali ariza kiritiladi.',
      ),
    ],
    illegalDemands: ['Mahalladan maʼlumotnoma', 'Qo‘shnilar tilxati', 'Kommunal to‘lovlar cheki'],
  ),

  // 2
  KadastrService(
    id: '2',
    titleSimple: 'Noturar obyektlarga kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Do‘kon, ofis, ombor, sex yoki korxona binolariga elektron kadastr pasportini rasmiylashtirish.',
    duration: 'Maydoni 100 kv.mgacha — 5 ish kuni; 1000 kv.mgacha — 7 ish kuni; 50 000 kv.mgacha — 20 ish kuni',
    cost: 'Tegishli tarif stavkalari asosida',
    warningTip: 'Faqat SMS orqali kelgan davlat invoysiga to‘lov qiling.',
    docs: [
      RequiredDocument(
        simpleName: 'Noturar mulkka egalik hujjati',
        officialName: 'Oldi-sotdi shartnomasi / Hokim qarori / Auksion bayonnomasi',
        whereToGet: 'Notarius, E-auksion yoki arxivdan',
        explanation: 'Binoga qonuniy egalikni tasdiqlovchi hujjat.',
      ),
      RequiredDocument(
        simpleName: 'Qurilish loyiha-smeta hujjatlari',
        officialName: 'Qurilish ruxsatnomasi va loyiha',
        whereToGet: 'Qurilish bo‘limidan',
        explanation: 'Yangi qurilgan bo‘lsa, foydalanishga qabul qilish dalolatnomasi.',
      ),
    ],
    illegalDemands: ['Soliqdan qarz yo‘qligi maʼlumotnomasi', 'Qo‘shimcha ekspertiza xulosalari'],
  ),

  // 3
  KadastrService(
    id: '3',
    titleSimple: 'Ko‘chmas mulk huquqini davlat ro‘yxatidan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Ko‘chmas mulkning yangi egasini Yagona davlat reyestriga kiritish va ko‘chirma berish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'Notariusdan chiqqach 1 oy ichida ro‘yxatdan o‘tkazilmasa, maʼmuriy jarima qo‘llanishi mumkin.',
    docs: [
      RequiredDocument(
        simpleName: 'Notarial shartnoma yoki sud hujjati',
        officialName: 'Huquqni vujudga keltiruvchi hujjat',
        whereToGet: 'Notarius yoki suddan',
        explanation: 'Notarial tasdiqlangan bitim yoki sud qarori.',
      ),
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Elektron kadastr yig‘majildi',
        whereToGet: 'Kadastr bazasidan',
        explanation: 'Obyektning raqamli pasporti.',
      ),
    ],
    illegalDemands: ['Notarius tasdiqlagan qog‘ozni qayta muhrlatish', 'Arxivdan yangi tasdiqnoma'],
  ),

  // 4
  KadastrService(
    id: '4',
    titleSimple: 'Davlat kadastr reyestridan ko‘chirma olish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish',
    category: 'Maʼlumotnoma',
    purpose: 'Mulkning haqiqiy egasi, uning chegaralari va holati bo‘yicha QR-kodli rasmiy tasdiqnoma olish.',
    duration: '1 ish kuni (ko‘p hollarda bir necha daqiqada)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Qog‘oz ko‘chirma va elektron QR-kodli ko‘chirma bir xil yuridik kuchga ega.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Obyekt kadastr raqami',
        whereToGet: 'Kadastr pasportidan',
        explanation: 'Mulkning unikal raqami.',
      ),
    ],
    illegalDemands: ['Kadastr xodimining joyiga chiqishi talabi'],
  ),

  // 5
  KadastrService(
    id: '5',
    titleSimple: 'Nomida shaxsiy turar joy bor/yo‘qligi haqida maʼlumotnoma',
    titleOfficial: 'Fuqaroning nomida shaxsiy turar joy mavjud yoki mavjud emasligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Subsidiya, imtiyozli ipoteka yoki uy navbatiga turishda nomingizda uy yo‘qligini tasdiqlash.',
    duration: 'Avtomatik (1 kun ichida)',
    cost: 'BHMning 0.05 baravari (my.gov.uz orqali)',
    warningTip: 'Respublika bo‘yicha barcha hududiy bazalar avtomatik tekshiriladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Pasport / ID-karta',
        officialName: 'Ariza beruvchining JShSHIR raqami',
        whereToGet: 'Shaxsingizni tasdiqlovchi hujjat',
        explanation: '14 xonali unikal raqamingiz.',
      ),
    ],
    illegalDemands: ['Mahalladan uy-joyi yo‘qligi haqida spravka so‘rash'],
  ),

  // 6
  KadastrService(
    id: '6',
    titleSimple: 'Ko‘chmas mulk bo‘yicha taqiq (Zapret) bor-yo‘qligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar mavjudligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Mulkka sud, MIB, bank yoki notarius taqiq qo‘ygan-qo‘ymaganini oldindan bilish.',
    duration: 'Real vaqtda (avtomatik)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Taqiqi bor uyni notarius rasmiylashtira olmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uyning kadastr raqami',
        officialName: 'Obyekt kadastr raqami',
        whereToGet: 'Kadastr pasportidan',
        explanation: 'Ko‘chmas mulk raqami.',
      ),
    ],
    illegalDemands: ['MIB idorasiga borib xatlov yo‘qligiga muhr bosdirish'],
  ),

  // 7
  KadastrService(
    id: '7',
    titleSimple: 'Ko‘chmas mulkni bo‘lish va yangi chegaralarini belgilash',
    titleOfficial: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati',
    category: 'Chegaralar',
    purpose: 'Bitta umumiy hovli yoki yer maydonini alohida mustaqil obyektlarga ajratish.',
    duration: '10 dan 15 ish kunigacha',
    cost: 'Belgilangan davlat boji asosida',
    warningTip: 'Bo‘linayotgan har bir yangi mulk alohida kirish yo‘liga va minimal maydon talabiga ega bo‘lishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Taqsimot hujjati',
        officialName: 'Notarial bo‘lish bitimi yoki sud qarori',
        whereToGet: 'Notarius yoki suddan',
        explanation: 'Mulk qanday bo‘linishini belgilovchi hujjat.',
      ),
      RequiredDocument(
        simpleName: 'Eski umumiy kadastr',
        officialName: 'Asl kadastr yig‘majildi',
        whereToGet: 'Uy egasidan',
        explanation: 'Avvalgi yaxlit holatdagi hujjat.',
      ),
    ],
    illegalDemands: ['Qo‘shnilardan yangi kadastrga rozilik xati talab qilish'],
  ),

  // 8
  KadastrService(
    id: '8',
    titleSimple: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatga olish',
    titleOfficial: 'Ko‘p kvartirali uyga tutash yer uchastkasiga bo‘lgan huquqlarni mulkdorlar nomiga ro‘yxatdan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Dom oldidagi hududni domdagi xonadon egalarining umumiy ulushli mulki sifatida rasmiylashtirish.',
    duration: '10 ish kuni',
    cost: 'Bepul / Minimal stavka',
    warningTip: 'Tutash yer noqonuniy qurilishlardan himoyalangan umumiy foydalanishdagi yer hisoblanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uy mulkdorlari yig‘ilishi bayonnomasi',
        officialName: 'Mulkdorlar umumiy yig‘ilishi qarori',
        whereToGet: 'Boshqaruvchi kompaniya yoki BSHMdan',
        explanation: 'Aholining ko‘pchilik ovozi bilan qabul qilingan qaror.',
      ),
    ],
    illegalDemands: ['Har bir fuqarodan alohida ariza talab qilish'],
  ),

  // 9
  KadastrService(
    id: '9',
    titleSimple: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    titleOfficial: 'Bino va inshootlar ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: '1 yildan ortiq muddatga tuzilgan binolar ijarasini kadastr reyestrida rasmiylashtirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: '1 yildan ortiq muddatli binolar ijarasi davlat ro‘yxatidan o‘tkazilmasa haqiqiy sanalmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Ijara shartnomasi',
        officialName: 'Notarial yoki ikki tomonlama ijara bitimi',
        whereToGet: 'Ijara beruvchi va oluvchi o‘rtasida',
        explanation: 'Shartnomaning asl nusxasi.',
      ),
    ],
    illegalDemands: ['Ijara obyektini qayta o‘lchashni majburlash'],
  ),

  // 10
  KadastrService(
    id: '10',
    titleSimple: 'Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Qishloq xo‘jaligi yoki boshqa yerlar ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Fermer, dehqon yoki tadbirkorlik yer uchastkalari ijarasini reyestrga kiritish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 baravari',
    warningTip: 'Fermer yerlari elektron ochiq tanlov (E-auksion/E-yer) natijasiga ko‘ra ro‘yxatdan o‘tkaziladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron tanlov bayonnomasi yoki ijara shartnomasi',
        officialName: 'Yer ijara shartnomasi',
        whereToGet: 'Elektron tanlov portali / Hokimlik',
        explanation: 'Yer ajratilganini tasdiqlovchi rasmiy hujjat.',
      ),
    ],
    illegalDemands: ['Qishloq xo‘jaligi bo‘limidan qo‘shimcha rozilik xati'],
  ),

  // 11
  KadastrService(
    id: '11',
    titleSimple: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatga olish',
    titleOfficial: 'Ko‘chmas mulk ipotekasi va garov shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Bankdan kredit olishda uyni garovga qo‘yish holatini reyestrda qayd etish.',
    duration: '1 ish kuni',
    cost: 'BHMning 50% miqdorida',
    warningTip: 'Kredit yopilgach, bank tomonidan darhol taqiqni yechish arizasi berilishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Ipoteka (garov) shartnomasi',
        officialName: 'Notarial tasdiqlangan ipoteka shartnomasi',
        whereToGet: 'Bank va notariusdan',
        explanation: 'Mulk kafolat sifatida olingani haqidagi rasmiy bitim.',
      ),
    ],
    illegalDemands: ['Bank xodimining DXMga shaxsan kelishi'],
  ),

  // 12
  KadastrService(
    id: '12',
    titleSimple: 'Yer uchastkasiga nisbatan servisut kelishuvini ro‘yxatdan o‘tkazish',
    titleOfficial: 'O‘zganing yer uchastkasidan cheklangan tarzda foydalanish huquqi (servitut)ni ro‘yxatdan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Qo‘shnining yeridan o‘tish yo‘li, ariq, quvur yoki sim tortish huquqini rasman qonuniylashtirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Servitut kelishuvi yer egasi o‘zgarganda ham o‘z kuchini saqlab qoladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Servitut kelishuvi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan servitut bitimi',
        whereToGet: 'Notarius yoki suddan',
        explanation: 'Yerning qaysi qismidan foydalanishga ruxsat berilgani chizmasi bilan.',
      ),
    ],
    illegalDemands: ['Qo‘shni yer uchastkasini to‘liq qayta xatlovdan o‘tkazish'],
  ),

  // 13
  KadastrService(
    id: '13',
    titleSimple: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini rasmiylashtirish',
    titleOfficial: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish va huquqni ro‘yxatdan o‘tkazish',
    category: 'Kadastr pasporti',
    purpose: 'Bog‘lar, plantatsiyalar va ko‘p yillik daraxtzorlarni ko‘chmas mulk sifatida hisobga olish.',
    duration: '5 ish kunigacha',
    cost: 'Daraxtzor maydoni bo‘yicha',
    warningTip: 'Daraxtlar joylashgan yerga bo‘lgan huquq mavjud bo‘lishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Bog‘ yaratilgan yer hujjati',
        officialName: 'Yer ijara yoki egalik hujjati',
        whereToGet: 'Kadastr reyestridan',
        explanation: 'Daraxt ekilgan yer uchastkasi hujjati.',
      ),
    ],
    illegalDemands: ['Ekologiya idorasidan qo‘shimcha sertifikat'],
  ),

  // 14
  KadastrService(
    id: '14',
    titleSimple: 'Tadbirkorlik uchun yerlarni E-auksion orqali xarid qilish',
    titleOfficial: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish',
    category: 'Auksion',
    purpose: 'Bo‘sh yer uchastkalarini mulk yoki ijara huquqi bilan ochiq tanlovda yutib olish.',
    duration: 'Auksion reglamenti asosida',
    cost: 'Auksionda shakllangan savdo bahosi',
    warningTip: 'Hokimlarning yer ajratish vakolati mutlaqo bekor qilingan, yer faqat E-auksion orqali olinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron raqamli imzo (ERI)',
        officialName: 'ERI kaliti',
        whereToGet: 'E-imzo tizimidan',
        explanation: 'Auksionda ishtirok etish va shartnomani tasdiqlash uchun.',
      ),
    ],
    illegalDemands: ['Auksiondan keyin hokimiyatdan qo‘shimcha farmoyish olish'],
  ),

  // 15
  KadastrService(
    id: '15',
    titleSimple: 'Qishloq xo‘jaligi yerlarini ijaraga olish ochiq tanlovi',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallangan yer uchastkalarini elektron tanlov orqali berish',
    category: 'Yer uchastkasi',
    purpose: 'Fermer va dehqon xo‘jaliklari uchun yerlarni "E-yer" portali orqali shaffof tanlovda olish.',
    duration: 'Tanlov muddatiga asosan',
    cost: 'Tanlov qoidalariga ko‘ra',
    warningTip: 'Tanlov natijalari to‘liq avtomatlashgan reyting tizimi orqali belgilanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Biznes-reja va ERI',
        officialName: 'Fermer xo‘jaligi rivojlantirish dasturi',
        whereToGet: 'Ariza beruvchining o‘zi tayyorlaydi',
        explanation: 'Ekin turlari va investitsiya hajmi ko‘rsatiladi.',
      ),
    ],
    illegalDemands: ['Tuman qishloq xo‘jaligi bo‘limidan alohida xat'],
  ),

  // 16
  KadastrService(
    id: '16',
    titleSimple: 'Eski va yangi kadastr raqamlarini muvofiqlashtirish',
    titleOfficial: 'Ko‘chmas mulk obyektining yangilangan kadastr raqami to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Hududiy o‘zgarish yoki raqamlashtirish sababli o‘zgargan yangi kadastr raqamini rasman tasdiqlash.',
    duration: 'Avtomatik (1 ish kuni)',
    cost: 'Bepul',
    warningTip: 'Eski hujjatlar bilan bank yoki notariusga borilganda yangi raqamni tasdiqlash uchun kerak.',
    docs: [
      RequiredDocument(
        simpleName: 'Eski kadastr raqami yoki manzili',
        officialName: 'Obyekt manzili / eski raqam',
        whereToGet: 'Eski kadastr daftarchasidan',
        explanation: 'Obyektning avvalgi rekvizitlari.',
      ),
    ],
    illegalDemands: ['Kadastr xodimini uyga chaqirib pul to‘lash'],
  ),

  // 17
  KadastrService(
    id: '17',
    titleSimple: 'Ko‘chmas mulk manzilini belgilash yoki o‘zgartirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish',
    category: 'Davlat ro‘yxati',
    purpose: 'Uy yoki binoga ko‘cha nomi, mahalla va aniq raqamli rasmiy manzil berish.',
    duration: '3 ish kuni',
    cost: 'Bepul',
    warningTip: 'Ko‘cha nomi o‘zgarganda ko‘chmas mulk hujjatlarini qayta o‘zgartirish majburiy emas, baza avtomatik yangilanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Mulkning kadastr yig‘majildi',
        whereToGet: 'Mulk egasidan',
        explanation: 'Obyektning hozirgi koordinatasi va raqami.',
      ),
    ],
    illegalDemands: ['Mahalladan ko‘cha nomi haqida spravka keltirish'],
  ),

  // 18
  KadastrService(
    id: '18',
    titleSimple: 'Ko‘chmas mulk obyektining buzilishga (Snos) tushgan-tushmaganligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk obyektining bosh rejaga asosan buzilishga tushganligi haqida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Uy yoki yer davlat va jamoat ehtiyojlari uchun buzilish hududiga tushgan yoki yo‘qligini oldindan aniqlash.',
    duration: '3 ish kuni',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Uy sotib olishdan oldin bu maʼlumotnomani albatta tekshiring.',
    docs: [
      RequiredDocument(
        simpleName: 'Obyekt kadastr raqami',
        officialName: 'Ko‘chmas mulk kadastr raqami',
        whereToGet: 'Kadastr hujjatidan',
        explanation: 'Tekshirilayotgan manzil raqami.',
      ),
    ],
    illegalDemands: ['Qurilish boshqarmasiga shaxsan borib imzo to‘plash'],
  ),

  // 19
  KadastrService(
    id: '19',
    titleSimple: 'Mulk huquqini bekor qilishni davlat ro‘yxatidan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Bino to‘liq buzilganda, yong‘inda yo‘q bo‘lganda yoki sud qarori bilan huquq tugatilganda bazadan chiqarish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Buzilgan uy bazadan chiqarilmasa, unga nisbatan yer va mulk solig‘i hisoblanaveradi.',
    docs: [
      RequiredDocument(
        simpleName: 'Buzilganlik dalolatnomasi yoki sud qarori',
        officialName: 'Tugatish dalolatnomasi / Sud qarori',
        whereToGet: 'Tuman komissiyasi yoki suddan',
        explanation: 'Obyekt amalda yo‘qligini tasdiqlovchi qog‘oz.',
      ),
    ],
    illegalDemands: ['Arxivdan 10 yil oldingi orderlarni qayta talab qilish'],
  ),

  // 20
  KadastrService(
    id: '20',
    titleSimple: 'Geodeziya va kartografiya maʼlumotlarini taqdim etish',
    titleOfficial: 'Davlat kartografiya-geodeziya fondidan maʼlumotlar va materiallar berish',
    category: 'Geodeziya',
    purpose: 'Muhandislik, loyihalash va qurilish ishlari uchun aniq topografik va geodezik xaritalarni olish.',
    duration: '5 ish kuni',
    cost: 'Buyurtma hajmiga ko‘ra shartnoma asosida',
    warningTip: 'Davlat siri hisoblangan koordinatalar maxsus ruxsatnomalar asosida beriladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Loyiha-qurilish buyurtmasi',
        officialName: 'Tashkilotning rasmiy so‘rovi va texnik topshiriq',
        whereToGet: 'Loyiha institutidan',
        explanation: 'Xarita qaysi hudud uchun kerakligi ko‘rsatilgan reja.',
      ),
    ],
    illegalDemands: ['Litsenziyasiz vositachilar xizmatidan foydalanishga majburlash'],
  ),

  // 21
  KadastrService(
    id: '21',
    titleSimple: 'Tadbirkorlarga yer uchastkasini xususiylashtirish',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish',
    category: 'Xususiylashtirish',
    purpose: 'Tadbirkor o‘ziga tegishli bino ostidagi yerni davlatdan shaxsiy mulk qilib sotib olishi.',
    duration: '10 ish kuni',
    cost: 'Yer solig‘ining karrali miqdoridagi to‘lov',
    warningTip: 'Xususiylashtirilgan yer daxlsiz xususiy mulk bo‘ladi va davlat tomonidan bekorga tortib olinmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Binoga bo‘lgan mulkchilik hujjati',
        officialName: 'Bino kadastr pasporti va ro‘yxatdan o‘tganlik ko‘chirmasi',
        whereToGet: 'Kadastr reyestridan',
        explanation: 'Yer ustidagi mulk o‘zingizniki ekanini tasdiqlovchi hujjat.',
      ),
    ],
    illegalDemands: ['Hokimiyat komissiyasining alohida yig‘ilish qarori'],
  ),

  // 22
  KadastrService(
    id: '22',
    titleSimple: 'O‘zboshimchalik bilan egallangan yer va uylarga huquqni eʼtirof etish',
    titleOfficial: 'O‘zboshimchalik bilan egallangan yer uchastkalari hamda ularda qurilgan binolarga bo‘lgan huquqlarni eʼtirof etish (Qonuniylashtirish)',
    category: 'Qonuniylashtirish',
    purpose: 'Hujjatsiz, o‘zboshimchalik bilan qurilgan uy-joylarga amaldagi qonun doirasida qonuniy mulk huquqini berish.',
    duration: 'Reja-jadval asosida xatlov davomida',
    cost: 'Qonunda belgilangan bir martalik yig‘im asosida',
    warningTip: 'Hech kimga oldindan "tezlashtirib beraman" deb pul bermang! Hududlar kadastr xodimlari tomonidan bepul xatlov qilinadi va tizimga avtomatik kiritiladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uzoq yillik to‘lovlar va dalillar',
        officialName: 'Kommunal cheklar, soliq to‘lovlari, eski texnik xatlovlar',
        whereToGet: 'Shaxsiy arxiv / to‘lov tizimlari',
        explanation: 'Mulkdan ko‘p yillardan beri uzluksiz foydalanilganini tasdiqlovchi hujjatlar.',
      ),
    ],
    illegalDemands: ['Norasmiy komissiya yig‘imlari', 'Vositachilik haqlari'],
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
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'Dastur haqida va Aloqa',
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
              accountEmail: Text('Kadastr sohasidagi barcha 22 ta davlat xizmati'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.home_work, color: Color(0xFF0D47A1), size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF0D47A1)),
              title: const Text('Barcha xizmatlar ro‘yxati'),
              subtitle: Text('${kadastrServices.length} ta rasmiy davlat xizmati'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent, color: Colors.green),
              title: const Text('Kadastr agentligi Call-markazi'),
              subtitle: const Text('Rasmiy ishonch telefoni: 1097'),
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
          // Qidiruv paneli
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Xizmat nomini qidiring...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0D47A1)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),

          // Korrupsiyaga qarshi eslatma
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF81C784)),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield, color: Color(0xFF2E7D32), size: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Rasmiy 22 ta xizmat bo‘yicha to‘liq yo‘riqnoma. Ortiqcha hujjat talab qilishlariga yo‘l qo‘ymang!',
                    style: TextStyle(color: Color(0xFF1B5E20), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Toifalar (Kategoriyalar)
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

          // Xizmatlar ro'yxati
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
                        const SizedBox(height: 3),
                        Text(item.titleOfficial, style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(item.category, style: const TextStyle(fontSize: 10, color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text('Muddat: ${item.duration}', overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: Colors.blueGrey)),
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
          // Dasturchi kartasi
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

          // Rasmiy Kadastr agentligi 1097
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

          // Loyiha maqsadi
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

// ---------------- TAFSILOTLAR EKRANI ----------------
class DetailScreen extends StatelessWidget {
  final KadastrService service;
  const DetailScreen({super.key, required this.service});

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
          const Text('Kerakli hujjatlar:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...service.docs.map((d) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.simpleName, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
                  const SizedBox(height: 4),
                  Text('Qayerdan olasiz: ${d.whereToGet}', style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 2),
                  Text('Bu nima: ${d.explanation}', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                ],
              ),
            ),
          )),
          const SizedBox(height: 12),
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
                subtitle: Text('Qayerdan olinadi: ${doc.whereToGet}'),
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
