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
  final String whatIsIt; // Bu qanday hujjat?
  final String insideContent; // Ichida nimalar yozilgan bo‘lishi shart?
  final String whereToGet; // Qayerdan olinadi yoki yo‘qolgan bo‘lsa nima qilinadi?

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

// ---------------- BARCHA 22 TA RASMIY KADASTR DAVLAT XIZMATLARI ----------------
final List<KadastrService> kadastrServices = [
  // 1
  KadastrService(
    id: '1',
    titleSimple: 'Uy-joyga kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (turar joy) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Kvartira yoki yakka tartibdagi hovli uyning texnik parametrlarini o‘lchab, rasmiy elektron pasport va chizmasini tayyorlab berish.',
    duration: 'Kvartira: 5 ish kuni; Hovli uy: 8 ish kuni',
    cost: 'Maydoniga qarab qonuniy invoys asosida (SMS orqali)',
    warningTip: 'Uyingizda noqonuniy qo‘shimcha qurilma bo‘lmasa, hech kim sizdan ortiqcha to‘lov talab qila olmaydi. Naqd pul bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Mulk huquqini tasdiqlovchi hujjat',
        officialName: 'Huquq belgilovchi hujjat (Shartnoma, qaror, order)',
        whatIsIt: 'Siz bu mulkka qanday qilib ega bo‘lganingizni tasdiqlovchi asosiy qonuniy hujjat.',
        insideContent: '• Notarius muhri va reyestr raqami (yoki hokimlik gerbli muhri);\n• Mulkdorning F.I.Sh. va pasport maʼlumotlari;\n• Mulkning aniq manzili.',
        whereToGet: 'Bitim tuzilgan notariusdan, uyni ajratgan tuman hokimligidan yoki davlat arxividan.',
      ),
      RequiredDocument(
        simpleName: 'Pasport yoki ID-karta (JShSHIR)',
        officialName: 'Shaxsni tasdiqlovchi davlat hujjati',
        whatIsIt: 'Murojaatchining shaxsini va 14 xonali unikal JShSHIR raqamini tasdiqlovchi hujjat.',
        insideContent: '• Shaxsiy fotosurat, ism-familiya va 14 xonali JShSHIR kodi.',
        whereToGet: 'Yoningizda bo‘lishi kifoya. Nusxa topshirish talab etilmaydi.',
      ),
    ],
    illegalDemands: ['Mahalladan maʼlumotnoma', 'Qo‘shnilar rozilik xati', 'Kommunal to‘lov cheklari'],
  ),

  // 2
  KadastrService(
    id: '2',
    titleSimple: 'Tadbirkorlik va noturar binolarga kadastr pasporti olish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Do‘kon, ofis, omborxona yoki ishlab chiqarish binolarining texnik o‘lchovlarini bajarib, elektron pasport tayyorlash.',
    duration: '100 kv.mgacha — 5 ish kuni; 1000 kv.mgacha — 7 ish kuni',
    cost: 'Belgilangan davlat tarifi bo‘yicha',
    warningTip: 'Faqat my.gov.uz yoki DXM orqali kelgan elektron invoysga to‘lov qiling.',
    docs: [
      RequiredDocument(
        simpleName: 'Noturar mulkka egalik hujjati',
        officialName: 'Oldi-sotdi shartnomasi / E-auksion bayonnomasi / Hokim qarori',
        whatIsIt: 'Binoni xarid qilganingiz yoki auksionda yutib olganingizni tasdiqlovchi asos.',
        insideContent: '• Binoning maydoni, qavati va ruxsat berilgan faoliyat turi.',
        whereToGet: 'E-auksion tizimidan, notariusdan yoki davlat arxividan.',
      ),
      RequiredDocument(
        simpleName: 'Foydalanishga qabul qilish dalolatnomasi',
        officialName: 'Obyektni foydalanishga qabul qilish to‘g‘risidagi ruxsatnoma',
        whatIsIt: 'Bino yangi qurilgan bo‘lsa, xavfsizlik talablariga javob berishini tasdiqlovchi hujjat.',
        insideContent: '• Qabul qilish komissiyasi aʼzolarining elektron tasdiqlari.',
        whereToGet: 'Qurilish va uy-joy kommunal xo‘jaligi bo‘limidan.',
      ),
    ],
    illegalDemands: ['Soliqdan qarz yo‘qligi maʼlumotnomasi', 'Hokimiyatning alohida yozma xati'],
  ),

  // 3
  KadastrService(
    id: '3',
    titleSimple: 'Mulk huquqini davlat ro‘yxatidan o‘tkazish (Reyestr)',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Notariusda uy sotib olgach yoki meros rasmiylashtirilgach, mulkdorni davlat bazasiga qonuniy xo‘jayin sifatida kiritish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'Diqqat: Notariusdan chiqqach 1 oy ichida ro‘yxatdan o‘tkazilmasa, mulk huquqi to‘liq kuchga kirmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Notarial shartnoma yoki sud qarori',
        officialName: 'Oldi-sotdi, hadya bitimi yoki sudning qonuniy kuchga kirgan qarori',
        whatIsIt: 'Mulk sizga o‘tganini tasdiqlovchi gerbli qatʼiy blankadagi hujjat.',
        insideContent: '• Notarius muhri, bitim sanasi va QR-kodi.',
        whereToGet: 'Notarial idoradan shartnoma imzolanganda olinadi.',
      ),
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Elektron kadastr yig‘majildi',
        whatIsIt: 'Mulkning chizmasi va texnik ko‘rsatkichlari bazasi.',
        insideContent: '• Kadastr raqami va mulk maydoni.',
        whereToGet: 'Kadastr bazasidan avtomatik olinadi.',
      ),
    ],
    illegalDemands: ['Notarius tasdiqlagan qog‘ozni hokimiyatda qayta muhrlatish'],
  ),

  // 4
  KadastrService(
    id: '4',
    titleSimple: 'Davlat reyestridan ko‘chirma olish (Mulkdorlik hujjati)',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish',
    category: 'Maʼlumotnoma',
    purpose: 'Mulkning hozirgi qonuniy egasi kimligini isbotlovchi QR-kodli rasmiy davlat hujjati.',
    duration: '1 ish kuni (real vaqtda)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Eski ko‘k muhrli qog‘ozlar o‘rniga aynan mana shu QR-kodli elektron ko‘chirma amalda qo‘llaniladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Obyektning unikal kadastr raqami',
        whatIsIt: 'Ko‘chmas mulkka berilgan maxsus 10 xonali elektron raqam.',
        insideContent: '• Viloyat, tuman, zona va bino kodi.',
        whereToGet: 'Kadastr pasportidan yoki my.gov.uz profilidan.',
      ),
    ],
    illegalDemands: ['Kadastr xodimining uyga shaxsan kelib ko‘rishi'],
  ),

  // 5
  KadastrService(
    id: '5',
    titleSimple: 'Nomida shaxsiy turar joy yo‘qligi haqida maʼlumotnoma',
    titleOfficial: 'Fuqaroning nomida shaxsiy turar joy mavjud yoki mavjud emasligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Subsidiya, imtiyozli uy-joy krediti yoki moddiy yordam olishda butun respublika bo‘yicha nomingizda uy yo‘qligini tasdiqlash.',
    duration: 'Avtomatik (1 kun ichida)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Respublika bo‘yicha barcha hududiy bazalar avtomatik tekshiriladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Pasport / ID-karta (JShSHIR)',
        officialName: 'Shaxsiy identifikatsiya kodi',
        whatIsIt: 'Nomingizdagi mulklarni qidirish uchun yagona kalit raqam.',
        insideContent: '• 14 xonali JShSHIR raqami.',
        whereToGet: 'ID-kartangizning orqa tomonida joylashgan.',
      ),
    ],
    illegalDemands: ['Mahalladan uy-joyi yo‘qligi haqida maʼlumotnoma so‘rash'],
  ),

  // 6
  KadastrService(
    id: '6',
    titleSimple: 'Mulkda taqiq (Zapret) bor-yo‘qligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar mavjudligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Uyni sotib olishdan oldin unga sud, MIB qarzdorligi, bank ipotekasi taqiq qo‘ymaganini aniqlash.',
    duration: 'Real vaqtda (avtomatik)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Taqiqi bor mulkni sotib olmang va taqiq yechilmaguncha zaklad (garov puli) bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Uyning kadastr raqami',
        officialName: 'Ko‘chmas mulk kadastr raqami',
        whatIsIt: 'Sotib olinayotgan uyning raqami.',
        insideContent: '• Mulkning to‘liq manzili va kodi.',
        whereToGet: 'Sotuvchining kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['MIBga borib qo‘lda imzo qo‘ydirib kelish talabi'],
  ),

  // 7
  KadastrService(
    id: '7',
    titleSimple: 'Hovli yoki uyni ikkiga bo‘lish (Alohida qilish)',
    titleOfficial: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati',
    category: 'Chegaralar',
    purpose: 'Bitta umumiy hovlini mulkdorlar o‘rtasida alohida mustaqil obyektlarga ajratish.',
    duration: '10 dan 15 ish kunigacha',
    cost: 'Maydoni va meʼmoriy chizmasiga asosan',
    warningTip: 'Bo‘linayotgan har bir yangi hovlida ko‘chaga mustaqil chiqish yo‘li (darvoza) bo‘lishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Taqsimlash shartnomasi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan bo‘lish bitimi / Sud ajrimi',
        whatIsIt: 'Mulkdorlar uyni qaysi chegaradan ajratishga kelishgani hujjati.',
        insideContent: '• Kimga qaysi xonalar va necha sotix yer tegishi haqida aniq reja.',
        whereToGet: 'Notariusda tuziladi yoki suddan olinadi.',
      ),
      RequiredDocument(
        simpleName: 'Amaldagi umumiy kadastr pasporti',
        officialName: 'Asl kadastr yig‘majildi',
        whatIsIt: 'Uyning yaxlit holatdagi kitobchasi yoki elektron pasporti.',
        insideContent: '• Butun yer uchastkasining chegaralari.',
        whereToGet: 'Mulkdorning qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Kommunal xizmatlarning yangi hisob raqamlarini oldindan talab qilish'],
  ),

  // 8
  KadastrService(
    id: '8',
    titleSimple: 'Ko‘p kvartirali uy oldidagi yerlarni rasmiylashtirish',
    titleOfficial: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatdan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Dom oldidagi maydonni aholining umumiy foydalanishdagi mulki sifatida rasmiylashtirish.',
    duration: '10 ish kuni',
    cost: 'Bepul / Minimal stavka',
    warningTip: 'Tutash yer noqonuniy qurilishlardan himoyalangan umumiy daxlsiz yer hisoblanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkdorlar yig‘ilishi bayonnomasi',
        officialName: 'Ko‘p kvartirali uy mulkdorlarining umumiy yig‘ilishi qarori',
        whatIsIt: 'Domda yashovchilarning ko‘pchiligi yerni rasmiylashtirishga rozi bo‘lgan bayonnoma.',
        insideContent: '• Qatnashgan aholi ro‘yxati va imzolari.',
        whereToGet: 'BSHM (boshqaruv kompaniyasi) yoki mahalla orqali tuziladi.',
      ),
    ],
    illegalDemands: ['Har bir xonadondan alohida pulli ariza talab qilish'],
  ),

  // 9
  KadastrService(
    id: '9',
    titleSimple: 'Bino va inshootlar ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Bino, ofis yoki sexni 1 yildan ortiq muddatga ijaraga berganda huquqni mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: '1 yildan oshiq muddatli ijaralar kadastrda ro‘yxatdan o‘tmasa, sudda haqiqiy sanalmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Ijara shartnomasi',
        officialName: 'Notarial yoki yozma ijara bitimi',
        whatIsIt: 'Ijara beruvchi va oluvchi o‘rtasidagi rasmiy shartnoma.',
        insideContent: '• Ijara muddati, oylik to‘lov va foydalanish maqsadi.',
        whereToGet: 'Notariusda yoki soliq tizimi orqali olinadi.',
      ),
    ],
    illegalDemands: ['Binoni qayta texnik inventarizatsiyadan o‘tkazish'],
  ),

  // 10
  KadastrService(
    id: '10',
    titleSimple: 'Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Yer uchastkasini ijaraga olish shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Fermer, dehqon xo‘jaligi yoki tadbirkorlik yerlarini o‘z nomingizga rasmiy mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 baravari',
    warningTip: 'Faqat E-auksion yoki E-yer ochiq elektron tanlovida yutib olingan yerlar ro‘yxatga olinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron tanlov bayonnomasi',
        officialName: 'Yer ijara huquqini sotish bo‘yicha auksion bayonnomasi',
        whatIsIt: 'Davlat ochiq tanlovida siz g‘olib bo‘lganingizni tasdiqlovchi QR-kodli hujjat.',
        insideContent: '• Kontur raqamlari, gektar maydoni va ijara muddati.',
        whereToGet: 'E-auksion.uz tizimidagi shaxsiy kabinetdan yuklanadi.',
      ),
    ],
    illegalDemands: ['Qishloq xo‘jaligi bo‘limidan qo‘shimcha rozilik xati'],
  ),

  // 11
  KadastrService(
    id: '11',
    titleSimple: 'Ipoteka va garov huquqini ro‘yxatga olish / yechish',
    titleOfficial: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatga olish',
    category: 'Davlat ro‘yxati',
    purpose: 'Kredit olayotganda uyni garovga qo‘yish yoki kredit yopilgach uydan taqiqni yechish.',
    duration: '1 ish kuni',
    cost: 'BHMning 50% miqdorida',
    warningTip: 'Kredit to‘langach, bank xodimi tizim orqali taqiqni yechish arizasini bepul yuborishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Ipoteka shartnomasi',
        officialName: 'Notarial tasdiqlangan ipoteka shartnomasi',
        whatIsIt: 'Mulk qaysi bankka, qancha kredit evaziga garovga qo‘yilganini bildiruvchi shartnoma.',
        insideContent: '• Kredit summasi va garovga qo‘yilgan uyning kadastr raqami.',
        whereToGet: 'Bank va notariusdan bir vaqtda beriladi.',
      ),
    ],
    illegalDemands: ['Bank xodimining DXMga shaxsan kelishi'],
  ),

  // 12
  KadastrService(
    id: '12',
    titleSimple: 'Servitut kelishuvi (Qo‘shni yeridan yo‘l ochish)',
    titleOfficial: 'Servitut huquqini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Uyingizga kirish uchun qo‘shnining hovlisidan o‘tish yoki quvur tortish ruxsatini qonuniylashtirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Servitut rasmiylashtirilsa, qo‘shni o‘zgarsa ham sizning o‘tish huquqingiz yo‘qolmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Servitut kelishuvi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan servitut shartnomasi',
        whatIsIt: 'Yerning qaysi metrlaridan o‘tishga kelishilgan rasmiy shartnoma.',
        insideContent: '• Yo‘lning eni, uzunligi va o‘tish shartlari.',
        whereToGet: 'Notariusda tuziladi yoki suddan olinadi.',
      ),
    ],
    illegalDemands: ['Qo‘shnining butun hovlisini qayta o‘lchash'],
  ),

  // 13
  KadastrService(
    id: '13',
    titleSimple: 'Ko‘p yillik bog‘ va daraxtzorlarga kadastr olish',
    titleOfficial: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish',
    category: 'Kadastr pasporti',
    purpose: 'Intensiv bog‘lar va mevali daraxtzorlarni ko‘chmas mulk sifatida hisobga olish.',
    duration: '5 ish kuni',
    cost: 'Bog‘ maydoniga qarab',
    warningTip: 'Bog‘ barpo etilgan yerga egalik yoki ijara hujjati bo‘lishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Bog‘ yerining hujjati',
        officialName: 'Yer uchastkasi ijara yoki egalik shartnomasi',
        whatIsIt: 'Bog‘ qaysi yerda barpo etilganini isbotlovchi davlat hujjati.',
        insideContent: '• Maydoni, konturi va daraxt turlari.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Ekologiya inspeksiyasidan qo‘shimcha ruxsatnoma'],
  ),

  // 14
  KadastrService(
    id: '14',
    titleSimple: 'Tadbirkorlik uchun yerni E-auksion orqali olish',
    titleOfficial: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish',
    category: 'Auksion',
    purpose: 'Bo‘sh turgan davlat yerlarini savdo yoki sex qurish uchun halol, ochiq auksionda yutib olish.',
    duration: 'Auksion reglamenti bo‘yicha',
    cost: 'Auksiondagi savdo bahosi',
    warningTip: 'Hokimning to‘g‘ridan-to‘g‘ri yer ajratish vakolati yo‘q! Birorta amaldorga "yer olib beraman" degan gapiga ishonib pul bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron raqamli imzo (ERI kalit)',
        officialName: 'ERI sertifikati',
        whatIsIt: 'Auksionda savdolashish va bayonnomani imzolash uchun elektron muhr.',
        insideContent: '• Fuqaro yoki korxona nomiga rasmiylashtirilgan kalit.',
        whereToGet: 'Davlat xizmatlari markazidan 10 daqiqada olinadi.',
      ),
    ],
    illegalDemands: ['Auksiondan keyin hokimiyatdan qo‘shimcha qaror kutish'],
  ),

  // 15
  KadastrService(
    id: '15',
    titleSimple: 'Qishloq xo‘jaligi yerlarini ijaraga olish tanlovi',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallangan yerlarni elektron ochiq tanlov orqali berish',
    category: 'Yer uchastkasi',
    purpose: 'Ekin ekish, bog‘dorchilik yoki issiqxona uchun yerlarni "E-yer" orqali ijaraga olish.',
    duration: 'Tanlov muddati asosida',
    cost: 'Tanlov qoidalariga ko‘ra',
    warningTip: 'G‘olib inson omilisiz, kompyuter reytingi orqali shaffof aniqlanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Fermerlik biznes-rejasi',
        officialName: 'Yer uchastkasidan samarali foydalanish taklifi',
        whatIsIt: 'Yerda nima yetishtirishingiz va investitsiya hajmi ko‘rsatilgan reja.',
        insideContent: '• Ekin turlari va yaratiladigan ish o‘rinlari soni.',
        whereToGet: 'Ariza beruvchining o‘zi tayyorlaydi.',
      ),
    ],
    illegalDemands: ['Tuman qishloq xo‘jaligi bo‘limidan alohida xat'],
  ),

  // 16
  KadastrService(
    id: '16',
    titleSimple: 'Eski va yangi kadastr raqamlarini solishtirish',
    titleOfficial: 'Ko‘chmas mulkning yangilangan kadastr raqami to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Eski pasportdagi raqam yangi elektron tizimda qaysi raqamga o‘zgarganini tasdiqlash.',
    duration: 'Avtomatik (1 ish kuni)',
    cost: 'Bepul',
    warningTip: 'Eski uyingiz notariusda chiqmay qolsa, shu maʼlumotnoma bilan ish bitadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Eski kadastr daftarchasi',
        officialName: 'Eski namunadagi texnik pasport',
        whatIsIt: 'Ilgari berilgan qog‘oz daftarcha.',
        insideContent: '• Eski kadastr kodi va uy manzili.',
        whereToGet: 'Mulkdorning shaxsiy arxiv hujjatlaridan.',
      ),
    ],
    illegalDemands: ['Kadastr xodimini chaqirib pul to‘lash'],
  ),

  // 17
  KadastrService(
    id: '17',
    titleSimple: 'Uyga rasmiy ko‘cha nomi va manzil berish',
    titleOfficial: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish',
    category: 'Davlat ro‘yxati',
    purpose: 'Yangi uyga tuman hokimiyati tomonidan rasmiy ko‘cha nomi va raqam berilishi.',
    duration: '3 ish kuni',
    cost: 'Bepul',
    warningTip: 'Ko‘cha nomi o‘zgarganda hujjatlarni qayta o‘zgartirish shart emas, baza buni o‘zi taniydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Mulk kadastr yig‘majildi',
        whatIsIt: 'Uyning joylashgan koordinatalarini ko‘rsatuvchi hujjat.',
        insideContent: '• Obyektning amaldagi xaritasi.',
        whereToGet: 'Mulkdorning qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Mahalladan ko‘cha nomi haqida spravka keltirish'],
  ),

  // 18
  KadastrService(
    id: '18',
    titleSimple: 'Uy buzilishga (Snos) tushgan-tushmaganligini aniqlash',
    titleOfficial: 'Ko‘chmas mulkning bosh rejaga asosan buzilishga tushganligi haqida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Uy o‘rnida kelajakda yo‘l yoki boshqa inshoot tushishi rejalashtirilganini tekshirish.',
    duration: '3 ish kuni',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Uy sotib olishdan oldin bu maʼlumotnomani albatta tekshiring!',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Obyekt kadastr raqami',
        whatIsIt: 'Tekshirilayotgan xonadon raqami.',
        insideContent: '• Koordinatalar va manzil.',
        whereToGet: 'Kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['Arxitektura bo‘limiga shaxsan borib yozma ruxsat olish'],
  ),

  // 19
  KadastrService(
    id: '19',
    titleSimple: 'Mulk buzilganda kadastr hisobidan chiqarish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini ro‘yxatdan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Eski uy buzilib o‘rniga yangi qurilayotganda yoki yo‘q bo‘lganda, eski uyni bazadan o‘chirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Buzilgan uyni bazadan chiqarmasangiz, yo‘q uy uchun soliq hisoblanaveradi.',
    docs: [
      RequiredDocument(
        simpleName: 'Buzilganlik dalolatnomasi',
        officialName: 'Bino mavjud emasligi to‘g‘risidagi dalolatnoma',
        whatIsIt: 'Bino joyida haqiqatda yo‘qligini tasdiqlovchi qog‘oz.',
        insideContent: '• Mahalla faollari va kadastr xodimi ishtirokidagi foto-dalolatnoma.',
        whereToGet: 'Tuman kadastr bo‘limi va mahalladan tuziladi.',
      ),
    ],
    illegalDemands: ['Eski orderlarni arxivdan qayta talab qilish'],
  ),

  // 20
  KadastrService(
    id: '20',
    titleSimple: 'Topografik va geodezik xaritalar olish',
    titleOfficial: 'Davlat kartografiya-geodeziya fondidan maʼlumotlar taqdim etish',
    category: 'Geodeziya',
    purpose: 'Katta inshootlar yoki yo‘l qurilish loyihalari uchun aniq geodezik xaritalarni olish.',
    duration: '5 ish kuni',
    cost: 'Xarita hajmiga qarab shartnoma asosida',
    warningTip: 'Qurilishdan oldin aniq geodezik maʼlumot olinsa, yer osti quvurlariga shikast yetmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Loyiha texnik topshirig‘i',
        officialName: 'Tashkilot buyurtmasi va loyihalash so‘rovi',
        whatIsIt: 'Qaysi hududning xaritasi nima uchun kerakligini ko‘rsatuvchi so‘rov.',
        insideContent: '• Koordinatalar va masshtab (1:500, 1:2000).',
        whereToGet: 'Loyiha tashkilotidan olinadi.',
      ),
    ],
    illegalDemands: ['Litsenziyasiz shaxslar xizmatidan foydalanishga majburlash'],
  ),

  // 21
  KadastrService(
    id: '21',
    titleSimple: 'Bino ostidagi yerni xususiylashtirish (Sotib olish)',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish',
    category: 'Xususiylashtirish',
    purpose: 'O‘zingizga tegishli bino yoki do‘kon turgan yerni shaxsiy xususiy mulk qilib sotib olish.',
    duration: '10 ish kuni',
    cost: 'Yer solig‘ining karrali stavkasida',
    warningTip: 'Xususiylashtirilgan yer — daxlsiz mulk. Uni hech kim asossiz tortib ololmaydi!',
    docs: [
      RequiredDocument(
        simpleName: 'Binoga bo‘lgan mulkchilik hujjati',
        officialName: 'Bino kadastr pasporti va ro‘yxatdan o‘tganlik ko‘chirmasi',
        whatIsIt: 'Yer ustidagi bino sizniki ekanini tasdiqlovchi hujjat.',
        insideContent: '• Bino maydoni va kadastr raqami.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Hokimiyatning alohida yozma ruxsati'],
  ),

  // 22
  KadastrService(
    id: '22',
    titleSimple: 'Hujjatsiz uylarni qonuniylashtirish (Amnistiya)',
    titleOfficial: 'O‘zboshimchalik bilan egallangan yer va ularda qurilgan binolarga huquqlarni eʼtirof etish',
    category: 'Qonuniylashtirish',
    purpose: 'Ko‘p yillardan beri yashab kelayotgan, lekin hujjati bo‘lmagan xonadonlarga qonuniy kadastr berish.',
    duration: 'Reja-grafik asosida (xatlov davomida)',
    cost: 'Bir martalik qonuniy yig‘im asosida',
    warningTip: 'DIQQAT: Hech kimga "tezlashtirib beraman" degan maklerlarga pul bermang! Hududlar kadastr xodimlari tomonidan mahallama-mahalla qonuniy xatlovdan o‘tkaziladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uzoq yillik to‘lovlar va dalillar',
        officialName: 'Yer/mulk solig‘i cheklari, elektr, gaz to‘lov daftarlari',
        whatIsIt: 'Siz ushbu joyda ko‘p yillardan beri yashab kelayotganingizni tasdiqlovchi cheklar.',
        insideContent: '• To‘lov qilingan sana va to‘lovchi F.I.Sh.',
        whereToGet: 'Shaxsiy arxiv daftarlari yoki bank/to‘lov tizimlaridan.',
      ),
    ],
    illegalDemands: ['Vositachilik haqlari', 'Norasmiy pul yig‘ishlar'],
  ),
];

// ---------------- ALOHIDA: "HUJJATLAR QOMUSI" (LUG‘AT) ----------------
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
    simpleExplanation: 'Tuman yoki shahar hokimi tomonidan fuqaro yoki tashkilotga yer ajratish, uy qurishga ruxsat berish haqida chiqarilgan rasmiy buyruq qog‘ozi. (Hozirda yangi yer ajratish vakolati bekor qilingan, faqat eski qarorlar kuchga ega).',
    whatIsInside: '• Qaror qabul qilingan sana, tuman hokimining imzosi va dumaloq muhri;\n• Kimga, qancha yer va qanday maqsadda berilgani;\n• Yerning aniq joylashuvi va chegaralari.',
    whereToFind: 'Qo‘lingizdagi asl nusxa yo‘qolgan bo‘lsa, tegishli tuman hokimligining devonxonasidan yoki viloyat davlat arxividan tasdiqlangan nusxasi olinadi.',
  ),
  DocVocabulary(
    term: 'Oldi-sotdi shartnomasi nima?',
    simpleExplanation: 'Siz uyni birovdan sotib olganingizda, notarius ishtirokida imzolanadigan eng asosiy gerbli qog‘oz.',
    whatIsInside: '• Sotuvchi va xaridorning to‘liq pasport maʼlumotlari;\n• Mulkning aniq manzili va sotilgan narxi;\n• Notariusning gerbli muhri, maxsus blanka seriya raqami va reyestr yozuvi.',
    whereToFind: 'Shartnoma tuzilgan xususiy yoki davlat notarial idorasidan (dublikat sifatida olinishi mumkin).',
  ),
  DocVocabulary(
    term: 'Mulk huquqi ko‘chirmasi (Vipiska) nima?',
    simpleExplanation: 'Eski ko‘k muhrli qog‘oz guvohnomalar o‘rniga hozir beriladigan yagona elektron QR-kodli hujjat. Bu hujjat hozirgi daqiqada uy aynan kimga tegishli ekanini isbotlaydi.',
    whatIsInside: '• Mulkning unikal kadastr raqami;\n• Hozirgi qonuniy egasining F.I.Sh;\n• Mulkning toifasi, maydoni va haqiqiy ekanini tasdiqlovchi maxsus QR-kod.',
    whereToFind: 'my.gov.uz portali orqali 1 daqiqada yuklab olinadi yoki Davlat xizmatlari markazidan olinadi.',
  ),
  DocVocabulary(
    term: 'Meros guvohnomasi nima?',
    simpleExplanation: 'Uy egasi vafot etganidan so‘ng, uning uyi farzandlariga yoki merosxo‘rlariga qolganini tasdiqlovchi rasmiy notarial hujjat.',
    whatIsInside: '• Meros qoldiruvchining o‘lim guvohnomasi rekvizitlari;\n• Merosxo‘rlarning qarindoshlik darajasi va ularga tekkan mulk ulushi (masalan: 1/2 qism).',
    whereToFind: 'Meros ishi ochilgan notarial idoradan olinadi.',
  ),
  DocVocabulary(
    term: 'Kadastr pasporti nima?',
    simpleExplanation: 'Uyingizning "texnik pasporti". Unda uyingiz necha xonadan iboratligi, devorlari qanday g‘ishtdan qurilgani, hovlingiz necha sotix ekani va xaritasi chizilgan bo‘ladi.',
    whatIsInside: '• Uyning umumiy va yashash maydoni chizmasi;\n• Kommunikatsiya tarmoqlari (suv, gaz, svet) borligi;\n• Bino qurilgan yil va texnik ko‘rsatkichlar.',
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
            tooltip: 'Hujjatlar nima? (Sodda qomus)',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const VocabularyScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            tooltip: 'Loyiha maqsadi va Aloqa',
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
              accountEmail: Text('Korrupsiyaga qarshi huquqiy yo‘riqnoma'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.shield, color: Color(0xFF0D47A1), size: 40),
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
                    'Har bir hujjat ustiga bosing — uning asl tavsifi va yo‘q bo‘lsa qayerdan olinishi sodda tilda chiqadi!',
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
                      const Text('Bu hujjat ichida nimalar yozilgan bo‘lishi shart?', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
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

// ---------------- LOYIHA MAQSADI VA ALOQA EKRANI (RASMIY VA JIDDIY MATN BILAN) ----------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Loyiha maqsadi va Aloqa', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // LOYIHANING RASMIY MAQSADI KARTASI
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.gavel, color: Colors.red, size: 28),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Loyihaning rasmiy maqsadi',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1)),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF81C784)),
                    ),
                    child: const Text(
                      'Ushbu loyiha O‘zbekiston Respublikasi Kadastr agentligining Korrupsiyaga qarshi kurashish bo‘limi tashabbusi asosida ishlab chiqildi.',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20), height: 1.3),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Asosiy vazifa va maqsad:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Kadastr sohasida oddiy aholi va tadbirkorlarning eng ko‘p sarson bo‘lishi hamda noqonuniy talablarga duch kelishi — fuqarolarning o‘zida qanday hujjatlar borligini, qaysi hujjatlar yetishmasligini va yetishmayotgan hujjatlarni aynan qayerdan olish kerakligini bilmasligidan kelib chiqadi.\n\n'
                    'Natijada fuqarolar turli vositachilar (maklerlar)ning yolg‘on vaʼdalariga ishonib, korrupsiya tuzog‘iga tushib qolmoqda yoki asossiz xarajatlarga duchor bo‘lmoqda.\n\n'
                    'Mazkur ilova fuqarolarga barcha 22 ta rasmiy davlat xizmati bo‘yicha aniq huquqiy yo‘riqnoma berish, ulardan asossiz hujjat talab qilinishiga yo‘l qo‘ymaslik hamda kadastr sohasida korrupsion xavflarga butunlay barham berish maqsadida xalqchil qo‘llanma sifatida yaratildi.',
                    style: TextStyle(fontSize: 13, height: 1.45, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // KADASTR AGENTLIGI CALL-MARKAZI (1097)
          const Card(
            elevation: 1.5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFE8F5E9),
                child: Icon(Icons.support_agent, color: Colors.green),
              ),
              title: Text('Kadastr agentligi Call-markazi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              subtitle: Text('Rasmiy ishonch telefoni: 1097\n(Korrupsiya holatlari va kadastr xizmatlari yuzasidan rasmiy murojaatlar uchun)'),
              isThreeLine: true,
            ),
          ),

          const SizedBox(height: 16),

          // DASTUR MUALLIFI VA ISHLAB CHIQUVCHI
          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: Color(0xFF0D47A1),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Muxriddin Elbegiyev',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Dastur yaratuvchisi va loyiha muallifi',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Divider(height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE8F5E9),
                      child: Icon(Icons.phone, color: Colors.green),
                    ),
                    title: const Text('Telefon raqam', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: const Text(
                      '+998 33 911 22 22',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE1F5FE),
                      child: Icon(Icons.send, color: Colors.lightBlue),
                    ),
                    title: const Text('Telegram aloqa', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: const Text(
                      '+998 33 911 22 22',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1)),
                    ),
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
