import 'package:flutter/material.dart';

void main() {
  runApp(const OsonKadastrApp());
}

enum AppLanguage { uzbekLatin, uzbekCyrillic, russian }

class OsonKadastrApp extends StatefulWidget {
  const OsonKadastrApp({super.key});

  static _OsonKadastrAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_OsonKadastrAppState>()!;

  @override
  State<OsonKadastrApp> createState() => _OsonKadastrAppState();
}

class _OsonKadastrAppState extends State<OsonKadastrApp> {
  AppLanguage currentLanguage = AppLanguage.uzbekLatin;

  void changeLanguage(AppLanguage newLang) {
    setState(() {
      currentLanguage = newLang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oson Kadastr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF08336E)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: MainNavigationScreen(
        currentLanguage: currentLanguage,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

// ---------------- TIL MATN MODELLARI ----------------
class MultiLangText {
  final String uz;
  final String kr;
  final String ru;

  MultiLangText({required this.uz, required this.kr, required this.ru});

  String get(AppLanguage lang) {
    switch (lang) {
      case AppLanguage.uzbekCyrillic:
        return kr;
      case AppLanguage.russian:
        return ru;
      case AppLanguage.uzbekLatin:
      default:
        return uz;
    }
  }
}

class RequiredDocument {
  final MultiLangText simpleName;
  final MultiLangText officialName;
  final MultiLangText whatIsIt;
  final MultiLangText insideContent;
  final MultiLangText whereToGet;
  final MultiLangText arxitekturaBoglanishi;

  RequiredDocument({
    required this.simpleName,
    required this.officialName,
    required this.whatIsIt,
    required this.insideContent,
    required this.whereToGet,
    required this.arxitekturaBoglanishi,
  });
}

class KadastrService {
  final String id;
  final IconData icon;
  final MultiLangText titleSimple;
  final MultiLangText titleOfficial;
  final String categoryId;
  final MultiLangText purpose;
  final MultiLangText duration;
  final MultiLangText cost;
  final List<RequiredDocument> docs;
  final List<MultiLangText> illegalDemands;
  final MultiLangText warningTip;

  KadastrService({
    required this.id,
    required this.icon,
    required this.titleSimple,
    required this.titleOfficial,
    required this.categoryId,
    required this.purpose,
    required this.duration,
    required this.cost,
    required this.docs,
    required this.illegalDemands,
    required this.warningTip,
  });
}

class ServiceCategory {
  final String id;
  final IconData icon;
  final Color color;
  final MultiLangText title;
  final MultiLangText description;

  ServiceCategory({
    required this.id,
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
  });
}

// ---------------- 6 TA ASOSIY YO‘NALISH ----------------
final List<ServiceCategory> allCategories = [
  ServiceCategory(
    id: 'turar',
    icon: Icons.home,
    color: const Color(0xFF0D47A1),
    title: MultiLangText(uz: 'Aholi turar joy xizmatlari', kr: 'Аҳоли турар жой хизматлари', ru: 'Жилая недвижимость граждан'),
    description: MultiLangText(uz: 'Kvartiralar, yakka tartibdagi hovli uylar, uy bo‘lish va manzil berish.', kr: 'Квартиралар, ҳовли уйлар, бўлиш ва манзил бериш.', ru: 'Квартиры, частные дома, раздел жилья и адреса.'),
  ),
  ServiceCategory(
    id: 'noturar',
    icon: Icons.storefront,
    color: const Color(0xFF00695C),
    title: MultiLangText(uz: 'Tadbirkorlik va noturar binolar', kr: 'Тадбиркорлик ва нотурар бинолар', ru: 'Коммерческая недвижимость'),
    description: MultiLangText(uz: 'Do‘konlar, ofislar, ishlab chiqarish sexlari va ijara munosabatlari.', kr: 'Дўконлар, офислар, ишлаб чиқариш цехлари ва ижара.', ru: 'Магазины, офисы, склады, производство и аренда.'),
  ),
  ServiceCategory(
    id: 'qonun937',
    icon: Icons.verified,
    color: const Color(0xFFE65100),
    title: MultiLangText(uz: 'O‘RQ-937 Qonuni (Amnistiya)', kr: 'ЎРҚ-937 Қонуни (Амнистия)', ru: 'Закон ЗРУ-937 (Амнистия)'),
    description: MultiLangText(uz: 'Hujjatsiz uylar, o‘zboshimchalik bilan egallangan yerlarni qonuniylashtirish.', kr: 'Ҳужжатсиз уйлар, эгалланган ерларни қонунийлаштириш.', ru: 'Признание прав на самовольные дома и участки.'),
  ),
  ServiceCategory(
    id: 'qurilish',
    icon: Icons.architecture,
    color: const Color(0xFF4A148C),
    title: MultiLangText(uz: 'Yangi qurilish va Arxitektura', kr: 'Янги қурилиш ва Архитектура', ru: 'Строительство и Архитектура'),
    description: MultiLangText(uz: 'APZ, litsenziyali loyiha chizmalari, rekonstruksiya va GASN xulosalari.', kr: 'АПЗ, лойиҳа чизмалари, реконструкция ва ГАСН хулосалари.', ru: 'АПЗ, проектные чертежи, реконструкция и ГАСН.'),
  ),
  ServiceCategory(
    id: 'yer',
    icon: Icons.landscape,
    color: const Color(0xFF2E7D32),
    title: MultiLangText(uz: 'Yer uchastkalari va Auksion', kr: 'Ер участкалари ва Аукцион', ru: 'Земельные участки и Аукцион'),
    description: MultiLangText(uz: 'E-auksion orqali yer olish, fermer xo‘jaligi ijarasi va servitut.', kr: 'Э-аукцион орқали ер олиш, фермер ижараси ва сервитут.', ru: 'Покупка земли на онлайн-торгах, аренда и сервитут.'),
  ),
  ServiceCategory(
    id: 'spravka',
    icon: Icons.description,
    color: const Color(0xFF37474F),
    title: MultiLangText(uz: 'Elektron maʼlumotnomalar va Reyestr', kr: 'Электрон маълумотномалар ва Реестр', ru: 'Справки и выписки из реестра'),
    description: MultiLangText(uz: 'Mulk ko‘chirmasi (Vipiska), taqiq (zapret) va uy yo‘qligi spravkasi.', kr: 'Мулк кўчирмаси (Виписка), тақиқ (запрет) ва уй йўқлиги.', ru: 'Выписки с QR-кодом, аресты/запреты и справки об отсутствии.'),
  ),
];

// ---------------- 22 TA TO‘LIQ XIZMAT ----------------
final List<KadastrService> all22Services = [
  KadastrService(
    id: '1',
    icon: Icons.home_work,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '1. Uy-joyga kadastr pasportini shakllantirish', kr: '1. Уй-жойга кадастр паспортини шакллантириш', ru: '1. Оформление кадастрового паспорта на жилье'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk obyektiga (turar joy) kadastr pasportini berish (VM 535-son qaror)', kr: 'Кўчмас мулк объектига (турар жой) кадастр паспортини бериш', ru: 'Выдача кадастрового паспорта на жилой объект (ПКМ №535)'),
    purpose: MultiLangText(uz: 'Kvartira yoki hovli uyning texnik parametrlarini o‘lchab, rasmiy elektron pasport va raqamli chizmasini tayyorlash.', kr: 'Квартира ёки ҳовли уйнинг параметрларини ўлчаб, электрон паспорт тайёрлаш.', ru: 'Замер параметров и создание электронного техпаспорта жилья.'),
    duration: MultiLangText(uz: 'Kvartira: 3 ish kuni; Hovli uy: 5 ish kuni', kr: 'Квартира: 3 иш куни; Ҳовли уй: 5 иш куни', ru: 'Квартира: 3 раб. дня; Дом: 5 раб. дней'),
    cost: MultiLangText(uz: 'Maydoniga qarab invoys bo‘yicha (my.gov.uz orqali 10% chegirma)', kr: 'Майдонига қараб инвойс (my.gov.uz орқали 10% чегирма)', ru: 'По инвойсу от площади (10% скидка на my.gov.uz)'),
    warningTip: MultiLangText(uz: 'Qayta qurilgan xonalar bo‘lsa, arxitektura ruxsatnomasi talab qilinadi. Naqd pul bermang, to‘lov faqat elektron kvitansiya bilan!', kr: 'Қайта қурилган хоналар бўлса архитектура рухсати керак. Нақд пул берманг!', ru: 'При перепланировке требуется разрешение архитектуры. Оплата только по инвойсу!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Mulk huquqini tasdiqlovchi hujjat', kr: 'Мулк ҳуқуқини тасдиқловчи ҳужжат', ru: 'Правоустанавливающий документ'),
        officialName: MultiLangText(uz: 'Oldi-sotdi, hadya bitimi, hokim qarori yoki meros guvohnomasi', kr: 'Олди-сотди, ҳадя битими, ҳоким қарори ёки мерос гувоҳномаси', ru: 'Договор купли-продажи, дарения, решение хокима, наследство'),
        whatIsIt: MultiLangText(uz: 'Mulkka qonuniy ega bo‘lganingizni tasdiqlovchi gerbli davlat hujjati.', kr: 'Мулкка эга бўлганингизни тасдиқловчи гербли давлат ҳужжати.', ru: 'Гербовый документ о законном праве собственности.'),
        insideContent: MultiLangText(uz: '• Notarius muhri va reyestr raqami;\n• Mulkdorning F.I.Sh. va aniq manzili.', kr: '• Нотариус муҳри ва реестр рақами;\n• Ф.И.Ш. ва аниқ манзил.', ru: '• Печать нотариуса, номер реестра;\n• Ф.И.О. владельца и адрес объекта.'),
        whereToGet: MultiLangText(uz: 'Notarial idoradan, hokimlik devonxonasidan yoki davlat arxividan.', kr: 'Нотариал идорадан, ҳокимликдан ёки давлат архивидан.', ru: 'В нотариальной конторе, хокимияте или госархиве.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Mavjud uyni qayta pasportlashtirishda arxitektura talab etilmaydi. Faqat devor surilgan yoki qo‘shimcha bino qurilgan bo‘lsa arxitektura kerak.', kr: 'Мавжуд уйда архитектура шарт эмас. Фақат девор сурилган бўлса керак.', ru: 'При обычном переоформлении архитектура не требуется, только при пристройках.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan maʼlumotnoma', kr: 'Маҳалладан маълумотнома', ru: 'Справка с махалли'),
      MultiLangText(uz: 'Qo‘shnilar tilxati', kr: 'Қўшнилар тилхати', ru: 'Расписка соседей'),
    ],
  ),
  KadastrService(
    id: '2',
    icon: Icons.storefront,
    categoryId: 'noturar',
    titleSimple: MultiLangText(uz: '2. Noturar tijorat binolariga kadastr pasporti olish', kr: '2. Нотурар тижорат биноларига кадастр паспорти олиш', ru: '2. Кадастровый паспорт на коммерческое нежилое здание'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish', kr: 'Кўчмас мулк объектига (нотурар бино) кадастр паспортини бериш', ru: 'Выдача кадастрового паспорта на нежилое здание'),
    purpose: MultiLangText(uz: 'Do‘kon, ofis, savdo markazi yoki sexlarning kadastr hujjatini tayyorlash.', kr: 'Дўкон, офис, цехларнинг кадастр ҳужжатини тайёрлаш.', ru: 'Оформление техпаспорта на магазины, офисы и склады.'),
    duration: MultiLangText(uz: '100 kv.m gacha — 5 ish kuni; 1000 kv.m gacha — 7 ish kuni', kr: '100 кв.м гача — 5 кун; 1000 кв.м гача — 7 кун', ru: 'До 100 кв.м — 5 дней; До 1000 кв.м — 7 дней'),
    cost: MultiLangText(uz: 'Davlat tarifi bo‘yicha hisoblangan invoys', kr: 'Давлат тарифи бўйича инвойс', ru: 'По утвержденному тарифу через инвойс'),
    warningTip: MultiLangText(uz: 'Yangi qurilgan tijorat binosi bo‘lsa, Shaharsozlik inspeksiyasi (GASN) qabul xulosasi talab etiladi.', kr: 'Янги тижорат биноси бўлса, ГАСН қабул хулосаси талаб этилади.', ru: 'Для новых коммерческих объектов обязателен акт инспекции ГАСН.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'GASN qabul dalolatnomasi', kr: 'ГАСН қабул далолатномаси', ru: 'Акт ввода в эксплуатацию ГАСН'),
        officialName: MultiLangText(uz: 'Bino va inshootni foydalanishga qabul qilish ruxsatnomasi', kr: 'Бинони фойдаланишга қабул қилиш рухсатномаси', ru: 'Разрешение на ввод в эксплуатацию объекта'),
        whatIsIt: MultiLangText(uz: 'Qurilish nazorati inspektori bino xavfsiz qurilganini tasdiqlovchi rasmiy hujjat.', kr: 'Қурилиш назорати инспектори хавфсизликни тасдиқловчи ҳужжат.', ru: 'Акт инспекции Минстроя о соответствии нормам безопасности.'),
        insideContent: MultiLangText(uz: '• Yong‘in, seysmik va arxitektura kelishuvlari.', kr: '• Ёнғин, сейсмик ва архитектура келишувлари.', ru: '• Заключения по пожарной, сейсмической безопасности.'),
        whereToGet: MultiLangText(uz: 'Qurilish vazirligi hududiy nazorat inspeksiyasidan (DXM orqali).', kr: 'Қурилиш инспекциясидан (ДХМ орқали).', ru: 'В инспекции стройнадзора через Центр госуслуг.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Tadbirkorlik binolarida arxitektura tasdiqlagan loyiha va GASN dalolatnomasi asosiy hujjat hisoblanadi.', kr: 'Тижорат биноларида архитектура лойиҳаси ва ГАСН далолатномаси асосийдир.', ru: 'Без согласованного проекта и акта ГАСН коммерческий объект не регистрируется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Soliqdan qarz yo‘qligi maʼlumotnomasi', kr: 'Солиқдан қарз йўқлиги маълумотномаси', ru: 'Справка об отсутствии задолженности по налогам'),
    ],
  ),
  KadastrService(
    id: '3',
    icon: Icons.verified_user,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '3. Mulk huquqini davlat ro‘yxatidan o‘tkazish (Reyestr)', kr: '3. Мулк ҳуқуқини давлат рўйхатидан ўтказиш (Реестр)', ru: '3. Госрегистрация прав на недвижимость'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish', kr: 'Кўчмас мулкка бўлган ҳуқуқларни давлат рўйхатидан ўтказиш', ru: 'Госрегистрация прав на недвижимое имущество в реестре'),
    purpose: MultiLangText(uz: 'Notariusda tuzilgan oldi-sotdi, hadya yoki merosdan so‘ng yangi mulkdorni davlat bazasiga qonuniy ega sifatida kiritish.', kr: 'Нотариусдан сўнг янги мулкдорни давлат базасига расман киритиш.', ru: 'Внесение нового владельца в Единый госреестр после сделки.'),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 1 dan 1.25 baravarigacha', kr: 'БҲМнинг 1 дан 1.25 бараваригача', ru: 'От 1 до 1.25 БРВ'),
    warningTip: MultiLangText(uz: 'Notarial bitimdan so‘ng 1 oy ichida ro‘yxatdan o‘tkazilmasa, maʼmuriy jarima qo‘llaniladi!', kr: 'Битимдан сўнг 1 ой ичида рўйхатдан ўтказилмаса, жарима солинади!', ru: 'При пропуске 1 месяца со дня сделки налагается штраф!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Notarial tasdiqlangan shartnoma', kr: 'Нотариал тасдиқланган шартнома', ru: 'Нотариальный договор'),
        officialName: MultiLangText(uz: 'Oldi-sotdi, hadya yoki meros hujjati', kr: 'Олди-сотди, ҳадя ёки мерос ҳужжати', ru: 'Договор купли-продажи, дарения, св-во о наследстве'),
        whatIsIt: MultiLangText(uz: 'Notariusda tuzilgan gerbli bitim.', kr: 'Нотариусда тузилган гербли битим.', ru: 'Нотариально заверенный договор.'),
        insideContent: MultiLangText(uz: '• Notarius muhri, QR-kod va reyestr raqami.', kr: '• Нотариус муҳри, QR-код ва реестр рақами.', ru: '• Печать нотариуса, QR-код и номер реестра.'),
        whereToGet: MultiLangText(uz: 'Bitim tuzilgan notarial idoradan beriladi.', kr: 'Нотариал идорадан берилади.', ru: 'Выдается нотариальной конторой.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimiyatda qayta tasdiqlatish', kr: 'Ҳокимиятда қайта тасдиқлатиш', ru: 'Повторное заверение в хокимияте'),
    ],
  ),
  KadastrService(
    id: '4',
    icon: Icons.qr_code_2,
    categoryId: 'spravka',
    titleSimple: MultiLangText(uz: '4. Davlat reyestridan elektron ko‘chirma olish (Vipiska)', kr: '4. Давлат реестридан электрон кўчирма олиш (Виписка)', ru: '4. Выписка из Госреестра прав (Выписка)'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish', kr: 'Кўчмас мулк бўйича давлат реестридан кўчирма бериш', ru: 'Предоставление выписки из Государственного реестра'),
    purpose: MultiLangText(uz: 'Ayni paytda mulk kimning nomida ekanini isbotlovchi QR-kodli yagona qonuniy hujjat.', kr: 'Мулк айни пайтда кимнинг номида эканини исботловчи QR-кодли ҳужжат.', ru: 'Официальный электронный документ с QR-кодом о собственнике.'),
    duration: MultiLangText(uz: 'Real vaqtda (avtomat, 1 kun)', kr: 'Реал вақтда (автомат, 1 кун)', ru: 'В реальном времени (1 день)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari (taxminan 18 750 so‘m)', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(uz: 'Eski ko‘k qog‘oz guvohnomalar bekor qilingan, faqat mana shu QR-kodli ko‘chirma yuridik kuchga ega.', kr: 'Эски кўк қоғозлар бекор бўлган, фақат шу QR-кодли кўчирма амал қилади.', ru: 'Бумажные свидетельства отменены, юридическую силу имеет выписка с QR-кодом.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Mulkning kadastr raqami', kr: 'Мулкнинг кадастр рақами', ru: 'Кадастровый номер'),
        officialName: MultiLangText(uz: 'Unikal ko‘chmas mulk kadastr kodi', kr: 'Уникал кўчмас мулк кадастр коди', ru: 'Уникальный кадастровый номер'),
        whatIsIt: MultiLangText(uz: 'Mulkka berilgan 10:01... shaklidagi raqam.', kr: 'Мулкнинг 10:01... шаклидаги рақами.', ru: 'Номер объекта в формате 10:01...'),
        insideContent: MultiLangText(uz: '• Hududiy va bino kodi.', kr: '• Ҳудудий ва бино коди.', ru: '• Зональный и пообъектный код.'),
        whereToGet: MultiLangText(uz: 'Kadastr pasportidan yoki my.gov.uz dan olinadi.', kr: 'Кадастр паспортидан ёки my.gov.uz дан.', ru: 'Из паспорта объекта или кабинета my.gov.uz.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Kadastr xodimining uyga kelishi', kr: 'Кадастр ходимининг уйга келиши', ru: 'Выезд сотрудника кадастра'),
    ],
  ),
  KadastrService(
    id: '5',
    icon: Icons.person_off,
    categoryId: 'spravka',
    titleSimple: MultiLangText(uz: '5. Nomida shaxsiy turar joy yo‘qligi haqida maʼlumotnoma', kr: '5. Номида турар жой йўқлиги ҳақида маълумотнома', ru: '5. Справка об отсутствии жилья в собственности'),
    titleOfficial: MultiLangText(uz: 'Fuqaroning nomida shaxsiy turar joy mavjud emasligi to‘g‘risida maʼlumotnoma', kr: 'Фуқаро номида турар жой мавжуд эмаслиги тўғрисида маълумотнома', ru: 'Справка об отсутствии жилья на праве собственности'),
    purpose: MultiLangText(uz: 'Subsidiya yoki arzon kredit olish uchun nomingizda uy yo‘qligini tasdiqlash.', kr: 'Субсидия ёки кредит олиш учун номда уй йўқлигини тасдиқлаш.', ru: 'Подтверждение отсутствия недвижимости для субсидий.'),
    duration: MultiLangText(uz: 'Avtomatik (1 kun)', kr: 'Автоматик (1 кун)', ru: 'Автоматически (1 день)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(uz: 'Respublika bo‘yicha barcha viloyat bazalari JShSHIR bo‘yicha avtomatik tekshiriladi.', kr: 'Бутун республика бўйича ЖШШИР орқали автоматик текширилади.', ru: 'Автоматическая проверка баз всех областей по ПИНФЛ.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Pasport / ID-karta (JShSHIR)', kr: 'Паспорт / ID-карта (ЖШШИР)', ru: 'ID-карта (ПИНФЛ)'),
        officialName: MultiLangText(uz: 'Fuqaroning 14 xonali shaxsiy identifikatsiya raqami', kr: '14 хонали ЖШШИР рақами', ru: '14-значный ПИНФЛ заявителя'),
        whatIsIt: MultiLangText(uz: 'Shaxsiy davlat identifikatsiya kodi.', kr: 'Шахсий давлат коди.', ru: 'Персональный код гражданина.'),
        insideContent: MultiLangText(uz: '• F.I.Sh. va JShSHIR.', kr: '• Ф.И.Ш. ва ЖШШИР.', ru: '• Ф.И.О. и ПИНФЛ.'),
        whereToGet: MultiLangText(uz: 'ID-kartangizning orqasida bo‘ladi.', kr: 'ID-карта орқасида бўлади.', ru: 'На обороте ID-карты.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan maʼlumotnoma so‘rash', kr: 'Маҳалладан маълумотнома сўраш', ru: 'Справка с махалли'),
    ],
  ),
  KadastrService(
    id: '6',
    icon: Icons.block,
    categoryId: 'spravka',
    titleSimple: MultiLangText(uz: '6. Mulkda taqiq (Zapret) bor-yo‘qligini tekshirish', kr: '6. Мулкда тақиқ (Запрет) бор-йўқлигини текшириш', ru: '6. Проверка наличия арестов и запретов (Запрет)'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar mavjudligi to‘g‘risida maʼlumotnoma', kr: 'Кўчмас мулк бўйича тақиқ ва хатловлар тўғрисида маълумотнома', ru: 'Справка о наличии арестов и запретов на недвижимость'),
    purpose: MultiLangText(uz: 'Mulkka sud, MIB ijrosi, notarius yoki bank tomonidan taqiq qo‘yilganini oldindan bilish.', kr: 'Мулкка суд, МИБ ёки банк томонидан тақиқ қўйилганини аниқлаш.', ru: 'Проверка жилья на судебные аресты, запреты БПИ или банковские залоги.'),
    duration: MultiLangText(uz: 'Real vaqtda (avtomat, 1 kun)', kr: 'Реал вақтда (1 кун)', ru: 'В реальном времени (1 день)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(uz: 'Taqiqi bor uyni sotib olmang va taqiq rasman yechilmaguncha zaklad bermang!', kr: 'Тақиқи бор уйни сотиб олманг ва заклад берманг!', ru: 'Не покупайте жилье до официального снятия ареста!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Uyning kadastr raqami', kr: 'Уйнинг кадастр рақами', ru: 'Кадастровый номер жилья'),
        officialName: MultiLangText(uz: 'Tekshirilayotgan obyekt kadastr raqami', kr: 'Текширилаётган кадастр рақами', ru: 'Кадастровый номер проверяемого объекта'),
        whatIsIt: MultiLangText(uz: 'Sotib olinayotgan uyning unikal raqami.', kr: 'Уйнинг уникал рақами.', ru: 'Номер проверяемого объекта.'),
        insideContent: MultiLangText(uz: '• Manzil va bino parametrlari.', kr: '• Манзил ва параметрлар.', ru: '• Параметры и адрес.'),
        whereToGet: MultiLangText(uz: 'Sotuvchining kadastr pasportidan olinadi.', kr: 'Сотувчининг паспортидан.', ru: 'Из паспорта собственника.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'MIB idorasiga borib imzo qo‘ydirish', kr: 'МИБга бориб имзо қўйдириш', ru: 'Подпись из отдела БПИ'),
    ],
  ),
  KadastrService(
    id: '7',
    icon: Icons.call_split,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '7. Hovli yoki uyni ikkiga bo‘lish (Alohida qilish)', kr: '7. Ҳовли ёки уйни иккига бўлиш (Алоҳида қилиш)', ru: '7. Раздел или объединение объектов недвижимости'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati', kr: 'Кўчмас мулк объектини бўлиш ёки бирлаштириш хизмати', ru: 'Государственная услуга по разделу или объединению недвижимости'),
    purpose: MultiLangText(uz: 'Umumiy bitta hovlini mulkdorlar o‘rtasida alohida mustaqil xonadonlarga ajratish.', kr: 'Умумий ҳовлини алоҳида мустақил хонадонларга ажратиш.', ru: 'Раздел единого жилого двора на самостоятельные жилые дома.'),
    duration: MultiLangText(uz: '10 dan 15 ish kunigacha', kr: '10 дан 15 иш кунигача', ru: 'От 10 до 15 раб. дней'),
    cost: MultiLangText(uz: 'Maydoni va yangi chizmalariga asosan invoys', kr: 'Майдонига асосан инвойс', ru: 'По инвойсу от площади раздела'),
    warningTip: MultiLangText(uz: 'Har bir yangi ajratilgan hovlida ko‘chaga mustaqil chiqish darvozasi bo‘lishi shart!', kr: 'Ҳар бир янги ҳовлида кўчага чиқиш йўли бўлиши шарт!', ru: 'Каждый выделяемый дом должен иметь независимый выход на улицу!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Qurilish va arxitektura bo‘limi xulosasi', kr: 'Қурилиш ва архитектура бўлими хулосаси', ru: 'Заключение отдела архитектуры'),
        officialName: MultiLangText(uz: 'Binoni bo‘lishning shaharsozlik jihatdan mumkinligi haqida xulosa', kr: 'Бинони бўлиш мумкинлиги ҳақида хулоса', ru: 'Заключение о градостроительной возможности раздела'),
        whatIsIt: MultiLangText(uz: 'Devorlarga ziyon yetmasligini tasdiqlovchi hujjat.', kr: 'Деворларга зиён етмаслигини тасдиқловчи ҳужжат.', ru: 'Заключение о сохранении несущей способности стен.'),
        insideContent: MultiLangText(uz: '• Arxitektor chizmasi va xulosa dalolatnomasi.', kr: '• Архитектор чизмаси ва далолатнома.', ru: '• Схема разделения и экспертное заключение.'),
        whereToGet: MultiLangText(uz: 'Tuman qurilish va arxitektura bo‘limidan (DXM orqali).', kr: 'Туман архитектура бўлимидан (ДХМ орқали).', ru: 'В отделе архитектуры через Центр госуслуг.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Bosh arxitektor xulosasisiz kadastr alohida raqam bera olmaydi.', kr: 'Бош архитектор хулосасисиз кадастр рақам бермайди.', ru: 'Без заключения главного архитектора раздел невозможен.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Yangi hisob raqamlarni oldindan talab qilish', kr: 'Янги ҳисобларни олдиндан талаб қилиш', ru: 'Открытие новых лицевых счетов заранее'),
    ],
  ),
  KadastrService(
    id: '8',
    icon: Icons.apartment,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '8. Ko‘p kvartirali uy oldidagi tutash yerlarni rasmiylashtirish', kr: '8. Кўп қаватли уй туташ ерларини расмийлаштириш', ru: '8. Оформление придомового участка многоквартирного дома'),
    titleOfficial: MultiLangText(uz: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatdan o‘tkazish', kr: 'Кўп квартирали уйга туташ ерни рўйхатдан ўтказиш', ru: 'Регистрация придомового участка многоквартирного дома'),
    purpose: MultiLangText(uz: 'Dom oldidagi maydonni aholining umumiy mulki sifatida rasmiylashtirish.', kr: 'Дом олдини аҳолининг умумий мулки сифатида расмийлаштириш.', ru: 'Защита двора от точечной застройки в общее пользование.'),
    duration: MultiLangText(uz: '10 ish kuni', kr: '10 иш куни', ru: '10 раб. дней'),
    cost: MultiLangText(uz: 'Bepul / Minimal stavka', kr: 'Бепул / Минимал', ru: 'Бесплатно / Минимальная ставка'),
    warningTip: MultiLangText(uz: 'Bu yer bitta shaxsga xususiylashtirilmaydi, umumiy mulk hisoblanadi.', kr: 'Битта шахсга хусусийлаштирилмайди.', ru: 'Придомовая земля не подлежит приватизации отдельными лицами.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Mulkdorlar yig‘ilishi bayonnomasi', kr: 'Мулкдорлар йиғилиши баённомаси', ru: 'Протокол собрания собственников'),
        officialName: MultiLangText(uz: 'Ko‘p kvartirali uy mulkdorlarining qarori', kr: 'Мулкдорлар умумий йиғилиши қарори', ru: 'Решение общего собрания жильцов'),
        whatIsIt: MultiLangText(uz: 'Aholining 50% dan ortig‘i rozi bo‘lgan bayonnoma.', kr: 'Аҳолининг 50% дан ортиғи рози бўлган баённома.', ru: 'Протокол с согласия более 50% жильцов.'),
        insideContent: MultiLangText(uz: '• Xonadon raqamlari va imzolar.', kr: '• Хонадонлар ва имзолар.', ru: '• Номера квартир и подписи.'),
        whereToGet: MultiLangText(uz: 'BSHM (boshqaruv kompaniyasi) orqali tuziladi.', kr: 'БСҲМ орқали тузилади.', ru: 'Через управляющую компанию.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Arxitektura qizil chiziq chegaralarini aniqlab beradi.', kr: 'Архитектура қизил чизиқни белгилайди.', ru: 'Архитектура определяет границы придомовой зоны.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Har bir kvartiradan alohida pulli ariza', kr: 'Ҳар бир хонадондан алоҳида пулли ариза', ru: 'Платное заявление от каждой квартиры'),
    ],
  ),
  KadastrService(
    id: '9',
    icon: Icons.history_edu,
    categoryId: 'noturar',
    titleSimple: MultiLangText(uz: '9. Bino va inshootlar ijara shartnomasini ro‘yxatdan o‘tkazish', kr: '9. Бинолар ижара шартномасини рўйхатдан ўтказиш', ru: '9. Регистрация договора аренды зданий и сооружений'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish', kr: 'Кўчмас мулк ижара шартномасини рўйхатдан ўтказиш', ru: 'Госрегистрация договора аренды недвижимости'),
    purpose: MultiLangText(uz: 'Noturar bino yoki do‘kon 1 yildan ortiq muddatga ijaraga berilganda ro‘yxatdan o‘tkazish.', kr: 'Бино 1 йилдан ортиққа ижарага берилганда рўйхатдан ўтказиш.', ru: 'Регистрация аренды нежилых объектов на срок свыше 1 года.'),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(uz: '1 yildan oshiq muddatli ijaralar kadastrda ro‘yxatdan o‘tmasa, sudda haqiqiy sanalmaydi.', kr: '1 йилдан ортиқ ижаралар кадастрда ўтмаса судда ҳақиқий эмас.', ru: 'Аренда свыше года без кадастровой регистрации не имеет силы в суде.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Ijara shartnomasi', kr: 'Ижара шартномаси', ru: 'Договор аренды'),
        officialName: MultiLangText(uz: 'Elektron yoki notarial ijara bitimi', kr: 'Электрон ёки нотариал ижара битими', ru: 'Договор долгосрочной аренды'),
        whatIsIt: MultiLangText(uz: 'Tomonlar o‘rtasidagi rasmiy shartnoma.', kr: 'Томонлар ўртасидаги шартнома.', ru: 'Официальный договор сторон.'),
        insideContent: MultiLangText(uz: '• Muddati va to‘lovi.', kr: '• Муддати ва тўлови.', ru: '• Срок и сумма оплаты.'),
        whereToGet: MultiLangText(uz: 'ijara.soliq.uz tizimidan yoki notariusdan.', kr: 'ijara.soliq.uz ёки нотариусдан.', ru: 'Через ijara.soliq.uz или у нотариуса.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Bino qayta ixtisoslashtirilsa, arxitektura kelishuvi kerak.', kr: 'Бино ихтисоси ўзгарса, архитектура керак.', ru: 'При смене профиля объекта требуется согласование архитектуры.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Binoni qayta inventarizatsiyadan o‘tkazish', kr: 'Бинони қайта инвентаризация қилиш', ru: 'Повторная инвентаризация здания'),
    ],
  ),
  KadastrService(
    id: '10',
    icon: Icons.landscape,
    categoryId: 'yer',
    titleSimple: MultiLangText(uz: '10. Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish', kr: '10. Ер участкаси ижара шартномасини рўйхатдан ўтказиш', ru: '10. Регистрация договора аренды земли'),
    titleOfficial: MultiLangText(uz: 'Yer uchastkasini uzoq muddatli ijaraga olish shartnomasini ro‘yxatdan o‘tkazish', kr: 'Ер ижара шартномасини давлат рўйхатидан ўтказиш', ru: 'Госрегистрация долгосрочной аренды земельного участка'),
    purpose: MultiLangText(uz: 'Fermer xo‘jaligi yoki tadbirkorlik yerlarini qonuniy rasmiylashtirish.', kr: 'Фермер ёки тадбиркорлик ерини расмийлаштириш.', ru: 'Регистрация аренды фермерских и коммерческих земель.'),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 1 baravari', kr: 'БҲМнинг 1 баравари', ru: '1 БРВ'),
    warningTip: MultiLangText(uz: 'Faqat E-auksion yoki "E-yer" ochiq tanlovida yutib olingan yerlar ro‘yxatga olinadi.', kr: 'Фақат электрон савдода ютилган ерлар рўйхатга олинади.', ru: 'Регистрация проводится строго по протоколам открытых онлайн-торгов.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Tanlov/auksion bayonnomasi', kr: 'Танлов баённомаси', ru: 'Протокол онлайн-аукциона'),
        officialName: MultiLangText(uz: 'Yer ijara huquqini berish bo‘yicha auksion bayonnomasi', kr: 'Ер ижараси бўйича баённома', ru: 'Протокол победы на открытых торгах'),
        whatIsIt: MultiLangText(uz: 'Tanlovda g‘olib bo‘lganingizni tasdiqlovchi QR-kodli hujjat.', kr: 'Ғолибликни тасдиқловчи QR-кодли ҳужжат.', ru: 'Электронный протокол о предоставлении права аренды.'),
        insideContent: MultiLangText(uz: '• Kontur raqami, gektar maydoni.', kr: '• Контур ва гектари.', ru: '• Номер контура, площадь и срок.'),
        whereToGet: MultiLangText(uz: 'E-auksion.uz tizimidan yuklab olinadi.', kr: 'E-auksion.uz тизимидан.', ru: 'Скачивается из кабинета E-auksion.uz.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Qishloq xo‘jaligi yerlarida arxitektura aralashmaydi.', kr: 'Қишлоқ ерида архитектура аралашмайди.', ru: 'На сельхозземлях градостроительные органы не участвуют.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qishloq xo‘jaligidan qo‘shimcha rozilik xati', kr: 'Қишлоқ хўжалигидан қўшимча хат', ru: 'Дополнительное письмо агроотдела'),
    ],
  ),
  KadastrService(
    id: '11',
    icon: Icons.account_balance,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '11. Ipoteka va garov huquqini ro‘yxatga olish / yechish', kr: '11. Ипотека ва гаровни рўйхатга олиш / ечиш', ru: '11. Госрегистрация и снятие ипотеки (залога)'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatdan o‘tkazish', kr: 'Ипотека ва гаров шартномасини рўйхатдан ўтказиш', ru: 'Госрегистрация и снятие залога недвижимости'),
    purpose: MultiLangText(uz: 'Kredit olayotganda uyni garovga qo‘yish yoki kredit yopilgach taqiqni yechish.', kr: 'Кредит учун уйни гаровга қўйиш ёки тақиқни ечиш.', ru: 'Регистрация залога под кредит и снятие обременения.'),
    duration: MultiLangText(uz: '1 ish kuni', kr: '1 иш куни', ru: '1 раб. день'),
    cost: MultiLangText(uz: 'BHMning 50% miqdorida', kr: 'БҲМнинг 50% миқдорида', ru: '50% от БРВ'),
    warningTip: MultiLangText(uz: 'Kredit to‘liq yopilgach, bank taqiqni bepul yechib berishi shart!', kr: 'Кредит ёпилгач, банк тақиқни бепул ечиши шарт!', ru: 'После погашения кредита банк обязан снять запрет бесплатно!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Ipoteka shartnomasi', kr: 'Ипотека шартномаси', ru: 'Договор ипотеки'),
        officialName: MultiLangText(uz: 'Notarial tasdiqlangan ipoteka (garov) bitimi', kr: 'Нотариал ипотека битими', ru: 'Нотариально удостоверенный договор ипотеки'),
        whatIsIt: MultiLangText(uz: 'Mulk qancha kredit evaziga garovga qo‘yilgani hujjati.', kr: 'Мулк гаровга қўйилгани ҳужжати.', ru: 'Договор о передаче жилья в залог.'),
        insideContent: MultiLangText(uz: '• Kredit summasi va kadastr raqami.', kr: '• Кредит суммаси ва рақами.', ru: '• Сумма кредита и номер объекта.'),
        whereToGet: MultiLangText(uz: 'Bank va notariusdan.', kr: 'Банк ва нотариусдан.', ru: 'В банке и нотариальной конторе.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Bank vakilining markazga shaxsan borishi', kr: 'Банк вакилининг марказга бориши', ru: 'Личный визит представителя банка'),
    ],
  ),
  KadastrService(
    id: '12',
    icon: Icons.alt_route,
    categoryId: 'yer',
    titleSimple: MultiLangText(uz: '12. Servitut kelishuvi (Qo‘shni yeridan yo‘l ochish)', kr: '12. Сервитут келишуви (Қўшни еридан йўл очиш)', ru: '12. Госрегистрация права сервитута (Проход через участок)'),
    titleOfficial: MultiLangText(uz: 'Servitut huquqini davlat ro‘yxatidan o‘tkazish', kr: 'Сервитут ҳуқуқини давлат рўйхатидан ўтказиш', ru: 'Государственная регистрация права сервитута'),
    purpose: MultiLangText(uz: 'Uyingizga kirish uchun qo‘shnining hovlisidan o‘tish huquqini qonuniylashtirish.', kr: 'Қўшнининг еридан ўтиш ҳуқуқини қонунийлаштириш.', ru: 'Закрепление права прохода через соседний участок.'),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(uz: 'Servitut rasmiylashtirilsa, qo‘shni o‘zgarsa ham o‘tish huquqingiz daxlsiz saqlanadi.', kr: 'Сервитут бўлса, қўшни алмашса ҳам ҳуқуқ сақланади.', ru: 'Сервитут сохраняется при смене собственника соседнего участка.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Servitut shartnomasi yoki sud ajrimi', kr: 'Сервитут шартномаси ёки суд қарори', ru: 'Соглашение о сервитуте или решение суда'),
        officialName: MultiLangText(uz: 'Notarial servitut bitimi yoki sud qarori', kr: 'Нотариал сервитут битими ёки суд қарори', ru: 'Нотариальное соглашение или решение суда'),
        whatIsIt: MultiLangText(uz: 'Qo‘shnilar yerning qaysi qismidan o‘tishga kelishgani xaritasi.', kr: 'Қўшнилар ўтишга келишгани харитаси.', ru: 'Схема прохода и соглашение сторон.'),
        insideContent: MultiLangText(uz: '• Yo‘lning eni, uzunligi va shartlari.', kr: '• Йўлнинг эни, узунлиги.', ru: '• Ширина, длина полосы и условия.'),
        whereToGet: MultiLangText(uz: 'Notariusda imzolanadi yoki suddan olinadi.', kr: 'Нотариусда ёки суддан.', ru: 'У нотариуса или в суде.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Arxitektor yo‘l boshqa joydan ochilishi imkoni yo‘qligini chizmada tasdiqlaydi.', kr: 'Архитектор йўл бошқа жойдан имконсизлигини тасдиқлайди.', ru: 'Архитектура подтверждает отсутствие иных вариантов прохода.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qo‘shnining butun hovlisini qayta o‘lchash', kr: 'Қўшнининг бутун ҳовлисини қайта ўлчаш', ru: 'Повторный замер всего участка соседа'),
    ],
  ),
  KadastrService(
    id: '13',
    icon: Icons.park,
    categoryId: 'noturar',
    titleSimple: MultiLangText(uz: '13. Ko‘p yillik bog‘ va dov-daraxtlarga kadastr olish', kr: '13. Кўп йиллик боғларга кадастр олиш', ru: '13. Кадастровый паспорт на многолетние насаждения и сады'),
    titleOfficial: MultiLangText(uz: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish', kr: 'Кўп йиллик боғларга кадастр паспортини бериш', ru: 'Оформление техпаспорта на многолетние сады'),
    purpose: MultiLangText(uz: 'Intensiv mevali bog‘lar va daraxtzorlarni ko‘chmas mulk sifatida hisobga olish.', kr: 'Интенсив боғларни кўчмас мулк сифатида ҳисобга олиш.', ru: 'Учет коммерческих садов в качестве объектов недвижимости.'),
    duration: MultiLangText(uz: '5 ish kuni', kr: '5 иш куни', ru: '5 раб. дней'),
    cost: MultiLangText(uz: 'Bog‘ maydoniga qarab', kr: 'Боғ майдонига қараб', ru: 'В зависимости от площади сада'),
    warningTip: MultiLangText(uz: 'Bog‘ barpo etilgan yerga bo‘lgan ijara yoki mulk huquqi bo‘lishi shart.', kr: 'Боғ экилган ерга ижара ёки эгалик ҳужжати шарт.', ru: 'Обязательно наличие законного права на землю.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Bog‘ yerining hujjati', kr: 'Боғ ерининг ҳужжати', ru: 'Документ на землю сада'),
        officialName: MultiLangText(uz: 'Yer ijara shartnomasi yoki davlat ko‘chirmasi', kr: 'Ер ижара шартномаси ёки кўчирмаси', ru: 'Договор аренды земли или выписка'),
        whatIsIt: MultiLangText(uz: 'Daraxt ekilgan yer sizga tegishli ekani hujjati.', kr: 'Ер сизга тегишли экани ҳужжати.', ru: 'Правоустанавливающий документ на землю.'),
        insideContent: MultiLangText(uz: '• Maydon, kontur va daraxt navlari.', kr: '• Майдон, контур ва навлар.', ru: '• Площадь, контур и сорта деревьев.'),
        whereToGet: MultiLangText(uz: 'Kadastr reyestridan.', kr: 'Кадастр реестридан.', ru: 'Из Единого реестра кадастра.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Ekologiya idorasidan qo‘shimcha ruxsatnoma', kr: 'Экологиядан қўшимча рухсатнома', ru: 'Разрешение от органов экологии'),
    ],
  ),
  KadastrService(
    id: '14',
    icon: Icons.gavel,
    categoryId: 'yer',
    titleSimple: MultiLangText(uz: '14. Tadbirkorlik uchun yerni E-auksion orqali olish', kr: '14. Тадбиркорлик учун ерни Э-аукцион орқали олиш', ru: '14. Покупка земли под бизнес на E-auksion'),
    titleOfficial: MultiLangText(uz: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish', kr: 'Ер участкаларини электрон аукцион орқали ажратиш', ru: 'Предоставление участков под бизнес на онлайн-торгах'),
    purpose: MultiLangText(uz: 'Bo‘sh turgan davlat yerlarini biznes uchun ochiq auksionda yutib olish.', kr: 'Бўш ерларни ҳалол аукционда ютиб олиш.', ru: 'Прозрачная покупка участков под коммерческую застройку.'),
    duration: MultiLangText(uz: 'Auksion reglamenti bo‘yicha', kr: 'Аукцион регламенти бўйича', ru: 'По регламенту торгов'),
    cost: MultiLangText(uz: 'Auksionda shakllangan savdo bahosi', kr: 'Аукцион савдо баҳоси', ru: 'Итоговая стоимость на торгах'),
    warningTip: MultiLangText(uz: 'Hokimning to‘g‘ridan-to‘g‘ri yer berish vakolati yo‘q! Amaldorlarga ishonib pul bermang!', kr: 'Ҳокимларнинг ер бериш ваколати йўқ! Пул берманг!', ru: 'Прямое выделение земель хокимами запрещено законом!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Elektron raqamli imzo (ERI)', kr: 'Электрон рақамли имзо (ЭРИ)', ru: 'Электронная подпись (ЭЦП)'),
        officialName: MultiLangText(uz: 'ERI kaliti va sertifikati', kr: 'ЭРИ калити ва сертификати', ru: 'Сертификат ключа ЭЦП'),
        whatIsIt: MultiLangText(uz: 'Savdoda qatnashish va bayonnomani tasdiqlash uchun imzo.', kr: 'Аукционда савдолашиш учун имзо.', ru: 'Ключ для участия в онлайн-торгах.'),
        insideContent: MultiLangText(uz: '• Fuqaro nomiga biriktirilgan kalit.', kr: '• Фуқаро номига калит.', ru: '• Персональные данные заявителя.'),
        whereToGet: MultiLangText(uz: 'Davlat xizmatlari markazidan olinadi.', kr: 'Давлат хизматлари марказидан.', ru: 'В Центре госуслуг за 10 минут.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Auksionga qo‘yilgan yerlar shaharsozlik bosh rejasiga moslashtirilgan bo‘ladi.', kr: 'Аукцион ерлари бош режага мосланган бўлади.', ru: 'Все выставляемые лоты согласованы с генпланом архитектуры.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimiyatdan qo‘shimcha farmoyish olish', kr: 'Ҳокимиятдан қўшимча фармойиш олиш', ru: 'Дополнительное распоряжение хокимията'),
    ],
  ),
  KadastrService(
    id: '15',
    icon: Icons.agriculture,
    categoryId: 'yer',
    titleSimple: MultiLangText(uz: '15. Qishloq xo‘jaligi yerlarini ijaraga olish tanlovi', kr: '15. Қишлоқ хўжалиги ерларини олиш танлови', ru: '15. Конкурс по аренде сельхозземель'),
    titleOfficial: MultiLangText(uz: 'Qishloq xo‘jaligiga mo‘ljallangan yerlarni elektron tanlov orqali berish', kr: 'Қишлоқ хўжалиги ерларини танлов орқали бериш', ru: 'Предоставление земель сельхозназначения по открытому конкурсу'),
    purpose: MultiLangText(uz: 'Ekin ekish yoki issiqxona uchun yerlarni "E-yer" orqali ijaraga olish.', kr: 'Экин экиш учун ерларни "E-yer" орқали ижарага олиш.', ru: 'Аренда сельхозземель через систему "E-yer" по баллам.'),
    duration: MultiLangText(uz: 'Tanlov reglamenti asosida', kr: 'Танлов регламенти асосида', ru: 'По регламенту конкурса'),
    cost: MultiLangText(uz: 'Tanlov shartlariga ko‘ra', kr: 'Танлов шартларига кўра', ru: 'Согласно правилам конкурса'),
    warningTip: MultiLangText(uz: 'G‘olib inson aralashuvisiz, kompyuter reytingi orqali aniqlanadi.', kr: 'Ғолиб компьютер рейтинги орқали аниқланади.', ru: 'Победитель определяется автоматическим компьютерным рейтингом.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Fermerlik biznes-rejasi', kr: 'Фермерлик бизнес-режаси', ru: 'Аграрный бизнес-план'),
        officialName: MultiLangText(uz: 'Yer uchastkasidan samarali foydalanish taklifi', kr: 'Ердан самарали фойдаланиш таклифи', ru: 'План эффективного освоения участка'),
        whatIsIt: MultiLangText(uz: 'Yerda nima yetishtirishingiz ko‘rsatilgan reja.', kr: 'Ерда нима экиш режаси.', ru: 'Программа севооборота и инвестиций.'),
        insideContent: MultiLangText(uz: '• Ekin turlari va kiritiladigan mablag‘.', kr: '• Экин турлари ва маблағ.', ru: '• Виды культур и объем инвестиций.'),
        whereToGet: MultiLangText(uz: 'Ariza beruvchining o‘zi tayyorlaydi.', kr: 'Ариза берувчининг ўзи тайёрлайди.', ru: 'Составляется заявителем самостоятельно.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qishloq xo‘jaligi bo‘limidan alohida xat keltirish', kr: 'Қишлоқ хўжалигидан алоҳида хат келтириш', ru: 'Письмо из отдела сельского хозяйства'),
    ],
  ),
  KadastrService(
    id: '16',
    icon: Icons.pin,
    categoryId: 'spravka',
    titleSimple: MultiLangText(uz: '16. Eski va yangi kadastr raqamlarini solishtirish', kr: '16. Эски ва янги кадастр рақамларини солиштириш', ru: '16. Сопоставление старого и нового кадастровых номеров'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulkning yangilangan kadastr raqami to‘g‘risida maʼlumotnoma', kr: 'Янгиланган кадастр рақами тўғрисида маълумотнома', ru: 'Справка о сопоставлении кадастровых номеров'),
    purpose: MultiLangText(uz: 'Eski daftarchadagi raqam yangi elektron tizimda qaysi raqamga o‘zgarganini tasdiqlash.', kr: 'Эски рақам янги тизимда қайси рақам бўлганини тасдиқлаш.', ru: 'Подтверждение изменения номера в электронной базе.'),
    duration: MultiLangText(uz: 'Avtomatik (1 ish kuni)', kr: 'Автоматик (1 иш куни)', ru: 'Автоматически (1 день)'),
    cost: MultiLangText(uz: 'Bepul', kr: 'Бепул', ru: 'Бесплатно'),
    warningTip: MultiLangText(uz: 'Eski uyingiz notariusda chiqmay qolsa, shu maʼlumotnoma bepul olinadi.', kr: 'Эски уй чиқмай қолса, шу маълумотнома бепул олинади.', ru: 'Выдается бесплатно при отсутствии старого номера в базе нотариуса.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Eski kadastr daftarchasi', kr: 'Эски кадастр дафтарчаси', ru: 'Старый техпаспорт'),
        officialName: MultiLangText(uz: 'Eski namunadagi qog‘oz pasport', kr: 'Эски намунадаги қоғоз паспорт', ru: 'Бумажный техпаспорт старого образца'),
        whatIsIt: MultiLangText(uz: 'Ilgari berilgan qog‘oz daftarcha.', kr: 'Илгари берилган қоғоз дафтарча.', ru: 'Бумажная инвентарная книжка.'),
        insideContent: MultiLangText(uz: '• Eski kadastr kodi va manzil.', kr: '• Эски код ва манзил.', ru: '• Старый номер и архивный адрес.'),
        whereToGet: MultiLangText(uz: 'Shaxsiy arxiv hujjatlari orasidan.', kr: 'Шахсий архив ҳужжатларидан.', ru: 'Из домашнего архива.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Kadastr xodimini uyga chaqirib pul to‘lash', kr: 'Ходимни уйга чақириб пул тўлаш', ru: 'Оплата за выезд сотрудника'),
    ],
  ),
  KadastrService(
    id: '17',
    icon: Icons.signpost,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '17. Uyga rasmiy ko‘cha nomi va manzil berish', kr: '17. Уйга расмий кўча номи ва манзил бериш', ru: '17. Присвоение официального адреса и улицы'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish (Manzillar reyestri)', kr: 'Объектга манзил бериш ва ўзгартириш', ru: 'Присвоение и изменение адреса объекта недвижимости'),
    purpose: MultiLangText(uz: 'Yangi qurilgan uyga tuman hokimiyati tomonidan rasmiy ko‘cha nomi va raqam berilishi.', kr: 'Янги уйга расмий кўча номи ва рақам берилиши.', ru: 'Официальное внесение улицы и номера дома в адресный реестр.'),
    duration: MultiLangText(uz: '3 ish kuni', kr: '3 иш куни', ru: '3 раб. дня'),
    cost: MultiLangText(uz: 'Bepul', kr: 'Бепул', ru: 'Бесплатно'),
    warningTip: MultiLangText(uz: 'Ko‘cha nomi o‘zgarganda hujjatlarni qayta o‘zgartirish majburiy emas.', kr: 'Кўча номи ўзгарганда ҳужжатларни алмаштириш шарт эмас.', ru: 'При смене названия улицы замена бумаг не требуется.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Kadastr pasporti', kr: 'Кадастр паспорти', ru: 'Кадастровый паспорт'),
        officialName: MultiLangText(uz: 'Mulk kadastr yig‘majildi', kr: 'Мулк кадастр йиғмажилди', ru: 'Кадастровое дело объекта'),
        whatIsIt: MultiLangText(uz: 'Uyning koordinatasini ko‘rsatuvchi hujjat.', kr: 'Уйнинг координатасини кўрсатувчи ҳужжат.', ru: 'Документ с географическими координатами строения.'),
        insideContent: MultiLangText(uz: '• Obyektning amaldagi xaritasi.', kr: '• Объектнинг амалдаги харитаси.', ru: '• Карта расположения объекта.'),
        whereToGet: MultiLangText(uz: 'Mulkdorning qo‘lida bo‘ladi.', kr: 'Мулкдорнинг қўлида бўлади.', ru: 'На руках у собственника.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Manzillar reyestri arxitektura qarorlariga asoslanadi.', kr: 'Манзиллар реестри архитектура қарорларига асосланади.', ru: 'Формируется на основе адресного реестра архитектуры.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan ko‘cha nomi haqida spravka so‘rash', kr: 'Маҳалладан кўча номи ҳақида справка', ru: 'Справка об адресе из махалли'),
    ],
  ),
  KadastrService(
    id: '18',
    icon: Icons.warning_amber,
    categoryId: 'spravka',
    titleSimple: MultiLangText(uz: '18. Uy buzilishga (Snos) tushganligini aniqlash', kr: '18. Уй бузилишга (Снос) тушганини аниқлаш', ru: '18. Проверка нахождения жилья в зоне сноса (Снос)'),
    titleOfficial: MultiLangText(uz: 'Bosh rejaga asosan uy buzilishga tushganligi haqida maʼlumotnoma', kr: 'Уйнинг бузилишга тушганлиги ҳақида маълумотнома', ru: 'Справка о нахождении объекта в зоне сноса по генплану'),
    purpose: MultiLangText(uz: 'Shahar bosh rejasiga ko‘ra, uy o‘rnida yo‘l yoki ko‘prik tushishi rejalashtirilganini tekshirish.', kr: 'Бош режа бўйича уй бузилишга тушганини текшириш.', ru: 'Проверка планов генплана относительно сноса перед покупкой.'),
    duration: MultiLangText(uz: '3 ish kuni', kr: '3 иш куни', ru: '3 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(uz: 'Uy sotib olayotganda albatta bu maʼlumotnomani tekshiring!', kr: 'Уй сотиб олишдан олдин албатта буни текширинг!', ru: 'Обязательно проверяйте справку перед покупкой недвижимости!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Kadastr raqami', kr: 'Кадастр рақами', ru: 'Кадастровый номер'),
        officialName: MultiLangText(uz: 'Obyekt kadastr raqami', kr: 'Объект кадастр рақами', ru: 'Кадастровый номер строения'),
        whatIsIt: MultiLangText(uz: 'Tekshirilayotgan uyning raqami.', kr: 'Текширилаётган уй рақами.', ru: 'Номер проверяемого объекта.'),
        insideContent: MultiLangText(uz: '• Koordinatalar va manzil.', kr: '• Координаталар ва манзил.', ru: '• Локация и адрес.'),
        whereToGet: MultiLangText(uz: 'Kadastr pasportidan olinadi.', kr: 'Кадастр паспортидан.', ru: 'Из паспорта объекта.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Maʼlumot to‘g‘ridan-to‘g‘ri shaharsozlik Bosh rejasidan olinadi.', kr: 'Маълумот архитектура Бош режасидан олинади.', ru: 'Справка формируется на основе данных Генплана архитектуры.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Arxitekturaga shaxsan borib imzo to‘plash', kr: 'Архитектурага бориб имзо тўплаш', ru: 'Сбор подписей в отделе архитектуры'),
    ],
  ),
  KadastrService(
    id: '19',
    icon: Icons.delete_forever,
    categoryId: 'turar',
    titleSimple: MultiLangText(uz: '19. Mulk buzilganda kadastr hisobidan chiqarish', kr: '19. Мулк бузилганда кадастр ҳисобидан чиқариш', ru: '19. Снятие с учета при сносе здания'),
    titleOfficial: MultiLangText(uz: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini davlat ro‘yxatidan o‘tkazish', kr: 'Ҳуқуқ бекор қилинганини рўйхатдан ўтказиш', ru: 'Госрегистрация прекращения прав на недвижимость'),
    purpose: MultiLangText(uz: 'Eski uy buzilib o‘rniga yangi qurilayotganda, eski uyni bazadan o‘chirish.', kr: 'Эски уй бузилганда уни базадан ўчириш.', ru: 'Аннулирование старого кадастрового номера при фактическом сносе.'),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(uz: 'Buzilgan uyni bazadan chiqarmasangiz, yo‘q uy uchun soliq hisoblanaveradi!', kr: 'Бузилган уйни чиқармасангиз, йўқ уйга солиқ келаверади!', ru: 'Если не снять снесенный дом с учета, налог начисляется дальше!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Buzilganlik dalolatnomasi', kr: 'Бузилганлик далолатномаси', ru: 'Акт подтверждения сноса'),
        officialName: MultiLangText(uz: 'Bino mavjud emasligi to‘g‘risidagi dalolatnoma', kr: 'Бино мавжуд эмаслиги тўғрисида далолатнома', ru: 'Акт об отсутствии строения на участке'),
        whatIsIt: MultiLangText(uz: 'Bino joyida haqiqatda yo‘qligini tasdiqlovchi rasmiy qog‘oz.', kr: 'Бино йўқлигини тасдиқловчи қоғоз.', ru: 'Акт инспектора об отсутствии строения.'),
        insideContent: MultiLangText(uz: '• Mahalla va kadastr ishtirokidagi foto-dalolatnoma.', kr: '• Маҳалла ва кадастр фото-далолатномаси.', ru: '• Фотофиксация и подписи комиссии.'),
        whereToGet: MultiLangText(uz: 'Tuman kadastr bo‘limi va mahalladan tuziladi.', kr: 'Кадастр ва маҳалладан.', ru: 'В районном кадастре и махалле.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Eski orderlarni qayta talab qilish', kr: 'Эски ордерларни қайта талаб қилиш', ru: 'Повторный запрос архивных ордеров'),
    ],
  ),
  KadastrService(
    id: '20',
    icon: Icons.map,
    categoryId: 'qurilish',
    titleSimple: MultiLangText(uz: '20. Topografik va geodezik xaritalar olish', kr: '20. Топографик ва геодезик хариталар олиш', ru: '20. Предоставление геодезических и топокарт'),
    titleOfficial: MultiLangText(uz: 'Davlat kartografiya-geodeziya fondidan maʼlumotlar taqdim etish', kr: 'Картография-геодезия фондидан маълумот бериш', ru: 'Предоставление материалов картографо-геодезического фонда'),
    purpose: MultiLangText(uz: 'Katta bino yoki korxonalar loyihalari uchun 1:500 geodezik xaritalarni olish.', kr: 'Қурилиш лойиҳалари учун 1:500 геодезик хариталарни олиш.', ru: 'Получение топографических съемок 1:500 для проектирования объектов.'),
    duration: MultiLangText(uz: '5 ish kuni', kr: '5 иш куни', ru: '5 раб. дней'),
    cost: MultiLangText(uz: 'Xarita hajmiga qarab shartnoma asosida', kr: 'Харита ҳажмига қараб', ru: 'Согласно масштабу по договору'),
    warningTip: MultiLangText(uz: 'Qurilishdan oldin geodezik maʼlumot olinsa, yer osti quvurlariga shikast yetmaydi.', kr: 'Геодезия олинса, ер ости газ ва ток симларига шикаст етмайди.', ru: 'Топосъемка исключает риск повреждения подземных коммуникаций.'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Loyiha texnik topshirig‘i', kr: 'Лойиҳа техник топшириғи', ru: 'Техзадание на проектирование'),
        officialName: MultiLangText(uz: 'Tashkilot buyurtmasi va loyihalash ruxsatnomasi', kr: 'Ташкилот буюртмаси ва рухсатномаси', ru: 'Запрос лицензированной проектной организации'),
        whatIsIt: MultiLangText(uz: 'Qaysi hududning xaritasi kerakligini ko‘rsatuvchi so‘rov.', kr: 'Қайси ҳудуд харитаси кераклиги сўрови.', ru: 'Официальный запрос с границами съемки.'),
        insideContent: MultiLangText(uz: '• Koordinatalar va masshtab.', kr: '• Координаталар ва масштаб.', ru: '• Координаты и требуемый масштаб.'),
        whereToGet: MultiLangText(uz: 'Loyiha institutidan olinadi.', kr: 'Лойиҳа институтидан.', ru: 'В проектном бюро.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Loyihalar arxitekturada aynan shu geodeziyaga bog‘lanadi.', kr: 'Лойиҳалар архитектурада айнан шу геодезияга боғланади.', ru: 'Базовый материал для посадки здания в архитектуре.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Litsenziyasiz shaxslar xizmatiga majburlash', kr: 'Нолицензион шахсларга мажбурлаш', ru: 'Принуждение к услугам нелицензированных лиц'),
    ],
  ),
  KadastrService(
    id: '21',
    icon: Icons.domain_verification,
    categoryId: 'yer',
    titleSimple: MultiLangText(uz: '21. Bino ostidagi yerni xususiylashtirish (Sotib olish)', kr: '21. Бино остидаги ерни хусусийлаштириш (Сотиб олиш)', ru: '21. Приватизация земли под собственным зданием'),
    titleOfficial: MultiLangText(uz: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish', kr: 'Ер участкаларини хусусийлаштириш', ru: 'Приватизация земельных участков несельскохозяйственного назначения'),
    purpose: MultiLangText(uz: 'O‘zingizga qarashli xususiy bino turgan yerni bir umrlik xususiy mulk qilib sotib olish.', kr: 'Бино турган ерни бир умрлик мулк қилиб сотиб олиш.', ru: 'Выкуп земельного участка под зданием в частную собственность.'),
    duration: MultiLangText(uz: '10 ish kuni', kr: '10 иш куни', ru: '10 раб. дней'),
    cost: MultiLangText(uz: 'Yer solig‘ining karrali stavkasida', kr: 'Ер солиғининг каррали ставкасида', ru: 'По кратной ставке земельного налога'),
    warningTip: MultiLangText(uz: 'Xususiylashtirilgan yer — daxlsiz xususiy mulk bo‘ladi!', kr: 'Хусусийлашган ер — дахлсиз мулк!', ru: 'Приватизированная земля является неприкосновенной собственностью!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: 'Binoga bo‘lgan mulkchilik hujjati', kr: 'Бинога мулкчилик ҳужжати', ru: 'Свидетельство на здание'),
        officialName: MultiLangText(uz: 'Bino kadastr pasporti va ro‘yxatdan o‘tganlik ko‘chirmasi', kr: 'Бино кадастр паспорти ва кўчирмаси', ru: 'Кадастровый паспорт и выписка на здание'),
        whatIsIt: MultiLangText(uz: 'Yer ustidagi bino sizniki ekanini tasdiqlovchi hujjat.', kr: 'Бино сизники эканини тасдиқловчи ҳужжат.', ru: 'Документ о собственности на капитальное строение.'),
        insideContent: MultiLangText(uz: '• Bino maydoni va kadastr raqami.', kr: '• Бино майдони ва кадастр рақами.', ru: '• Площадь строения и кадастровый номер.'),
        whereToGet: MultiLangText(uz: 'Kadastr reyestridan.', kr: 'Кадастр реестридан.', ru: 'Из Единого реестра кадастра.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Arxitektura qizil chiziqlar yo‘qligini elektron tasdiqlaydi.', kr: 'Архитектура қизил чизиқлар йўқлигини электрон тасдиқлайди.', ru: 'Архитектура подтверждает отсутствие красных линий.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimiyatning alohida yozma ruxsatnomasi', kr: 'Ҳокимиятнинг алоҳида ёзма рухсати', ru: 'Отдельное письменное разрешение хокима'),
    ],
  ),
  KadastrService(
    id: '22',
    icon: Icons.shield,
    categoryId: 'qonun937',
    titleSimple: MultiLangText(uz: '22. Hujjatsiz uylarni qonuniylashtirish (O‘RQ-937 Qonuni)', kr: '22. Ҳужжатсиз уйларни қонунийлаштириш (ЎРҚ-937 Қонуни)', ru: '22. Признание прав на самовольное жилье (Закон ЗРУ-937)'),
    titleOfficial: MultiLangText(uz: 'O‘zboshimchalik bilan egallangan yer uchastkalari hamda ularda qurilgan binolarga bo‘lgan huquqlarni eʼtirof etish (05.08.2024 yildagi O‘RQ-937-son Qonun)', kr: 'Ўзбошимчалик билан эгалланган ер ва биноларга ҳуқуқларни эътироф этиш (ЎРҚ-937)', ru: 'Признание прав на самовольно занятые участки и постройки (ЗРУ-937 от 05.08.2024)'),
    purpose: MultiLangText(uz: 'Hujjati bo‘lmagan xonadonlarga O‘RQ-937 Qonun bo‘yicha mulk huquqini eʼtirof etish.', kr: 'Ҳужжати бўлмаган уйларга ЎРҚ-937 бўйича мулк ҳуқуқини эътироф этиш.', ru: 'Признание права собственности на дома без документов по Закону ЗРУ-937.'),
    duration: MultiLangText(uz: 'Xatlov reja-jadvali asosida (mahallama-mahalla)', kr: 'Хатлов жадвали асосида (маҳаллама-маҳалла)', ru: 'По графику сплошной инвентаризации по махаллям'),
    cost: MultiLangText(uz: 'Qonunda belgilangan bir martalik to‘lov (Toshkentda 5 BHM, viloyatda 3 BHM, qishloqda 1 BHM)', kr: 'Бир марталик тўлов (Тошкентда 5 БҲМ, вилоятда 3 БҲМ, қишлоқда 1 БҲМ)', ru: 'Разовый сбор (г. Ташкент — 5 БРВ, области — 3 БРВ, села — 1 БРВ)'),
    warningTip: MultiLangText(uz: 'OGOH BO‘LING: Xatlov mutlaqo BEPUL! Vositachilarga bitta ham so‘m bermang!', kr: 'ОГОҲ БЎЛИНГ: Хатлов БЕПУЛ! Воситачиларга умуман пул берманг!', ru: 'ВНИМАНИЕ: Инвентаризация проводится БЕСПЛАТНО. Не платите маклерам!'),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(uz: '2018-yilgacha to‘langan soliq va kommunal kvitansiyalar', kr: '2018 йилгача тўланган солиқ ва коммунал квитанциялар', ru: 'Квитанции налогов и ЖКХ до 2018 года'),
        officialName: MultiLangText(uz: 'Yer va mulk solig‘i, elektr, gaz to‘lov dalillari', kr: 'Ер ва мулк солиғи, электр, газ тўловлари', ru: 'Документы об уплате налогов и коммунальных услуг'),
        whatIsIt: MultiLangText(uz: 'Ushbu uyni ko‘p yildan buyon egallab yashayotganingiz dalili.', kr: 'Уйда кўп йилдан бери яшаётганингиз исботи.', ru: 'Доказательство непрерывного владения домом.'),
        insideContent: MultiLangText(uz: '• To‘lovchi F.I.Sh. va sana.', kr: '• Тўловчи Ф.И.Ш. ва санаси.', ru: '• Ф.И.О. плательщика и архивные даты.'),
        whereToGet: MultiLangText(uz: 'Shaxsiy arxiv yoki to‘lov tizimlari arxivlaridan.', kr: 'Шахсий архив ёки тўлов тизимларидан.', ru: 'Из домашнего архива или банковских выписок.'),
        arxitekturaBoglanishi: MultiLangText(uz: 'Qurilish va arxitektura bino xavfli zonada emasligini bepul tekshiradi.', kr: 'Архитектура хавфли ҳудудда эмаслигини бепул текширади.', ru: 'Архитектура бесплатно проверяет безопасность расположения дома.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Vositachilik haqlari', kr: 'Воситачилик ҳақлари', ru: 'Плата за посредничество'),
      MultiLangText(uz: 'Komissiya xodimlariga pul berish', kr: 'Комиссия ходимларига нақд пул бериш', ru: 'Передача наличных денег членам комиссии'),
    ],
  ),
];

// ---------------- HUJJATLAR LUG‘ATI (QOMUS) ----------------
class DocVocabulary {
  final MultiLangText term;
  final MultiLangText simpleExplanation;
  final MultiLangText whatIsInside;
  final MultiLangText whereToFind;

  DocVocabulary({
    required this.term,
    required this.simpleExplanation,
    required this.whatIsInside,
    required this.whereToFind,
  });
}

final List<DocVocabulary> allVocabularies = [
  DocVocabulary(
    term: MultiLangText(uz: 'Hokim Qarori (Qaror nima?)', kr: 'Ҳоким Қарори (Қарор нима?)', ru: 'Решение хокима (Что это?)'),
    simpleExplanation: MultiLangText(uz: 'Tuman yoki shahar hokimi tomonidan fuqaroga yer ajratish, uy qurishga ruxsat berish haqida chiqarilgan rasmiy davlat hujjati. (Hozir yangi qaror chiqarish bekor qilingan, faqat eski arxiv qarorlari amal qiladi).', kr: 'Ҳоким томонидан ер ажратиш ҳақида чиқарилган ҳужжат. (Янги қарор чиқариш бекор қилинган, эскилари амал қилади).', ru: 'Распорядительный акт о выделении участка (новые решения отменены, действуют архивные).'),
    whatIsInside: MultiLangText(uz: '• Hokim imzosi, gerbli muhr va sana;\n• Kimga, qancha yer va qanday maqsadda berilgani.', kr: '• Ҳоким имзоси, муҳр ва сана;\n• Кимга, қанча ер берилгани.', ru: '• Подпись хокима, гербовая печать, дата, Ф.И.О. и площадь.'),
    whereToFind: MultiLangText(uz: 'Tuman hokimligi devonxonasidan yoki viloyat davlat arxividan tasdiqlangan nusxasi olinadi.', kr: 'Ҳокимлик девонхонаси ёки вилоят давлат архивидан.', ru: 'В канцелярии хокимията или областном государственном архиве.'),
  ),
  DocVocabulary(
    term: MultiLangText(uz: 'Oldi-sotdi shartnomasi nima?', kr: 'Олди-сотди шартномаси нима?', ru: 'Договор купли-продажи (Что это?)'),
    simpleExplanation: MultiLangText(uz: 'Uyni sotib olganingizda notarius ishtirokida imzolanadigan eng asosiy gerbli hujjat.', kr: 'Уйни сотиб олганда нотариусда имзоланадиган асосий ҳужжат.', ru: 'Основной документ о покупке недвижимости, заверенный нотариусом.'),
    whatIsInside: MultiLangText(uz: '• Sotuvchi va xaridor pasportlari;\n• Mulkning summasi, manzili va notarius muhri.', kr: '• Сотувчи ва харидор паспортлари;\n• Мулк суммаси, манзил ва муҳр.', ru: '• Паспортные данные сторон, сумма сделки, адрес и печать.'),
    whereToFind: MultiLangText(uz: 'Bitim tuzilgan notarial idoradan dublikati olinadi.', kr: 'Битим тузилган нотариал идорадан.', ru: 'В нотариальной конторе оформления (выдается дубликат).'),
  ),
  DocVocabulary(
    term: MultiLangText(uz: 'APZ (Arxitektura topshirig‘i) nima?', kr: 'АПЗ (Архитектура топшириғи) нима?', ru: 'АПЗ (Архитектурное задание)'),
    simpleExplanation: MultiLangText(uz: 'Uy yoki bino qurishdan oldin arxitektura bo‘limi beradigan ruxsatnoma. Unda bino necha qavat bo‘lishi va qizil chiziq chegaralari yoziladi.', kr: 'Қурилишдан олдин архитектура берадиган рухсатнома.', ru: 'Градостроительный документ, определяющий этажность и границы застройки.'),
    whatIsInside: MultiLangText(uz: '• Qavatlar soni, qizil chiziq chegaralari;\n• Muhandislik tarmoqlariga ulanish shartlari.', kr: '• Қаватлар сони, қизил чизиқ чегаралари.', ru: '• Красные линии, этажность и техусловия сетей.'),
    whereToFind: MultiLangText(uz: 'my.gov.uz portali orqali tuman Qurilish va arxitektura bo‘limidan olinadi.', kr: 'my.gov.uz орқали архитектура бўлимидан.', ru: 'Через портал my.gov.uz из районного отдела архитектуры.'),
  ),
  DocVocabulary(
    term: MultiLangText(uz: 'Mulk ko‘chirmasi (Vipiska) nima?', kr: 'Мулк кўчирмаси (Виписка) нима?', ru: 'Выписка из реестра (Vipiska)'),
    simpleExplanation: MultiLangText(uz: 'Eski ko‘k qog‘oz guvohnomalar o‘rniga beriladigan yagona elektron QR-kodli hujjat. Mulk ayni daqiqada kimniki ekanini isbotlaydi.', kr: 'Эски кўк гувоҳнома ўрнига бериладиган ягона QR-кодли ҳужжат.', ru: 'Цифровой документ с QR-кодом, заменивший бумажные свидетельства.'),
    whatIsInside: MultiLangText(uz: '• Kadastr raqami, hozirgi mulkdor va QR-kod.', kr: '• Кадастр рақами, мулкдор ва QR-код.', ru: '• Кадастровый номер, имя владельца и QR-код.'),
    whereToFind: MultiLangText(uz: 'my.gov.uz orqali yoki Davlat xizmatlari markazidan (DXM).', kr: 'my.gov.uz орқали ёки ДХМдан.', ru: 'Через my.gov.uz или в Центре госуслуг.'),
  ),
];

// ---------------- NAVIGATSIYA ----------------
class MainNavigationScreen extends StatefulWidget {
  final AppLanguage currentLanguage;
  final Function(AppLanguage) onLanguageChanged;

  const MainNavigationScreen({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    final pages = [
      CategorySelectionScreen(lang: lang),
      AllServicesListScreen(lang: lang),
      CalculatorScreen(lang: lang),
      AmnestyTestScreen(lang: lang),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Осон Кадастр' : (lang == AppLanguage.uzbekCyrillic ? 'Осон Кадастр' : 'Oson Kadastr'),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          PopupMenuButton<AppLanguage>(
            icon: const Icon(Icons.language, color: Colors.white, size: 28),
            onSelected: widget.onLanguageChanged,
            itemBuilder: (ctx) => [
              const PopupMenuItem(value: AppLanguage.uzbekLatin, child: Text('🇺🇿 O‘zbekcha (Lotin)', style: TextStyle(fontWeight: FontWeight.bold))),
              const PopupMenuItem(value: AppLanguage.uzbekCyrillic, child: Text('🇺🇿 Ўзбекча (Кирилл)', style: TextStyle(fontWeight: FontWeight.bold))),
              const PopupMenuItem(value: AppLanguage.russian, child: Text('🇷🇺 Русский', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.white, size: 26),
            tooltip: 'Lug‘at',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VocabularyScreen(lang: lang))),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white, size: 26),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen(lang: lang))),
          ),
        ],
      ),
      drawer: AppDrawer(lang: lang),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF08336E),
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: lang == AppLanguage.russian ? 'Категории' : 'Toifalar',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt),
            label: lang == AppLanguage.russian ? '22 услуги' : '22 ta xizmat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calculate),
            label: lang == AppLanguage.russian ? 'Калькулятор' : 'Kalkulyator',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.fact_check),
            label: lang == AppLanguage.russian ? 'Тест ЗРУ-937' : 'Test 937',
          ),
        ],
      ),
    );
  }
}

// ---------------- 1-TAB: TOIFALAR ----------------
class CategorySelectionScreen extends StatelessWidget {
  final AppLanguage lang;
  const CategorySelectionScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF08336E), Color(0xFF0D47A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.blue.shade900.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.shield, color: Color(0xFF64B5F6), size: 30),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      lang == AppLanguage.russian ? 'Антикоррупционный навигатор' : 'Korrupsiyaga qarshi huquqiy yo‘riqnoma',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                lang == AppLanguage.russian
                    ? 'Выберите направление: какие документы нужны, когда требуется архитектура и сколько платить по закону.'
                    : 'Kerakli yo‘nalishni tanlang: qanday hujjatlar kerak, Arxitektura va qurilish bo‘limi qachon talab etiladi va qonuniy to‘lov qancha ekanini bilib oling.',
                style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          lang == AppLanguage.russian ? 'ОСНОВНЫЕ НАПРАВЛЕНИЯ' : (lang == AppLanguage.uzbekCyrillic ? 'АСОСИЙ ЙЎНАЛИШЛАР' : 'ASOSIY XIZMAT TOIFALARI'),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B), letterSpacing: 0.8),
        ),
        const SizedBox(height: 10),
        ...allCategories.map((cat) {
          final count = all22Services.where((s) => s.categoryId == cat.id).length;
          return Card(
            elevation: 2.5,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CategoryDetailServicesScreen(category: cat, lang: lang),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: cat.color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(cat.icon, color: cat.color, size: 30),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat.title.get(lang),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A)),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cat.description.get(lang),
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade700, height: 1.3),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              '$count ${lang == AppLanguage.russian ? "услуг" : "ta xizmat"}',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: cat.color),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

// ---------------- TOIFA ICHIDAGI RO‘YXAT ----------------
class CategoryDetailServicesScreen extends StatelessWidget {
  final ServiceCategory category;
  final AppLanguage lang;

  const CategoryDetailServicesScreen({super.key, required this.category, required this.lang});

  @override
  Widget build(BuildContext context) {
    final filtered = all22Services.where((s) => s.categoryId == category.id).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: category.color,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          category.title.get(lang),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filtered.length,
        itemBuilder: (context, i) {
          final item = filtered[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: category.color.withOpacity(0.12),
                child: Icon(item.icon, color: category.color, size: 26),
              ),
              title: Text(
                item.titleSimple.get(lang),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B)),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(item.titleOfficial.get(lang), maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
                  const SizedBox(height: 6),
                  Text('Muddati: ${item.duration.get(lang)}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueGrey),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(service: item, lang: lang)));
              },
            ),
          );
        },
      ),
    );
  }
}

// ---------------- 2-TAB: BARCHA 22 TA XIZMAT ----------------
class AllServicesListScreen extends StatefulWidget {
  final AppLanguage lang;
  const AllServicesListScreen({super.key, required this.lang});

  @override
  State<AllServicesListScreen> createState() => _AllServicesListScreenState();
}

class _AllServicesListScreenState extends State<AllServicesListScreen> {
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;
    final list = all22Services.where((s) {
      final q = _search.toLowerCase();
      return s.titleSimple.get(lang).toLowerCase().contains(q) || s.titleOfficial.get(lang).toLowerCase().contains(q);
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
          child: TextField(
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: lang == AppLanguage.russian ? 'Поиск среди 22 услуг...' : '22 ta xizmat bo‘yicha qidiruv...',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF08336E)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
            onChanged: (v) => setState(() => _search = v),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              final s = list[i];
              return Card(
                elevation: 1.5,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE8EEF7),
                    child: Icon(s.icon, color: const Color(0xFF08336E), size: 24),
                  ),
                  title: Text(s.titleSimple.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  subtitle: Text(s.titleOfficial.get(lang), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(service: s, lang: lang))),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ---------------- 3-TAB: KALKULYATOR ----------------
class CalculatorScreen extends StatefulWidget {
  final AppLanguage lang;
  const CalculatorScreen({super.key, required this.lang});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final double bhm = 375000;
  String _selectedType = 'turar';
  final TextEditingController _areaController = TextEditingController(text: '70');
  double _total = 0;

  @override
  void initState() {
    super.initState();
    _calc();
  }

  void _calc() {
    double a = double.tryParse(_areaController.text) ?? 0;
    setState(() {
      if (_selectedType == 'turar') {
        if (a <= 100) {
          _total = bhm * 1.25;
        } else if (a <= 300) {
          _total = bhm * 2.0;
        } else {
          _total = bhm * 3.0;
        }
      } else if (_selectedType == 'reyestr') {
        _total = bhm * 1.0;
      } else if (_selectedType == 'spravka') {
        _total = bhm * 0.05;
      } else {
        _total = bhm * 3.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              const Icon(Icons.verified, color: Colors.green, size: 28),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  lang == AppLanguage.russian ? 'Официальный расчет по ставкам БРВ. Не переплачивайте посредникам!' : 'BHM asosidagi rasmiy qonuniy stavkalar. Vositachilarga aldanmang!',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lang == AppLanguage.russian ? 'Выберите услугу:' : 'Xizmat turini tanlang:', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                  items: const [
                    DropdownMenuItem(value: 'turar', child: Text('Turar joy kadastr pasporti')),
                    DropdownMenuItem(value: 'reyestr', child: Text('Mulkni davlat ro‘yxatidan o‘tkazish')),
                    DropdownMenuItem(value: 'spravka', child: Text('Elektron ko‘chirma (QR-kodli)')),
                    DropdownMenuItem(value: 'noturar', child: Text('Tadbirkorlik (Noturar bino)')),
                  ],
                  onChanged: (v) {
                    _selectedType = v!;
                    _calc();
                  },
                ),
                if (_selectedType == 'turar' || _selectedType == 'noturar') ...[
                  const SizedBox(height: 14),
                  Text(lang == AppLanguage.russian ? 'Площадь объекта (кв. метр):' : 'Bino umumiy maydoni (kv. metr):', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _areaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), suffixText: 'kv.m'),
                    onChanged: (v) => _calc(),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xFF08336E), borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Text(lang == AppLanguage.russian ? 'ОФИЦИАЛЬНАЯ ГОСПОШЛИНА' : 'QONUNIY RASMIY TO‘LOV', style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1)),
              const SizedBox(height: 8),
              Text(
                '${_total.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so‘m',
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                lang == AppLanguage.russian ? 'Скидка 10% при оплате через my.gov.uz!' : 'my.gov.uz orqali to‘lansa 10% chegirma beriladi!',
                style: const TextStyle(color: Color(0xFF81C784), fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// ---------------- 4-TAB: AMNISTIYA TESTI ----------------
class AmnestyTestScreen extends StatefulWidget {
  final AppLanguage lang;
  const AmnestyTestScreen({super.key, required this.lang});

  @override
  State<AmnestyTestScreen> createState() => _AmnestyTestScreenState();
}

class _AmnestyTestScreenState extends State<AmnestyTestScreen> {
  int _q1 = -1;
  int _q2 = -1;
  int _q3 = -1;

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;
    bool done = _q1 != -1 && _q2 != -1 && _q3 != -1;
    bool ok = _q1 == 1 && _q2 == 0 && _q3 == 0;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.amber)),
          child: Text(
            lang == AppLanguage.russian ? 'Проверьте за 1 минуту: подпадает ли ваш дом под признание прав по Закону ЗРУ-937.' : 'Uyingiz O‘RQ-937-son Qonun bo‘yicha eʼtirof etilishga tushadimi? 1 daqiqada tekshiring.',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
        ),
        const SizedBox(height: 16),
        _buildQ('1. Uyingiz 2018-yil 1-maygacha qurilganmi?', _q1, () => setState(() => _q1 = 1), () => setState(() => _q1 = 0)),
        _buildQ('2. Uy daryo bo‘yi, gaz quvuri yoki simlar ostidami?', _q2, () => setState(() => _q2 = 1), () => setState(() => _q2 = 0)),
        _buildQ('3. Qo‘shnilar bilan yer talashi (sud/nizo) bormi?', _q3, () => setState(() => _q3 = 1), () => setState(() => _q3 = 0)),
        if (done) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ok ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ok ? Colors.green : Colors.red, width: 1.5),
            ),
            child: Column(
              children: [
                Icon(ok ? Icons.check_circle : Icons.cancel, color: ok ? Colors.green : Colors.red, size: 40),
                const SizedBox(height: 10),
                Text(
                  ok ? 'UYINGIZ AMNISTIYAGA TUSHADI!' : 'ALOHIDA HUQUQIY O‘RGANISH TALAB ETILADI',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ok ? Colors.green.shade900 : Colors.red.shade900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  ok
                      ? 'Uyingiz ishchi guruh tomonidan bepul xatlov qilinadi. Hech kimga bitta ham so‘m pul bermang!'
                      : 'Muhofaza zonasida joylashgan yoki sud nizosi bor yerlar avtomat qonuniylashtirilmaydi.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, height: 1.4),
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  Widget _buildQ(String text, int val, VoidCallback onYes, VoidCallback onNo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: val == 1 ? const Color(0xFF08336E) : null, foregroundColor: val == 1 ? Colors.white : null),
                    onPressed: onYes,
                    child: const Text('Ha'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(backgroundColor: val == 0 ? const Color(0xFF08336E) : null, foregroundColor: val == 0 ? Colors.white : null),
                    onPressed: onNo,
                    child: const Text('Yo‘q'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ---------------- XIZMAT TAFSILOTLARI ----------------
class DetailScreen extends StatelessWidget {
  final KadastrService service;
  final AppLanguage lang;

  const DetailScreen({super.key, required this.service, required this.lang});

  void _showDocumentDetail(BuildContext context, RequiredDocument doc) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const CircleAvatar(backgroundColor: Color(0xFFE8F5E9), child: Icon(Icons.find_in_page, color: Colors.green)),
                  const SizedBox(width: 12),
                  Expanded(child: Text(doc.simpleName.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                ],
              ),
              const Divider(height: 24),
              const Text('Rasmiy nomi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
              Text(doc.officialName.get(lang), style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 14),
              const Text('Bu qanday hujjat? (Oddiy xalq tilida):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF08336E))),
              const SizedBox(height: 4),
              Text(doc.whatIsIt.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 14),
              const Text('Hujjat ichida nimalar yozilgan bo‘lishi shart:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepOrange)),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(10)),
                child: Text(doc.insideContent.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              ),
              const SizedBox(height: 14),
              const Text('Arxitektura va qurilish bo‘limi bilan bog‘liqligi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF4A148C))),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFF3E5F5), borderRadius: BorderRadius.circular(10)),
                child: Text(doc.arxitekturaBoglanishi.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              ),
              const SizedBox(height: 14),
              const Text('Qayerdan olasiz yoki yo‘qolgan bo‘lsa:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green)),
              const SizedBox(height: 4),
              Text(doc.whereToGet.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF08336E), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Tushundim', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(service.titleSimple.get(lang), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(14),
        color: Colors.white,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          icon: const Icon(Icons.checklist, size: 22),
          label: const Text('Hujjatlarim yetarlimi? Tekshirish', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CheckScreen(service: service, lang: lang))),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Xizmat nima uchun kerak?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF08336E))),
                const SizedBox(height: 6),
                Text(service.purpose.get(lang), style: const TextStyle(fontSize: 15, height: 1.4)),
                const Divider(height: 24),
                Text('Muddati: ${service.duration.get(lang)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text('To‘lov: ${service.cost.get(lang)}', style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.orange.shade300)),
            child: Row(
              children: [
                const Icon(Icons.warning, color: Colors.deepOrange, size: 24),
                const SizedBox(width: 10),
                Expanded(child: Text(service.warningTip.get(lang), style: const TextStyle(color: Color(0xFFBF360C), fontWeight: FontWeight.bold, fontSize: 14, height: 1.35))),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Kerakli hujjatlar (Batafsil bilish uchun bosing):', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...service.docs.map((d) => Card(
            elevation: 1.5,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _showDocumentDetail(context, d),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 20, backgroundColor: Color(0xFFE8EEF7), child: Icon(Icons.assignment, color: Color(0xFF08336E), size: 22)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.simpleName.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF08336E))),
                          const SizedBox(height: 2),
                          Text('Qayerdan: ${d.whereToGet.get(lang)}', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.touch_app, size: 20, color: Colors.blueGrey),
                  ],
                ),
              ),
            ),
          )),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bularni talab qilishga HAQLARI YO‘Q:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                const SizedBox(height: 6),
                ...service.illegalDemands.map((il) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('❌ ${il.get(lang)}', style: const TextStyle(color: Color(0xFFB71C1C), fontSize: 13, fontWeight: FontWeight.w600)),
                )),
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
  final AppLanguage lang;

  const CheckScreen({super.key, required this.service, required this.lang});

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
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Hujjatlarim yetarlimi?', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Qo‘lingizda mavjud hujjatlarni belgilang:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...List.generate(widget.service.docs.length, (i) {
            final doc = widget.service.docs[i];
            final val = _checked[i] ?? false;
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: CheckboxListTile(
                value: val,
                title: Text(doc.simpleName.get(widget.lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text('Manba: ${doc.whereToGet.get(widget.lang)}'),
                onChanged: (newVal) => setState(() => _checked[i] = newVal ?? false),
              ),
            );
          }),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: isComplete ? const Color(0xFFE8F5E9) : const Color(0xFFFFFDE7),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: isComplete ? Colors.green : Colors.amber.shade700, width: 1.5),
            ),
            child: Column(
              children: [
                Icon(isComplete ? Icons.check_circle : Icons.warning_amber, color: isComplete ? Colors.green : Colors.amber.shade900, size: 42),
                const SizedBox(height: 10),
                Text(
                  isComplete ? 'Hujjatlaringiz to‘liq!' : 'Hujjatlar to‘liq emas ($count / $total)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isComplete ? Colors.green.shade900 : Colors.amber.shade900),
                ),
                const SizedBox(height: 8),
                Text(
                  isComplete
                      ? 'Endi bemalol Davlat xizmatlari markaziga yoki my.gov.uz orqali ariza yuborishingiz mumkin. Hech kim qo‘shimcha hujjat talab qila olmaydi.'
                      : 'Belgilanmagan hujjatlarni yuqorida ko‘rsatilgan idoradan olib, keyin murojaat qiling.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ---------------- LUG‘AT (QOMUS) ----------------
class VocabularyScreen extends StatelessWidget {
  final AppLanguage lang;
  const VocabularyScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Hujjatlar nima? (Sodda qomus)', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allVocabularies.length,
        itemBuilder: (ctx, i) {
          final item = allVocabularies[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              initiallyExpanded: i == 0,
              leading: const CircleAvatar(backgroundColor: Color(0xFFE8EEF7), child: Icon(Icons.menu_book, color: Color(0xFF08336E))),
              title: Text(item.term.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      Text(item.simpleExplanation.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
                      const SizedBox(height: 10),
                      const Text('Hujjat ichida nimalar yozilgan bo‘ladi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF08336E))),
                      const SizedBox(height: 4),
                      Text(item.whatIsInside.get(lang), style: const TextStyle(fontSize: 13, height: 1.4)),
                      const SizedBox(height: 10),
                      const Text('Qayerdan topiladi:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
                      const SizedBox(height: 4),
                      Text(item.whereToFind.get(lang), style: const TextStyle(fontSize: 13, height: 1.4)),
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

// ---------------- LOYIHA HAQIDA VA ALOQA ----------------
class AboutScreen extends StatelessWidget {
  final AppLanguage lang;
  const AboutScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Loyiha maqsadi va Aloqa', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.shield, color: Colors.red, size: 28),
                      SizedBox(width: 10),
                      Expanded(child: Text('Loyihaning rasmiy maqsadi', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF08336E)))),
                    ],
                  ),
                  const Divider(height: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Ushbu loyiha O‘zbekiston Respublikasi Kadastr agentligining Korrupsiyaga qarshi kurashish bo‘limi tashabbusi asosida ishlab chiqildi.',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20), height: 1.35),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Asosiy vazifa: Fuqarolarning o‘zida qanday hujjat borligini bilmasdan vositachilar (maklerlar) tuzog‘iga tushib qolishining oldini olish, asossiz talablarga chek qo‘yish va barcha 22 ta rasmiy xizmat bo‘yicha shaffof qo‘llanma berish.',
                    style: TextStyle(fontSize: 14, height: 1.45),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  CircleAvatar(radius: 36, backgroundColor: Color(0xFF08336E), child: Icon(Icons.person, size: 40, color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Muxriddin Elbegiyev', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Dastur yaratuvchisi va loyiha muallifi', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  Divider(height: 24),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(backgroundColor: Color(0xFFE8F5E9), child: Icon(Icons.phone, color: Colors.green)),
                    title: Text('Telefon raqam', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: Text('+998 33 911 22 22', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(backgroundColor: Color(0xFFE1F5FE), child: Icon(Icons.send, color: Colors.lightBlue)),
                    title: Text('Telegram aloqa', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: Text('+998 33 911 22 22', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF08336E))),
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

// ---------------- YON MENYU (DRAWER) ----------------
class AppDrawer extends StatelessWidget {
  final AppLanguage lang;
  const AppDrawer({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF08336E)),
            accountName: const Text('Oson Kadastr', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            accountEmail: const Text('Korrupsiyaga qarshi huquqiy yo‘riqnoma'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.shield, color: Color(0xFF08336E), size: 40),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book, color: Color(0xFF08336E)),
            title: const Text('Hujjatlar nima? (Qomus)', style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => VocabularyScreen(lang: lang)));
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.support_agent, color: Colors.green),
            title: Text('Kadastr Call-markazi: 1097', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blueGrey),
            title: const Text('Muallif bilan aloqa', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('+998 33 911 22 22'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen(lang: lang)));
            },
          ),
        ],
      ),
    );
  }
}
