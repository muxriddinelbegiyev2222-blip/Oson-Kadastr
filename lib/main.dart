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

// ---------------- BARCHA ASOSIY KADASTR XIZMATLARI ----------------
final List<KadastrService> kadastrServices = [
  KadastrService(
    id: '1',
    titleSimple: 'Uyga yangi kadastr pasportini shakllantirish',
    titleOfficial: 'Ko‘chmas mulk obyektiga kadastr pasportini shakllantirish',
    category: 'Uy-joy',
    purpose: 'Ko‘chmas mulk obyekti (uy, kvartira, bino)ning texnik ko‘rsatkichlarini va elektron chizmasini tayyorlash.',
    duration: '5 dan 10 ish kunigacha (maydoni va murakkabligiga qarab)',
    cost: 'Obyekt maydoni va turiga qarab belgilangan davlat boji asosida (SMS-kvitansiya orqali)',
    warningTip: 'Hech kimga qo‘ldan naqd pul bermang! To‘lov faqat Davlat xizmatlari markazi yoki Click/Payme/Uzum orqali invoys asosida qilinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkka egalik huquqini tasdiqlovchi hujjat',
        officialName: 'Huquq belgilovchi hujjat',
        whereToGet: 'Notarius, tuman hokimligi yoki davlat arxividan',
        explanation: 'Oldi-sotdi shartnomasi, meros guvohnomasi, order yoki tuman hokimi qarori.',
      ),
      RequiredDocument(
        simpleName: 'Ariza beruvchining pasporti yoki ID-kartasi',
        officialName: 'Shaxsni tasdiqlovchi hujjat (JShSHIR)',
        whereToGet: 'Yoningizda bo‘lishi kifoya',
        explanation: '14 xonali shaxsiy identifikatsiya raqami orqali ariza kiritiladi.',
      ),
    ],
    illegalDemands: [
      'Mahalladan maʼlumotnoma (spravka)',
      'Qo‘shnilardan yozma rozilik xati',
      'Kommunal to‘lovlardan qarz yo‘qligi to‘g‘risida maʼlumotnoma',
    ],
  ),
  KadastrService(
    id: '2',
    titleSimple: 'Mulk huquqini davlat ro‘yxatidan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqlarni davlat ro‘yxatidan o‘tkazish',
    category: 'Uy-joy',
    purpose: 'Ko‘chmas mulkka bo‘lgan egalik huquqini Yagona davlat reyestrida rasman tasdiqlash va ro‘yxatdan o‘tkazish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'Agar notarial bitimdan so‘ng mulk ro‘yxatdan o‘tkazilmasa, huquqiy jihatdan to‘liq mulkdor hisoblanmaysiz.',
    docs: [
      RequiredDocument(
        simpleName: 'Huquq belgilovchi notarial yoki sud hujjati',
        officialName: 'Bitim yoki sud qarori',
        whereToGet: 'Notarial idoradan yoki suddan',
        explanation: 'Shartnoma, merosga bo‘lgan guvohnoma yoki sudning qonuniy kuchga kirgan qarori.',
      ),
      RequiredDocument(
        simpleName: 'Obyektning kadastr yig‘majildi (pasporti)',
        officialName: 'Kadastr pasporti',
        whereToGet: 'Avvalgi egasidan yoki kadastr tizimidan',
        explanation: 'Mulkning elektron chizmasi va xususiyatlari jamlangan hujjat.',
      ),
    ],
    illegalDemands: [
      'Notarius tasdiqlagan hujjatni qayta tasdiqlatish',
      'Arxivdan qo‘shimcha nusxa talab qilish',
    ],
  ),
  KadastrService(
    id: '3',
    titleSimple: 'Ko‘chmas mulk bo‘yicha taqiq (Zapret) bor-yo‘qligini tekshirish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq va xatlovlar to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Mulkka sud, MIB, bank yoki notarius tomonidan taqiq qo‘yilmaganligini aniqlash.',
    duration: '1 ish kuni (ko‘p hollarda real vaqtda avtomatik)',
    cost: 'BHMning 0.05 baravari (my.gov.uz orqali chegirma bor)',
    warningTip: 'Taqiq yoki xatlov bor obyektni sotish, hadya qilish yoki garovga qo‘yish qonunan mumkin emas.',
    docs: [
      RequiredDocument(
        simpleName: 'Obyektning kadastr raqami',
        officialName: 'Mulk kadastr raqami',
        whereToGet: 'Kadastr guvohnomasidan',
        explanation: '10:.. formatidagi maxsus raqam.',
      ),
    ],
    illegalDemands: [
      'MIB yoki soliq idorasidan qo‘shimcha muhrli maʼlumotnoma talab qilish',
    ],
  ),
  KadastrService(
    id: '4',
    titleSimple: 'Mulkning o‘ziga tegishliligi haqida maʼlumotnoma',
    titleOfficial: 'Fuqaroning nomida ko‘chmas mulk bor/yo‘qligi haqida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Fuqaroning butun O‘zbekiston hududida o‘z nomida turar joyi bor yoki yo‘qligini tasdiqlash (subsidiya, uy-joy navbati uchun kerak bo‘ladi).',
    duration: 'Avtomatik (1 kun ichida)',
    cost: 'BHMning 0.05 baravari',
    warningTip: 'Ko‘pincha davlat subsidiyasi yoki ipoteka olishda talab etiladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Pasport / ID karta maʼlumotlari',
        officialName: 'Shaxsiy JShSHIR',
        whereToGet: 'O‘zingizning shaxsingiz',
        explanation: 'Tizim JShSHIR orqali barcha bazani o‘zi tekshiradi.',
      ),
    ],
    illegalDemands: [
      'Turar joyi yo‘qligi haqida mahalladan tasdiqnoma so‘rash',
    ],
  ),
  KadastrService(
    id: '5',
    titleSimple: 'Uyni (obyektni) ikkiga yoki undan ko‘p qismga bo‘lish',
    titleOfficial: 'Ko‘chmas mulk obyektini bo‘lish yoki birlashtirish bo‘yicha davlat xizmati',
    category: 'Uy-joy',
    purpose: 'Bitta yer uchastkasi yoki uyni ikki mulkdor o‘rtasida mustaqil alohida obyektlarga ajratish.',
    duration: '10 dan 15 ish kunigacha',
    cost: 'Davlat boji stavkalari asosida',
    warningTip: 'Bo‘linayotgan yangi obyektlar alohida kirish yo‘liga va minimal yer meʼyorlariga mos bo‘lishi lozim.',
    docs: [
      RequiredDocument(
        simpleName: 'Mulkdorlarning o‘zaro notarial kelishuvi yoki sud qarori',
        officialName: 'Taqsimlash bitimi / Sud qarori',
        whereToGet: 'Notarius yoki sud orqali',
        explanation: 'Uy qaysi qismdan qanday bo‘linganini ko‘rsatuvchi hujjat.',
      ),
      RequiredDocument(
        simpleName: 'Asl kadastr hujjati',
        officialName: 'Obyekt kadastr yig‘majildi',
        whereToGet: 'Uy egasining qo‘lida bo‘ladi',
        explanation: 'Eski butun holatdagi kadastr.',
      ),
    ],
    illegalDemands: [
      'Kommunal xizmatlarning yangi hisob raqamlari ochilganini oldindan talab qilish',
    ],
  ),
  KadastrService(
    id: '6',
    titleSimple: 'Ipoteka va garov huquqini ro‘yxatdan o‘tkazish',
    titleOfficial: 'Ko‘chmas mulk ipotekasi va garov shartnomasini ro‘yxatga olish',
    category: 'Yer uchastkasi',
    purpose: 'Bankdan kredit olishda uyni garovga qo‘yish yoki kredit yopilgach garovni yechish.',
    duration: '1 ish kuni',
    cost: 'BHMning 50% miqdorida',
    warningTip: 'Kredit to‘liq yopilgach, bankdan darhol xatlovni yechish arizasini topshirtiring.',
    docs: [
      RequiredDocument(
        simpleName: 'Garov yoki ipoteka shartnomasi',
        officialName: 'Notarial tasdiqlangan ipoteka shartnomasi',
        whereToGet: 'Bank va notariusdan',
        explanation: 'Mulk kafolat sifatida olinganini tasdiqlovchi shartnoma.',
      ),
    ],
    illegalDemands: [
      'Bank vakilining Davlat xizmatlari markaziga shaxsan borishi',
    ],
  ),
  KadastrService(
    id: '7',
    titleSimple: 'Tadbirkorlik uchun yer uchastkasini auksiondan olish',
    titleOfficial: 'Yer uchastkalarini "E-auksion" orqali ijaraga yoki mulk qilib berish',
    category: 'Yer uchastkasi',
    purpose: 'Tadbirkorlik va biznes faoliyati uchun bo‘sh turgan yer maydonlarini auksion orqali shaffof xarid qilish.',
    duration: 'Auksion muddatiga binoan (reglament asosida)',
    cost: 'Auksiondagi yutuq bahosi bo‘yicha',
    warningTip: 'Hokimning to‘g‘ridan-to‘g‘ri yer ajratish vakolati yo‘q! Faqat E-auksion orqali olinadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Elektron raqamli imzo (ERI)',
        officialName: 'ERI kaliti',
        whereToGet: 'Davlat xizmatlari markazidan yoki E-imzo orqali',
        explanation: 'Auksionda qatnashish va bayonnomani tasdiqlash uchun kerak.',
      ),
    ],
    illegalDemands: [
      'Auksion yutug‘idan so‘ng hokim qarorini kutish yoki qo‘shimcha ruxsatnoma olish',
    ],
  ),
  KadastrService(
    id: '8',
    titleSimple: 'O‘zboshimchalik bilan egallangan yer va binolarni qonuniylashtirish',
    titleOfficial: 'O‘zboshimchalik bilan egallangan yer uchastkalari hamda ularda qurilgan binolarga bo‘lgan huquqlarni eʼtirof etish',
    category: 'Qonuniylashtirish',
    purpose: 'Yillar davomida hujjatsiz foydalanib kelingan uy-joylar va yer maydonlariga amaldagi amnistiya qonuni asosida huquqni rasmiylashtirish.',
    duration: 'Bosqichma-bosqich xatlov grafigi asosida',
    cost: 'Bir martalik belgilangan yig‘im stavkasi bo‘yicha',
    warningTip: 'Ushbu xizmat bo‘yicha hech qanday vositachilarga pul bermang! Hududlar kadastr organlari tomonidan reja asosida dron va xatlov orqali bosqichma-bosqich ko‘rib chiqiladi.',
    docs: [
      RequiredDocument(
        simpleName: 'Yer yoki binodan uzoq vaqt foydalanilganini bildiruvchi eski dalillar',
        officialName: 'Elektr, gaz to‘lov daftarlari, eski cheklar yoki soliq to‘lovlari',
        whereToGet: 'Shaxsiy arxiv / kommunal to‘lov tizimlaridan',
        explanation: 'Ushbu joyda ko‘p yillardan buyon yashab kelayotganingizni ko‘rsatuvchi to‘lovlar.',
      ),
    ],
    illegalDemands: [
      'Oldindan noqonuniy "tezlashtirish" to‘lovlarini talab qilish',
      'Noqonuniy komissiyalar tuzib pul yig‘ish',
    ],
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
  final List<String> _categories = ['Barchasi', 'Uy-joy', 'Yer uchastkasi', 'Maʼlumotnoma', 'Qonuniylashtirish'];

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedCategory == 'Barchasi'
        ? kadastrServices
        : kadastrServices.where((s) => s.category == _selectedCategory).toList();

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
              accountEmail: Text('Muallif: Muxriddin Elbegiyev'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.home_work, color: Color(0xFF0D47A1), size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF0D47A1)),
              title: const Text('Barcha kadastr xizmatlari'),
              subtitle: Text('${kadastrServices.length} ta asosiy yo‘nalish'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.phone_in_talk, color: Colors.green),
              title: const Text('Kadastr ishonch telefoni: 1197'),
              subtitle: const Text('Davlat Kadastr Palatasi call-markazi'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Davlat Kadastr Palatasi: 1197')),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text('Dastur muallifi bilan aloqa'),
              subtitle: const Text('+998 33 911 22 22'),
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
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF81C784)),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield, color: Color(0xFF2E7D32), size: 36),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Sodda yo‘riqnoma! Qo‘lingizdagi hujjatlar yetarliligini tekshiring va ortiqcha xarajatdan qutuling.',
                    style: TextStyle(color: Color(0xFF1B5E20), fontSize: 13, fontWeight: FontWeight.bold),
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
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cat, style: TextStyle(color: isSelected ? Colors.white : Colors.black87)),
                    selected: isSelected,
                    selectedColor: const Color(0xFF0D47A1),
                    onSelected: (val) => setState(() => _selectedCategory = cat),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                final item = filtered[i];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),
                    title: Text(item.titleSimple, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(item.titleOfficial, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(item.category, style: const TextStyle(fontSize: 11, color: Color(0xFF0D47A1), fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 8),
                            Text('Muddat: ${item.duration}', style: const TextStyle(fontSize: 11, color: Colors.blueGrey)),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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

// ---------------- DASTUR VA MUALLIF BILAN ALOQA EKRANI ----------------
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Dastur haqida va Aloqa', style: TextStyle(color: Colors.white, fontSize: 17)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: Color(0xFF0D47A1),
                    child: Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Muxriddin Elbegiyev',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Loyiha muallifi va ishlab chiquvchi',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const Divider(height: 30),

                  // TELEFON
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE8F5E9),
                      child: Icon(Icons.phone, color: Colors.green),
                    ),
                    title: const Text('Aloqa uchun telefon raqam', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    subtitle: const Text(
                      '+998 33 911 22 22',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),

                  // TELEGRAM
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

          const SizedBox(height: 16),

          // MAQSAD
          Card(
            elevation: 1.5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: const Padding(
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
                    'Ushbu mobil ilova aholining (ayniqsa, chekka hududlardagi fuqarolarning) kadastr sohasidagi huquqiy savodxonligini oshirish, firibgarlik va noqonuniy talablardan himoya qilish hamda amaldagi barcha davlat xizmatlaridan ortiqcha xarajatsiz, oson foydalanishlariga ko‘maklashish maqsadida yaratilgan.',
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
        title: Text(service.titleSimple, style: const TextStyle(color: Colors.white, fontSize: 16)),
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
                      ? 'Endi bemalol DXM (Yagona darcha)ga borishingiz yoki my.gov.uz orqali ariza yuborishingiz mumkin. Hech kim sizdan ortiqcha qog‘oz talab qila olmaydi.'
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
