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
      home: CategorySelectionScreen(
        currentLanguage: currentLanguage,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

// ---------------- TIL MODELLARI ----------------
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

// ---------------- HUJJAT VA ARXITEKTURA MODELI ----------------
class RequiredDocument {
  final MultiLangText simpleName;
  final MultiLangText officialName;
  final MultiLangText whatIsIt;
  final MultiLangText insideContent;
  final MultiLangText whereToGet;
  final MultiLangText arxitekturaBoglanishi; // Arxitektura va qurilishga aloqasi

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

// ---------------- 6 TA ASOSIY XIZMATLAR TOIFASI (TIPLARI) ----------------
final List<ServiceCategory> serviceCategories = [
  ServiceCategory(
    id: 'turar',
    icon: Icons.home,
    color: const Color(0xFF0D47A1),
    title: MultiLangText(
      uz: 'Aholi turar joy xizmatlari',
      kr: 'Аҳоли турар жой хизматлари',
      ru: 'Жилая недвижимость граждан',
    ),
    description: MultiLangText(
      uz: 'Kvartiralar, yakka tartibdagi hovli uylar, uy bo‘lish va manzil berish.',
      kr: 'Квартиралар, якка тартибдаги ҳовли уйлар, уй бўлиш ва манзил бериш.',
      ru: 'Квартиры, частные жилые дома, раздел жилья и присвоение адресов.',
    ),
  ),
  ServiceCategory(
    id: 'noturar',
    icon: Icons.storefront,
    color: const Color(0xFF00695C),
    title: MultiLangText(
      uz: 'Tadbirkorlik va noturar binolar',
      kr: 'Тадбиркорлик ва нотурар бинолар',
      ru: 'Коммерческая и нежилая недвижимость',
    ),
    description: MultiLangText(
      uz: 'Do‘konlar, ofislar, ishlab chiqarish sexlari va ijara munosabatlari.',
      kr: 'Дўконлар, офислар, ишлаб чиқариш цехлари ва ижара муносабатлари.',
      ru: 'Магазины, офисы, склады, производство и долгосрочная аренда.',
    ),
  ),
  ServiceCategory(
    id: 'qonun937',
    icon: Icons.verified,
    color: const Color(0xFFE65100),
    title: MultiLangText(
      uz: 'O‘RQ-937 Qonuni (Amnistiya)',
      kr: 'ЎРҚ-937 Қонуни (Амнистия)',
      ru: 'Закон ЗРУ-937 (Амнистия жилья)',
    ),
    description: MultiLangText(
      uz: 'Hujjatsiz uylar, o‘zboshimchalik bilan egallangan yerlarni qonuniylashtirish.',
      kr: 'Ҳужжатсиз уйлар, ўзбошимчалик билан эгалланган ерларни қонунийлаштириш.',
      ru: 'Признание прав на самовольно занятые участки и дома без документов.',
    ),
  ),
  ServiceCategory(
    id: 'qurilish',
    icon: Icons.architecture,
    color: const Color(0xFF4A148C),
    title: MultiLangText(
      uz: 'Yangi qurilish va Arxitektura',
      kr: 'Янги қурилиш ва Архитектура',
      ru: 'Новое строительство и Архитектура',
    ),
    description: MultiLangText(
      uz: 'APZ olish, loyiha kelishuvi, rekonstruksiya va foydalanishga qabul (GASN).',
      kr: 'АПЗ олиш, лойиҳа келишуви, реконструкция ва фойдаланишга қабул (ГАСН).',
      ru: 'Получение АПЗ, согласование проектов, реконструкция и акт ввода (ГАСН).',
    ),
  ),
  ServiceCategory(
    id: 'yer',
    icon: Icons.landscape,
    color: const Color(0xFF2E7D32),
    title: MultiLangText(
      uz: 'Yer ajratish va E-auksion',
      kr: 'Ер ажратиш ва Э-аукцион',
      ru: 'Земельные участки и Аукцион',
    ),
    description: MultiLangText(
      uz: 'E-auksion orqali yer olish, fermer xo‘jaligi ijarasi va servitut.',
      kr: 'Э-аукцион орқали ер олиш, фермер хўжалиги ижараси ва сервитут.',
      ru: 'Покупка земли на онлайн-аукционе, сельхозаренда и сервитут.',
    ),
  ),
  ServiceCategory(
    id: 'spravka',
    icon: Icons.description,
    color: const Color(0xFF37474F),
    title: MultiLangText(
      uz: 'Elektron maʼlumotnomalar (Reyestr)',
      kr: 'Электрон маълумотномалар (Реестр)',
      ru: 'Справки и выписки из реестра',
    ),
    description: MultiLangText(
      uz: 'Mulk ko‘chirmasi (Vipiska), taqiq (zapret) va uy yo‘qligi spravkasi.',
      kr: 'Мулк кўчирмаси (Виписка), тақиқ (запрет) ва уй йўқлиги справкаси.',
      ru: 'Выписки с QR-кодом, проверка запретов/арестов и отсутствие жилья.',
    ),
  ),
];

// ---------------- BARCHA 22 TA XIZMAT (ARXITEKTURA VA HUQUQ TALQINI BILAN) ----------------
final List<KadastrService> allServices = [
  // 1. Turar joy pasporti
  KadastrService(
    id: '1',
    icon: Icons.home_work,
    categoryId: 'turar',
    titleSimple: MultiLangText(
      uz: 'Hovli uy va kvartiraga kadastr pasportini shakllantirish',
      kr: 'Ҳовли уй ва квартирага кадастр паспортини шакллантириш',
      ru: 'Оформление кадастрового паспорта на квартиру или жилой дом',
    ),
    titleOfficial: MultiLangText(
      uz: 'Turar joy obyektiga kadastr pasportini berish (VM 535-son qaror)',
      kr: 'Турар жой объектига кадастр паспортини бериш (ВМ 535-сон қарор)',
      ru: 'Выдача кадастрового паспорта на объект жилого фонда (ПКМ №535)',
    ),
    purpose: MultiLangText(
      uz: 'Uyning umumiy va yashash maydonini aniq o‘lchash, elektron chizmasini yaratish va davlat tizimiga kiritish.',
      kr: 'Уйнинг умумий ва яшаш майдонини аниқ ўлчаш, электрон чизмасини яратиш ва давлат тизимига киритиш.',
      ru: 'Техническая инвентаризация, замер жилой и общей площади, формирование электронного чертежа.',
    ),
    duration: MultiLangText(
      uz: 'Kvartira: 3 ish kuni; Hovli uy: 5 ish kuni',
      kr: 'Квартира: 3 иш куни; Ҳовли уй: 5 иш куни',
      ru: 'Квартира: 3 раб. дня; Частный дом: 5 раб. дней',
    ),
    cost: MultiLangText(
      uz: 'Maydoniga qarab tasdiqlangan invoys (my.gov.uz orqali 10% chegirma)',
      kr: 'Майдонига қараб тасдиқланган инвойс (my.gov.uz орқали 10% чегирма)',
      ru: 'По государственному инвойсу в зависимости от площади (10% скидка на my.gov.uz)',
    ),
    warningTip: MultiLangText(
      uz: 'OGOH BO‘LING: Agar hovlingizda arxitektura ruxsatisiz yangi imorat qurilgan bo‘lsa, u kadastrda "o‘zboshimchalik" deb belgilanadi. Qo‘lda pul bermang!',
      kr: 'ОГОҲ БЎЛИНГ: Агар ҳовлингизда архитектура рухсатисиз янги иморат қурилган бўлса, у кадастрда "ўзбошимчалик" деб белгиланади. Қўлда пул берманг!',
      ru: 'ВНИМАНИЕ: При возведении построек без разрешения архитектуры они фиксируются как самовольные. Не давайте наличных денег!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Mulk huquqini belgilovchi asosiy hujjat',
          kr: 'Мулк ҳуқуқини белгиловчи асосий ҳужжат',
          ru: 'Правоустанавливающий документ на жилье',
        ),
        officialName: MultiLangText(
          uz: 'Notarial oldi-sotdi/hadya shartnomasi, meros guvohnomasi yoki hokim qarori',
          kr: 'Нотариал олди-сотди/ҳадя шартномаси, мерос гувоҳномаси ёки ҳоким қарори',
          ru: 'Договор купли-продажи, дарения, свидетельство о праве на наследство или решение хокима',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uy qonuniy ravishda sizga tegishli ekanini bildiruvchi eng muhim gerbli hujjat.',
          kr: 'Уй қонуний равишда сизга тегишли эканини билдирувчи энг муҳим гербли ҳужжат.',
          ru: 'Официальный гербовый документ, подтверждающий возникновение законного права собственности.',
        ),
        insideContent: MultiLangText(
          uz: '• Notarius muhri, bitim sanasi va reyestr raqami;\n• Mulkdorning F.I.Sh. va aniq pasport maʼlumotlari;\n• Mulkning to‘liq manzili.',
          kr: '• Нотариус муҳри, битим санаси ва реестр рақами;\n• Мулкдорнинг Ф.И.Ш. ва аниқ паспорт маълумотлари;\n• Мулкнинг тўлиқ манзили.',
          ru: '• Гербовая печать нотариуса, дата и номер реестра;\n• Ф.И.О. собственника и адрес объекта.',
        ),
        whereToGet: MultiLangText(
          uz: 'Notarial idoradan, hokimiyat arxividan yoki viloyat davlat arxividan.',
          kr: 'Нотариал идорадан, ҳокимият архивидан ёки вилоят давлат архивидан.',
          ru: 'В нотариальной конторе оформления или областном государственном архиве.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Mavjud uyni qayta pasportlashtirishda arxitektura talab etilmaydi. Faqat bino devorlari surilgan yoki yangi xona qo‘shilgan bo‘lsa, arxitektura xulosasi kerak bo‘ladi.',
          kr: 'Мавжуд уйни қайта паспортлаштиришда архитектура талаб этилмайди. Фақат бино деворлари сурилган бўлса, архитектура хулосаси керак.',
          ru: 'Для планового переоформления архитектура не требуется. Нужна только в случае пристроек или переноса капитальных стен.',
        ),
      ),
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Pasport / ID-karta (JShSHIR)',
          kr: 'Паспорт / ID-карта (ЖШШИР)',
          ru: 'Паспорт / ID-карта с ПИНФЛ',
        ),
        officialName: MultiLangText(
          uz: 'Shaxsni tasdiqlovchi hujjat',
          kr: 'Шахсни тасдиқловчи ҳужжат',
          ru: 'Документ, удостоверяющий личность заявителя',
        ),
        whatIsIt: MultiLangText(
          uz: '14 xonali unikal JShSHIR raqamingiz ko‘rsatilgan karta.',
          kr: '14 хонали уникал ЖШШИР рақамингиз кўрсатилган карта.',
          ru: 'Удостоверение личности с 14-значным персональным номером ПИНФЛ.',
        ),
        insideContent: MultiLangText(
          uz: '• F.I.Sh., rasm va 14 xonali JShSHIR raqami.',
          kr: '• Ф.И.Ш., расм ва 14 хонали ЖШШИР рақами.',
          ru: '• Ф.И.О., фотография и персональный ПИНФЛ.',
        ),
        whereToGet: MultiLangText(
          uz: 'Yoningizda bo‘lishi kifoya, qog‘oz nusxa berish shart emas.',
          kr: 'Ёнингизда бўлиши кифоя, қоғоз нусха бериш шарт эмас.',
          ru: 'Оригинал при себе. Бумажные копии сдавать запрещено.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Aloqasi yo‘q.',
          kr: 'Алоқаси йўқ.',
          ru: 'Не связано.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan maʼlumotnoma', kr: 'Маҳалладан маълумотнома', ru: 'Справка с махалли'),
      MultiLangText(uz: 'Qo‘shnilar rozilik tilxati', kr: 'Қўшнилар розилик тилхати', ru: 'Расписка от соседей'),
      MultiLangText(uz: 'Kommunal to‘lov qarz yo‘qligi cheklari', kr: 'Коммунал тўлов қарз йўқлиги чеклари', ru: 'Чеки коммунальных служб'),
    ],
  ),

  // 2. Yangi qurilish va rekonstruksiya (Arxitektura o‘rni)
  KadastrService(
    id: '2',
    icon: Icons.architecture,
    categoryId: 'qurilish',
    titleSimple: MultiLangText(
      uz: 'Yangi qurilgan uyni foydalanishga qabul qilish va pasport berish',
      kr: 'Янги қурилган уйни фойдаланишга қабул қилиш ва паспорт бериш',
      ru: 'Ввод нового дома в эксплуатацию и первичный кадастр',
    ),
    titleOfficial: MultiLangText(
      uz: 'Qurilishi tugallangan bino va inshootlarni foydalanishga qabul qilish va davlat ro‘yxatidan o‘tkazish',
      kr: 'Қурилиши тугалланган бино ва иншоотларни фойдаланишга қабул қилиш ва рўйхатдан ўтказиш',
      ru: 'Приемка завершенного строительством объекта в эксплуатацию и госрегистрация',
    ),
    purpose: MultiLangText(
      uz: 'Bo‘sh yerda yangi ko‘tarilgan bino yoki kapital qayta qurilgan imoratni qonuniy deb tan olish.',
      kr: 'Бўш ерда янги кўтарилган бино ёки капитал қайта қурилган иморатни қонуний деб тан олиш.',
      ru: 'Официальный ввод новостройки в эксплуатацию и присвоение первичного кадастрового номера.',
    ),
    duration: MultiLangText(uz: '7–10 ish kuni', kr: '7–10 иш куни', ru: '7–10 раб. дней'),
    cost: MultiLangText(uz: 'Tasdiqlangan invoys bo‘yicha', kr: 'Тасдиқланган инвойс бўйича', ru: 'По официальному инвойсу'),
    warningTip: MultiLangText(
      uz: 'DIQQAT: APZ (ruxsatnoma) olmasdan turib uy qurgan bo‘lsangiz, qurilish inspeksiyasi jarima qo‘llashi mumkin. Avval tuman arxitekturasidan kelishuv olinishi shart!',
      kr: 'ДИҚҚАТ: АПЗ (рухсатнома) олмасдан туриб уй қурган бўлсангиз, қурилиш инспекцияси жарима қўллаши мумкин. Аввал архитектурадан келишув олиниши шарт!',
      ru: 'ВНИМАНИЕ: Строительство без АПЗ влечет штрафы инспекции. Проект должен быть первично согласован с архитектурой!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'APZ — Arxitektura-rejalashtirish topshirig‘i',
          kr: 'АПЗ — Архитектура-режалаштириш топшириғи',
          ru: 'АПЗ — Архитектурно-планировочное задание',
        ),
        officialName: MultiLangText(
          uz: 'Tuman qurilish va arxitektura bo‘limi tomonidan berilgan APZ hujjati',
          kr: 'Туман қурилиш ва архитектура бўлими томонидан берилган АПЗ ҳужжати',
          ru: 'Архитектурно-планировочное задание отдела строительства и архитектуры',
        ),
        whatIsIt: MultiLangText(
          uz: 'Qurilish boshlanishidan oldin beriladigan ruxsatnoma. Unda uy necha qavat bo‘lishi va ko‘chadan necha metr ichkarida qurilishi yoziladi.',
          kr: 'Қурилиш бошланишидан олдин бериладиган рухсатнома. Унда уй неча қават бўлиши ва кўчадан неча метр ичкарида қурилиши ёзилади.',
          ru: 'Базовый градостроительный документ, определяющий этажность, пятно застройки и красные линии.',
        ),
        insideContent: MultiLangText(
          uz: '• Qizil chiziq chegaralari;\n• Qavatlar soni va balandlik chegarasi;\n• Muhandislik tarmoqlariga (svet, gaz, suv) ulanish shartlari.',
          kr: '• Қизил чизиқ чегаралари;\n• Қаватлар сони ва баландлик чегараси;\n• Муҳандислик тармоқларига уланиш шартлари.',
          ru: '• Красные линии и отступы;\n• Предельная этажность и высотность;\n• Техусловия подключения инженерных сетей.',
        ),
        whereToGet: MultiLangText(
          uz: 'my.gov.uz orqali yoki DXM orqali tuman Arxitektura va qurilish bo‘limidan olinadi.',
          kr: 'my.gov.uz орқали ёки ДХМ орқали туман Архитектура ва қурилиш бўлимидан олинади.',
          ru: 'Через портал my.gov.uz или в Центре госуслуг из районного отдела архитектуры.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Bu aynan Qurilish va arxitektura vazirligi tizimining eng asosiy poydevor hujjatidir.',
          kr: 'Бу айнан Қурилиш ва архитектура вазирлиги тизимининг энг асосий пойдевор ҳужжатидир.',
          ru: 'Является ключевым документом органов градостроительства до начала стройки.',
        ),
      ),
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Litsenziyali loyiha (Arxitektura chizmasi)',
          kr: 'Лицензияли лойиҳа (Архитектура чизмаси)',
          ru: 'Согласованный проект проектной организации',
        ),
        officialName: MultiLangText(
          uz: 'Litsenziyaga ega tashkilot tomonidan ishlab chiqilgan va kelishilgan loyiha',
          kr: 'Лицензияга эга ташкилот томонидан ишлаб чиқилган ва келишилган лойиҳа',
          ru: 'Проектная документация, разработанная лицензированной организацией',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uyingiz mustahkamligi, poydevori va seysmik xavfsizligi hisoblangan professional loyiha chizmasi.',
          kr: 'Уйингиз мустаҳкамлиги, пойдевори ва сейсмик хавфсизлиги ҳисобланган профессионал лойиҳа чизмаси.',
          ru: 'Архитектурно-строительный чертеж с расчетом сейсмостойкости и несущих конструкций.',
        ),
        insideContent: MultiLangText(
          uz: '• Loyiha tashkiloti muhri va litsenziya raqami;\n• Bino qavatlari, devorlari va xonalar o‘lchami.',
          kr: '• Лойиҳа ташкилоти муҳри ва лицензия рақами;\n• Бино қаватлари, деворлари ва хоналар ўлчами.',
          ru: '• Печать проектной организации и номер лицензии;\n• Экспликация помещений и разрезы здания.',
        ),
        whereToGet: MultiLangText(
          uz: 'Loyiha institutlari yoki xususiy litsenziyali arxitektorlardan buyurtma qilinadi.',
          kr: 'Лойиҳа институтлари ёки хусусий лицензияли архитекторлардан буюртма қилинади.',
          ru: 'Заказывается у частных лицензированных проектных организаций или институтов.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Loyiha tuman arxitektura bo‘limining shaharsozlik kengashida tasdiqlanadi.',
          kr: 'Лойиҳа туман архитектура бўлимининг шаҳарсозлик кенгашида тасдиқланади.',
          ru: 'Подлежит экспертизе и согласованию в градостроительном совете архитектуры.',
        ),
      ),
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'GASN ruxsatnomasi (Qurilish inspeksiyasi)',
          kr: 'ГАСН рухсатномаси (Қурилиш инспекцияси)',
          ru: 'Разрешение и акт инспекции контроля в сфере строительства',
        ),
        officialName: MultiLangText(
          uz: 'Qurilish-montaj ishlarini boshlash haqida xabarnoma va foydalanishga qabul dalolatnomasi',
          kr: 'Қурилиш-монтаж ишларини бошлаш ҳақида хабарнома ва қабул далолатномаси',
          ru: 'Уведомление о начале СМР и акт приемки объекта в эксплуатацию',
        ),
        whatIsIt: MultiLangText(
          uz: 'Davlat qurilish nazorati inspektori imorat xavfsiz qurilganini tekshirib beradigan elektron xulosa.',
          kr: 'Давлат қурилиш назорати инспектори иморат хавфсиз қурилганини текшириб берадиган электрон хулоса.',
          ru: 'Электронный акт госинспектора о соответствии построенного объекта нормам безопасности.',
        ),
        insideContent: MultiLangText(
          uz: '• Qabul komissiyasi aʼzolarining QR-kodli elektron imzolari.',
          kr: '• Қабул комиссияси аъзоларининг QR-кодли электрон имзолари.',
          ru: '• QR-код и электронные подписи инспекторов технадзора.',
        ),
        whereToGet: MultiLangText(
          uz: 'Qurilish vazirligi hududiy nazorat inspeksiyasidan (DXM orqali).',
          kr: 'Қурилиш вазирлиги ҳудудий назорат инспекциясидан (ДХМ орқали).',
          ru: 'В территориальной инспекции Минстроя через Центр госуслуг.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Qurilish inspeksiyasi obyekti qabul qilgandan keyingina kadastr organi uni ro‘yxatga oladi.',
          kr: 'Қурилиш инспекцияси объекти қабул қилгандан кейингина кадастр органи уни рўйхатга олади.',
          ru: 'Кадастр оформляет паспорт только на основании положительного акта инспекции.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Komissiya aʼzolarining uyga norasmiy kelishi uchun pul', kr: 'Комиссия аъзоларининг уйга норасмий келиши учун пул', ru: 'Оплата неофициальных выездов инспекторов'),
    ],
  ),

  // 3. O‘RQ-937 QONUNI BO‘YICHA AMNISTIYA (KENG TALQIN)
  KadastrService(
    id: '3',
    icon: Icons.verified,
    categoryId: 'qonun937',
    titleSimple: MultiLangText(
      uz: 'O‘RQ-937 Qonuni: Hujjatsiz yer va uylarni eʼtirof etish (Amnistiya)',
      kr: 'ЎРҚ-937 Қонуни: Ҳужжатсиз ер ва уйларни эътироф этиш (Амнистия)',
      ru: 'Закон ЗРУ-937: Признание прав на самовольное жилье и участки (Амнистия)',
    ),
    titleOfficial: MultiLangText(
      uz: 'O‘zboshimchalik bilan egallangan yer uchastkalari hamda ularda qurilgan binolar va inshootlarga bo‘lgan huquqlarni eʼtirof etish to‘g‘risidagi Qonun (05.08.2024 yildagi O‘RQ-937-son)',
      kr: 'Ўзбошимчалик билан эгалланган ер участкалари ҳамда биноларга бўлган ҳуқуқларни эътироф этиш тўғрисидаги Қонун',
      ru: 'Закон ЗРУ-937 от 05.08.2024 "О признании прав на самовольно занятые земельные участки и постройки"',
    ),
    purpose: MultiLangText(
      uz: '2018-yil 1-mayga qadar fuqarolar tomonidan hujjatsiz qurilgan yakka tartibdagi uy-joylarga, ortiqcha egallangan yerlarga rasmiy mulk huquqini berish.',
      kr: '2018 йил 1 майга қадар ҳужжатсиз қурилган якка тартибдаги уй-жойларга, ортиқча эгалланган ерларга расмий мулк ҳуқуқини бериш.',
      ru: 'Признание права собственности на жилые дома, возведенные гражданами без документов до 1 мая 2018 года, и излишки земли.',
    ),
    duration: MultiLangText(
      uz: 'Tuman ishchi guruhining hududiy xatlov reja-jadvali asosida',
      kr: 'Туман ишчи гуруҳининг ҳудудий хатлов режа-жадвали асосида',
      ru: 'По утвержденному графику сплошной инвентаризации рабочей группы района',
    ),
    cost: MultiLangText(
      uz: 'Qonunda belgilangan bir martalik to‘lov (Toshkentda 5 BHM, viloyatlarda 3 BHM, qishloqlarda 1 BHM)',
      kr: 'Қонунда белгиланган бир марталик тўлов (Тошкентда 5 БҲМ, вилоятларда 3 БҲМ, қишлоқларда 1 БҲМ)',
      ru: 'Разовый законный сбор (г. Ташкент — 5 БРВ, областные центры — 3 БРВ, села — 1 БРВ)',
    ),
    warningTip: MultiLangText(
      uz: 'OGOH BO‘LING: Amnistiya bo‘yicha hech qanday arizalar qabul qilinmaydi! Jarayon mahalla-mahalla kadastr va arxitektura xodimlari tomonidan BEPUL xatlov qilinadi. Vositachilarga bitta ham so‘m bermang!',
      kr: 'ОГОҲ БЎЛИНГ: Амнистия бўйича ариза топширилмайди! Жараён маҳаллама-маҳалла БЕПУЛ хатлов қилинади. Воситачиларга умуман пул берманг!',
      ru: 'ВАЖНО: Индивидуальные заявления не подаются! Сплошная инвентаризация по махаллям проводится БЕСПЛАТНО. Не платите маклерам ни сума!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Eski to‘lov kvitansiyalari (Soliq, svet, gaz)',
          kr: 'Эски тўлов квитанциялари (Солиқ, свет, газ)',
          ru: 'Архивные платежные квитанции за налоги и коммунальные услуги',
        ),
        officialName: MultiLangText(
          uz: '2018-yil 1-mayga qadar yer va mol-mulk solig‘i, elektr va gaz to‘langanini tasdiqlovchi arxiv cheklari',
          kr: '2018 йил 1 майга қадар ер ва мол-мулк солиғи, электр ва газ тўланганини тасдиқловчи архив чеклари',
          ru: 'Квитанции об уплате земельного/имущественного налога и услуг ЖКХ до 1 мая 2018 года',
        ),
        whatIsIt: MultiLangText(
          uz: 'Siz ushbu uyni ko‘p yillardan buyon egallab yashab kelayotganingizni isbotlovchi asosiy hujjat.',
          kr: 'Сиз ушбу уйни кўп йиллардан буён эгаллаб яшаб келаётганингизни исботловчи асосий ҳужжат.',
          ru: 'Ключевое доказательство добросовестного и непрерывного владения недвижимостью долгие годы.',
        ),
        insideContent: MultiLangText(
          uz: '• To‘lovchi F.I.Sh.;\n• To‘lov qilingan yil va oy sanasi;\n• Mulkning joylashgan manzili.',
          kr: '• Тўловчи Ф.И.Ш.;\n• Тўлов қилинган йил ва ой санаси;\n• Мулкнинг жойлашган манзили.',
          ru: '• Ф.И.О. плательщика, архивные даты оплат и адрес строения.',
        ),
        whereToGet: MultiLangText(
          uz: 'Shaxsiy arxiv hujjatlaringiz orasidan yoki bank/kommunal korxona arxiv bazalaridan.',
          kr: 'Шахсий архив ҳужжатларингиз орасидан ёки банк/коммунал корхона архив базаларидан.',
          ru: 'Из домашних архивов или выписок коммунальных баз снабжающих организаций.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Qurilish va arxitektura bo‘limi xatlov vaqtida bino xavfsizligini (daryo muhofazasi, yuqori kuchlanish ostida emasligini) bepul tekshiradi.',
          kr: 'Қурилиш ва архитектура бўлими хатлов вақтида бино хавфсизлигини (дарё бўйи, ток симлари остида эмаслигини) бепул текширади.',
          ru: 'Архитектура в составе комиссии бесплатно проверяет отсутствие нахождения дома в водоохранных и защитных зонах ЛЭП.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Amnistiyaga kiritish uchun alohida to‘lov', kr: 'Амнистияга киритиш учун алоҳида тўлов', ru: 'Плата за ускорение включения в списки'),
      MultiLangText(uz: 'Tuman komissiyasiga norasmiy pul berish', kr: 'Туман комиссиясига норасмий пул бериш', ru: 'Неофициальные сборы членов комиссии'),
    ],
  ),

  // 4. Mulk ko'chirmasi
  KadastrService(
    id: '4',
    icon: Icons.qr_code_2,
    categoryId: 'spravka',
    titleSimple: MultiLangText(
      uz: 'Davlat reyestridan elektron ko‘chirma olish (Vipiska)',
      kr: 'Давлат реестридан электрон кўчирма олиш (Виписка)',
      ru: 'Получение электронной выписки из Государственного реестра прав',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish davlat xizmati',
      kr: 'Кўчмас мулк бўйича давлат реестридан кўчирма бериш давлат хизмати',
      ru: 'Предоставление выписки из Государственного реестра прав на недвижимость',
    ),
    purpose: MultiLangText(
      uz: 'Ayni paytda mulk kimning nomida ekanini tasdiqlovchi QR-kodli yagona huquqiy kuchga ega elektron hujjat.',
      kr: 'Айни пайтда мулк кимнинг номида эканини тасдиқловчи QR-кодли ягона ҳуқуқий кучга эга электрон ҳужжат.',
      ru: 'Единственный юридически значимый документ с QR-кодом, подтверждающий текущего собственника.',
    ),
    duration: MultiLangText(uz: 'Avtomatik (1 kun)', kr: 'Автоматик (1 кун)', ru: 'Автоматически (в реальном времени)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari (taxminan 18 750 so‘m)', kr: 'БҲМнинг 0.05 баравари (тахминан 18 750 сўм)', ru: '0.05 БРВ'),
    warningTip: MultiLangText(
      uz: 'Eski ko‘k muhrli qog‘ozlar bekor qilingan! Notarius va banklar faqat mana shu QR-kodli ko‘chirmani qabul qiladi.',
      kr: 'Эски кўк муҳрли қоғозлар бекор қилинган! Нотариус ва банклар фақат шу QR-кодли кўчирмани қабул қилади.',
      ru: 'Бумажные свидетельства отменены. Нотариусы признают только цифровую выписку с QR-кодом.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Kadastr raqami',
          kr: 'Кадастр рақами',
          ru: 'Кадастровый номер',
        ),
        officialName: MultiLangText(
          uz: 'Ko‘chmas mulkning unikal kadastr kodi',
          kr: 'Кўчмас мулкнинг уникал кадастр коди',
          ru: 'Уникальный кадастровый номер объекта',
        ),
        whatIsIt: MultiLangText(
          uz: 'Mulkka berilgan individual davlat raqami.',
          kr: 'Мулкка берилган индивидуал давлат рақами.',
          ru: 'Уникальный цифровой код объекта в реестре.',
        ),
        insideContent: MultiLangText(
          uz: '• Hududiy zonalar kodi va obyekt tartib raqami.',
          kr: '• Ҳудудий зоналар коди ва объект тартиб рақами.',
          ru: '• Зональный и порядковый код объекта.',
        ),
        whereToGet: MultiLangText(
          uz: 'Kadastr pasportidan yoki my.gov.uz dagi shaxsiy kabinetdan olinadi.',
          kr: 'Кадастр паспортидан ёки my.gov.uz даги шахсий кабинетдан олинади.',
          ru: 'Из паспорта объекта или кабинета my.gov.uz.',
        ),
        arxitekturaBoglanishi: MultiLangText(uz: 'Talab etilmaydi.', kr: 'Талаб этилмайди.', ru: 'Не требуется.'),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Kadastr xodimining joyiga borishi', kr: 'Кадастр ходимининг жойига бориши', ru: 'Выезд сотрудника на объект'),
    ],
  ),

  // 5. Yer auksioni
  KadastrService(
    id: '5',
    icon: Icons.gavel,
    categoryId: 'yer',
    titleSimple: MultiLangText(
      uz: 'Tadbirkorlik va uy qurish uchun yerni E-auksionda sotib olish',
      kr: 'Тадбиркорлик ва уй қуриш учун ерни Э-аукционда сотиб олиш',
      ru: 'Покупка земельного участка на онлайн-аукционе E-auksion',
    ),
    titleOfficial: MultiLangText(
      uz: 'Yer uchastkalarini mulk va ijara huquqi asosida elektron auksion orqali ajratish',
      kr: 'Ер участкаларини электрон аукцион орқали ажратиш',
      ru: 'Предоставление участков в собственность или аренду через электронные торги',
    ),
    purpose: MultiLangText(
      uz: 'Bo‘sh turgan davlat yerlarini halol, ochiq va porasiz E-auksion savdolarida qonuniy sotib olish.',
      kr: 'Бўш турган давлат ерларини ҳалол, очиқ ва порасиз Э-аукцион савдоларида қонуний сотиб олиш.',
      ru: 'Прозрачная покупка свободных государственных земель на открытых онлайн-торгах без взяток.',
    ),
    duration: MultiLangText(uz: 'Auksion reglamentiga asosan', kr: 'Аукцион регламентига асосан', ru: 'Согласно регламенту торгов'),
    cost: MultiLangText(uz: 'Savdoda shakllangan g‘oliblik narxi', kr: 'Савдода шаклланган ғолиблик нархи', ru: 'Итоговая победная стоимость лота'),
    warningTip: MultiLangText(
      uz: 'MUHIM: Hokimlarning to‘g‘ridan-to‘g‘ri yer ajratish vakolati mutlaqo bekor qilingan! Birorta amaldorga ishonib pul bermang!',
      kr: 'МУҲИМ: Ҳокимларнинг тўғридан-тўғри ер ажратиш ваколати бекор қилинган! Ҳеч кимга ишониб пул берманг!',
      ru: 'ВАЖНО: Прямое выделение земли хокимами запрещено законом! Не доверяйте мошенникам!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'ERI — Elektron raqamli imzo',
          kr: 'ЭРИ — Электрон рақамли имзо',
          ru: 'ЭЦП — Электронная цифровая подпись',
        ),
        officialName: MultiLangText(
          uz: 'Davlat xizmatlari markazidan olingan ERI kaliti va sertifikati',
          kr: 'Давлат хизматлари марказидан олинган ЭРИ калити',
          ru: 'Сертификат и закрытый ключ ЭЦП',
        ),
        whatIsIt: MultiLangText(
          uz: 'Savdolarda ishtirok etish va yer bayonnomasini tasdiqlash uchun shaxsiy raqamli imzo.',
          kr: 'Савдоларда иштирок этиш ва баённомани тасдиқлаш учун рақамли имзо.',
          ru: 'Цифровой ключ для подачи ставок и подписания итогового протокола.',
        ),
        insideContent: MultiLangText(
          uz: '• Fuqaroning JShSHIR kodi va sertifikati.',
          kr: '• Фуқаронинг ЖШШИР коди ва сертификати.',
          ru: '• ПИНФЛ гражданина и срок действия ключа.',
        ),
        whereToGet: MultiLangText(
          uz: 'Istalgan Davlat xizmatlari markazidan 5 daqiqada olinadi.',
          kr: 'Исталган Давлат хизматлари марказидан 5 дақиқада олинади.',
          ru: 'В любом Центре госуслуг за 5 минут.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Auksionga qo‘yilgan har bir yer maydoni arxitektura va ekologiya tomonidan oldindan 100% kelishilgan bo‘ladi.',
          kr: 'Аукционга қўйилган ерлар архитектура ва экология томонидан олдиндан 100% келишилган бўлади.',
          ru: 'Выставляемые лоты заранее согласованы со всеми градостроительными службами.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Auksiondan keyin hokimiyatdan qo‘shimcha qaror kutish', kr: 'Аукциондан кейин ҳокимиятдан қарор кутиш', ru: 'Требование отдельного решения хокимията после аукциона'),
    ],
  ),

  // 6. Noturar joy pasporti
  KadastrService(
    id: '6',
    icon: Icons.store,
    categoryId: 'noturar',
    titleSimple: MultiLangText(
      uz: 'Tadbirkorlik do‘koni, ofis va sexlarga kadastr olish',
      kr: 'Тадбиркорлик дўкони, офис ва цехларга кадастр олиш',
      ru: 'Кадастровый паспорт на коммерческий магазин, офис или склад',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk obyektiga (noturar bino va inshootlar) kadastr pasportini berish',
      kr: 'Кўчмас мулк объектига (нотурар бино) кадастр паспортини бериш',
      ru: 'Выдача кадастрового паспорта на нежилое коммерческое здание',
    ),
    purpose: MultiLangText(
      uz: 'Tijorat faoliyati yuritiladigan binolarning elektron kadastr yig‘majildini shakllantirish.',
      kr: 'Тижорат фаолияти юритиладиган биноларнинг электрон кадастр йиғмажилдини шакллантириш.',
      ru: 'Оформление кадастрового дела на объекты коммерческого и промышленного назначения.',
    ),
    duration: MultiLangText(uz: '100 kv.m gacha — 5 ish kuni; 1000 kv.m gacha — 7 ish kuni', kr: '100 кв.м гача — 5 кун; 1000 кв.м гача — 7 кун', ru: 'До 100 кв.м — 5 дней; До 1000 кв.м — 7 дней'),
    cost: MultiLangText(uz: 'Davlat stavkasi bo‘yicha hisoblangan elektron invoys', kr: 'Давлат ставкаси бўйича инвойс', ru: 'По утвержденному инвойсу'),
    warningTip: MultiLangText(
      uz: 'Bino maqsadi (masalan, turar joydan noturar joyga) o‘zgartirilgan bo‘lsa, tuman arxitekturasining qayta ixtisoslashtirish qarori bo‘lishi shart!',
      kr: 'Бино мақсади (турардан нотурарга) ўзгартирилган бўлса, архитектуранинг қайта ихтисослаштириш қарори бўлиши шарт!',
      ru: 'При переводе из жилого в нежилой фонд обязательно решение архитектуры о перепрофилировании!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Qurilish inspeksiyasi qabul dalolatnomasi',
          kr: 'Қурилиш инспекцияси қабул далолатномаси',
          ru: 'Акт ввода в эксплуатацию инспекции Минстроя',
        ),
        officialName: MultiLangText(
          uz: 'Tugallangan binoni foydalanishga qabul qilish to‘g‘risida ruxsatnoma',
          kr: 'Тугалланган бинони фойдаланишга қабул қилиш тўғрисида рухсатнома',
          ru: 'Разрешение на ввод завершенного строительством объекта в эксплуатацию',
        ),
        whatIsIt: MultiLangText(
          uz: 'Do‘kon yoki bino xavfsiz qurilganini tasdiqlovchi dalolatnoma.',
          kr: 'Дўкон ёки бино хавфсиз қурилганини тасдиқловчи далолатнома.',
          ru: 'Акт комиссии о соответствии нормам пожарной и сейсмической безопасности.',
        ),
        insideContent: MultiLangText(
          uz: '• Arxitektura, yong‘in xavfsizligi va SES xulosalari.',
          kr: '• Архитектура, ёнғин хавфсизлиги ва СЭС хулосалари.',
          ru: '• Согласования органов пожарного надзора, архитектуры и СЭС.',
        ),
        whereToGet: MultiLangText(
          uz: 'Qurilish nazorati inspeksiyasidan (GASN).',
          kr: 'Қурилиш назорати инспекциясидан (ГАСН).',
          ru: 'В районной инспекции строительного надзора.',
        ),
        arxitekturaBoglanishi: MultiLangText(
          uz: 'Tadbirkorlik obyektlarida arxitektura va GASN ruxsatisiz bitta ham bino kadastr ro‘yxatidan o‘tmaydi.',
          kr: 'Тадбиркорлик объектларида архитектура ва ГАСН рухсатисиз бирорта бино рўйхатдан ўтмайди.',
          ru: 'Для коммерческих объектов согласование архитектуры и инспекции строго обязательно.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Soliqdan qarz yo‘qligi spravkasi', kr: 'Солиқдан қарз йўқлиги справкаси', ru: 'Справка об отсутствии задолженности по налогам'),
    ],
  ),
];

// ---------------- 1-BOSH SAHIFA: TOIFALAR (TIPLARI) TANLOVI ----------------
class CategorySelectionScreen extends StatelessWidget {
  final AppLanguage currentLanguage;
  final Function(AppLanguage) onLanguageChanged;

  const CategorySelectionScreen({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final lang = currentLanguage;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
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
            onSelected: onLanguageChanged,
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: AppLanguage.uzbekLatin,
                child: Text('🇺🇿 O‘zbekcha (Lotin)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const PopupMenuItem(
                value: AppLanguage.uzbekCyrillic,
                child: Text('🇺🇿 Ўзбекча (Кирилл)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const PopupMenuItem(
                value: AppLanguage.russian,
                child: Text('🇷🇺 Русский', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.calculate, color: Colors.white, size: 28),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CalculatorScreen(lang: lang))),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white, size: 28),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen(lang: lang))),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // YUQORI MAQSADLI BANNER
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
                        lang == AppLanguage.russian ? 'Антикоррупционный гид' : 'Korrupsiyaga qarshi huquqiy qalqon',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  lang == AppLanguage.russian
                      ? 'Выберите категорию услуги, чтобы узнать: какие документы нужны, где их получить, когда обращаться в архитектуру и сколько платить по закону.'
                      : 'Kerakli xizmat turini tanlang: qanday hujjatlar kerak, Arxitektura va qurilish bo‘limi qachon talab etiladi va davlat boji qancha ekanini bilib oling.',
                  style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          Text(
            lang == AppLanguage.russian ? 'КАТЕГОРИИ УСЛУГ' : (lang == AppLanguage.uzbekCyrillic ? 'ХИЗМАТ ТУРЛАРИ' : 'XIZMATLAR TURLARI (KATEGORIYALARI)'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B), letterSpacing: 0.8),
          ),
          const SizedBox(height: 10),

          // 6 TA TOIFA KARTALARI
          ...serviceCategories.map((cat) {
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
                      builder: (_) => ServicesListScreen(category: cat, lang: lang),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration: BoxDecoration(
                          color: cat.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(cat.icon, color: cat.color, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cat.title.get(lang),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Color(0xFF0F172A)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              cat.description.get(lang),
                              style: TextStyle(fontSize: 13, color: Colors.grey.shade700, height: 1.3),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ---------------- 2-EKRAN: TOIFA ICHIDAGI XIZMATLAR RO‘YXATI ----------------
class ServicesListScreen extends StatelessWidget {
  final ServiceCategory category;
  final AppLanguage lang;

  const ServicesListScreen({super.key, required this.category, required this.lang});

  @override
  Widget build(BuildContext context) {
    final filtered = allServices.where((s) => s.categoryId == category.id).toList();

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
      body: filtered.isEmpty
          ? Center(
              child: Text(
                lang == AppLanguage.russian ? 'В этой категории обновляются данные' : 'Ushbu toifadagi maʼlumotlar yangilanmoqda',
                style: const TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
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
                      child: Icon(item.icon, color: category.color, size: 28),
                    ),
                    title: Text(
                      item.titleSimple.get(lang),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          item.titleOfficial.get(lang),
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.timer, size: 16, color: Colors.blueGrey),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                item.duration.get(lang),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueGrey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailScreen(service: item, lang: lang)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

// ---------------- 3-EKRAN: XIZMATNING TO‘LIQ HUQUQIY VA ARXITEKTURA TAFSILOTI ----------------
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
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
                      doc.simpleName.get(lang),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
                ],
              ),
              const Divider(height: 24),
              Text(
                lang == AppLanguage.russian ? 'Официальное наименование:' : 'Rasmiy yuridik nomi:',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
              ),
              Text(doc.officialName.get(lang), style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 14),

              Text(
                lang == AppLanguage.russian ? 'Что это за документ? (Простыми словами):' : 'Bu qanday hujjat? (Oddiy xalq tilida):',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF08336E)),
              ),
              const SizedBox(height: 4),
              Text(doc.whatIsIt.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 14),

              Text(
                lang == AppLanguage.russian ? 'Что обязательно должно быть внутри:' : 'Hujjat ichida nimalar yozilgan bo‘lishi shart:',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.deepOrange),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(10)),
                child: Text(doc.insideContent.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              ),
              const SizedBox(height: 14),

              // ARXITEKTURA VA QURILISH TALABI
              Text(
                lang == AppLanguage.russian ? 'Связь с архитектурой и строительством:' : 'Arxitektura va qurilish bo‘limi bilan bog‘liqligi:',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF4A148C)),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFF3E5F5), borderRadius: BorderRadius.circular(10)),
                child: Text(doc.arxitekturaBoglanishi.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              ),
              const SizedBox(height: 14),

              Text(
                lang == AppLanguage.russian ? 'Где взять или как восстановить:' : 'Qayerdan olasiz yoki yo‘qolgan bo‘lsa:',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
              ),
              const SizedBox(height: 4),
              Text(doc.whereToGet.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF08336E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(
                    lang == AppLanguage.russian ? 'Понятно' : 'Tushundim',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
        title: Text(
          service.titleSimple.get(lang),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(14),
        color: Colors.white,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Icon(Icons.checklist, size: 22),
          label: Text(
            lang == AppLanguage.russian ? 'Проверить мои документы' : 'Hujjatlarim yetarlimi? Tekshirish',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CheckScreen(service: service, lang: lang)));
          },
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
                Text(
                  lang == AppLanguage.russian ? 'Суть и назначение:' : 'Xizmat nima uchun kerak?',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF08336E)),
                ),
                const SizedBox(height: 6),
                Text(service.purpose.get(lang), style: const TextStyle(fontSize: 15, height: 1.4)),
                const Divider(height: 24),
                Row(
                  children: [
                    const Icon(Icons.timer, size: 20, color: Colors.blueGrey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${lang == AppLanguage.russian ? "Срок" : "Muddati"}: ${service.duration.get(lang)}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.payments, size: 20, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${lang == AppLanguage.russian ? "Оплата" : "To‘lov"}: ${service.cost.get(lang)}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning, color: Colors.deepOrange, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    service.warningTip.get(lang),
                    style: const TextStyle(color: Color(0xFFBF360C), fontWeight: FontWeight.bold, fontSize: 14, height: 1.35),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          Text(
            lang == AppLanguage.russian ? 'Необходимые документы (Нажмите для чтения):' : 'Kerakli hujjatlar ro‘yxati (Batafsil bilish uchun bosing):',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
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
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFE8EEF7),
                      child: Icon(Icons.assignment, color: Color(0xFF08336E), size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.simpleName.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF08336E))),
                          const SizedBox(height: 2),
                          Text(
                            '${lang == AppLanguage.russian ? "Где взять" : "Qayerdan"}: ${d.whereToGet.get(lang)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
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
                Text(
                  lang == AppLanguage.russian ? 'НЕ ИМЕЮТ ПРАВА ТРЕБОВАТЬ:' : 'Bularni talab qilishga HAQLARI YO‘Q:',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14),
                ),
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
    final lang = widget.lang;
    int total = widget.service.docs.length;
    int count = _checked.values.where((v) => v).length;
    bool isComplete = total == count;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Проверка документов' : 'Hujjatlarim yetarlimi?',
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            lang == AppLanguage.russian ? 'Отметьте документы на руках:' : 'Qo‘lingizda mavjud hujjatlarni belgilang:',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...List.generate(widget.service.docs.length, (i) {
            final doc = widget.service.docs[i];
            final val = _checked[i] ?? false;
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: CheckboxListTile(
                value: val,
                title: Text(doc.simpleName.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text('Manba: ${doc.whereToGet.get(lang)}'),
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
                  isComplete
                      ? (lang == AppLanguage.russian ? 'Документы полностью готовы!' : 'Hujjatlaringiz to‘liq!')
                      : (lang == AppLanguage.russian ? 'Комплект не полный ($count / $total)' : 'Hujjatlar to‘liq emas ($count / $total)'),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isComplete ? Colors.green.shade900 : Colors.amber.shade900),
                ),
                const SizedBox(height: 8),
                Text(
                  isComplete
                      ? 'Endi bemalol Davlat xizmatlari markaziga yoki my.gov.uz orqali murojaat qilishingiz mumkin. Barcha qonuniy meʼyorlarga egasiz!'
                      : 'Belgilanmagan hujjatlarni yuqorida ko‘rsatilgan idoralardan to‘liq olib, keyin murojaat qiling.',
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

// ---------------- KALKULYATOR EKRANI ----------------
class CalculatorScreen extends StatefulWidget {
  final AppLanguage lang;
  const CalculatorScreen({super.key, required this.lang});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final double bhm = 375000;
  String _selectedService = 'turar';
  final TextEditingController _areaController = TextEditingController(text: '70');
  double _calculatedSum = 0;

  @override
  void initState() {
    super.initState();
    _recalculate();
  }

  void _recalculate() {
    double area = double.tryParse(_areaController.text) ?? 0;
    setState(() {
      if (_selectedService == 'turar') {
        if (area <= 100) {
          _calculatedSum = bhm * 1.25;
        } else if (area <= 300) {
          _calculatedSum = bhm * 2.0;
        } else {
          _calculatedSum = bhm * 3.0;
        }
      } else if (_selectedService == 'reyestr') {
        _calculatedSum = bhm * 1.0;
      } else if (_selectedService == 'spravka') {
        _calculatedSum = bhm * 0.05;
      } else {
        _calculatedSum = bhm * 3.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF08336E),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Davlat boji kalkulyatori', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Xizmat turini tanlang:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedService,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'turar', child: Text('Turar joy kadastr pasporti')),
                      DropdownMenuItem(value: 'reyestr', child: Text('Mulk huquqini davlat ro‘yxatidan o‘tkazish')),
                      DropdownMenuItem(value: 'spravka', child: Text('Elektron ko‘chirma (QR-kodli)')),
                      DropdownMenuItem(value: 'noturar', child: Text('Tadbirkorlik (Noturar bino)')),
                    ],
                    onChanged: (val) {
                      _selectedService = val!;
                      _recalculate();
                    },
                  ),
                  if (_selectedService == 'turar' || _selectedService == 'noturar') ...[
                    const SizedBox(height: 16),
                    const Text('Umumiy maydoni (kv. metr):', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        suffixText: 'kv.m',
                      ),
                      onChanged: (v) => _recalculate(),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF08336E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text('QONUNIY RASMIY TO‘LOV', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  '${_calculatedSum.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so‘m',
                  style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('my.gov.uz orqali to‘lansa 10% chegirma beriladi!', style: TextStyle(color: Color(0xFF81C784), fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ---------------- HAQIDA VA ALOQA EKRANI ----------------
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
        title: const Text('Loyiha maqsadi va Aloqa', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Color(0xFF08336E),
                    child: Icon(Icons.person, size: 44, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text('Muxriddin Elbegiyev', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
