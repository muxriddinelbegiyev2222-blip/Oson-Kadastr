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

// ---------------- HUJJAT VA XIZMAT MODELLARI ----------------
class RequiredDocument {
  final String simpleName;
  final String officialName;
  final String whatIsIt; // Bu qanday hujjat? (Oddiy tilda)
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

// ---------------- JAMI 22 TA MUKAMMAL KADASTR DAVLAT XIZMATI ----------------
final List<KadastrService> kadastrServices = [
  // 1
  KadastrService(
    id: '1',
    titleSimple: 'Turar joyga (kvartira, hovli) kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (turar joy) kadastr pasportini berish (VM 535-son qaror)',
    category: 'Kadastr pasporti',
    purpose: 'Kvartira yoki yakka tartibdagi hovli uyning texnik parametrlarini o‘lchab, rasmiy elektron pasport va raqamli chizmasini tayyorlash.',
    duration: 'Ko‘p qavatli uydagi kvartira uchun — 3 ish kuni; Yakka tartibdagi hovli uy uchun — 5 ish kuni',
    cost: 'Maydoniga qarab hisoblangan invoys bo‘yicha (my.gov.uz orqali 10% chegirma)',
    warningTip: 'Agar uyingizda rekonstruksiya yoki yangi xona qurilgan bo‘lsa, arxitektura ruxsatnomasisiz o‘zboshimchalik deb topiladi. Qo‘ldan pul bermang, to‘lov faqat SMS-invoys orqali!',
    docs: [
      RequiredDocument(
        simpleName: 'Mulk huquqini tasdiqlovchi hujjat',
        officialName: 'Huquq belgilovchi hujjat (Oldi-sotdi bitimi, tuman hokimi qarori, order yoki meros guvohnomasi)',
        whatIsIt: 'Siz bu uyga qanday qilib qonuniy ega bo‘lganingizni isbotlovchi gerbli asosiy hujjat.',
        insideContent: '• Notarius muhri, bitim sanasi va reyestr raqami (yoki hokimlik gerbli muhri);\n• Mulkdorning to‘liq F.I.Sh. va pasport maʼlumotlari;\n• Mulkning aniq manzili (tuman, mahalla, ko‘cha, uy raqami).',
        whereToGet: 'Bitim tuzilgan notarial idoradan, tuman hokimligi devonxonasidan yoki viloyat davlat arxividan.',
      ),
      RequiredDocument(
        simpleName: 'Shaxsni tasdiqlovchi hujjat (JShSHIR)',
        officialName: 'Pasport yoki identifikatsiya ID-kartasi',
        whatIsIt: 'Ariza beruvchining shaxsi va 14 xonali unikal JShSHIR kodini tasdiqlovchi hujjat.',
        insideContent: '• Shaxsiy fotosurat, F.I.Sh. va 14 xonali JShSHIR raqami.',
        whereToGet: 'Yoningizda bo‘lishi kifoya. Nusxa qoldirish talab etilmaydi.',
      ),
      RequiredDocument(
        simpleName: 'Qayta qurish (rekonstruksiya) qilingan bo‘lsa — Loyiha va Ruxsatnoma',
        officialName: 'Arxitektura-rejalashtirish topshirig‘i (APZ) va Qurilish bo‘limi ruxsatnomasi',
        whatIsIt: 'Agar hovlida yangi xona qurilgan yoki devorlar surilgan bo‘lsa, tuman Qurilish va arxitektura bo‘limi ruxsati.',
        insideContent: '• Shaharsozlik kengashi tasdig‘i;\n• Kelishilgan chizma loyiha va xavfsizlik xulosasi.',
        whereToGet: 'Yagona darcha (DXM) yoki my.gov.uz orqali Qurilish bo‘limidan olinadi.',
      ),
    ],
    illegalDemands: ['Mahalladan maʼlumotnoma', 'Qo‘shnilar tilxati', 'Kommunal to‘lov cheklari'],
  ),

  // 2
  KadastrService(
    id: '2',
    titleSimple: 'Tadbirkorlik va noturar binolarga kadastr pasporti olish',
    titleOfficial: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish',
    category: 'Kadastr pasporti',
    purpose: 'Do‘kon, ofis, savdo markazi, ishlab chiqarish sexi yoki omborxona kabi tijorat obyektlarining elektron kadastr pasportini rasmiylashtirish.',
    duration: '100 kv.mgacha — 5 ish kuni; 1000 kv.mgacha — 7 ish kuni; 5000 kv.mgacha — 10 ish kuni',
    cost: 'Belgilangan davlat tarif stavkasi bo‘yicha (invoys asosida)',
    warningTip: 'Tadbirkorlik binolarida qurilish nazorati inspeksiyasi (GASN) xulosasi bo‘lishi shart. Vositachilarga aldanmang!',
    docs: [
      RequiredDocument(
        simpleName: 'Mulk huquqi yoki yer ajratish hujjati',
        officialName: 'Oldi-sotdi shartnomasi / E-auksion yutuq bayonnomasi / Hokim qarori',
        whatIsIt: 'Bino yoki bino joylashgan yer sizniki ekanini bildiruvchi qonuniy hujjat.',
        insideContent: '• Mulkdor rekvizitlari, faoliyat turi va binoning ruxsat etilgan maqsadi.',
        whereToGet: 'E-auksion tizimidan, notariusdan yoki davlat arxividan.',
      ),
      RequiredDocument(
        simpleName: 'Foydalanishga qabul qilish dalolatnomasi (GASN)',
        officialName: 'Tugallangan qurilish obyektini foydalanishga qabul qilish to‘g‘risidagi ruxsatnoma',
        whatIsIt: 'Qurilish va arxitektura nazorati inspeksiyasi tomonidan bino xavfsiz va loyiha asosida qurilganini tasdiqlovchi rasmiy dalolatnoma.',
        insideContent: '• Qabul qilish komissiyasining elektron QR-kodli xulosasi va ro‘yxat raqami.',
        whereToGet: 'Qurilish vazirligi hududiy inspeksiyasi (Shaharsozlik nazorati) orqali DXMda olinadi.',
      ),
    ],
    illegalDemands: ['Soliqdan qarz yo‘qligi maʼlumotnomasi', 'Hokimiyatning alohida yozma xati'],
  ),

  // 3
  KadastrService(
    id: '3',
    titleSimple: 'Mulk huquqini davlat ro‘yxatidan o‘tkazish (Reyestr)',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish (VM 535-son qaror 2-ilova)',
    category: 'Davlat ro‘yxati',
    purpose: 'Notariusda tuzilgan oldi-sotdi, hadya, meros shartnomasi yoki auksion bayonnomasidan so‘ng yangi mulkdorni Yagona davlat reyestriga rasman kiritish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'QONUNIY TALAB: Notarial bitim tuzilgandan so‘ng 1 oy ichida davlat ro‘yxatidan o‘tkazilmasa, maʼmuriy jarima qo‘llaniladi va mulk huquqi rasman kuchga kirmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Huquq vujudga kelganini tasdiqlovchi hujjat',
        officialName: 'Notarial tasdiqlangan shartnoma, meros guvohnomasi yoki sud qarori',
        whatIsIt: 'Uy sizga rasman o‘tganini tasdiqlovchi gerbli, qatʼiy hisobdagi notarial blanka.',
        insideContent: '• Notarius muhri, bitim sanasi va elektron reyestr raqami.',
        whereToGet: 'Notarial idoradan shartnoma imzolangan zahoti beriladi.',
      ),
      RequiredDocument(
        simpleName: 'Obyekt kadastr pasporti',
        officialName: 'Elektron kadastr yig‘majildi',
        whatIsIt: 'Mulkning chizmasi va xususiyatlari jamlangan hujjat.',
        insideContent: '• Mulkning unikal kadastr raqami va texnik ko‘rsatkichlari.',
        whereToGet: 'Kadastr bazasidan avtomatik olinadi.',
      ),
    ],
    illegalDemands: ['Notarius tasdiqlagan qog‘ozni hokimiyatda qayta muhrlatish', 'Arxivdan qo‘shimcha spravka'],
  ),

  // 4
  KadastrService(
    id: '4',
    titleSimple: 'Davlat reyestridan ko‘chirma olish (Mulkdorlik hujjati)',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish',
    category: 'Maʼlumotnoma',
    purpose: 'Ayni daqiqada mulk kimning nomida turganini isbotlab beruvchi QR-kodli rasmiy davlat hujjati (Guvohnoma o‘rniga o‘tadi).',
    duration: '1 ish kuni (real vaqt rejimida avtomatik)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Eski ko‘k muhrli qog‘oz guvohnomalar bekor bo‘lgan, hozirgi kunda mana shu QR-kodli ko‘chirma yagona yuridik kuchga ega.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkning kadastr raqami',
        officialName: 'Unikal ko‘chmas mulk kadastr raqami',
        whatIsIt: '10:01:... shaklidagi mulkning yagona davlat raqami.',
        insideContent: '• Hududiy zona, massiv va bino kodi.',
        whereToGet: 'Kadastr pasportidan yoki my.gov.uz dagi shaxsiy kabinetdan olinadi.',
      ),
    ],
    illegalDemands: ['Kadastr inspektorining joyiga kelib ko‘rishi'],
  ),

  // 5
  KadastrService(
    id: '5',
    titleSimple: 'Nomida shaxsiy turar joy yo‘qligi haqida maʼlumotnoma',
    titleOfficial: 'Fuqaroning nomida shaxsiy turar joy mavjud yoki mavjud emasligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Davlat subsidiyasi, arzon imtiyozli ipoteka krediti yoki uy-joy navbatiga turish uchun nomingizda mulk yo‘qligini tasdiqlash.',
    duration: 'Avtomatik (1 kun ichida)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Respublika bo‘yicha barcha viloyat bazalari JShSHIR bo‘yicha avtomatik tekshiriladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Pasport / ID-karta (JShSHIR)',
        officialName: 'Ariza beruvchining 14 xonali JShSHIR raqami',
        whatIsIt: 'O‘zbekiston fuqarosining yagona identifikatsiya kodi.',
        insideContent: '• Shaxsiy maʼlumotlar va JShSHIR.',
        whereToGet: 'ID-kartangizning orqa tomonida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Mahalla raisidan "uysiz" degan maʼlumotnoma so‘rash'],
  ),

  // 6
  KadastrService(
    id: '6',
    titleSimple: 'Mulkda taqiq (Zapret) bor-yo‘qligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar mavjudligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Mulkka sud, MIB ijrosi, notarius yoki bank tomonidan taqiq qo‘yilgan-qo‘yilmaganligini oldindan aniqlash.',
    duration: 'Real vaqtda (1 kun)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Taqiqi bor uyni sotib olmang! Taqiq to‘liq yechilmagunicha sotuvchiga zaklad (garov puli) bermang.',
    docs: [
      RequiredDocument(
        simpleName: 'Uyning kadastr raqami',
        officialName: 'Ko‘chmas mulk kadastr raqami',
        whatIsIt: 'Sotib olinayotgan uyning unikal raqami.',
        insideContent: '• Mulkning to‘liq manzili va xususiyatlari.',
        whereToGet: 'Sotuvchining kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['MIB bo‘limiga borib qo‘lda imzo va muhr qo‘ydirib kelish'],
  ),

  // 7
  KadastrService(
    id: '7',
    titleSimple: 'Hovli yoki uyni ikkiga bo‘lish (Alohida qilish)',
    titleOfficial: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati',
    category: 'Chegaralar',
    purpose: 'Bitta umumiy hovlini mulkdorlar o‘rtasida alohida mustaqil ikki yoki undan ortiq xonadonlarga ajratish.',
    duration: '10 dan 15 ish kunigacha',
    cost: 'Maydoni va meʼmoriy chizmasiga asosan',
    warningTip: 'SHAHARSOZLIK MEʼYORI: Har bir yangi hosil bo‘ladigan hovlida umumiy ko‘chaga mustaqil chiqish darvozasi (yo‘li) bo‘lishi shart. Agar yo‘l bo‘lmasa, bo‘lish rad etiladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Taqsimlash kelishuvi yoki sud ajrimi',
        officialName: 'Notarial tasdiqlangan bo‘lish bitimi yoki qonuniy kuchga kirgan sud qarori',
        whatIsIt: 'Mulkdorlar uyni qaysi devordan ajratishga kelishgani hujjati.',
        insideContent: '• Kimga qaysi xonalar va necha sotix yer tegishi haqidagi chizma reja.',
        whereToGet: 'Notarial idorada rasmiylashtiriladi (kelishmovchilik bo‘lsa suddan olinadi).',
      ),
      RequiredDocument(
        simpleName: 'Tuman Qurilish bo‘limi xulosasi',
        officialName: 'Binoni bo‘lishning shaharsozlik va seysmik jihatdan mumkinligi haqida xulosa',
        whatIsIt: 'Imoratni ikkiga bo‘lganda yuk ko‘taruvchi devorlar va xavfsizlikka ziyon yetmasligini tasdiqlovchi hujjat.',
        insideContent: '• Arxitektor ko‘rigi bayonnomasi.',
        whereToGet: 'Tuman qurilish va arxitektura bo‘limidan olinadi.',
      ),
      RequiredDocument(
        simpleName: 'Mavjud umumiy kadastr pasporti',
        officialName: 'Asl kadastr yig‘majildi',
        whatIsIt: 'Uyning butun holatdagi hujjati.',
        insideContent: '• Barcha maydon va chegaralar.',
        whereToGet: 'Mulkdorning qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Kommunal xizmatlarning yangi hisob raqamlarini oldindan talab qilish'],
  ),

  // 8
  KadastrService(
    id: '8',
    titleSimple: 'Ko‘p kvartirali uy oldidagi tutash yerlarni rasmiylashtirish',
    titleOfficial: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatdan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Dom oldidagi o‘yin maydonchasi va yashil hududni begona shaxslar egallab olmasligi uchun dom egalarining umumiy mulki qilib qo‘yish.',
    duration: '10 ish kuni',
    cost: 'Bepul / Minimal stavka',
    warningTip: 'Ushbu yer sotilmaydi yoki bitta shaxsga xususiylashtirilmaydi, u butun dom xonadon egalariga daxlsiz umumiy mulk bo‘ladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkdorlar umumiy yig‘ilishi bayonnomasi',
        officialName: 'Ko‘p kvartirali uy mulkdorlarining umumiy yig‘ilishi qarori',
        whatIsIt: 'Domda yashovchilarning 50% dan ortig‘i yerni rasmiylashtirishga ovoz bergan rasmiy bayonnoma.',
        insideContent: '• Mulkdorlar ro‘yxati, xonadon raqamlari va shaxsiy imzolari.',
        whereToGet: 'Boshqaruv servis kompaniyasi (BSHM) yoki mahalla bilan birga tuziladi.',
      ),
    ],
    illegalDemands: ['Har bir xonadondan alohida pulli ariza talab qilish'],
  ),

  // 9
  KadastrService(
    id: '9',
    titleSimple: 'Bino va inshootlar ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Noturar bino, savdo do‘koni yoki sexni 1 yildan ortiq muddatga ijaraga berganda huquqni mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: '1 yildan oshiq muddatli bino ijaralari kadastrda ro‘yxatdan o‘tkazilmasa, yuridik kuchga ega bo‘lmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Ijara shartnomasi',
        officialName: 'Notarial yoki elektron yozma ijara bitimi',
        whatIsIt: 'Ijara beruvchi va ijarachi o‘rtasidagi rasmiy shartnoma.',
        insideContent: '• Ijara muddati, oylik to‘lov, maydoni va faoliyat maqsadi.',
        whereToGet: 'Notarial idorada yoki soliq portali (ijara.soliq.uz) orqali rasmiylashtiriladi.',
      ),
    ],
    illegalDemands: ['Binoni qayta inventarizatsiyadan o‘tkazish'],
  ),

  // 10
  KadastrService(
    id: '10',
    titleSimple: 'Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Yer uchastkasini uzoq muddatli ijaraga olish shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Fermer, dehqon xo‘jaligi yoki tadbirkorlik yerlarini qonuniy o‘z nomingizga rasmiy mustahkamlash.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 baravari',
    warningTip: 'Faqat E-auksion yoki "E-yer" ochiq elektron tanlovida yutib olingan yer uchastkalari ro‘yxatga olinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron tanlov/auksion bayonnomasi',
        officialName: 'Yer uchastkasi ijara huquqini berish bo‘yicha auksion bayonnomasi',
        whatIsIt: 'Davlat ochiq tanlovida siz g‘olib bo‘lganingizni tasdiqlovchi QR-kodli hujjat.',
        insideContent: '• Kontur raqami, yer maydoni (gektar) va ijara muddati (masalan: 30 yil).',
        whereToGet: 'E-auksion.uz tizimidagi shaxsiy kabinetdan yuklab olinadi.',
      ),
    ],
    illegalDemands: ['Tuman qishloq xo‘jaligi bo‘limidan qo‘shimcha rozilik xati'],
  ),

  // 11
  KadastrService(
    id: '11',
    titleSimple: 'Ipoteka va garov huquqini ro‘yxatga olish / yechish',
    titleOfficial: 'Ko‘chmas mulk ipotekasi va garov shartnomasini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Bankdan kredit olayotganda uyni garovga qo‘yish yoki kredit to‘langach uydan taqiqni yechish.',
    duration: '1 ish kuni',
    cost: 'BHMning 50% miqdorida',
    warningTip: 'Kredit yopilgach, bank xodimi tizim orqali taqiqni yechish arizasini darhol bepul yuborishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Ipoteka shartnomasi',
        officialName: 'Notarial tasdiqlangan ipoteka (garov) shartnomasi',
        whatIsIt: 'Mulk qaysi bankka, qancha kredit evaziga garovga qo‘yilganini bildiruvchi rasmiy hujjat.',
        insideContent: '• Kredit summasi va garovga qo‘yilgan uyning kadastr raqami.',
        whereToGet: 'Bank va notariusdan bir vaqtda beriladi.',
      ),
    ],
    illegalDemands: ['Bank vakilining DXMga shaxsan borishi'],
  ),

  // 12
  KadastrService(
    id: '12',
    titleSimple: 'Servitut kelishuvi (Qo‘shni yeridan yo‘l ochish)',
    titleOfficial: 'Servitut huquqini davlat ro‘yxatidan o‘tkazish',
    category: 'Yer uchastkasi',
    purpose: 'Uyingizga kirish uchun qo‘shnining hovlisidan o‘tish yoki quvur/sim tortish huquqini qonuniylashtirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Servitut rasmiylashtirilsa, qo‘shni o‘zgarganda ham sizning o‘tish huquqingiz o‘z kuchini yo‘qotmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Servitut shartnomasi yoki sud qarori',
        officialName: 'Notarial tasdiqlangan servitut bitimi yoki sud ajrimi',
        whatIsIt: 'Qo‘shnilar yerning qaysi qismidan o‘tishga kelishgani xaritasi bilan.',
        insideContent: '• Yo‘lning eni, uzunligi, koordinatalari va to‘lov miqdori (agar pulli bo‘lsa).',
        whereToGet: 'Notariusda imzolanadi yoki fuqarolik sudidan olinadi.',
      ),
    ],
    illegalDemands: ['Qo‘shnining butun hovlisini qayta xatlovdan o‘tkazish'],
  ),

  // 13
  KadastrService(
    id: '13',
    titleSimple: 'Ko‘p yillik bog‘ va dov-daraxtlarga kadastr olish',
    titleOfficial: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish',
    category: 'Kadastr pasporti',
    purpose: 'Intensiv bog‘lar, mevali daraxtzorlar va uzumzorlarni ko‘chmas mulk sifatida hisobga olish.',
    duration: '5 ish kuni',
    cost: 'Bog‘ maydoniga qarab',
    warningTip: 'Bog‘ barpo etilgan yerga bo‘lgan ijara yoki mulk huquqi bo‘lishi shart.',
    docs: [
      RequiredDocument(
        simpleName: 'Bog‘ yerining hujjati',
        officialName: 'Yer uchastkasi ijara shartnomasi yoki davlat ko‘chirmasi',
        whatIsIt: 'Daraxt ekilgan yer sizga qonuniy biriktirilganini isbotlovchi hujjat.',
        insideContent: '• Yer maydoni, konturi, daraxt navlari va ekilgan yili.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Ekologiya idorasidan qo‘shimcha sertifikat talab qilish'],
  ),

  // 14
  KadastrService(
    id: '14',
    titleSimple: 'Tadbirkorlik uchun yerni E-auksion orqali olish',
    titleOfficial: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish',
    category: 'Auksion',
    purpose: 'Bo‘sh turgan davlat yerlarini savdo, xizmat ko‘rsatish yoki sex qurish uchun halol, ochiq auksionda yutib olish.',
    duration: 'Auksion reglamenti bo‘yicha',
    cost: 'Auksionda shakllangan savdo bahosi',
    warningTip: 'Hokimning yerni to‘g‘ridan-to‘g‘ri ajratish vakolati yo‘q! Birorta amaldorga "yer olib beraman" degan gapiga aldanib pul bermang!',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron raqamli imzo (ERI)',
        officialName: 'ERI kaliti va sertifikati',
        whatIsIt: 'Savdoda qatnashish va g‘oliblik bayonnomasini tasdiqlash uchun raqamli imzo.',
        insideContent: '• Tashkilot yoki fuqaro nomiga rasmiylashtirilgan kalit.',
        whereToGet: 'Davlat xizmatlari markazidan 10 daqiqada olinadi.',
      ),
    ],
    illegalDemands: ['Auksiondan keyin hokimiyatdan qo‘shimcha farmoyish olish'],
  ),

  // 15
  KadastrService(
    id: '15',
    titleSimple: 'Qishloq xo‘jaligi yerlarini ijaraga olish tanlovi',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallangan yerlarni elektron ochiq tanlov orqali berish',
    category: 'Yer uchastkasi',
    purpose: 'Ekin ekish, chorvachilik yoki issiqxona uchun yerlarni "E-yer" portali orqali ijaraga olish.',
    duration: 'Tanlov reglamenti asosida',
    cost: 'Tanlov shartlariga ko‘ra',
    warningTip: 'G‘olib inson aralashuvisiz, kompyuter reytingi orqali ballar asosida shaffof aniqlanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Fermerlik biznes-rejasi',
        officialName: 'Yer uchastkasidan samarali foydalanish taklifi',
        whatIsIt: 'Yerda nima yetishtirmoqchisiz va qancha ish o‘rni yaratasiz, shular ko‘rsatilgan reja.',
        insideContent: '• Ekin turlari, kiritiladigan investitsiya hajmi.',
        whereToGet: 'Ariza beruvchining o‘zi tayyorlaydi.',
      ),
    ],
    illegalDemands: ['Qishloq xo‘jaligi bo‘limidan alohida xat keltirish'],
  ),

  // 16
  KadastrService(
    id: '16',
    titleSimple: 'Eski va yangi kadastr raqamlarini solishtirish',
    titleOfficial: 'Ko‘chmas mulkning yangilangan kadastr raqami to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Eski daftarchadagi raqam yangi elektron tizimda qaysi raqamga o‘zgarganini tasdiqlovchi maʼlumotnoma.',
    duration: 'Avtomatik (1 ish kuni)',
    cost: 'Bepul',
    warningTip: 'Eski uyingiz notariusda chiqmay qolsa, shu maʼlumotnoma bilan ish bitadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Eski kadastr daftarchasi',
        officialName: 'Eski namunadagi texnik pasport',
        whatIsIt: 'Ilgari berilgan qog‘oz daftarcha.',
        insideContent: '• Eski kadastr kodi va uy manzili.',
        whereToGet: 'Shaxsiy arxiv hujjatlari orasidan olinadi.',
      ),
    ],
    illegalDemands: ['Kadastr xodimini uyga chaqirib pul to‘lash'],
  ),

  // 17
  KadastrService(
    id: '17',
    titleSimple: 'Uyga rasmiy ko‘cha nomi va manzil berish',
    titleOfficial: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish (Manzillar reyestri)',
    category: 'Davlat ro‘yxati',
    purpose: 'Yangi qurilgan uyga tuman hokimiyati tomonidan rasmiy ko‘cha nomi va raqam berilishi.',
    duration: '3 ish kuni',
    cost: 'Bepul',
    warningTip: 'Ko‘cha nomi o‘zgarganda hujjatlarni qayta o‘zgartirish majburiy emas, baza buni o‘zi taniydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr pasporti',
        officialName: 'Mulk kadastr yig‘majildi',
        whatIsIt: 'Uyning joylashgan koordinatasini ko‘rsatuvchi hujjat.',
        insideContent: '• Obyektning amaldagi xaritasi va geografik nuqtasi.',
        whereToGet: 'Mulkdorning qo‘lida bo‘ladi.',
      ),
    ],
    illegalDemands: ['Mahalladan ko‘cha nomi haqida spravka so‘rash'],
  ),

  // 18
  KadastrService(
    id: '18',
    titleSimple: 'Uy buzilishga (Snos) tushgan-tushmaganligini aniqlash',
    titleOfficial: 'Ko‘chmas mulkning bosh rejaga asosan buzilishga tushganligi haqida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Shahar bosh rejasiga ko‘ra, uy o‘rnida kelajakda yo‘l yoki ko‘prik tushishi rejalashtirilganini tekshirish.',
    duration: '3 ish kuni',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Uy sotib olayotganda albatta bu maʼlumotnomani tekshiring!',
    docs: [
      RequiredDocument(
        simpleName: 'Kadastr raqami',
        officialName: 'Obyekt kadastr raqami',
        whatIsIt: 'Tekshirilayotgan xonadonning raqami.',
        insideContent: '• Koordinatalar va joylashuv manzili.',
        whereToGet: 'Kadastr pasportidan olinadi.',
      ),
    ],
    illegalDemands: ['Arxitektura bo‘limiga shaxsan borib imzo to‘plash'],
  ),

  // 19
  KadastrService(
    id: '19',
    titleSimple: 'Mulk buzilganda kadastr hisobidan chiqarish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini davlat ro‘yxatidan o‘tkazish',
    category: 'Davlat ro‘yxati',
    purpose: 'Eski uy buzilib o‘rniga yangi qurilayotganda yoki yo‘q bo‘lganda, eski uyni bazadan o‘chirish.',
    duration: '2 ish kuni',
    cost: 'BHMning 0.5 baravari',
    warningTip: 'Buzilgan uyni bazadan chiqarmasangiz, yo‘q uy uchun soliq hisoblanaveradi.',
    docs: [
      RequiredDocument(
        simpleName: 'Buzilganlik dalolatnomasi',
        officialName: 'Bino mavjud emasligi to‘g‘risidagi komissiya dalolatnomasi',
        whatIsIt: 'Bino joyida haqiqatda yo‘qligini tasdiqlovchi rasmiy qog‘oz.',
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
    purpose: 'Katta inshootlar, korxonalar yoki yo‘l qurilish loyihalari uchun aniq geodezik xaritalarni olish.',
    duration: '5 ish kuni',
    cost: 'Xarita hajmiga qarab shartnoma asosida',
    warningTip: 'Qurilishdan oldin aniq geodezik maʼlumot olinsa, yer osti quvurlariga shikast yetmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Loyiha texnik topshirig‘i',
        officialName: 'Tashkilot buyurtmasi va loyihalash ruxsatnomasi',
        whatIsIt: 'Qaysi hududning xaritasi nima uchun kerakligini ko‘rsatuvchi rasmiy so‘rov.',
        insideContent: '• Koordinatalar chegarasi va masshtabi (1:500, 1:2000).',
        whereToGet: 'Loyiha institutidan olinadi.',
      ),
    ],
    illegalDemands: ['Litsenziyasiz vositachilar xizmatidan foydalanishga majburlash'],
  ),

  // 21
  KadastrService(
    id: '21',
    titleSimple: 'Bino ostidagi yerni xususiylashtirish (Sotib olish)',
    titleOfficial: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish',
    category: 'Xususiylashtirish',
    purpose: 'O‘zingizga qarashli xususiy bino yoki korxona turgan yerni bir umrlik shaxsiy xususiy mulk qilib sotib olish.',
    duration: '10 ish kuni',
    cost: 'Yer solig‘ining karrali stavkasida',
    warningTip: 'Xususiylashtirilgan yer — daxlsiz xususiy mulk. Uni hech kim asossiz tortib ololmaydi!',
    docs: [
      RequiredDocument(
        simpleName: 'Binoga bo‘lgan mulkchilik hujjati',
        officialName: 'Bino kadastr pasporti va ro‘yxatdan o‘tganlik ko‘chirmasi',
        whatIsIt: 'Yer ustidagi bino sizniki ekanini tasdiqlovchi hujjat.',
        insideContent: '• Bino maydoni va unikal kadastr raqami.',
        whereToGet: 'Kadastr reyestridan.',
      ),
    ],
    illegalDemands: ['Hokimiyatning alohida yozma ruxsatnomasi'],
  ),

  // 22
  KadastrService(
    id: '22',
    titleSimple: 'Hujjatsiz uylarni qonuniylashtirish (O‘RQ-937 Qonuni)',
    titleOfficial: 'O‘zboshimchalik bilan egallangan yer uchastkalari hamda ularda qurilgan binolarga bo‘lgan huquqlarni eʼtirof etish (05.08.2024 yildagi O‘RQ-937-son Qonun)',
    category: 'Qonuniylashtirish',
    purpose: 'Ko‘p yillardan beri yashab kelayotgan, lekin hujjati bo‘lmagan xonadonlarga amaldagi O‘RQ-937-son Qonun doirasida qonuniy mulk huquqini eʼtirof etish.',
    duration: 'Bosqichma-bosqich reja-jadval asosida (xatlov davomida)',
    cost: 'Qonunda belgilangan bir martalik qonuniy yig‘im (BHM miqdorida)',
    warningTip: 'OGOH BO‘LING: Hech kimga "men uyingizni amnistiyaga kiritib tezlashtirib beraman" degan maklerlarga pul bermang! Hududlar kadastr xodimlari tomonidan dron orqali va mahallama-mahalla bepul xatlov qilinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uzoq yillik to‘lovlar va foydalanish dalillari',
        officialName: 'Yer va mol-mulk solig‘i cheklari, elektr, gaz, suv to‘lov daftarlari',
        whatIsIt: 'Siz ushbu uyni kecha emas, ko‘p yillardan buyon egallab yashab kelayotganingizni tasdiqlovchi cheklar.',
        insideContent: '• To‘lov qilingan sana va to‘lovchi F.I.Sh.',
        whereToGet: 'Shaxsiy arxiv kvitansiyalari, bank yoki to‘lov tizimlari arxivlaridan.',
      ),
      RequiredDocument(
        simpleName: 'Qurilish va arxitektura bo‘limi xulosasi',
        officialName: 'Bino shaharsozlik va xavfsizlik talablariga muvofiqligi to‘g‘risida komissiya xulosasi',
        whatIsIt: 'Imorat magistral quvur, yuqori kuchlanishli elektr tarmog‘i yoki daryo muhofaza zonasida joylashmaganini tasdiqlovchi xulosa.',
        insideContent: '• Maxsus komissiya ko‘rigi bayonnomasi.',
        whereToGet: 'Xatlov jarayonida hududiy komissiya tomonidan bepul o‘rganiladi.',
      ),
    ],
    illegalDemands: ['Vositachilik haqlari', 'Norasmiy komissiya yig‘imlari'],
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
    simpleExplanation: 'Tuman yoki shahar hokimi tomonidan fuqaro yoki korxonaga yer ajratish, uy qurishga ruxsat berish haqida chiqarilgan rasmiy buyruq qog‘ozi. (Hozirda yangi yer ajratish vakolati bekor qilingan, faqat eski qonuniy qarorlar kuchga ega).',
    whatIsInside: '• Qaror qabul qilingan sana, hokim imzosi va dumaloq gerbli muhr;\n• Kimga, qancha yer va qanday maqsadda berilgani;\n• Yerning aniq joylashuvi va chegaralari.',
    whereToFind: 'Qo‘lingizdagi asl nusxa yo‘qolgan bo‘lsa, tegishli tuman hokimligining devonxonasidan yoki viloyat davlat arxividan tasdiqlangan nusxasi olinadi.',
  ),
  DocVocabulary(
    term: 'Oldi-sotdi shartnomasi nima?',
    simpleExplanation: 'Siz uyni birovdan pul to‘lab sotib olganingizda, notarius ishtirokida imzolanadigan eng asosiy gerbli hujjat.',
    whatIsInside: '• Sotuvchi va xaridorning pasport maʼlumotlari;\n• Mulkning aniq manzili va sotilgan summasi;\n• Notariusning gerbli muhri, maxsus blanka seriya raqami va reyestr yozuvi.',
    whereToFind: 'Shartnoma tuzilgan notarial idoradan (dublikat sifatida olinishi mumkin).',
  ),
  DocVocabulary(
    term: 'Mulk huquqi ko‘chirmasi (Vipiska) nima?',
    simpleExplanation: 'Eski ko‘k muhrli qog‘oz guvohnomalar o‘rniga hozir beriladigan yagona elektron QR-kodli hujjat. Bu hujjat ayni daqiqada uy kimga tegishli ekanini isbotlaydi.',
    whatIsInside: '• Mulkning unikal kadastr raqami;\n• Hozirgi qonuniy egasining F.I.Sh;\n• Mulk maydoni va haqiqiy ekanini tasdiqlovchi maxsus QR-kod.',
    whereToFind: 'my.gov.uz portali orqali 1 daqiqada yuklab olinadi yoki Davlat xizmatlari markazidan olinadi.',
  ),
  DocVocabulary(
    term: 'APZ (Arxitektura-rejalashtirish topshirig‘i) nima?',
    simpleExplanation: 'Uy yoki bino qurishdan oldin tuman arxitektura bo‘limi tomonidan beriladigan ruxsatnoma. Unda bino necha qavat bo‘lishi, qo‘shnining devoridan necha metr uzoqda qurilishi kerakligi yoziladi.',
    whatIsInside: '• Qavatlar soni, qizil chiziq chegaralari;\n• Muhandislik tarmoqlariga (gaz, svet, suv) ulanish shartlari.',
    whereToGet: 'my.gov.uz orqali yoki Davlat xizmatlari markazidan olinadi.',
  ),
  DocVocabulary(
    term: 'Foydalanishga qabul qilish dalolatnomasi nima?',
    simpleExplanation: 'Bino yangi qurib bitkazilgach, Qurilish nazorati inspeksiyasi (GASN) kelib bino xavfsiz qurilganini tasdiqlovchi hujjat.',
    whatIsInside: '• Qurilish loyihasiga muvofiqlik bayonnomasi;\n• Yong‘in xavfsizligi va seysmik xulosalar.',
    whereToGet: 'Qurilish va arxitektura nazorati inspeksiyasidan olinadi.',
  ),
  DocVocabulary(
    term: 'Meros guvohnomasi nima?',
    simpleExplanation: 'Uy egasi vafot etganidan so‘ng, uning uyi farzandlariga yoki qonuniy merosxo‘rlariga o‘tganini tasdiqlovchi rasmiy notarial hujjat.',
    whatIsInside: '• Vafot etgan shaxsning o‘lim guvohnomasi rekvizitlari;\n• Merosxo‘rlarning qarindoshlik darajasi va ularga tekkan mulk ulushi (masalan: 1/2 qism).',
    whereToFind: 'Meros ishi ochilgan notarial idoradan olinadi.',
  ),
  DocVocabulary(
    term: 'Kadastr pasporti nima?',
    simpleExplanation: 'Uyingizning texnik hujjati. Unda uyingiz necha xonadan iboratligi, devorlari qanday g‘ishtdan qurilgani, hovlingiz necha sotix ekani va xaritasi chizilgan bo‘ladi.',
    whatIsInside: '• Uyning umumiy va yashash maydoni chizmasi;\n• Kommunikatsiya tarmoqlari borligi;\n• Qurilgan yil va texnik parametrlar.',
    whereToFind: 'Kadastr filiali mutaxassislari tomonidan o‘lchab tuziladi va elektron shaklda beriladi.',
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
              subtitle: const Text('Amaldagi qonuniy meʼyorlar bilan'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Colors.indigo),
              title: const Text('Hujjatlar nima? (Qomus)'),
              subtitle: const Text('Qaror, APZ, ko‘chirma, shartnoma'),
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
                    'Har bir hujjat ustiga bosing — uning tavsifi, ichida nimalar yozilgan bo‘lishi va qaysi idoradan olinishi chiqadi!',
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

// ---------------- LOYIHA MAQSADI VA ALOQA EKRANI ----------------
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
          // LOYIHANING RASMIY MAQSADI
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
                    'Kadastr sohasida oddiy aholi va tadbirkorlarning eng ko‘p sarson bo‘lishi hamda noqonuniy talablarga duch kelishi — fuqarolarning o‘zida qanday hujjatlar borligini, qaysi hujjatlar yetishmasligini va yetishmayotgan hujjatlarni aynan qayerdan (Arxitektura, Qurilish, Notarius yoki Arxiv) olish kerakligini bilmasligidan kelib chiqadi.\n\n'
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
