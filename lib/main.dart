import 'package:flutter/material.dart';

void main() {
  runApp(const CadastrePortalApp());
}

class CadastrePortalApp extends StatefulWidget {
  const CadastrePortalApp({super.key});

  @override
  State<CadastrePortalApp> createState() => _CadastrePortalAppState();
}

class _CadastrePortalAppState extends State<CadastrePortalApp> {
  String _currentLang = 'uz_lat'; // uz_lat, uz_cyr, ru

  void _changeLanguage(String langCode) {
    setState(() {
      _currentLang = langCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kadastr & Davlat Xizmatlari',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF0F3973),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F3973),
          primary: const Color(0xFF0F3973),
          secondary: const Color(0xFF0284C7),
        ),
      ),
      home: HomeScreen(
        currentLang: _currentLang,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

// --- MA'LUMOTLAR BAZASI (3 Tilda) ---
final Map<String, Map<String, dynamic>> appData = {
  'uz_lat': {
    'app_title': 'DAVLAT KADASTR XIZMATLARI',
    'app_subtitle': 'Shaffof, tezkor va korrupsiyasiz yagona portal',
    'search_hint': 'Xizmat nomi yoki bo‘limini qidiring...',
    'anti_corr_title': 'Korrupsiyaga chek qo‘yish',
    'anti_corr_desc': 'Tamagirlik yoki noqonuniy to‘lov talab qilindimi? Darhol xabar bering!',
    'anti_corr_dialog_title': 'Xavfsizlik va Nazorat Markazi',
    'anti_corr_dialog_body':
        'Hurmatli fuqaro!\n\nDavlat xizmatlari uchun belgilangan rasmiy to‘lovlardan tashqari hech qanday vositachi yoki naqd pul berish taqiqlanadi.\n\nQonunbuzarlik holatlarida quyidagi raqamlarga murojaat qiling:\n• Bosh prokuratura: 1007\n• Korrupsiyaga qarshi agentlik: 1253\n• Ishonch telefoni: 1148 / 1097',
    'btn_details': 'Batafsil ma’lumot',
    'lbl_term': 'Ijro muddati:',
    'lbl_cost': 'Davlat to‘lovi:',
    'lbl_docs': 'Kerakli hujjatlar:',
    'lbl_rules': 'Shaffoflik kafolati:',
    'btn_online_apply': 'Arizani onlayn topshirish',
    'services': [
      {
        'icon': Icons.assignment_outlined,
        'title': 'Kadastr pasportini shakllantirish',
        'category': 'Ko‘chmas mulk',
        'term': '5 - 10 ish kuni',
        'cost': 'BHMning 25% dan boshlab',
        'desc': 'Ko‘chmas mulk ob’ektlariga elektron kadastr yig‘majildini tayyorlash va pasport rasmiylashtirish.',
        'docs': 'Mulk huquqini tasdiqlovchi hujjat, pasport/ID nusxasi.',
        'rules': 'Inson omilisiz elektron shakllanadi. Barcha jarayon onlayn SMS orqali kuzatib boriladi.'
      },
      {
        'icon': Icons.home_work_outlined,
        'title': 'Mulk huquqini davlat ro‘yxatidan o‘tkazish',
        'category': 'Davlat reyestri',
        'term': '2 ish kuni',
        'cost': 'BHM 1 baravari',
        'desc': 'Xarid qilingan, meros qolgan yoki hadya etilgan mulkni Milliy reyestrga kiritish.',
        'docs': 'Notarial shartnoma, order yoki sud qarori.',
        'rules': 'Reyestrga kiritilgach QR-kodli elektron davlat guvohnomasi yuklab olish uchun beriladi.'
      },
      {
        'icon': Icons.straighten_outlined,
        'title': 'Yer uchastkasi chegaralarini belgilash',
        'category': 'Yer resurslari',
        'term': '3 - 5 ish kuni',
        'cost': 'Shartnoma asosida',
        'desc': 'Yer maydonining aniq koordinatalarini aniqlash va chegaralarni elektron xaritaga bog‘lash.',
        'docs': 'Ajratish qarori, auksion bayonnomasi.',
        'rules': 'Topografik o‘lchovlar avtomatik geoportallar tizimiga muhrlanadi.'
      },
      {
        'icon': Icons.verified_user_outlined,
        'title': 'Mulk mavjudligi haqida ma’lumotnoma',
        'category': 'Ma’lumotnomalar',
        'term': '15 daqiqa (Avtomatlashtirilgan)',
        'cost': 'Bepul / BHM 5%',
        'desc': 'Fuqaro yoki yuridik shaxs nomida bino/yer bor-yo‘qligini tasdiqlovchi elektron hujjat.',
        'docs': 'JShShIR (PINFL) raqami va E-imzo.',
        'rules': 'Hech qanday navbatsiz va inspektorsiz to‘g‘ridan-to‘g‘ri ma’lumotlar bazasidan beriladi.'
      },
      {
        'icon': Icons.domain_add_outlined,
        'title': 'Bino va inshootlarni qayta loyihalash ruxsati',
        'category': 'Qurilish va arxitektura',
        'term': '5 ish kuni',
        'cost': 'BHM 30%',
        'desc': 'Xonalarni qayta rejalashtirish yoki qo‘shimcha qurilishlar uchun elektron ruxsatnoma.',
        'docs': 'Loyiha-smeta hujjati, mulkdor roziligi.',
        'rules': 'Arxitektura kengashi tomonidan to‘liq raqamlashtirilgan tartibda ko‘rib chiqiladi.'
      },
    ]
  },
  'uz_cyr': {
    'app_title': 'ДАВЛАТ КАДАСТР ХИЗМАТЛАРИ',
    'app_subtitle': 'Шаффоф, тезкор ва коррупциясиз ягона портал',
    'search_hint': 'Хизмат номи ёки бўлимини қидиринг...',
    'anti_corr_title': 'Коррупцияга чек қўйиш',
    'anti_corr_desc': 'Тамагирлик ёки ноқонуний тўлов талаб қилиндими? Дарҳол хабар беринг!',
    'anti_corr_dialog_title': 'Хавфсизлик ва Назорат Маркази',
    'anti_corr_dialog_body':
        'Ҳурматли фуқаро!\n\nДавлат хизматлари учун белгиланган расмий тўловлардан ташқари ҳеч қандай воситачи ёки нақд пул бериш тақиқланади.\n\nҚонунбузарлик ҳолатларида қуйидаги рақамларга мурожаат қилинг:\n• Бош прокуратура: 1007\n• Коррупцияга қарши агентлик: 1253\n• Ишонч телефони: 1148 / 1097',
    'btn_details': 'Батафсил маълумот',
    'lbl_term': 'Ижро муддати:',
    'lbl_cost': 'Давлат тўлови:',
    'lbl_docs': 'Керакли ҳужжатлар:',
    'lbl_rules': 'Шаффофлик кафолати:',
    'btn_online_apply': 'Аризани онлайн топшириш',
    'services': [
      {
        'icon': Icons.assignment_outlined,
        'title': 'Кадастр паспортини шакллантириш',
        'category': 'Кўчмас мулк',
        'term': '5 - 10 иш куни',
        'cost': 'БҲМнинг 25% дан бошлаб',
        'desc': 'Кўчмас мулк объектларига электрон кадастр йиғмажилдини тайёрлаш ва паспорт расмийлаштириш.',
        'docs': 'Мулк ҳуқуқини тасдиқловчи ҳужжат, паспорт/ID нусхаси.',
        'rules': 'Инсон омилисиз электрон шаклланади. Барча жараён онлайн SMS орқали кузатиб борилади.'
      },
      {
        'icon': Icons.home_work_outlined,
        'title': 'Мулк ҳуқуқини давлат рўйхатидан ўтказиш',
        'category': 'Давлат реестри',
        'term': '2 иш куни',
        'cost': 'БҲМ 1 баравари',
        'desc': 'Харид қилинган, мерос қолган ёки ҳадя этилган мулкни Миллий реестрга киритиш.',
        'docs': 'Нотариал шартнома, ордер ёки суд қарори.',
        'rules': 'Реестрга киритилгач QR-кодли электрон давлат гувоҳномаси юклаб олиш учун берилади.'
      },
      {
        'icon': Icons.straighten_outlined,
        'title': 'Ер участкаси чегараларини белгилаш',
        'category': 'Ер ресурслари',
        'term': '3 - 5 иш куни',
        'cost': 'Шартнома асосида',
        'desc': 'Ер майдонининг аниқ координаталарини аниқлаш ва чегараларни электрон харитага боғлаш.',
        'docs': 'Ажратиш қарори, аукцион баённомаси.',
        'rules': 'Топографик ўлчовлар автоматик геопорталлар тизимига муҳрланади.'
      },
      {
        'icon': Icons.verified_user_outlined,
        'title': 'Мулк мавжудлиги ҳақида маълумотнома',
        'category': 'Маълумотномалар',
        'term': '15 дақиқа (Автоматлаштирилган)',
        'cost': 'Бепул / БҲМ 5%',
        'desc': 'Фуқаро ёки юридик шахс номида бино/ер бор-йўқлигини тасдиқловчи электрон ҳужжат.',
        'docs': 'ЖШШИР (ПИНФЛ) рақами ва Э-имзо.',
        'rules': 'Ҳеч қандай навбатсиз ва инспекторсиз тўғридан-тўғри маълумотлар базасидан берилади.'
      },
      {
        'icon': Icons.domain_add_outlined,
        'title': 'Бино ва иншоотларни қайта лойиҳалаш рухсати',
        'category': 'Қурилиш ва архитектура',
        'term': '5 иш куни',
        'cost': 'БҲМ 30%',
        'desc': 'Хоналарни қайта режалаштириш ёки қўшимча қурилишлар учун электрон рухсатнома.',
        'docs': 'Лойиҳа-смета ҳужжати, мулкдор розилиги.',
        'rules': 'Архитектура кенгаши томонидан тўлиқ рақамлаштирилган тартибда кўриб чиқилади.'
      },
    ]
  },
  'ru': {
    'app_title': 'ГОСУДАРСТВЕННЫЙ КАДАСТР',
    'app_subtitle': 'Прозрачный и единый портал без коррупции и очередей',
    'search_hint': 'Поиск услуги или раздела...',
    'anti_corr_title': 'Противодействие коррупции',
    'anti_corr_desc': 'Столкнулись с вымогательством или незаконным сбором? Сообщите нам!',
    'anti_corr_dialog_title': 'Центр Безопасности и Контроля',
    'anti_corr_dialog_body':
        'Уважаемый гражданин!\n\nВсе платежи производятся исключительно по государственным официальным квитанциям.\n\nПри правонарушениях обращайтесь:\n• Генеральная прокуратура: 1007\n• Агентство по противодействию коррупции: 1253\n• Горячая линия: 1148 / 1097',
    'btn_details': 'Подробнее',
    'lbl_term': 'Срок исполнения:',
    'lbl_cost': 'Госпошлина:',
    'lbl_docs': 'Необходимые документы:',
    'lbl_rules': 'Гарантия прозрачности:',
    'btn_online_apply': 'Подать электронное заявление',
    'services': [
      {
        'icon': Icons.assignment_outlined,
        'title': 'Оформление кадастрового паспорта',
        'category': 'Недвижимость',
        'term': '5 - 10 рабочих дней',
        'cost': 'От 25% БРВ',
        'desc': 'Формирование электронного кадастрового дела и изготовление паспорта объекта.',
        'docs': 'Правоустанавливающий документ, копия паспорта/ID.',
        'rules': 'Полностью электронный процесс без прямого контакта с инспекторами.'
      },
      {
        'icon': Icons.home_work_outlined,
        'title': 'Госрегистрация прав на недвижимость',
        'category': 'Единый реестр',
        'term': '2 рабочих дня',
        'cost': '1 БРВ',
        'desc': 'Внесение прав собственности на недвижимость в Государственный реестр.',
        'docs': 'Нотариальный договор, ордер или решение суда.',
        'rules': 'После регистрации выдается электронная выписка с защищенным QR-кодом.'
      },
      {
        'icon': Icons.straighten_outlined,
        'title': 'Определение границ земельного участка',
        'category': 'Земельный фонд',
        'term': '3 - 5 рабочих дней',
        'cost': 'На договорной основе',
        'desc': 'Геодезическая съемка, фиксация точных поворотных точек и границ на карте.',
        'docs': 'Решение о выделении, протокол аукциона.',
        'rules': 'Координаты фиксируются в геоинформационной системе автоматически.'
      },
      {
        'icon': Icons.verified_user_outlined,
        'title': 'Справка о наличии/отсутствии жилья',
        'category': 'Справки',
        'term': '15 минут (Автоматически)',
        'cost': 'Бесплатно / 5% БРВ',
        'desc': 'Официальная электронная выписка о наличии зарегистрированного имущества.',
        'docs': 'ПИНФЛ и электронная подпись (ЭЦП).',
        'rules': 'Генерируется базой данных в режиме реального времени.'
      },
      {
        'icon': Icons.domain_add_outlined,
        'title': 'Разрешение на перепланировку помещений',
        'category': 'Строительство и архитектура',
        'term': '5 рабочих дней',
        'cost': '30% БРВ',
        'desc': 'Согласование перепланировок, сноса некапитальных стен или пристроек.',
        'docs': 'Проектный план, согласие всех собственников.',
        'rules': 'Рассматривается градостроительным советом в цифровом формате.'
      },
    ]
  }
};

// --- ASOSIY EKRAN ---
class HomeScreen extends StatefulWidget {
  final String currentLang;
  final Function(String) onLanguageChanged;

  const HomeScreen({
    super.key,
    required this.currentLang,
    required this.onLanguageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final langData = appData[widget.currentLang]!;
    final List<Map<String, dynamic>> allServices = langData['services'];

    final filteredServices = allServices.where((s) {
      final title = s['title'].toString().toLowerCase();
      final cat = s['category'].toString().toLowerCase();
      final q = _searchQuery.toLowerCase();
      return title.contains(q) || cat.contains(q);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F3973),
        elevation: 2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              langData['app_title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
            Text(
              langData['app_subtitle'],
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFFBAE6FD),
              ),
            ),
          ],
        ),
        actions: [
          // Til tanlash tugmalari
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Colors.white, size: 26),
            onSelected: widget.onLanguageChanged,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'uz_lat',
                child: Row(
                  children: [
                    Text(
                      "O'zbekcha (Lotin)",
                      style: TextStyle(
                        fontWeight: widget.currentLang == 'uz_lat' ? FontWeight.bold : FontWeight.normal,
                        color: widget.currentLang == 'uz_lat' ? const Color(0xFF0F3973) : Colors.black87,
                      ),
                    ),
                    if (widget.currentLang == 'uz_lat') const Spacer(),
                    if (widget.currentLang == 'uz_lat') const Icon(Icons.check, color: Color(0xFF0F3973), size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'uz_cyr',
                child: Row(
                  children: [
                    Text(
                      "Ўзбекча (Крилл)",
                      style: TextStyle(
                        fontWeight: widget.currentLang == 'uz_cyr' ? FontWeight.bold : FontWeight.normal,
                        color: widget.currentLang == 'uz_cyr' ? const Color(0xFF0F3973) : Colors.black87,
                      ),
                    ),
                    if (widget.currentLang == 'uz_cyr') const Spacer(),
                    if (widget.currentLang == 'uz_cyr') const Icon(Icons.check, color: Color(0xFF0F3973), size: 18),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'ru',
                child: Row(
                  children: [
                    Text(
                      "Русский",
                      style: TextStyle(
                        fontWeight: widget.currentLang == 'ru' ? FontWeight.bold : FontWeight.normal,
                        color: widget.currentLang == 'ru' ? const Color(0xFF0F3973) : Colors.black87,
                      ),
                    ),
                    if (widget.currentLang == 'ru') const Spacer(),
                    if (widget.currentLang == 'ru') const Icon(Icons.check, color: Color(0xFF0F3973), size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Qidiruv paneli
          Container(
            padding: const EdgeInsets.all(14),
            color: const Color(0xFF0F3973),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: langData['search_hint'],
                hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF0F3973), size: 24),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Korrupsiyaga qarshi maxsus banner
          InkWell(
            onTap: () => _showAntiCorruptionInfo(context, langData),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFFCA5A5), width: 1.2),
              ),
              child: Row(
                children: [
                  const Icon(Icons.gavel_rounded, color: Color(0xFFDC2626), size: 34),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          langData['anti_corr_title'],
                          style: const TextStyle(
                            color: Color(0xFF991B1B),
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          langData['anti_corr_desc'],
                          style: const TextStyle(
                            color: Color(0xFF7F1D1D),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDC2626), size: 16),
                ],
              ),
            ),
          ),

          // Xizmatlar ro'yxati
          Expanded(
            child: filteredServices.isEmpty
                ? const Center(
                    child: Text(
                      'Hech narsa topilmadi',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                    itemCount: filteredServices.length,
                    itemBuilder: (context, index) {
                      final item = filteredServices[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceDetailScreen(
                                    service: item,
                                    langData: langData,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Ikonka bloki
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0F2FE),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      item['icon'],
                                      color: const Color(0xFF0284C7),
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  // Matnlar
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            item['category'],
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF475569),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          item['title'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF1E293B),
                                            height: 1.25,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          item['desc'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF64748B),
                                            height: 1.3,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(Icons.schedule, size: 16, color: Color(0xFF0F3973)),
                                            const SizedBox(width: 4),
                                            Text(
                                              item['term'],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF0F3973),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              langData['btn_details'],
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF0284C7),
                                              ),
                                            ),
                                            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF0284C7)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showAntiCorruptionInfo(BuildContext context, Map<String, dynamic> langData) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.security, color: Color(0xFFDC2626), size: 28),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                langData['anti_corr_dialog_title'],
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        content: Text(
          langData['anti_corr_dialog_body'],
          style: const TextStyle(fontSize: 14, height: 1.4, color: Color(0xFF1E293B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

// --- XIZMAT TAFSILOTLARI EKRANI ---
class ServiceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> service;
  final Map<String, dynamic> langData;

  const ServiceDetailScreen({
    super.key,
    required this.service,
    required this.langData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          service['category'],
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0F3973),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2FE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(service['icon'], color: const Color(0xFF0284C7), size: 36),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    service['title'],
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _infoCard(
              title: 'Tavsif',
              content: service['desc'],
              icon: Icons.info_outline,
            ),
            const SizedBox(height: 12),
            _infoCard(
              title: langData['lbl_term'],
              content: service['term'],
              icon: Icons.timer_outlined,
            ),
            const SizedBox(height: 12),
            _infoCard(
              title: langData['lbl_cost'],
              content: service['cost'],
              icon: Icons.payments_outlined,
            ),
            const SizedBox(height: 12),
            _infoCard(
              title: langData['lbl_docs'],
              content: service['docs'],
              icon: Icons.folder_open_outlined,
            ),
            const SizedBox(height: 12),
            _infoCard(
              title: langData['lbl_rules'],
              content: service['rules'],
              icon: Icons.shield_outlined,
              isHighlight: true,
            ),
            const SizedBox(height: 26),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F3973),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Yagona identifikatsiya (OneID) orqali ariza tizimiga ulanmoqda...'),
                    ),
                  );
                },
                icon: const Icon(Icons.send_rounded, color: Colors.white),
                label: Text(
                  langData['btn_online_apply'],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required String title,
    required String content,
    required IconData icon,
    bool isHighlight = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFFF0FDF4) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isHighlight ? const Color(0xFF86EFAC) : const Color(0xFFE2E8F0),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: isHighlight ? const Color(0xFF16A34A) : const Color(0xFF0F3973)),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isHighlight ? const Color(0xFF166534) : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: isHighlight ? const Color(0xFF14532D) : const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }
}
