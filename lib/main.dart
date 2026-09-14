import 'package:flutter/material.dart';

void main() {
  runApp(const OsonKadastrApp());
}

// ---------------- TIL HOLATI (STATE) ----------------
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B3C7B)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(
        currentLanguage: currentLanguage,
        onLanguageChanged: changeLanguage,
      ),
    );
  }
}

// ---------------- MULTILANGUAGE STRUKTURA ----------------
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
  final IconData icon;
  final MultiLangText titleSimple;
  final MultiLangText titleOfficial;
  final MultiLangText category;
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
    required this.category,
    required this.purpose,
    required this.duration,
    required this.cost,
    required this.docs,
    required this.illegalDemands,
    required this.warningTip,
  });
}

// ---------------- 22 TA MUKAMMAL KADASTR DAVLAT XIZMATLARI ----------------
final List<KadastrService> allKadastrServices = [
  // 1
  KadastrService(
    id: '1',
    icon: Icons.home_work,
    titleSimple: MultiLangText(
      uz: 'Uy-joyga kadastr pasportini shakllantirish',
      kr: 'Уй-жойга кадастр паспортини шакллантириш',
      ru: 'Оформление кадастрового паспорта на жилье',
    ),
    titleOfficial: MultiLangText(
      uz: 'Turar joy obyektiga kadastr pasportini berish (VM 535-son qaror)',
      kr: 'Турар жой объектига кадастр паспортини бериш (ВМ 535-сон қарор)',
      ru: 'Выдача кадастрового паспорта на жилой объект (ПКМ №535)',
    ),
    category: MultiLangText(uz: 'Pasport', kr: 'Паспорт', ru: 'Паспорт'),
    purpose: MultiLangText(
      uz: 'Kvartira yoki hovli uyning texnik parametrlarini o‘lchab, rasmiy elektron pasport va raqamli chizmasini tayyorlash.',
      kr: 'Квартира ёки ҳовли уйнинг техник параметрларини ўлчаб, расмий электрон паспорт ва рақамли чизмасини тайёрлаш.',
      ru: 'Замер технических параметров и подготовка электронного паспорта с чертежом квартиры или дома.',
    ),
    duration: MultiLangText(
      uz: 'Kvartira: 3 ish kuni; Hovli uy: 5 ish kuni',
      kr: 'Квартира: 3 иш куни; Ҳовли уй: 5 иш куни',
      ru: 'Квартира: 3 раб. дня; Частный дом: 5 раб. дней',
    ),
    cost: MultiLangText(
      uz: 'Maydoniga qarab hisoblangan invoys bo‘yicha (my.gov.uz orqali 10% chegirma)',
      kr: 'Майдонига қараб ҳисобланган инвойс бўйича (my.gov.uz орқали 10% чегирма)',
      ru: 'По официальному инвойсу в зависимости от площади (10% скидка через my.gov.uz)',
    ),
    warningTip: MultiLangText(
      uz: 'Qayta qurilgan xonalar bo‘lsa, arxitektura ruxsatnomasi talab qilinadi. Naqd pul bermang, to‘lov faqat elektron kvitansiya bilan!',
      kr: 'Қайта қурилган хоналар бўлса, архитектура рухсатномаси талаб қилинади. Нақд пул берманг, фақат электрон квитанция билан тўланг!',
      ru: 'При наличии перепланировки требуется разрешение архитекторов. Оплата только по официальной квитанции!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Mulk huquqini tasdiqlovchi hujjat',
          kr: 'Мулк ҳуқуқини тасдиқловчи ҳужжат',
          ru: 'Правоустанавливающий документ на собственность',
        ),
        officialName: MultiLangText(
          uz: 'Oldi-sotdi, hadya bitimi, hokim qarori yoki meros guvohnomasi',
          kr: 'Олди-сотди, ҳадя битими, ҳоким қарори ёки мерос гувоҳномаси',
          ru: 'Договор купли-продажи, дарения, решение хокима или св-во о наследстве',
        ),
        whatIsIt: MultiLangText(
          uz: 'Mulkka qonuniy ega bo‘lganingizni tasdiqlovchi gerbli davlat hujjati.',
          kr: 'Мулкка қонуний эга бўлганингизни тасдиқловчи гербли давлат ҳужжати.',
          ru: 'Официальный документ с гербовой печатью, подтверждающий ваше право собственности.',
        ),
        insideContent: MultiLangText(
          uz: '• Notarius muhri va reyestr raqami;\n• Mulkdorning F.I.Sh. va aniq manzili.',
          kr: '• Нотариус муҳри ва реестр рақами;\n• Мулкдорнинг Ф.И.Ш. ва аниқ манзили.',
          ru: '• Печать нотариуса и номер реестра;\n• Ф.И.О. владельца и точный адрес.',
        ),
        whereToGet: MultiLangText(
          uz: 'Notarial idoradan, hokimlik devonxonasidan yoki davlat arxividan.',
          kr: 'Нотариал идорадан, ҳокимлик девонхонасидан ёки давлат архивидан.',
          ru: 'В нотариальной конторе, канцелярии хокимията или госархиве.',
        ),
      ),
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Shaxsni tasdiqlovchi hujjat',
          kr: 'Шахсни тасдиқловчи ҳужжат',
          ru: 'Документ, удостоверяющий личность',
        ),
        officialName: MultiLangText(
          uz: 'Pasport yoki identifikatsiya ID-kartasi (JShSHIR)',
          kr: 'Паспорт ёки идентификация ID-картаси (ЖШШИР)',
          ru: 'Паспорт или идентификационная ID-карта (ПИНФЛ)',
        ),
        whatIsIt: MultiLangText(
          uz: '14 xonali JShSHIR raqamingiz ko‘rsatilgan shaxsiy kartangiz.',
          kr: '14 хонали ЖШШИР рақамингиз кўрсатилган шахсий картангиз.',
          ru: 'Удостоверение личности с 14-значным персональным номером ПИНФЛ.',
        ),
        insideContent: MultiLangText(
          uz: '• F.I.Sh., fotosurat va JShSHIR kodi.',
          kr: '• Ф.И.Ш., фотосурат ва ЖШШИР коди.',
          ru: '• Ф.И.О., фотография и код ПИНФЛ.',
        ),
        whereToGet: MultiLangText(
          uz: 'Yoningizda bo‘lishi kifoya, nusxa qoldirish talab etilmaydi.',
          kr: 'Ёнингизда бўлиши кифоя, нусха қолдириш талаб этилмайди.',
          ru: 'Достаточно иметь оригинал при себе, копию сдавать не нужно.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan maʼlumotnoma', kr: 'Маҳалладан маълумотнома', ru: 'Справка с махалли'),
      MultiLangText(uz: 'Qo‘shnilar tilxati', kr: 'Қўшнилар тилхати', ru: 'Расписка от соседей'),
      MultiLangText(uz: 'Kommunal to‘lov cheklari', kr: 'Коммунал тўлов чеклари', ru: 'Чеки коммунальных служб'),
    ],
  ),

  // 2
  KadastrService(
    id: '2',
    icon: Icons.storefront,
    titleSimple: MultiLangText(
      uz: 'Tadbirkorlik va noturar binolarga kadastr pasporti olish',
      kr: 'Тадбиркорлик ва нотурар биноларга кадастр паспорти олиш',
      ru: 'Кадастровый паспорт на нежилое коммерческое здание',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk obyektiga (noturar bino) kadastr pasportini berish',
      kr: 'Кўчмас мулк объектига (нотурар бино) кадастр паспортини бериш',
      ru: 'Выдача кадастрового паспорта на нежилое здание',
    ),
    category: MultiLangText(uz: 'Pasport', kr: 'Паспорт', ru: 'Паспорт'),
    purpose: MultiLangText(
      uz: 'Do‘kon, ofis, savdo shoxobchasi yoki sex kabi noturar obyektlarning kadastr pasportini tayyorlash.',
      kr: 'Дўкон, офис, савдо шохобчаси ёки цех каби нотурар объектларнинг кадастр паспортини тайёрлаш.',
      ru: 'Оформление кадастрового паспорта на коммерческие магазины, офисы и склады.',
    ),
    duration: MultiLangText(
      uz: '100 kv.m gacha — 5 ish kuni; 1000 kv.m gacha — 7 ish kuni',
      kr: '100 кв.м гача — 5 иш куни; 1000 кв.м гача — 7 иш куни',
      ru: 'До 100 кв.м — 5 раб. дней; До 1000 кв.м — 7 раб. дней',
    ),
    cost: MultiLangText(
      uz: 'Tasdiqlangan davlat tarifi bo‘yicha elektron invoys',
      kr: 'Тасдиқланган давлат тарифи бўйича электрон инвойс',
      ru: 'По государственному тарифу через электронный инвойс',
    ),
    warningTip: MultiLangText(
      uz: 'Yangi qurilgan tijorat binosi bo‘lsa, Shaharsozlik inspeksiyasi (GASN) qabul xulosasi talab etiladi.',
      kr: 'Янги қурилган тижорат биноси бўлса, Шаҳарсозлик инспекцияси (ГАСН) қабул хулосаси талаб этилади.',
      ru: 'Для новых зданий обязателен акт ввода в эксплуатацию от строительной инспекции (ГАСН).',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Mulk huquqi yoki auksion hujjati',
          kr: 'Мулк ҳуқуқи ёки аукцион ҳужжати',
          ru: 'Документ о праве собственности или протокол аукциона',
        ),
        officialName: MultiLangText(
          uz: 'Oldi-sotdi shartnomasi / E-auksion yutuq bayonnomasi',
          kr: 'Олди-соти шартномаси / Э-аукцион ютуқ баённомаси',
          ru: 'Договор купли-продажи / Протокол победы на E-auksion',
        ),
        whatIsIt: MultiLangText(
          uz: 'Binoni qonuniy sotib olganingizni tasdiqlovchi hujjat.',
          kr: 'Бинони қонуний сотиб олганингизни тасдиқловчи ҳужжат.',
          ru: 'Официальный протокол или договор, удостоверяющий покупку здания.',
        ),
        insideContent: MultiLangText(
          uz: '• Faoliyat turi va chegaralari.',
          kr: '• Фаолият тури ва чегаралари.',
          ru: '• Назначение объекта и границы площади.',
        ),
        whereToGet: MultiLangText(
          uz: 'E-auksion tizimidan yoki notariusdan.',
          kr: 'Э-аукцион тизимидан ёки нотариусдан.',
          ru: 'В кабинете E-auksion или у нотариуса.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Soliqdan qarz yo‘qligi maʼlumotnomasi', kr: 'Солиқдан қарз йўқлиги маълумотномаси', ru: 'Справка об отсутствии задолженности по налогам'),
    ],
  ),

  // 3
  KadastrService(
    id: '3',
    icon: Icons.verified_user,
    titleSimple: MultiLangText(
      uz: 'Mulk huquqini davlat ro‘yxatidan o‘tkazish (Reyestr)',
      kr: 'Мулк ҳуқуқини давлат рўйхатидан ўтказиш (Реестр)',
      ru: 'Государственная регистрация прав на недвижимость',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish',
      kr: 'Кўчмас мулкка бўлган ҳуқуқларни давлат рўйхатидан ўтказиш',
      ru: 'Госрегистрация прав на недвижимое имущество в реестре',
    ),
    category: MultiLangText(uz: 'Ro‘yxat', kr: 'Рўйхат', ru: 'Реестр'),
    purpose: MultiLangText(
      uz: 'Notariusda uy sotib olingandan so‘ng, mulkdorni davlat bazasiga qonuniy ega sifatida kiritish.',
      kr: 'Нотариусда уй сотиб олингандан сўнг, мулкдорни давлат базасига қонуний эга сифатида киритиш.',
      ru: 'Внесение владельца в Единый госреестр после нотариального оформления.',
    ),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 1 dan 1.25 baravarigacha', kr: 'БҲМнинг 1 дан 1.25 бараваригача', ru: 'От 1 до 1.25 БРВ'),
    warningTip: MultiLangText(
      uz: 'Bitimdan so‘ng 1 oy ichida ro‘yxatdan o‘tkazilmasa, maʼmuriy jarima solinadi!',
      kr: 'Битимдан сўнг 1 ой ичида рўйхатдан ўтказилмаса, маъмурий жарима солинади!',
      ru: 'При пропуске месячного срока регистрации налагается административный штраф!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Notarial bitim yoki sud qarori',
          kr: 'Нотариал битим ёки суд қарори',
          ru: 'Нотариальный договор или решение суда',
        ),
        officialName: MultiLangText(
          uz: 'Mulk o‘tganligini tasdiqlovchi gerbli hujjat',
          kr: 'Мулк ўтганлигини тасдиқловчи гербли ҳужжат',
          ru: 'Документ с гербовой печатью о переходе прав',
        ),
        whatIsIt: MultiLangText(
          uz: 'Notariusda tuzilgan qonuniy hujjat.',
          kr: 'Нотариусда тузилган қонуний ҳужжат.',
          ru: 'Заверенный нотариусом договор.',
        ),
        insideContent: MultiLangText(
          uz: '• QR-kod, notarius muhri va reyestr raqami.',
          kr: '• QR-код, нотариус муҳри ва реестр рақами.',
          ru: '• QR-код, печать и номер нотариального реестра.',
        ),
        whereToGet: MultiLangText(
          uz: 'Bitim tuzilgan notarial idoradan olinadi.',
          kr: 'Битим тузилган нотариал идорадан олинади.',
          ru: 'В нотариальной конторе, где совершена сделка.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimiyatda qayta tasdiqlatish', kr: 'Ҳокимиятда қайта тасдиқлатиш', ru: 'Повторное утверждение в хокимияте'),
    ],
  ),

  // 4
  KadastrService(
    id: '4',
    icon: Icons.qr_code_2,
    titleSimple: MultiLangText(
      uz: 'Davlat reyestridan ko‘chirma olish (Vipiska)',
      kr: 'Давлат реестридан кўчирма олиш (Виписка)',
      ru: 'Выписка из Государственного реестра прав (Выписка)',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk bo‘yicha davlat reyestridan ko‘chirma berish',
      kr: 'Кўчмас мулк бўйича давлат реестридан кўчирма бериш',
      ru: 'Предоставление выписки из Государственного реестра',
    ),
    category: MultiLangText(uz: 'Maʼlumot', kr: 'Маълумот', ru: 'Справка'),
    purpose: MultiLangText(
      uz: 'Mulk ayni daqiqada kimning nomida ekanini tasdiqlovchi QR-kodli yagona rasmiy elektron hujjat.',
      kr: 'Мулк айни дақиқада кимнинг номида эканини тасдиқловчи QR-кодли ягона расмий электрон ҳужжат.',
      ru: 'Официальный электронный документ с QR-кодом, подтверждающий текущего собственника.',
    ),
    duration: MultiLangText(uz: 'Real vaqtda (1 kun)', kr: 'Реал вақтда (1 кун)', ru: 'В реальном времени (1 день)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(
      uz: 'Eski ko‘k muhrli qog‘ozlar bekor bo‘lgan, hozirda faqat mana shu QR-kodli ko‘chirma qonuniy hisoblanadi.',
      kr: 'Эски кўк муҳрли қоғозлар бекор бўлган, ҳозирда фақат шу QR-кодли кўчирма қонунийдир.',
      ru: 'Старые бумажные свидетельства отменены, юридическую силу имеет только электронная выписка с QR-кодом.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Kadastr raqami',
          kr: 'Кадастр рақами',
          ru: 'Кадастровый номер',
        ),
        officialName: MultiLangText(
          uz: 'Obyektning unikal kadastr raqami',
          kr: 'Объектнинг уникал кадастр рақами',
          ru: 'Уникальный кадастровый номер объекта',
        ),
        whatIsIt: MultiLangText(
          uz: 'Mulkka berilgan 10 xonali elektron raqam.',
          kr: 'Мулкка берилган 10 хонали электрон рақам.',
          ru: '10-значный уникальный код объекта недвижимости.',
        ),
        insideContent: MultiLangText(
          uz: '• Hududiy va bino kodi.',
          kr: '• Ҳудудий ва бино коди.',
          ru: '• Зональный и пообъектный код.',
        ),
        whereToGet: MultiLangText(
          uz: 'Kadastr pasportidan yoki my.gov.uz orqali.',
          kr: 'Кадастр паспортидан ёки my.gov.uz орқали.',
          ru: 'Из паспорта объекта или кабинета my.gov.uz.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Inspektorning uyga kelishi', kr: 'Инспекторнинг уйга келиши', ru: 'Выезд инспектора на дом'),
    ],
  ),

  // 5
  KadastrService(
    id: '5',
    icon: Icons.person_off,
    titleSimple: MultiLangText(
      uz: 'Nomida uy yo‘qligi haqida maʼlumotnoma',
      kr: 'Номида уй йўқлиги ҳақида маълумотнома',
      ru: 'Справка об отсутствии жилья в собственности',
    ),
    titleOfficial: MultiLangText(
      uz: 'Fuqaro nomida shaxsiy turar joy mavjud emasligi to‘g‘risida maʼlumotnoma',
      kr: 'Фуқаро номида шахсий турар жой мавжуд эмаслиги тўғрисида маълумотнома',
      ru: 'Выдача справки об отсутствии собственного жилья',
    ),
    category: MultiLangText(uz: 'Maʼlumot', kr: 'Маълумот', ru: 'Справка'),
    purpose: MultiLangText(
      uz: 'Subsidiya yoki imtiyozli kredit olish uchun butun respublika bo‘yicha uyingiz yo‘qligini tasdiqlash.',
      kr: 'Субсидия ёки имтиёзли кредит олиш учун бутун республика бўйича уйингиз йўқлигини тасдиқлаш.',
      ru: 'Подтверждение отсутствия зарегистрированного жилья по всей республике для получения субсидий.',
    ),
    duration: MultiLangText(uz: 'Avtomatik (1 kun)', kr: 'Автоматик (1 кун)', ru: 'Автоматически (1 день)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(
      uz: 'Respublika bazalari JShSHIR orqali avtomatik tekshiriladi, hech qayerdan qog‘oz to‘plamaysiz.',
      kr: 'Республика базалари ЖШШИР орқали автоматик текширилади, ҳеч қаердан қоғоз тўпламайсиз.',
      ru: 'Проверка осуществляется автоматически по ПИНФЛ по всем регионам страны.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'JShSHIR (ID-karta)',
          kr: 'ЖШШИР (ID-карта)',
          ru: 'ПИНФЛ (ID-карта)',
        ),
        officialName: MultiLangText(
          uz: 'Shaxsiy 14 xonali identifikatsiya raqami',
          kr: 'Шахсий 14 хонали идентификация рақами',
          ru: 'Персональный 14-значный идентификационный номер',
        ),
        whatIsIt: MultiLangText(
          uz: 'Fuqaroning yagona davlat kodi.',
          kr: 'Фуқаронинг ягона давлат коди.',
          ru: 'Единый код гражданина.',
        ),
        insideContent: MultiLangText(
          uz: '• 14 ta raqam.',
          kr: '• 14 та рақам.',
          ru: '• 14 цифр.',
        ),
        whereToGet: MultiLangText(
          uz: 'ID-kartangiz orqasida bo‘ladi.',
          kr: 'ID-картангиз орқасида бўлади.',
          ru: 'Указан на обратной стороне ID-карты.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan maʼlumotnoma', kr: 'Маҳалладан маълумотнома', ru: 'Справка с махалли'),
    ],
  ),

  // 6
  KadastrService(
    id: '6',
    icon: Icons.block,
    titleSimple: MultiLangText(
      uz: 'Mulkda taqiq (Zapret) bor-yo‘qligini tekshirish',
      kr: 'Мулкда тақиқ (Запрет) бор-йўқлигини текшириш',
      ru: 'Проверка арестов и обременений (Запрет)',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar to‘g‘risida maʼlumotnoma',
      kr: 'Кўчмас мулк бўйича тақиқ ва хатловлар тўғрисида маълумотнома',
      ru: 'Справка о наличии арестов и запретов на недвижимость',
    ),
    category: MultiLangText(uz: 'Maʼlumot', kr: 'Маълумот', ru: 'Справка'),
    purpose: MultiLangText(
      uz: 'Mulkka sud, MIB yoki banklar tomonidan taqiq qo‘yilganini sotib olishdan oldin aniqlash.',
      kr: 'Мулкка суд, МИБ ёки банклар томонидан тақиқ қўйилганини сотиб олишдан олдин аниқлаш.',
      ru: 'Проверка имущества на аресты БПИ, судебные запреты или банковский залог.',
    ),
    duration: MultiLangText(uz: 'Real vaqtda (avtomat)', kr: 'Реал вақтда (автомат)', ru: 'В реальном времени (авто)'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(
      uz: 'Taqiqi bor mulkni xarid qilmang va taqiq yechilmaguncha zaklad bermang!',
      kr: 'Тақиқи бор мулкни харид қилманг ва тақиқ ечилмагунча заклад берманг!',
      ru: 'Не вносите задаток и не покупайте имущество до официального снятия запрета!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Mulk kadastr raqami',
          kr: 'Мулк кадастр рақами',
          ru: 'Кадастровый номер объекта',
        ),
        officialName: MultiLangText(
          uz: 'Tekshirilayotgan uyning kadastr raqami',
          kr: 'Текширилаётган уйнинг кадастр рақами',
          ru: 'Кадастровый номер проверяемой недвижимости',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uyning raqami.',
          kr: 'Уйнинг рақами.',
          ru: 'Номер объекта.',
        ),
        insideContent: MultiLangText(
          uz: '• Manzil va parametrlar.',
          kr: '• Манзил ва параметрлар.',
          ru: '• Адрес и параметры.',
        ),
        whereToGet: MultiLangText(
          uz: 'Sotuvchining kadastr pasportidan.',
          kr: 'Сотувчининг кадастр паспортидан.',
          ru: 'Из паспорта собственника.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'MIBdan yozma maʼlumotnoma', kr: 'МИБдан ёзма маълумотнома', ru: 'Письменная справка из БПИ'),
    ],
  ),

  // 7
  KadastrService(
    id: '7',
    icon: Icons.call_split,
    titleSimple: MultiLangText(
      uz: 'Hovli yoki uyni ikkiga bo‘lish (Alohida qilish)',
      kr: 'Ҳовли ёки уйни иккига бўлиш (Алоҳида қилиш)',
      ru: 'Раздел или объединение объектов недвижимости',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish davlat xizmati',
      kr: 'Кўчмас мулк объектини бўлиш ёки бирлаштириш давлат хизмати',
      ru: 'Государственная услуга по разделу или объединению недвижимости',
    ),
    category: MultiLangText(uz: 'Chegara', kr: 'Чегара', ru: 'Границы'),
    purpose: MultiLangText(
      uz: 'Umumiy hovlini mustaqil ikki alohida xonadonlarga ajratish va alohida kadastr berish.',
      kr: 'Умумий ҳовлини мустақил икки алоҳида хонадонларга ажратиш ва алоҳида кадастр бериш.',
      ru: 'Раздел единого жилого дома на два самостоятельных объекта с отдельными кадастрами.',
    ),
    duration: MultiLangText(uz: '10–15 ish kuni', kr: '10–15 иш куни', ru: '10–15 раб. дней'),
    cost: MultiLangText(uz: 'Maydoniga asosan invoys', kr: 'Майдонига асосан инвойс', ru: 'По инвойсу в зависимости от площади'),
    warningTip: MultiLangText(
      uz: 'Har bir yangi bo‘lingan hovlida ko‘chaga mustaqil chiqish darvozasi (yo‘li) bo‘lishi shart!',
      kr: 'Ҳар бир янги бўлинган ҳовлида кўчага мустақил чиқиш дарвозаси (йўли) бўлиши шарт!',
      ru: 'Обязательное градостроительное требование: каждый разделенный дом должен иметь отдельный выход на улицу!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Taqsimlash bitimi yoki sud ajrimi',
          kr: 'Тақсимлаш битими ёки суд ажрими',
          ru: 'Соглашение о разделе или решение суда',
        ),
        officialName: MultiLangText(
          uz: 'Notarial tasdiqlangan bo‘lish shartnomasi',
          kr: 'Нотариал тасдиқланган бўлиш шартномаси',
          ru: 'Нотариально заверенный договор о разделе имущества',
        ),
        whatIsIt: MultiLangText(
          uz: 'Egalarining uyni taqsimlash kelishuvi.',
          kr: 'Эгаларининг уйни тақсимлаш келишуви.',
          ru: 'Соглашение собственников о распределении долей.',
        ),
        insideContent: MultiLangText(
          uz: '• Xonalar va sotixlar taqsimoti.',
          kr: '• Хоналар ва сотихлар тақсимоти.',
          ru: '• Схема распределения комнат и участка.',
        ),
        whereToGet: MultiLangText(
          uz: 'Notariusdan yoki fuqarolik sudidan.',
          kr: 'Нотариусдан ёки фуқаролик судидан.',
          ru: 'У нотариуса или в гражданском суде.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Yangi kommunal hisoblarni oldindan talab qilish', kr: 'Янги коммунал ҳисобларни олдиндан талаб қилиш', ru: 'Требование предварительных коммунальных лицевых счетов'),
    ],
  ),

  // 8
  KadastrService(
    id: '8',
    icon: Icons.apartment,
    titleSimple: MultiLangText(
      uz: 'Ko‘p qavatli uy tutash yerlarini rasmiylashtirish',
      kr: 'Кўп қаватли уй туташ ерларини расмийлаштириш',
      ru: 'Оформление прилегающей территории многоквартирного дома',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘p kvartirali uyga tutash yer uchastkasini ro‘yxatdan o‘tkazish',
      kr: 'Кўп квартирали уйга туташ ер участкасини рўйхатдан ўтказиш',
      ru: 'Регистрация придомового земельного участка многоквартирного дома',
    ),
    category: MultiLangText(uz: 'Yer', kr: 'Ер', ru: 'Земля'),
    purpose: MultiLangText(
      uz: 'Dom oldidagi bolalar maydonchasi va hududni begona qurilishlardan himoya qilib, umumiy mulk qilish.',
      kr: 'Дом олдидаги болалар майдончаси ва ҳудудни бегона қурилишлардан ҳимоя қилиб, умумий мулк қилиш.',
      ru: 'Защита двора от точечной застройки и закрепление земли в общее пользование жильцов.',
    ),
    duration: MultiLangText(uz: '10 ish kuni', kr: '10 иш куни', ru: '10 раб. дней'),
    cost: MultiLangText(uz: 'Bepul / Minimal', kr: 'Бепул / Минимал', ru: 'Бесплатно / Минимальный'),
    warningTip: MultiLangText(
      uz: 'Bu yer bitta shaxsga xususiylashtirilmaydi, butun dom aholisining daxlsiz umumiy mulki bo‘ladi.',
      kr: 'Бу ер битта шахсга хусусийлаштирилмайди, бутун дом аҳолисининг дахлсиз умумий мулки бўлади.',
      ru: 'Придомовая земля не подлежит приватизации отдельными лицами, являясь общей собственностью жильцов.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Aholi yig‘ilishi bayonnomasi',
          kr: 'Аҳоли йиғилиши баённомаси',
          ru: 'Протокол общего собрания жильцов',
        ),
        officialName: MultiLangText(
          uz: 'Mulkdorlar umumiy yig‘ilishi qarori',
          kr: 'Мулкдорлар умумий йиғилиши қарори',
          ru: 'Решение общего собрания собственников квартир',
        ),
        whatIsIt: MultiLangText(
          uz: 'Aholining 50% dan ko‘pi imzolagan qaror.',
          kr: 'Аҳолининг 50% дан кўпи имзолаган қарор.',
          ru: 'Протокол с подписями более 50% собственников.',
        ),
        insideContent: MultiLangText(
          uz: '• Xonadon raqamlari va imzolar.',
          kr: '• Хонадон рақамлари ва имзолар.',
          ru: '• Номера квартир и личные подписи.',
        ),
        whereToGet: MultiLangText(
          uz: 'Boshqaruv kompaniyasi (BSHM) orqali.',
          kr: 'Бошқарув компанияси (БСҲМ) орқали.',
          ru: 'Через управляющую сервисную компанию (УК).',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Har bir kvartiradan alohida ariza', kr: 'Ҳар бир квартирадан алоҳида ариза', ru: 'Отдельное заявление от каждой квартиры'),
    ],
  ),

  // 9
  KadastrService(
    id: '9',
    icon: Icons.history_edu,
    titleSimple: MultiLangText(
      uz: 'Bino va inshootlar ijara shartnomasini ro‘yxatdan o‘tkazish',
      kr: 'Бино ва иншоотлар ижара шартномасини рўйхатдан ўтказиш',
      ru: 'Регистрация договора аренды зданий и сооружений',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk ijara shartnomasini davlat ro‘yxatidan o‘tkazish',
      kr: 'Кўчмас мулк ижара шартномасини давлат рўйхатидан ўтказиш',
      ru: 'Госрегистрация договора долгосрочной аренды недвижимости',
    ),
    category: MultiLangText(uz: 'Ro‘yxat', kr: 'Рўйхат', ru: 'Реестр'),
    purpose: MultiLangText(
      uz: 'Noturar bino yoki do‘kon 1 yildan ortiqqa ijaraga berilganda huquqni davlat ro‘yxatidan o‘tkazish.',
      kr: 'Нотурар бино ёки дўкон 1 йилдан ортиққа ижарага берилганда ҳуқуқни давлат рўйхатидан ўтказиш.',
      ru: 'Государственная регистрация аренды нежилых объектов на срок более 1 года.',
    ),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(
      uz: '1 yildan ortiq ijaralar kadastrda ro‘yxatdan o‘tmasa, sudda haqiqiy hisoblanmaydi.',
      kr: '1 йилдан ортиқ ижаралар кадастрда рўйхатдан ўтмаса, судда ҳақиқий ҳисобланмайди.',
      ru: 'Договоры аренды свыше одного года без кадастровой регистрации не признаются судом действительными.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Ijara shartnomasi',
          kr: 'Ижара шартномаси',
          ru: 'Договор аренды',
        ),
        officialName: MultiLangText(
          uz: 'Notarial yoki elektron imzolangan bitim',
          kr: 'Нотариал ёки электрон имзоланган битим',
          ru: 'Нотариальный или электронный договор аренды',
        ),
        whatIsIt: MultiLangText(
          uz: 'Ijara beruvchi va oluvchi o‘rtasidagi bitim.',
          kr: 'Ижара берувчи ва олувчи ўртасидаги битим.',
          ru: 'Официальный договор между арендодателем и арендатором.',
        ),
        insideContent: MultiLangText(
          uz: '• Muddati, narxi va to‘lov shartlari.',
          kr: '• Муддати, нархи ва тўлов шартлари.',
          ru: '• Срок, сумма оплаты и порядок расчетов.',
        ),
        whereToGet: MultiLangText(
          uz: 'ijara.soliq.uz yoki notariusdan.',
          kr: 'ijara.soliq.uz ёки нотариусдан.',
          ru: 'Через портал ijara.soliq.uz или у нотариуса.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Binoni qayta inventarizatsiyadan o‘tkazish', kr: 'Бинони қайта инвентаризациядан ўтказиш', ru: 'Повторная техническая инвентаризация объекта'),
    ],
  ),

  // 10
  KadastrService(
    id: '10',
    icon: Icons.landscape,
    titleSimple: MultiLangText(
      uz: 'Yer uchastkasi ijara shartnomasini ro‘yxatdan o‘tkazish',
      kr: 'Ер участкаси ижара шартномасини рўйхатдан ўтказиш',
      ru: 'Госрегистрация договора долгосрочной аренды земельного участка',
    ),
    titleOfficial: MultiLangText(
      uz: 'Yer uchastkasini ijaraga olish shartnomasini davlat ro‘yxatidan o‘tkazish',
      kr: 'Ер участкасини ижарага олиш шартномасини давлат рўйхатидан ўтказиш',
      ru: 'Государственная регистрация аренды земли',
    ),
    category: MultiLangText(uz: 'Yer', kr: 'Ер', ru: 'Земля'),
    purpose: MultiLangText(
      uz: 'E-auksion yoki ochiq tanlovda yutib olingan qishloq xo‘jaligi yoki tadbirkorlik yerini rasmiylashtirish.',
      kr: 'Э-аукцион ёки очиқ танловда ютиб олинган қишлоқ хўжалиги ёки тадбиркорлик ерини расмийлаштириш.',
      ru: 'Регистрация аренды сельхоз или коммерческой земли, выигранной на открытых торгах.',
    ),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 1 baravari', kr: 'БҲМнинг 1 баравари', ru: '1 БРВ'),
    warningTip: MultiLangText(
      uz: 'Hokimning to‘g‘ridan-to‘g‘ri qarori bilan berilmaydi, faqat elektron tanlov bayonnomasi asosida ro‘yxatga olinadi.',
      kr: 'Ҳокимнинг тўғридан-тўғри қарори билан берилмайди, фақат электрон танлов баённомаси асосида рўйхатга олинади.',
      ru: 'Прямые решения хокимов отменены: регистрация проводится строго по протоколу электронного аукциона.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Auksion bayonnomasi',
          kr: 'Аукцион баённомаси',
          ru: 'Протокол аукциона',
        ),
        officialName: MultiLangText(
          uz: 'Yer ajratish bo‘yicha tanlov bayonnomasi',
          kr: 'Ер ажратиш бўйича танлов баённомаси',
          ru: 'Протокол открытого конкурса на право аренды',
        ),
        whatIsIt: MultiLangText(
          uz: 'Tanlovda g‘olib bo‘lganingizni tasdiqlovchi QR-kodli hujjat.',
          kr: 'Танловда ғолиб бўлганингизни тасдиқловчи QR-кодли ҳужжат.',
          ru: 'Электронный протокол о победе в торгах.',
        ),
        insideContent: MultiLangText(
          uz: '• Kontur raqami va gektar o‘lchami.',
          kr: '• Контур рақами ва гектар ўлчами.',
          ru: '• Номер контура и площадь в гектарах.',
        ),
        whereToGet: MultiLangText(
          uz: 'E-auksion.uz tizimidan yuklanadi.',
          kr: 'E-auksion.uz тизимидан юкланади.',
          ru: 'Скачивается из личного кабинета E-auksion.uz.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qishloq xo‘jaligi bo‘limidan alohida xat', kr: 'Қишлоқ хўжалиги бўлимидан алоҳида хат', ru: 'Дополнительное письмо из отдела сельского хозяйства'),
    ],
  ),

  // 11
  KadastrService(
    id: '11',
    icon: Icons.account_balance,
    titleSimple: MultiLangText(
      uz: 'Ipoteka va garov huquqini ro‘yxatga olish / yechish',
      kr: 'Ипотека ва гаров ҳуқуқини рўйхатга олиш / ечиш',
      ru: 'Регистрация и снятие залога и ипотеки недвижимости',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatga olish',
      kr: 'Кўчмас мулк ипотекаси ва гаров шартномасини рўйхатга олиш',
      ru: 'Госрегистрация и снятие договора ипотеки (залога)',
    ),
    category: MultiLangText(uz: 'Ro‘yxat', kr: 'Рўйхат', ru: 'Реестр'),
    purpose: MultiLangText(
      uz: 'Bank krediti uchun uyni garovga qo‘yish yoki kredit yopilgach, taqiqni bepul yechish.',
      kr: 'Банк кредити учун уйни гаровга қўйиш ёки кредит ёпилгач, тақиқни бепул ечиш.',
      ru: 'Оформление залога под банковский кредит или оперативное снятие обременения после погашения.',
    ),
    duration: MultiLangText(uz: '1 ish kuni', kr: '1 иш куни', ru: '1 раб. день'),
    cost: MultiLangText(uz: 'BHMning 50% miqdorida', kr: 'БҲМнинг 50% миқдорида', ru: '50% от БРВ'),
    warningTip: MultiLangText(
      uz: 'Kredit to‘langach, bank xodimi tizim orqali taqiqni yechishni o‘zi bepul amalga oshirishi shart!',
      kr: 'Кредит тўлангач, банк ходими тизим орқали тақиқни ечишни ўзи бепул амалга ошириши шарт!',
      ru: 'После закрытия кредита банк обязан электронно и бесплатно снять запрет через систему!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Ipoteka shartnomasi',
          kr: 'Ипотека шартномаси',
          ru: 'Договор ипотеки',
        ),
        officialName: MultiLangText(
          uz: 'Notarial tasdiqlangan ipoteka bitimi',
          kr: 'Нотариал тасдиқланган ипотека битими',
          ru: 'Нотариально удостоверенный договор ипотеки',
        ),
        whatIsIt: MultiLangText(
          uz: 'Mulk qaysi bankka garovga qo‘yilgani hujjati.',
          kr: 'Мулк қайси банкка гаровга қўйилгани ҳужжати.',
          ru: 'Документ о залоге объекта в банке.',
        ),
        insideContent: MultiLangText(
          uz: '• Kredit summasi va kadastr raqami.',
          kr: '• Кредит суммаси ва кадастр рақами.',
          ru: '• Сумма кредита и кадастровый номер.',
        ),
        whereToGet: MultiLangText(
          uz: 'Bank va notariusdan.',
          kr: 'Банк ва нотариусдан.',
          ru: 'В банке и нотариальной конторе.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Bank vakilining markazga borishi', kr: 'Банк вакилининг марказга бориши', ru: 'Личный визит сотрудника банка в Центр'),
    ],
  ),

  // 12
  KadastrService(
    id: '12',
    icon: Icons.alt_route,
    titleSimple: MultiLangText(
      uz: 'Servitut kelishuvi (Qo‘shni yeridan yo‘l ochish)',
      kr: 'Сервитут келишуви (Қўшни еридан йўл очиш)',
      ru: 'Государственная регистрация права сервитута (Проход через участок)',
    ),
    titleOfficial: MultiLangText(
      uz: 'Servitut huquqini davlat ro‘yxatidan o‘tkazish',
      kr: 'Сервитут ҳуқуқини давлат рўйхатидан ўтказиш',
      ru: 'Государственная регистрация права сервитута',
    ),
    category: MultiLangText(uz: 'Yer', kr: 'Ер', ru: 'Земля'),
    purpose: MultiLangText(
      uz: 'Uyingizga kirish uchun qo‘shnining hovlisidan yo‘l yoki quvur o‘tkazish huquqini qonuniylashtirish.',
      kr: 'Уйингизга кириш учун қўшнининг ҳовлисидан йўл ёки қувур ўтказиш ҳуқуқини қонунийлаштириш.',
      ru: 'Юридическое закрепление права прохода или прокладки коммуникаций через чужой земельный участок.',
    ),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(
      uz: 'Servitut ro‘yxatdan o‘tkazilsa, qo‘shni almashsa ham sizning o‘tish huquqingiz daxlsiz saqlanadi.',
      kr: 'Сервитут рўйхатдан ўтказилса, қўшни алмашса ҳам сизнинг ўтиш ҳуқуқингиз дахлсиз сақланади.',
      ru: 'Сервитут сохраняется даже при смене собственника соседнего участка.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Servitut bitimi yoki sud qarori',
          kr: 'Сервитут битими ёки суд қарори',
          ru: 'Соглашение о сервитуте или решение суда',
        ),
        officialName: MultiLangText(
          uz: 'Notarial shartnoma yoki sud hujjati',
          kr: 'Нотариал шартнома ёки суд ҳужжати',
          ru: 'Нотариальное соглашение или судебное решение',
        ),
        whatIsIt: MultiLangText(
          uz: 'Qo‘shnilar kelishuvi.',
          kr: 'Қўшнилар келишуви.',
          ru: 'Соглашение сторон.',
        ),
        insideContent: MultiLangText(
          uz: '• Yo‘lning eni, uzunligi va chizmasi.',
          kr: '• Йўлнинг эни, узунлиги ва чизмаси.',
          ru: '• Схема, ширина и длина полосы прохода.',
        ),
        whereToGet: MultiLangText(
          uz: 'Notariusda tuziladi yoki suddan olinadi.',
          kr: 'Нотариусда тузилади ёки суддан олинади.',
          ru: 'Оформляется у нотариуса или получается в суде.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qo‘shnining butun hovlisini qayta o‘lchash', kr: 'Қўшнининг бутун ҳовлисини қайта ўлчаш', ru: 'Повторный замер всего участка соседа'),
    ],
  ),

  // 13
  KadastrService(
    id: '13',
    icon: Icons.park,
    titleSimple: MultiLangText(
      uz: 'Ko‘p yillik bog‘ va daraxtzorlarga kadastr olish',
      kr: 'Кўп йиллик боғ ва дарахтзорларга кадастр олиш',
      ru: 'Кадастровый паспорт на многолетние насаждения и сады',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘p yillik dov-daraxtlarga kadastr pasportini shakllantirish',
      kr: 'Кўп йиллик дов-дарахтларга кадастр паспортини шакллантириш',
      ru: 'Оформление кадастрового паспорта на многолетние насаждения',
    ),
    category: MultiLangText(uz: 'Pasport', kr: 'Паспорт', ru: 'Паспорт'),
    purpose: MultiLangText(
      uz: 'Intensiv bog‘lar va mevali daraxtzorlarni ko‘chmas mulk sifatida hisobga olish.',
      kr: 'Интенсив боғлар ва мевали дарахтзорларни кўчмас мулк сифатида ҳисобга олиш.',
      ru: 'Регистрация коммерческих садов и насаждений как объектов недвижимости.',
    ),
    duration: MultiLangText(uz: '5 ish kuni', kr: '5 иш куни', ru: '5 раб. дней'),
    cost: MultiLangText(uz: 'Bog‘ maydoniga qarab', kr: 'Боғ майдонига қараб', ru: 'В зависимости от площади сада'),
    warningTip: MultiLangText(
      uz: 'Bog‘ ekilgan yerga bo‘lgan ijara yoki egalik hujjati bo‘lishi shart.',
      kr: 'Боғ экилган ерга бўлган ижара ёки эгалик ҳужжати бўлиши шарт.',
      ru: 'Обязательно наличие прав аренды или собственности на земельный участок.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Yer hujjati',
          kr: 'Ер ҳужжати',
          ru: 'Документ на землю',
        ),
        officialName: MultiLangText(
          uz: 'Yer ijara shartnomasi yoki reyestr ko‘chirmasi',
          kr: 'Ер ижара шартномаси ёки реестр кўчирмаси',
          ru: 'Договор аренды земли или выписка из реестра',
        ),
        whatIsIt: MultiLangText(
          uz: 'Bog‘ joylashgan yerning davlat hujjati.',
          kr: 'Боғ жойлашган ернинг давлат ҳужжати.',
          ru: 'Правоустанавливающий документ на землю.',
        ),
        insideContent: MultiLangText(
          uz: '• Maydoni va daraxt turlari.',
          kr: '• Майдони ва дарахт турлари.',
          ru: '• Площадь и виды деревьев.',
        ),
        whereToGet: MultiLangText(
          uz: 'Kadastr reyestridan.',
          kr: 'Кадастр реестридан.',
          ru: 'Из Единого реестра кадастра.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Ekologiya idorasidan ruxsatnoma', kr: 'Экология идорасидан рухсатнома', ru: 'Разрешение от органов экологии'),
    ],
  ),

  // 14
  KadastrService(
    id: '14',
    icon: Icons.gavel,
    titleSimple: MultiLangText(
      uz: 'Tadbirkorlik uchun yerni E-auksion orqali olish',
      kr: 'Тадбиркорлик учун ерни Э-аукцион орқали олиш',
      ru: 'Приобретение земли под бизнес через E-auksion',
    ),
    titleOfficial: MultiLangText(
      uz: 'Yer uchastkalarini tadbirkorlik uchun elektron auksion orqali ajratish',
      kr: 'Ер участкаларини тадбиркорлик учун электрон аукцион орқали ажратиш',
      ru: 'Предоставление участков под предпринимательство на онлайн-аукционе',
    ),
    category: MultiLangText(uz: 'Auksion', kr: 'Аукцион', ru: 'Аукцион'),
    purpose: MultiLangText(
      uz: 'Bo‘sh turgan davlat yerlarini savdo yoki ishlab chiqarish uchun halol auksionda yutib olish.',
      kr: 'Бўш турган давлат ерларини савдо ёки ишлаб чиқариш учун ҳалол аукционда ютиб олиш.',
      ru: 'Открытая покупка земельных участков под бизнес на прозрачных онлайн-торгах.',
    ),
    duration: MultiLangText(uz: 'Auksion jadvali bo‘yicha', kr: 'Аукцион жадвали бўйича', ru: 'Согласно графику торгов'),
    cost: MultiLangText(uz: 'Auksion savdo bahosi', kr: 'Аукцион савдо баҳоси', ru: 'Итоговая аукционная стоимость'),
    warningTip: MultiLangText(
      uz: 'Hokimlar to‘g‘ridan-to‘g‘ri yer bera olmaydi! "Yer olib beraman" degan firibgarlarga pul bermang!',
      kr: 'Ҳокимлар тўғридан-тўғри ер бера олмайди! "Ер олиб бераман" деган фирибгарларга пул берманг!',
      ru: 'Хокимы лишены права прямого выделения земель! Остерегайтесь мошенников-посредников!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Elektron raqamli imzo (ERI)',
          kr: 'Электрон рақамли имзо (ЭРИ)',
          ru: 'Электронная цифровая подпись (ЭЦП)',
        ),
        officialName: MultiLangText(
          uz: 'ERI kaliti va sertifikati',
          kr: 'ЭРИ калити ва сертификати',
          ru: 'Ключ и сертификат ЭЦП',
        ),
        whatIsIt: MultiLangText(
          uz: 'Auksionda savdolashish uchun raqamli kalit.',
          kr: 'Аукционда савдолашиш учун рақамли калит.',
          ru: 'Электронный ключ для торгов.',
        ),
        insideContent: MultiLangText(
          uz: '• Foydalanuvchi maʼlumotlari.',
          kr: '• Фойдаланувчи маълумотлари.',
          ru: '• Данные заявителя.',
        ),
        whereToGet: MultiLangText(
          uz: 'DXMdan 10 daqiqada olinadi.',
          kr: 'ДХМдан 10 дақиқада олинади.',
          ru: 'В Центре госуслуг за 10 минут.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimiyatdan qo‘shimcha farmoyish kutish', kr: 'Ҳокимиятдан қўшимча фармойиш кутиш', ru: 'Ожидание дополнительного распоряжения хокимията'),
    ],
  ),

  // 15
  KadastrService(
    id: '15',
    icon: Icons.agriculture,
    titleSimple: MultiLangText(
      uz: 'Qishloq xo‘jaligi yerlarini ijaraga olish tanlovi',
      kr: 'Қишлоқ хўжалиги ерларини ижарага олиш танлови',
      ru: 'Электронный конкурс по аренде сельскохозяйственных земель',
    ),
    titleOfficial: MultiLangText(
      uz: 'Qishloq xo‘jaligiga mo‘ljallangan yerlarni elektron ochiq tanlov orqali berish',
      kr: 'Қишлоқ хўжалигига мўлжалланган ерларни электрон очиқ танлов орқали бериш',
      ru: 'Предоставление земель сельхозназначения через открытый конкурс',
    ),
    category: MultiLangText(uz: 'Yer', kr: 'Ер', ru: 'Земля'),
    purpose: MultiLangText(
      uz: 'Ekin ekish yoki bog‘dorchilik uchun yerlarni "E-yer" orqali inson omilisiz ijaraga olish.',
      kr: 'Экин экиш ёки боғдорчилик учун ерларни "E-yer" орқали инсон омилисиз ижарага олиш.',
      ru: 'Аренда сельхозземель через систему "E-yer" по балльной оценке без человеческого фактора.',
    ),
    duration: MultiLangText(uz: 'Tanlov muddati asosida', kr: 'Танлов муддати асосида', ru: 'По регламенту конкурса'),
    cost: MultiLangText(uz: 'Tanlov qoidalariga ko‘ra', kr: 'Танлов қоидаларига кўра', ru: 'Согласно правилам конкурса'),
    warningTip: MultiLangText(
      uz: 'G‘olib kompyuter reytingi orqali shaffof aniqlanadi.',
      kr: 'Ғолиб компьютер рейтинги орқали шаффоф аниқланади.',
      ru: 'Победитель определяется автоматическим компьютерным рейтингом.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Biznes-reja',
          kr: 'Бизнес-режа',
          ru: 'Бизнес-план',
        ),
        officialName: MultiLangText(
          uz: 'Yer samaradorligi bo‘yicha taklif',
          kr: 'Ер самарадорлиги бўйича таклиф',
          ru: 'План эффективного освоения земельного участка',
        ),
        whatIsIt: MultiLangText(
          uz: 'Yerda nima ekishingiz rejasi.',
          kr: 'Ерда нима экишингиз режаси.',
          ru: 'Программа культивации и инвестиций.',
        ),
        insideContent: MultiLangText(
          uz: '• Ekin turlari va ish o‘rinlari.',
          kr: '• Экин турлари ва иш ўринлари.',
          ru: '• Виды культур и рабочие места.',
        ),
        whereToGet: MultiLangText(
          uz: 'Ariza beruvchi tayyorlaydi.',
          kr: 'Ариза берувчи тайёрлайди.',
          ru: 'Составляется заявителем самостоятельно.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Qishloq xo‘jaligi bo‘limidan alohida xat', kr: 'Қишлоқ хўжалиги бўлимидан алоҳида хат', ru: 'Письмо из агроотдела'),
    ],
  ),

  // 16
  KadastrService(
    id: '16',
    icon: Icons.pin,
    titleSimple: MultiLangText(
      uz: 'Eski va yangi kadastr raqamlarini solishtirish',
      kr: 'Эски ва янги кадастр рақамларини солиштириш',
      ru: 'Справка о сопоставлении старого и нового кадастровых номеров',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulkning yangilangan kadastr raqami to‘g‘risida maʼlumotnoma',
      kr: 'Кўчмас мулкнинг янгиланган кадастр рақами тўғрисида маълумотнома',
      ru: 'Предоставление справки о новом кадастровом номере',
    ),
    category: MultiLangText(uz: 'Maʼlumot', kr: 'Маълумот', ru: 'Справка'),
    purpose: MultiLangText(
      uz: 'Eski pasportdagi raqam yangi elektron tizimda qaysi raqamga o‘zgarganini tasdiqlash.',
      kr: 'Эски паспортдаги рақам янги электрон тизимда қайси рақамга ўзгарганини тасдиқлаш.',
      ru: 'Подтверждение соответствия старого номера объекта новому системному номеру.',
    ),
    duration: MultiLangText(uz: 'Avtomatik (1 kun)', kr: 'Автоматик (1 кун)', ru: 'Автоматически (1 день)'),
    cost: MultiLangText(uz: 'Bepul', kr: 'Бепул', ru: 'Бесплатно'),
    warningTip: MultiLangText(
      uz: 'Notariusda eski uyingiz chiqmay qolsa, bu maʼlumotnoma bepul olinadi.',
      kr: 'Нотариусда эски уйингиз чиқмай қолса, бу маълумотнома бепул олинади.',
      ru: 'Выдается бесплатно, если нотариус не находит старый номер объекта в базе.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Eski kadastr daftarchasi',
          kr: 'Эски кадастр дафтарчаси',
          ru: 'Старый техпаспорт',
        ),
        officialName: MultiLangText(
          uz: 'Eski namunadagi qog‘oz pasport',
          kr: 'Эски намунадаги қоғоз паспорт',
          ru: 'Технический паспорт старого образца',
        ),
        whatIsIt: MultiLangText(
          uz: 'Qo‘ldagi eski kadastr hujjati.',
          kr: 'Қўлдаги эски кадастр ҳужжати.',
          ru: 'Бумажная книжка старого кадастра.',
        ),
        insideContent: MultiLangText(
          uz: '• Eski raqam va manzil.',
          kr: '• Эски рақам ва манзил.',
          ru: '• Старый номер и адрес.',
        ),
        whereToGet: MultiLangText(
          uz: 'Shaxsiy arxiv hujjatlaridan.',
          kr: 'Шахсий архив ҳужжатларидан.',
          ru: 'Из личного домашнего архива.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Xodimni uyga chaqirib pul berish', kr: 'Ходимни уйга чақириб пул бериш', ru: 'Оплата за выезд сотрудника на дом'),
    ],
  ),

  // 17
  KadastrService(
    id: '17',
    icon: Icons.signpost,
    titleSimple: MultiLangText(
      uz: 'Uyga rasmiy ko‘cha nomi va manzil berish',
      kr: 'Уйга расмий кўча номи ва манзил бериш',
      ru: 'Присвоение и изменение официального почтового адреса',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulk obyektiga manzil berish va o‘zgartirish (Manzillar reyestri)',
      kr: 'Кўчмас мулк объектига манзил бериш ва ўзгартириш (Манзиллар реестри)',
      ru: 'Присвоение и изменение адреса объекта недвижимости',
    ),
    category: MultiLangText(uz: 'Ro‘yxat', kr: 'Рўйхат', ru: 'Реестр'),
    purpose: MultiLangText(
      uz: 'Yangi uyga tuman hokimiyati tomonidan rasmiy ko‘cha nomi va uy raqami berilishi.',
      kr: 'Янги уйга туман ҳокимияти томонидан расмий кўча номи ва уй рақами берилиши.',
      ru: 'Официальное присвоение наименования улицы и номера дома через адресный реестр.',
    ),
    duration: MultiLangText(uz: '3 ish kuni', kr: '3 иш куни', ru: '3 раб. дня'),
    cost: MultiLangText(uz: 'Bepul', kr: 'Бепул', ru: 'Бесплатно'),
    warningTip: MultiLangText(
      uz: 'Ko‘cha nomi o‘zgarganda barcha hujjatlarni almashtirish shart emas.',
      kr: 'Кўча номи ўзгарганда барча ҳужжатларни алмаштириш шарт эмас.',
      ru: 'При переименовании улиц замена всех документов не требуется.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Kadastr pasporti',
          kr: 'Кадастр паспорти',
          ru: 'Кадастровый паспорт',
        ),
        officialName: MultiLangText(
          uz: 'Uy kadastr yig‘majildi',
          kr: 'Уй кадастр йиғмажилди',
          ru: 'Кадастровое дело объекта',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uyning koordinatasi ko‘rsatilgan hujjat.',
          kr: 'Уйнинг координатаси кўрсатилган ҳужжат.',
          ru: 'Документ с географическими координатами дома.',
        ),
        insideContent: MultiLangText(
          uz: '• Joylashuv xaritasi.',
          kr: '• Жойлашув харитаси.',
          ru: '• Карта расположения.',
        ),
        whereToGet: MultiLangText(
          uz: 'Mulkdorning qo‘lida bo‘ladi.',
          kr: 'Мулкдорнинг қўлида бўлади.',
          ru: 'На руках у собственника.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Mahalladan ko‘cha nomi haqida spravka', kr: 'Маҳалладан кўча номи ҳақида справка', ru: 'Справка об адресе из махалли'),
    ],
  ),

  // 18
  KadastrService(
    id: '18',
    icon: Icons.warning_amber,
    titleSimple: MultiLangText(
      uz: 'Uy buzilishga (Snos) tushganligini aniqlash',
      kr: 'Уй бузилишга (Снос) тушганлигини аниқлаш',
      ru: 'Проверка объекта на попадание под снос (Снос)',
    ),
    titleOfficial: MultiLangText(
      uz: 'Bosh rejaga asosan uy buzilishga tushganligi to‘g‘risida maʼlumotnoma',
      kr: 'Бош режага асосан уй бузилишга тушганлиги тўғрисида маълумотнома',
      ru: 'Справка о нахождении объекта в зоне сноса по генплану',
    ),
    category: MultiLangText(uz: 'Maʼlumot', kr: 'Маълумот', ru: 'Справка'),
    purpose: MultiLangText(
      uz: 'Shahar bosh rejasiga ko‘ra uy o‘rnida yo‘l yoki ko‘prik tushishini oldindan aniqlash.',
      kr: 'Шаҳар бош режасига кўра уй ўрнида йўл ёки кўприк тушишини олдиндан аниқлаш.',
      ru: 'Проверка планов генплана относительно сноса дома перед заключением сделки.',
    ),
    duration: MultiLangText(uz: '3 ish kuni', kr: '3 иш куни', ru: '3 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.05 baravari', kr: 'БҲМнинг 0.05 баравари', ru: '0.05 БРВ'),
    warningTip: MultiLangText(
      uz: 'Uy sotib olishdan oldin buni tekshirish firibgarlardan asraydi!',
      kr: 'Уй сотиб олишдан олдин буни текшириш фирибгарлардан асрайди!',
      ru: 'Обязательно проверяйте справку перед покупкой недвижимости!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Kadastr raqami',
          kr: 'Кадастр рақами',
          ru: 'Кадастровый номер',
        ),
        officialName: MultiLangText(
          uz: 'Obyekt kadastr raqami',
          kr: 'Объект кадастр рақами',
          ru: 'Кадастровый номер строения',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uyning raqami.',
          kr: 'Уйнинг рақами.',
          ru: 'Номер объекта.',
        ),
        insideContent: MultiLangText(
          uz: '• Joylashuvi.',
          kr: '• Жойлашуви.',
          ru: '• Локация.',
        ),
        whereToGet: MultiLangText(
          uz: 'Pasportdan olinadi.',
          kr: 'Паспортдан олинади.',
          ru: 'Из паспорта.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Arxitektura bo‘limiga borib imzo to‘plash', kr: 'Архитектура бўлимига бориб имзо тўплаш', ru: 'Сбор подписей в отделе архитектуры'),
    ],
  ),

  // 19
  KadastrService(
    id: '19',
    icon: Icons.delete_forever,
    titleSimple: MultiLangText(
      uz: 'Mulk buzilganda kadastr hisobidan chiqarish',
      kr: 'Мулк бузилганда кадастр ҳисобидан чиқариш',
      ru: 'Снятие с кадастрового учета при сносе здания',
    ),
    titleOfficial: MultiLangText(
      uz: 'Ko‘chmas mulkka bo‘lgan huquqning bekor qilinganligini ro‘yxatdan o‘tkazish',
      kr: 'Кўчмас мулкка бўлган ҳуқуқнинг бекор қилинганлигини рўйхатдан ўтказиш',
      ru: 'Госрегистрация прекращения прав на недвижимое имущество',
    ),
    category: MultiLangText(uz: 'Ro‘yxat', kr: 'Рўйхат', ru: 'Реестр'),
    purpose: MultiLangText(
      uz: 'Eski uy buzilib o‘rniga yangi qurilayotganda eski uyni bazadan o‘chirish.',
      kr: 'Эски уй бузилиб ўрнига янги қурилаётганда эски уйни базадан ўчириш.',
      ru: 'Аннулирование старого кадастрового номера при сносе или уничтожении строения.',
    ),
    duration: MultiLangText(uz: '2 ish kuni', kr: '2 иш куни', ru: '2 раб. дня'),
    cost: MultiLangText(uz: 'BHMning 0.5 baravari', kr: 'БҲМнинг 0.5 баравари', ru: '0.5 БРВ'),
    warningTip: MultiLangText(
      uz: 'Buzilgan uyni bazadan chiqarmasangiz, yo‘q uy uchun soliq hisoblanaveradi!',
      kr: 'Бузилган уйни базадан чиқармасангиз, йўқ уй учун солиқ ҳисобланаверади!',
      ru: 'Если не снять снесенный дом с учета, налог на имущество будет начисляться дальше!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Buzilganlik dalolatnomasi',
          kr: 'Бузилганлик далолатномаси',
          ru: 'Акт об отсутствии строения',
        ),
        officialName: MultiLangText(
          uz: 'Bino mavjud emasligi to‘g‘risidagi dalolatnoma',
          kr: 'Бино мавжуд эмаслиги тўғрисидаги далолатнома',
          ru: 'Акт подтверждения сноса объекта',
        ),
        whatIsIt: MultiLangText(
          uz: 'Uy haqiqatda yo‘qligini tasdiqlovchi dalolatnoma.',
          kr: 'Уй ҳақиқатда йўқлигини тасдиқловчи далолатнома.',
          ru: 'Акт комиссии об отсутствии строения на участке.',
        ),
        insideContent: MultiLangText(
          uz: '• Mahalla va kadastr imzolari.',
          kr: '• Маҳалла ва кадастр имзолари.',
          ru: '• Подписи инспектора и махалли.',
        ),
        whereToGet: MultiLangText(
          uz: 'Tuman kadastri va mahalladan.',
          kr: 'Туман кадастри ва маҳалладан.',
          ru: 'В районном филиале кадастра и махалле.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Eski orderlarni arxivdan qayta talab qilish', kr: 'Эски ордерларни архивдан қайта талаб қилиш', ru: 'Повторный запрос старых архивных ордеров'),
    ],
  ),

  // 20
  KadastrService(
    id: '20',
    icon: Icons.map,
    titleSimple: MultiLangText(
      uz: 'Topografik va geodezik xaritalar olish',
      kr: 'Топографик ва геодезик хариталар олиш',
      ru: 'Предоставление геодезических и топографических карт',
    ),
    titleOfficial: MultiLangText(
      uz: 'Davlat kartografiya-geodeziya fondidan maʼlumotlar taqdim etish',
      kr: 'Давлат картография-геодезия фондидан маълумотлар тақдим этиш',
      ru: 'Предоставление пространственных геодезических материалов фонда',
    ),
    category: MultiLangText(uz: 'Geodeziya', kr: 'Геодезия', ru: 'Геодезия'),
    purpose: MultiLangText(
      uz: 'Katta inshootlar yoki yo‘l loyihalari uchun aniq xaritalar olish.',
      kr: 'Катта иншоотлар ёки йўл лойиҳалари учун аниқ хариталар олиш.',
      ru: 'Получение точных карт 1:500 для проектирования капитальных объектов.',
    ),
    duration: MultiLangText(uz: '5 ish kuni', kr: '5 иш куни', ru: '5 раб. дней'),
    cost: MultiLangText(uz: 'Masshtabiga qarab', kr: 'Масштабига қараб', ru: 'Согласно масштабу съемки'),
    warningTip: MultiLangText(
      uz: 'Geodezik maʼlumotsiz qurilish yer osti quvurlariga xavf tug‘diradi.',
      kr: 'Геодезик маълумотсиз қурилиш ер ости қувурларига хавф туғдиради.',
      ru: 'Строительство без геодезии несет риск повреждения подземных коммуникаций.',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Loyiha topshirig‘i',
          kr: 'Лойиҳа топшириғи',
          ru: 'Техзадание проекта',
        ),
        officialName: MultiLangText(
          uz: 'Tashkilot buyurtmasi',
          kr: 'Ташкилот буюртмаси',
          ru: 'Официальный запрос проектной организации',
        ),
        whatIsIt: MultiLangText(
          uz: 'Xarita talabi.',
          kr: 'Харита талаби.',
          ru: 'Запрос параметров.',
        ),
        insideContent: MultiLangText(
          uz: '• Koordinatalar va masshtab.',
          kr: '• Координаталар ва масштаб.',
          ru: '• Координаты и масштаб.',
        ),
        whereToGet: MultiLangText(
          uz: 'Loyiha institutidan.',
          kr: 'Лойиҳа институтидан.',
          ru: 'В проектном бюро.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Nolitsenzion vositachilardan xizmat olish', kr: 'Нолицензион воситачилардан хизмат олиш', ru: 'Принуждение к услугам нелицензированных посредников'),
    ],
  ),

  // 21
  KadastrService(
    id: '21',
    icon: Icons.domain_verification,
    titleSimple: MultiLangText(
      uz: 'Bino ostidagi yerni xususiylashtirish (Sotib olish)',
      kr: 'Бино остидаги ерни хусусийлаштириш (Сотиб олиш)',
      ru: 'Приватизация земельного участка под собственным зданием',
    ),
    titleOfficial: MultiLangText(
      uz: 'Qishloq xo‘jaligiga mo‘ljallanmagan yer uchastkalarini xususiylashtirish',
      kr: 'Қишлоқ хўжалигига мўлжалланмаган ер участкаларини хусусийлаштириш',
      ru: 'Приватизация земельных участков несельскохозяйственного назначения',
    ),
    category: MultiLangText(uz: 'Xususiy', kr: 'Хусусий', ru: 'Приватизация'),
    purpose: MultiLangText(
      uz: 'O‘zingizga qarashli xususiy bino turgan yerni bir umrlik xususiy mulk qilib sotib olish.',
      kr: 'Ўзингизга қарашли хусусий бино турган ерни бир умрлик хусусий мулк қилиб сотиб олиш.',
      ru: 'Выкуп земельного участка под частным зданием в бессрочную частную собственность.',
    ),
    duration: MultiLangText(uz: '10 ish kuni', kr: '10 иш куни', ru: '10 раб. дней'),
    cost: MultiLangText(uz: 'Yer solig‘ining karrali stavkasida', kr: 'Ер солиғининг каррали ставкасида', ru: 'По кратной ставке земельного налога'),
    warningTip: MultiLangText(
      uz: 'Xususiylashtirilgan yer — daxlsiz xususiy mulk bo‘ladi!',
      kr: 'Хусусийлаштирилган ер — дахлсиз хусусий мулк бўлади!',
      ru: 'Приватизированный участок становится неприкосновенной частной собственностью!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Bino mulkdorlik hujjati',
          kr: 'Бино мулкдорлик ҳужжати',
          ru: 'Свидетельство на строение',
        ),
        officialName: MultiLangText(
          uz: 'Bino kadastr pasporti va ko‘chirmasi',
          kr: 'Бино кадастр паспорти ва кўчирмаси',
          ru: 'Кадастровый паспорт и выписка на здание',
        ),
        whatIsIt: MultiLangText(
          uz: 'Bino sizniki ekani hujjati.',
          kr: 'Бино сизники экани ҳужжати.',
          ru: 'Подтверждение собственности на здание.',
        ),
        insideContent: MultiLangText(
          uz: '• Maydon va kadastr raqami.',
          kr: '• Майдон ва кадастр рақами.',
          ru: '• Площадь и кадастровый номер.',
        ),
        whereToGet: MultiLangText(
          uz: 'Kadastr reyestridan.',
          kr: 'Кадастр реестридан.',
          ru: 'Из реестра кадастра.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Hokimning alohida yozma ruxsati', kr: 'Ҳокимнинг алоҳида ёзма рухсати', ru: 'Отдельное письменное разрешение хокима'),
    ],
  ),

  // 22
  KadastrService(
    id: '22',
    icon: Icons.shield,
    titleSimple: MultiLangText(
      uz: 'Hujjatsiz uylarni qonuniylashtirish (O‘RQ-937 Qonuni)',
      kr: 'Ҳужжатсиз уйларни қонунийлаштириш (ЎРҚ-937 Қонуни)',
      ru: 'Признание прав на самовольно занятые участки и жилье (ЗРУ-937)',
    ),
    titleOfficial: MultiLangText(
      uz: 'O‘zboshimchalik bilan egallangan yer va binolarga huquqlarni eʼtirof etish (05.08.2024 yildagi O‘RQ-937-son Qonun)',
      kr: 'Ўзбошимчалик билан эгалланган ер ва биноларга ҳуқуқларни эътироф этиш (05.08.2024 йилдаги ЎРҚ-937-сон Қонун)',
      ru: 'Признание прав на самовольные участки и постройки (Закон ЗРУ-937 от 05.08.2024)',
    ),
    category: MultiLangText(uz: 'Amnistiya', kr: 'Амнистия', ru: 'Амнистия'),
    purpose: MultiLangText(
      uz: 'Ko‘p yillardan beri yashab kelayotgan hujjatsiz uylarga qonuniy kadastr pasporti va mulk huquqini rasmiylashtirish.',
      kr: 'Кўп йиллардан бери яшаб келаётган ҳужжатсиз уйларга қонуний кадастр паспорти ва мулк ҳуқуқини расмийлаштириш.',
      ru: 'Законное оформление кадастра и прав собственности на жилые дома без документов по Закону ЗРУ-937.',
    ),
    duration: MultiLangText(uz: 'Xatlov reja-jadvali asosida', kr: 'Хатлов режа-жадвали асосида', ru: 'По графику сплошной инвентаризации'),
    cost: MultiLangText(uz: 'Qonunda belgilangan bir martalik to‘lov (BHMda)', kr: 'Қонунда белгиланган бир марталик тўлов (БҲМда)', ru: 'Разовый законный сбор согласно Закону'),
    warningTip: MultiLangText(
      uz: 'OGOH BO‘LING: Hech kimga "men uyingizni amnistiyaga kiritib beraman" degan maklerlarga pul bermang! Hududlar kadastr xodimlari tomonidan bepul xatlov qilinadi!',
      kr: 'ОГОҲ БЎЛИНГ: Ҳеч кимга "уйингизни амнистияга киритиб бераман" деган маклерларга пул берманг! Ҳудудлар кадастр ходимлари томонидан бепул хатлов қилинади!',
      ru: 'ВНИМАНИЕ: Не платите маклерам за "ускорение"! Инвентаризация проводится сотрудниками кадастра по махаллям бесплатно!',
    ),
    docs: [
      RequiredDocument(
        simpleName: MultiLangText(
          uz: 'Yillar davomidagi to‘lov cheklari',
          kr: 'Йиллар давомидаги тўлов чеклари',
          ru: 'Многолетние квитанции об оплате налогов и услуг',
        ),
        officialName: MultiLangText(
          uz: 'Yer/mulk solig‘i, elektr, gaz, suv to‘lov kvitansiyalari',
          kr: 'Ер/мулк солиғи, электр, газ, сув тўлов квитанциялари',
          ru: 'Чеки об уплате земельного/имущественного налога, коммунальных услуг',
        ),
        whatIsIt: MultiLangText(
          uz: 'Ushbu joyda ko‘p yildan beri yashayotganingiz isboti.',
          kr: 'Ушбу жойда кўп йилдан бери яшаётганингиз исботи.',
          ru: 'Подтверждение фактического владения домом на протяжении многих лет.',
        ),
        insideContent: MultiLangText(
          uz: '• To‘lovchi F.I.Sh. va to‘lov sanasi.',
          kr: '• Тўловчи Ф.И.Ш. ва тўлов санаси.',
          ru: '• Ф.И.О. плательщика и архивные даты оплаты.',
        ),
        whereToGet: MultiLangText(
          uz: 'Shaxsiy arxivdan yoki kommunal bazalardan.',
          kr: 'Шахсий архивдан ёки коммунал базалардан.',
          ru: 'Из домашних квитанций или баз коммунальных служб.',
        ),
      ),
    ],
    illegalDemands: [
      MultiLangText(uz: 'Vositachilik haqlari', kr: 'Воситачилик ҳақлари', ru: 'Плата за посредничество'),
      MultiLangText(uz: 'Norasmiy pul yig‘ishlar', kr: 'Норасмий пул йиғишлар', ru: 'Неофициальные сборы комиссии'),
    ],
  ),
];

// ---------------- SODDA HUJJATLAR QOMUSI ----------------
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
    term: MultiLangText(
      uz: 'Hokim Qarori (Qaror nima?)',
      kr: 'Ҳоким Қарори (Қарор нима?)',
      ru: 'Решение хокима (Что это такое?)',
    ),
    simpleExplanation: MultiLangText(
      uz: 'Tuman yoki shahar hokimi tomonidan fuqaroga yer ajratish, uy qurishga ruxsat berish haqida chiqarilgan rasmiy davlat hujjati.',
      kr: 'Туман ёки шаҳар ҳокими томонидан фуқарога ер ажратиш, уй қуришга рухсат бериш ҳақида чиқарилган расмий давлат ҳужжати.',
      ru: 'Распорядительный акт главы района о выделении участка или разрешении строительства (новые решения отменены, действуют архивные).',
    ),
    whatIsInside: MultiLangText(
      uz: '• Hokim imzosi, sana va dumaloq gerbli muhr;\n• Kimga, qancha yer va qanday maqsadda berilgani.',
      kr: '• Ҳоким имзоси, сана ва думалоқ гербли муҳр;\n• Кимга, қанча ер ва қандай мақсадда берилгани.',
      ru: '• Подпись хокима, гербовая печать, дата;\n• Ф.И.О., площадь и целевое назначение участка.',
    ),
    whereToFind: MultiLangText(
      uz: 'Tuman hokimligi devonxonasidan yoki viloyat davlat arxividan.',
      kr: 'Туман ҳокимлиги девонхонасидан ёки вилоят давлат архивидан.',
      ru: 'В канцелярии хокимията или областном госархиве.',
    ),
  ),
  DocVocabulary(
    term: MultiLangText(
      uz: 'Oldi-sotdi shartnomasi nima?',
      kr: 'Олди-сотди шартномаси нима?',
      ru: 'Договор купли-продажи (Что это?)',
    ),
    simpleExplanation: MultiLangText(
      uz: 'Uyni sotib olganingizda notarius ishtirokida imzolanadigan eng asosiy gerbli hujjat.',
      kr: 'Уйни сотиб олганингизда нотариус иштирокида имзоланадиган энг асосий гербли ҳужжат.',
      ru: 'Основной документ о покупке жилья, удостоверяемый государственным или частным нотариусом.',
    ),
    whatIsInside: MultiLangText(
      uz: '• Sotuvchi va xaridor pasportlari;\n• Mulkning summasi, manzili va notarius muhri.',
      kr: '• Сотувчи ва харидор паспортлари;\n• Мулкнинг суммаси, манзили ва нотариус муҳри.',
      ru: '• Паспортные данные сторон, сумма сделки, адрес и печать нотариуса.',
    ),
    whereToFind: MultiLangText(
      uz: 'Bitim tuzilgan notarial idoradan (dublikati olinishi mumkin).',
      kr: 'Битим тузилган нотариал идорадан (дубликати олиниши мумкин).',
      ru: 'В нотариальной конторе оформления (выдается дубликат).',
    ),
  ),
  DocVocabulary(
    term: MultiLangText(
      uz: 'APZ (Arxitektura topshirig‘i) nima?',
      kr: 'АПЗ (Архитектура топшириғи) нима?',
      ru: 'АПЗ (Архитектурно-планировочное задание)',
    ),
    simpleExplanation: MultiLangText(
      uz: 'Qurilish boshlashdan oldin arxitektura bo‘limi beradigan qonuniy meʼyorlar hujjati (qavatlar soni, qizil chiziqlar).',
      kr: 'Қурилиш бошлашдан олдин архитектура бўлими берадиган қонуний меъёрлар ҳужжати (қаватлар сони, қизил чизиқлар).',
      ru: 'Градостроительный документ перед стройкой с требованиями по этажности и границам застройки.',
    ),
    whatIsInside: MultiLangText(
      uz: '• Qavatlar soni, chegaradan qoldiriladigan metrlar va kommunikatsiya shartlari.',
      kr: '• Қаватлар сони, чегарадан қолдириладиган метрлар ва коммуникация шартлари.',
      ru: '• Предельная этажность, отступы от границ участка и техусловия сетей.',
    ),
    whereToFind: MultiLangText(
      uz: 'my.gov.uz portali orqali tuman Qurilish va arxitektura bo‘limidan.',
      kr: 'my.gov.uz портали орқали туман Қурилиш ва архитектура бўлимидан.',
      ru: 'Через портал my.gov.uz из районного отдела архитектуры и строительства.',
    ),
  ),
  DocVocabulary(
    term: MultiLangText(
      uz: 'Mulk ko‘chirmasi (Vipiska) nima?',
      kr: 'Мулк кўчирмаси (Виписка) нима?',
      ru: 'Выписка из госреестра (Что это?)',
    ),
    simpleExplanation: MultiLangText(
      uz: 'Eski ko‘k guvohnoma o‘rniga beriladigan yagona QR-kodli elektron davlat hujjati.',
      kr: 'Эски кўк гувоҳнома ўрнига бериладиган ягона QR-кодли электрон давлат ҳужжати.',
      ru: 'Электронный документ с QR-кодом, заменивший старые бумажные свидетельства.',
    ),
    whatIsInside: MultiLangText(
      uz: '• Kadastr raqami, hozirgi qonuniy mulkdor va QR-kod.',
      kr: '• Кадастр рақами, ҳозирги қонуний мулкдор ва QR-код.',
      ru: '• Кадастровый номер, имя законного владельца и QR-код подлинности.',
    ),
    whereToFind: MultiLangText(
      uz: 'my.gov.uz orqali yoki Davlat xizmatlari markazidan (DXM).',
      kr: 'my.gov.uz орқали ёки Давлат хизматлари марказидан (ДХМ).',
      ru: 'Через my.gov.uz или в Центре госуслуг (ЦГУ).',
    ),
  ),
];

// ---------------- BOSH SAHIFA ----------------
class HomeScreen extends StatefulWidget {
  final AppLanguage currentLanguage;
  final Function(AppLanguage) onLanguageChanged;

  const HomeScreen({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final lang = widget.currentLanguage;

    final filtered = allKadastrServices.where((s) {
      final text = '${s.titleSimple.get(lang)} ${s.titleOfficial.get(lang)}'.toLowerCase();
      return text.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C7B),
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian
              ? 'Осон Кадастр'
              : (lang == AppLanguage.uzbekCyrillic ? 'Осон Кадастр' : 'Oson Kadastr'),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
        ),
        actions: [
          // TIL ALMASHTIRISH TUGMASI
          PopupMenuButton<AppLanguage>(
            icon: const Icon(Icons.language, color: Colors.white, size: 26),
            tooltip: 'Tilni tanlash / Выбор языка',
            onSelected: widget.onLanguageChanged,
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: AppLanguage.uzbekLatin,
                child: Text('🇺🇿 O‘zbekcha (Lotin)', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const PopupMenuItem(
                value: AppLanguage.uzbekCyrillic,
                child: Text('🇺🇿 Ўзбекча (Кирилл)', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const PopupMenuItem(
                value: AppLanguage.russian,
                child: Text('🇷🇺 Русский', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.calculate, color: Colors.white, size: 26),
            tooltip: 'Kalkulyator',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CalculatorScreen(lang: lang)));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white, size: 26),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen(lang: lang)));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF0B3C7B)),
              accountName: Text(
                lang == AppLanguage.russian ? 'Осон Кадастр' : (lang == AppLanguage.uzbekCyrillic ? 'Осон Кадастр' : 'Oson Kadastr'),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: Text(
                lang == AppLanguage.russian
                    ? 'Антикоррупционный правовой навигатор'
                    : (lang == AppLanguage.uzbekCyrillic ? 'Коррупцияга қарши ҳуқуқий навигатор' : 'Korrupsiyaga qarshi huquqiy yo‘riqnoma'),
                style: const TextStyle(fontSize: 13),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.shield, color: Color(0xFF0B3C7B), size: 42),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book, color: Color(0xFF0B3C7B), size: 26),
              title: Text(
                lang == AppLanguage.russian ? 'Словарь документов' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатлар қомуси' : 'Hujjatlar nima? (Qomus)'),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => VocabularyScreen(lang: lang)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Colors.teal, size: 26),
              title: Text(
                lang == AppLanguage.russian ? 'Калькулятор госпошлины' : (lang == AppLanguage.uzbekCyrillic ? 'Давлат божи калькулятори' : 'Davlat boji kalkulyatori'),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => CalculatorScreen(lang: lang)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.fact_check, color: Colors.orange, size: 26),
              title: Text(
                lang == AppLanguage.russian ? 'Тест: Амнистия (ЗРУ-937)' : (lang == AppLanguage.uzbekCyrillic ? 'Амнистия тести (ЎРҚ-937)' : 'Amnistiya testi (O‘RQ-937)'),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => AmnestyTestScreen(lang: lang)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning, color: Colors.red, size: 26),
              title: Text(
                lang == AppLanguage.russian ? 'Столкнулись с коррупцией?' : (lang == AppLanguage.uzbekCyrillic ? 'Коррупцияга дуч келсангиз' : 'Korrupsiyaga duch kelsangiz'),
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => CorruptionHelpScreen(lang: lang)));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.phone_in_talk, color: Colors.green, size: 26),
              title: Text(
                lang == AppLanguage.russian ? 'Колл-центр Агентства: 1097' : (lang == AppLanguage.uzbekCyrillic ? 'Агентлик Ишонч телефони: 1097' : 'Kadastr Call-markazi: 1097'),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueGrey, size: 26),
              title: const Text('Muxriddin Elbegiyev', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('+998 33 911 22 22'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => AboutScreen(lang: lang)));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // QIDIRUV MAYDONI
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
            child: TextField(
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: lang == AppLanguage.russian
                    ? 'Поиск услуги или документа...'
                    : (lang == AppLanguage.uzbekCyrillic ? 'Хизмат ёки ҳужжатни қидиринг...' : 'Xizmat yoki hujjatni qidiring...'),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0B3C7B), size: 26),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),

          // TEZKOR BO‘LIMLAR TUGMALARI
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Row(
              children: [
                _buildQuickAction(
                  icon: Icons.calculate,
                  label: lang == AppLanguage.russian ? 'Калькулятор' : (lang == AppLanguage.uzbekCyrillic ? 'Калькулятор' : 'Kalkulyator'),
                  color: Colors.teal.shade700,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CalculatorScreen(lang: lang))),
                ),
                const SizedBox(width: 8),
                _buildQuickAction(
                  icon: Icons.fact_check,
                  label: lang == AppLanguage.russian ? 'Тест ЗРУ-937' : (lang == AppLanguage.uzbekCyrillic ? 'Тест ЎРҚ-937' : 'Test O‘RQ-937'),
                  color: Colors.deepOrange.shade700,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AmnestyTestScreen(lang: lang))),
                ),
                const SizedBox(width: 8),
                _buildQuickAction(
                  icon: Icons.shield,
                  label: lang == AppLanguage.russian ? 'Антикоррупция' : (lang == AppLanguage.uzbekCyrillic ? 'Антикоррупция' : 'Antikorrupsiya'),
                  color: Colors.red.shade800,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CorruptionHelpScreen(lang: lang))),
                ),
              ],
            ),
          ),

          // RO‘YXAT
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final item = filtered[i];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8EEF7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item.icon, color: const Color(0xFF0B3C7B), size: 28),
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            '${lang == AppLanguage.russian ? "Срок" : (lang == AppLanguage.uzbekCyrillic ? "Муддати" : "Muddati")}: ${item.duration.get(lang)}',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF0B3C7B)),
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF0B3C7B)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(service: item, lang: lang)));
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

  Widget _buildQuickAction({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      onPressed: onTap,
    );
  }
}

// ---------------- TAFSILOTLAR EKRANI ----------------
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
                    child: Icon(Icons.assignment, color: Colors.green),
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
                lang == AppLanguage.russian ? 'Официальное наименование:' : (lang == AppLanguage.uzbekCyrillic ? 'Расмий номи:' : 'Rasmiy nomi:'),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey),
              ),
              Text(doc.officialName.get(lang), style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 14),
              Text(
                lang == AppLanguage.russian ? 'Что это за документ? (Простыми словами):' : (lang == AppLanguage.uzbekCyrillic ? 'Бу қандай ҳужжат? (Оддий тилда):' : 'Bu qanday hujjat? (Oddiy tilda):'),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0B3C7B)),
              ),
              const SizedBox(height: 4),
              Text(doc.whatIsIt.get(lang), style: const TextStyle(fontSize: 15, height: 1.4)),
              const SizedBox(height: 14),
              Text(
                lang == AppLanguage.russian ? 'Что обязательно должно быть внутри:' : (lang == AppLanguage.uzbekCyrillic ? 'Ичида нималар ёзилган бўлиши шарт:' : 'Hujjat ichida nimalar yozilgan bo‘lishi shart:'),
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
              Text(
                lang == AppLanguage.russian ? 'Где получить или как восстановить:' : (lang == AppLanguage.uzbekCyrillic ? 'Қаердан олинади ёки йўқолган бўлса:' : 'Qayerdan olinadi yoki yo‘qolgan bo‘lsa:'),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
              ),
              const SizedBox(height: 4),
              Text(doc.whereToGet.get(lang), style: const TextStyle(fontSize: 14, height: 1.4)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B3C7B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(
                    lang == AppLanguage.russian ? 'Понятно' : (lang == AppLanguage.uzbekCyrillic ? 'Тушунарли' : 'Tushundim'),
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
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(service.titleSimple.get(lang), style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
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
            lang == AppLanguage.russian ? 'Проверить мои документы' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатларимни текшириш' : 'Hujjatlarim yetarlimi? Tekshirish'),
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
                  lang == AppLanguage.russian ? 'Цель и назначение услуги:' : (lang == AppLanguage.uzbekCyrillic ? 'Хизматнинг мақсади:' : 'Bu xizmat nima uchun kerak?'),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0B3C7B)),
                ),
                const SizedBox(height: 6),
                Text(service.purpose.get(lang), style: const TextStyle(fontSize: 15, height: 1.4)),
                const Divider(height: 24),
                Row(
                  children: [
                    const Icon(Icons.timer, size: 20, color: Colors.blueGrey),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '${lang == AppLanguage.russian ? "Срок" : (lang == AppLanguage.uzbekCyrillic ? "Муддати" : "Muddati")}: ${service.duration.get(lang)}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.payments, size: 20, color: Colors.green),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        '${lang == AppLanguage.russian ? "Оплата" : (lang == AppLanguage.uzbekCyrillic ? "Тўлов" : "To‘lov")}: ${service.cost.get(lang)}',
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
                    style: const TextStyle(color: Color(0xFFBF360C), fontWeight: FontWeight.bold, fontSize: 14, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            lang == AppLanguage.russian ? 'Необходимые документы (Нажмите):' : (lang == AppLanguage.uzbekCyrillic ? 'Талаб қилинадиган ҳужжатлар (Босинг):' : 'Kerakli hujjatlar (Ustiga bosing):'),
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
                      child: Icon(Icons.info, color: Color(0xFF0B3C7B), size: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.simpleName.get(lang), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0B3C7B))),
                          const SizedBox(height: 2),
                          Text(
                            '${lang == AppLanguage.russian ? "Где взять" : (lang == AppLanguage.uzbekCyrillic ? "Қаердан" : "Qayerdan")}: ${d.whereToGet.get(lang)}',
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
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang == AppLanguage.russian ? 'НЕ ИМЕЮТ ПРАВА ТРЕБОВАТЬ:' : (lang == AppLanguage.uzbekCyrillic ? 'БУЛАРНИ ТАЛАБ ҚИЛИШГА ҲАҚЛАРИ ЙЎҚ:' : 'Bularni talab qilishga HAQLARI YO‘Q:'),
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
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Проверка документов' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатларни текшириш' : 'Hujjatlarim yetarlimi?'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            lang == AppLanguage.russian ? 'Отметьте документы, имеющиеся на руках:' : (lang == AppLanguage.uzbekCyrillic ? 'Қўлингизда бор ҳужжатларни белгиланг:' : 'Qo‘lingizda bor hujjatlarni belgilang:'),
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
                subtitle: Text('${lang == AppLanguage.russian ? "Источник" : (lang == AppLanguage.uzbekCyrillic ? "Қаердан" : "Qayerdan")}: ${doc.whereToGet.get(lang)}'),
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
                      ? (lang == AppLanguage.russian ? 'Документы в полном комплекте!' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатларингиз тўлиқ!' : 'Hujjatlaringiz to‘liq!'))
                      : (lang == AppLanguage.russian ? 'Комплект не полный ($count / $total)' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатлар тўлиқ эмас ($count / $total)' : 'Hujjatlar to‘liq emas ($count / $total)')),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isComplete ? Colors.green.shade900 : Colors.amber.shade900),
                ),
                const SizedBox(height: 8),
                Text(
                  isComplete
                      ? (lang == AppLanguage.russian
                          ? 'Вы можете подать заявление через my.gov.uz или Центр госуслуг. Никто не имеет права требовать лишних справок!'
                          : (lang == AppLanguage.uzbekCyrillic
                              ? 'Энди бемалол Давлат хизматлари марказига ёки my.gov.uz орқали ариза топширишингиз мумкин. Ҳеч ким сиздан ортиқча қоғоз талаб қила олмайди!'
                              : 'Endi bemalol Davlat xizmatlari markaziga yoki my.gov.uz orqali ariza topshirishingiz mumkin. Hech kim ortiqcha qog‘oz talab qila olmaydi!'))
                      : (lang == AppLanguage.russian
                          ? 'Соберите недостающие документы в указанных инстанциях перед подачей заявления.'
                          : (lang == AppLanguage.uzbekCyrillic
                              ? 'Белгиланмаган ҳужжатларни кўрсатилган идорадан олиб, кейин мурожаат қилинг.'
                              : 'Belgilanmagan hujjatlarni ko‘rsatilgan idoradan olib, keyin murojaat qiling.')),
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

// ---------------- DAVLAT BOJI KALKULYATORI (YANGI VA MUKAMMAL) ----------------
class CalculatorScreen extends StatefulWidget {
  final AppLanguage lang;
  const CalculatorScreen({super.key, required this.lang});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final double bhm = 375000; // 2024-2026 amaldagi BHM stavkasi
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
        // Kvartira/uy pasporti
        if (area <= 100) {
          _calculatedSum = bhm * 1.25;
        } else if (area <= 300) {
          _calculatedSum = bhm * 2.0;
        } else {
          _calculatedSum = bhm * 3.0;
        }
      } else if (_selectedService == 'reyestr') {
        // Davlat ro'yxatidan o'tkazish
        _calculatedSum = bhm * 1.0;
      } else if (_selectedService == 'spravka') {
        // Ko'chirma
        _calculatedSum = bhm * 0.05;
      } else {
        // Noturar
        _calculatedSum = bhm * 3.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Калькулятор госпошлины' : (lang == AppLanguage.uzbekCyrillic ? 'Давлат божи калькулятори' : 'Davlat boji kalkulyatori'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
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
                    lang == AppLanguage.russian
                        ? 'Расчет по официальным ставкам БРВ. Не переплачивайте посредникам!'
                        : (lang == AppLanguage.uzbekCyrillic
                            ? 'БҲМ асосида расмий ҳисоб. Маклерларга ортиқча пул берманг!'
                            : 'BHM asosidagi qonuniy rasmiy hisob. Maklerlarga ortiqcha pul to‘lamang!'),
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
                  Text(
                    lang == AppLanguage.russian ? 'Выберите тип услуги:' : (lang == AppLanguage.uzbekCyrillic ? 'Хизмат турини танланг:' : 'Xizmat turini tanlang:'),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedService,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'turar',
                        child: Text(lang == AppLanguage.russian ? 'Кадастровый паспорт (Жилье)' : 'Uy-joy kadastr pasporti'),
                      ),
                      DropdownMenuItem(
                        value: 'reyestr',
                        child: Text(lang == AppLanguage.russian ? 'Госрегистрация (Реестр)' : 'Mulk huquqini ro‘yxatdan o‘tkazish'),
                      ),
                      DropdownMenuItem(
                        value: 'spravka',
                        child: Text(lang == AppLanguage.russian ? 'Выписка с QR-кодом' : 'Davlat reyestridan ko‘chirma'),
                      ),
                      DropdownMenuItem(
                        value: 'noturar',
                        child: Text(lang == AppLanguage.russian ? 'Коммерческий объект (Нежилое)' : 'Tadbirkorlik (Noturar bino)'),
                      ),
                    ],
                    onChanged: (val) {
                      _selectedService = val!;
                      _recalculate();
                    },
                  ),
                  if (_selectedService == 'turar' || _selectedService == 'noturar') ...[
                    const SizedBox(height: 16),
                    Text(
                      lang == AppLanguage.russian ? 'Общая площадь (кв. метр):' : (lang == AppLanguage.uzbekCyrillic ? 'Умумий майдони (кв. метр):' : 'Umumiy maydoni (kv. metr):'),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
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
              color: const Color(0xFF0B3C7B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  lang == AppLanguage.russian ? 'ОФИЦИАЛЬНАЯ ГОСПОШЛИНА' : (lang == AppLanguage.uzbekCyrillic ? 'РАСМИЙ ДАВЛАТ ТЎЛОВИ' : 'RASMIY QONUNIY TO‘LOV'),
                  style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                const SizedBox(height: 8),
                Text(
                  '${_calculatedSum.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so‘m',
                  style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  lang == AppLanguage.russian
                      ? 'my.gov.uz дает скидку 10% от этой суммы!'
                      : (lang == AppLanguage.uzbekCyrillic
                          ? 'my.gov.uz орқали тўланса 10% чегирма берилади!'
                          : 'my.gov.uz orqali to‘lansa 10% chegirma beriladi!'),
                  style: const TextStyle(color: Color(0xFF81C784), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ---------------- AMNISTIYA TESTI (O‘RQ-937 QONUNI) ----------------
class AmnestyTestScreen extends StatefulWidget {
  final AppLanguage lang;
  const AmnestyTestScreen({super.key, required this.lang});

  @override
  State<AmnestyTestScreen> createState() => _AmnestyTestScreenState();
}

class _AmnestyTestScreenState extends State<AmnestyTestScreen> {
  int _q1 = -1; // 2018 yilgacha qurilganmi?
  int _q2 = -1; // Xavfli zonadami?
  int _q3 = -1; // Nizo bormi?

  @override
  Widget build(BuildContext context) {
    final lang = widget.lang;
    bool allAnswered = _q1 != -1 && _q2 != -1 && _q3 != -1;
    bool isEligible = _q1 == 1 && _q2 == 0 && _q3 == 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Тест ЗРУ-937 (Амнистия)' : (lang == AppLanguage.uzbekCyrillic ? 'Амнистия тести (ЎРҚ-937)' : 'Amnistiya testi (O‘RQ-937)'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.amber)),
            child: Text(
              lang == AppLanguage.russian
                  ? 'Узнайте за 1 минуту, подпадает ли ваш дом под признание прав по Закону ЗРУ-937 от 05.08.2024.'
                  : (lang == AppLanguage.uzbekCyrillic
                      ? 'Уйингиз ЎРҚ-937-сон Қонун бўйича қонуний тан олинишга тўғри келадими? 1 дақиқада текширинг.'
                      : 'Uyingiz O‘RQ-937-son Qonun bo‘yicha eʼtirof etilishga to‘g‘ri keladimi? 1 daqiqada tekshiring.'),
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
          ),
          const SizedBox(height: 16),
          _buildQuestion(
            title: lang == AppLanguage.russian ? '1. Дом построен до 1 мая 2018 года?' : '1. Uyingiz 2018-yil 1-maygacha qurilganmi?',
            val: _q1,
            onYes: () => setState(() => _q1 = 1),
            onNo: () => setState(() => _q1 = 0),
          ),
          _buildQuestion(
            title: lang == AppLanguage.russian ? '2. Находится ли дом в охранной зоне (ЛЭП, газ, водоохранная)?' : '2. Uy daryo bo‘yi, gaz quvuri yoki simlar ostidami?',
            val: _q2,
            onYes: () => setState(() => _q2 = 1),
            onNo: () => setState(() => _q2 = 0),
          ),
          _buildQuestion(
            title: lang == AppLanguage.russian ? '3. Имеется ли спор по границе с соседями?' : '3. Qo‘shnilar bilan yer talashi (sud/nizo) bormi?',
            val: _q3,
            onYes: () => setState(() => _q3 = 1),
            onNo: () => setState(() => _q3 = 0),
          ),
          if (allAnswered) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isEligible ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: isEligible ? Colors.green : Colors.red, width: 1.5),
              ),
              child: Column(
                children: [
                  Icon(isEligible ? Icons.check_circle : Icons.cancel, color: isEligible ? Colors.green : Colors.red, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    isEligible
                        ? (lang == AppLanguage.russian ? 'ВЫ ПОДПАДАЕТЕ ПОД ЗАКОН ЗРУ-937!' : 'UYINGIZ QONUNIY TAN OLINISHGA TUSHADI!')
                        : (lang == AppLanguage.russian ? 'ТРЕБУЕТСЯ ИНДИВИДУАЛЬНОЕ РАССМОТРЕНИЕ' : 'ALOHIDA HUQUQIY O‘RGANISH TALAB ETILADI'),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isEligible ? Colors.green.shade900 : Colors.red.shade900),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isEligible
                        ? (lang == AppLanguage.russian
                            ? 'Сотрудники кадастра включат ваш дом в реестр в ходе сплошной инвентаризации по махалле. Никому не платите!'
                            : 'Uyingiz bepul xatlov dasturiga tushadi. Hech qanday vositachilarga pul bermang, ishchi guruh kelishini kuting!')
                        : (lang == AppLanguage.russian
                            ? 'Нахождение в охранных зонах или земельные споры исключают автоматическое признание прав.'
                            : 'Muhofaza zonasida joylashgan yoki qo‘shnilar bilan nizosi bor yerlar avtomat qonuniylashtirilmaydi.'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildQuestion({required String title, required int val, required VoidCallback onYes, required VoidCallback onNo}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: val == 1 ? const Color(0xFF0B3C7B) : null,
                      foregroundColor: val == 1 ? Colors.white : null,
                    ),
                    onPressed: onYes,
                    child: Text(widget.lang == AppLanguage.russian ? 'Да' : 'Ha'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: val == 0 ? const Color(0xFF0B3C7B) : null,
                      foregroundColor: val == 0 ? Colors.white : null,
                    ),
                    onPressed: onNo,
                    child: Text(widget.lang == AppLanguage.russian ? 'Нет' : 'Yo‘q'),
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

// ---------------- KORRUPSIYAGA DUCH KELSANGIZ (QADAMLAR) ----------------
class CorruptionHelpScreen extends StatelessWidget {
  final AppLanguage lang;
  const CorruptionHelpScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Действия при коррупции' : (lang == AppLanguage.uzbekCyrillic ? 'Коррупцияга дуч келсангиз' : 'Korrupsiyaga duch kelsangiz'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.red.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.gavel, color: Colors.red.shade900, size: 28),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        lang == AppLanguage.russian ? 'ВАШИ ЗАКОННЫЕ ПРАВА:' : 'SIZNING QONUNIY HUQUQLARINGIZ:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red.shade900),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  lang == AppLanguage.russian
                      ? '1. Ни один сотрудник кадастра не имеет права брать наличные деньги в руки.\n'
                        '2. Любая плата производится строго через электронный инвойс.\n'
                        '3. Требование справок, не входящих в утвержденный перечень — грубое правонарушение.'
                      : '1. Birorta ham kadastr xodimi sizdan qo‘lda naqd pul olishga haqi yo‘q.\n'
                        '2. Barcha to‘lovlar faqat telefoningizga kelgan rasmiy SMS-invoys orqali to‘lanadi.\n'
                        '3. Tasdiqlangan ro‘yxatdan tashqari qo‘shimcha hujjat talab qilish qonunbuzarlikdir.',
                  style: const TextStyle(fontSize: 14, height: 1.45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            lang == AppLanguage.russian ? 'Официальные горячие линии:' : 'Rasmiy tezkor aloqa liniyalari:',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildContactCard(
            title: lang == AppLanguage.russian ? 'Агентство по кадастру (Колл-центр)' : 'Kadastr agentligi Call-markazi',
            phone: '1097',
            desc: lang == AppLanguage.russian ? 'Жалобы на действия сотрудников' : 'Xodimlar ustidan tezkor shikoyatlar',
          ),
          _buildContactCard(
            title: lang == AppLanguage.russian ? 'Генеральная прокуратура РУз' : 'Bosh prokuratura ishonch telefoni',
            phone: '1007',
            desc: lang == AppLanguage.russian ? 'Борьба с коррупцией и вымогательством' : 'Korrupsiya va tamagirlik holatlari',
          ),
          _buildContactCard(
            title: lang == AppLanguage.russian ? 'Департамент при Генпрокуратуре' : 'Iqtisodiy jinoyatlarga qarshi kurashish departamenti',
            phone: '+998 (71) 233-10-07',
            desc: lang == AppLanguage.russian ? 'Финансовые преступления и взятки' : 'Noqonuniy vositachilik va poraxo‘rlik',
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({required String title, required String phone, required String desc}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F5E9),
          child: Icon(Icons.phone, color: Colors.green),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text('$desc\nTelefon: $phone', style: const TextStyle(fontSize: 12)),
        isThreeLine: true,
      ),
    );
  }
}

// ---------------- ALOHIDA LUG‘AT (QOMUS) EKRANI ----------------
class VocabularyScreen extends StatelessWidget {
  final AppLanguage lang;
  const VocabularyScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'Словарь документов' : (lang == AppLanguage.uzbekCyrillic ? 'Ҳужжатлар қомуси' : 'Hujjatlar nima? (Sodda qomus)'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allVocabularies.length,
        itemBuilder: (context, i) {
          final item = allVocabularies[i];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              initiallyExpanded: i == 0,
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE8EEF7),
                child: Icon(Icons.menu_book, color: Color(0xFF0B3C7B)),
              ),
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
                      Text(
                        lang == AppLanguage.russian ? 'Что внутри:' : 'Ichida nimalar yozilgan bo‘ladi:',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0B3C7B)),
                      ),
                      const SizedBox(height: 4),
                      Text(item.whatIsInside.get(lang), style: const TextStyle(fontSize: 13, height: 1.4)),
                      const SizedBox(height: 10),
                      Text(
                        lang == AppLanguage.russian ? 'Где найти:' : 'Qayerdan topiladi:',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),
                      ),
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

// ---------------- LOYIHA HAQIDA VA ALOQA EKRANI ----------------
class AboutScreen extends StatelessWidget {
  final AppLanguage lang;
  const AboutScreen({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B3C7B),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          lang == AppLanguage.russian ? 'О проекте и контакты' : (lang == AppLanguage.uzbekCyrillic ? 'Лойиҳа мақсади ва Алоқа' : 'Loyiha maqsadi va Aloqa'),
          style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
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
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.shield, color: Colors.red, size: 30),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          lang == AppLanguage.russian ? 'Официальная цель проекта' : 'Loyihaning rasmiy maqsadi',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0B3C7B)),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      lang == AppLanguage.russian
                          ? 'Проект разработан по инициативе отдела по борьбе с коррупцией Агентства по кадастру Республики Узбекистан.'
                          : 'Ushbu loyiha O‘zbekiston Respublikasi Kadastr agentligining Korrupsiyaga qarshi kurashish bo‘limi tashabbusi asosida ishlab chiqildi.',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20), height: 1.35),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    lang == AppLanguage.russian
                        ? 'Главная цель: Предотвращение коррупционных рисков и вымогательства в сфере кадастра путем предоставления гражданам исчерпывающей и понятной юридической информации по всем 22 государственным услугам.'
                        : 'Asosiy maqsad: Fuqarolar o‘zida bor yoki yo‘q hujjatlarni bilmasdan turli vositachilar (maklerlar) tuzog‘iga tushib qolishini oldini olish, asossiz talablarga chek qo‘yish va barcha 22 ta rasmiy davlat xizmati bo‘yicha shaffof qo‘llanma taqdim etish.',
                    style: const TextStyle(fontSize: 14, height: 1.45),
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
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Color(0xFF0B3C7B),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
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
                    subtitle: Text('+998 33 911 22 22', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0B3C7B))),
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
