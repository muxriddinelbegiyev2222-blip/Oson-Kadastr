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

final List<KadastrService> kadastrServices = [
  KadastrService(
    id: '1',
    titleSimple: 'Uyga yangi kadastr daftarchasi olish',
    titleOfficial: 'Ko‘chmas mulk obyektiga kadastr pasportini shakllantirish',
    category: 'Uy-joy',
    purpose: 'Uyingizni rasman o‘lchab, sizga mulkdorlik elektron guvohnomasi va chizmasini berish uchun kerak.',
    duration: '5 dan 10 ish kunigacha',
    cost: 'Maydon hajmiga qarab davlat stavkasi bo‘yicha to‘lanadi.',
    warningTip: 'Hech qachon ko‘chada yurgan "o‘rtakash"ga pul bermang! To‘lov faqat davlat SMS-kvitansiyasi orqali to‘lanadi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uy sizniki ekanini bildiruvchi asosiy qog‘oz',
        officialName: 'Huquq belgilovchi hujjat',
        whereToGet: 'Tuman davlat arxividan, tuman hokimligidan yoki notariusdan olinadi.',
        explanation: 'Hokim qarori, notarial shartnoma, meros hujjati yoki order.',
      ),
      RequiredDocument(
        simpleName: 'O‘zingizning pasportingiz yoki ID-kartangiz',
        officialName: 'Shaxsni tasdiqlovchi hujjat (JShSHIR)',
        whereToGet: 'Yoningizda bo‘lishi kifoya.',
        explanation: '14 xonali JShSHIR raqamingiz tizimga kiritiladi.',
      ),
    ],
    illegalDemands: [
      'Mahalla qo‘mitasidan maʼlumotnoma (spravka)',
      'Qo‘shnilarning imzo yig‘ilgan xati',
      'Kommunal to‘lovlardan qarz yo‘qligi haqida qog‘oz',
    ],
  ),
  KadastrService(
    id: '2',
    titleSimple: 'Uyni rasman o‘z nomimga muhrlash',
    titleOfficial: 'Ko‘chmas mulkka bo‘lgan huquqni davlat ro‘yxatidan o‘tkazish',
    category: 'Uy-joy',
    purpose: 'Uyni sotib olgandan yoki merosdan so‘ng bazada yangi rasmiy xo‘jayin kimligini ko‘rsatish.',
    duration: '2 ish kuni',
    cost: 'BHMning 1 dan 1.25 baravarigacha',
    warningTip: 'Agar uyni notariusda qilib, ro‘yxatdan o‘tkazmasangiz, qonuniy to‘liq xo‘jayin bo‘lmaysiz.',
    docs: [
      RequiredDocument(
        simpleName: 'Notarius tasdiqlagan shartnoma yoki meros hujjati',
        officialName: 'Oldi-sotdi, hadya yoki meros hujjati',
        whereToGet: 'Notarial idoradan',
        explanation: 'QR-kodli notarius tasdiqlagan rasmiy qog‘oz.',
      ),
      RequiredDocument(
        simpleName: 'Mavjud eski kadastr hujjati',
        officialName: 'Kadastr yig‘majildi',
        whereToGet: 'Uyning oldingi egasidan olinadi',
        explanation: 'Uyning chizmasi va xona o‘lchamlari.',
      ),
    ],
    illegalDemands: [
      'Tuman arxividan qo‘shimcha tasdiqnoma so‘rash',
      'Barcha oila aʼzolarining shaxsan borishi',
    ],
  ),
  KadastrService(
    id: '3',
    titleSimple: 'Uyda taqiq (Zapret) bor-yo‘qligini bilish',
    titleOfficial: 'Ko‘chmas mulk bo‘yicha taqiq yo‘qligi to‘g‘risida maʼlumotnoma',
    category: 'Maʼlumotnoma',
    purpose: 'Oldi-sotdi qilishdan oldin uyga sud, bank yoki MIB taqiq qo‘ymaganini tekshirish.',
    duration: '1 ish kuni (ko‘pincha bir necha daqiqa)',
    cost: 'BHMning 10-20% atrofida',
    warningTip: 'Taqiq chiqqan uyni notarius rasmiylashtirmaydi.',
    docs: [
      RequiredDocument(
        simpleName: 'Uyning kadastr raqami',
        officialName: 'Ko‘chmas mulk kadastr raqami',
        whereToGet: 'Kadastr qog‘ozining birinchi betidan',
        explanation: 'Masalan: 10:01:02:... ko‘rinishidagi unikal raqam.',
      ),
    ],
    illegalDemands: [
      'MIB idorasiga borib muhr bosdirib kelish talabi',
    ],
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Barchasi';
  final List<String> _categories = ['Barchasi', 'Uy-joy', 'Maʼlumotnoma'];

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedCategory == 'Barchasi'
        ? kadastrServices
        : kadastrServices.where((s) => s.category == _selectedCategory).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text('Oson Kadastr', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
                    title: Text(item.titleSimple, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(item.titleOfficial, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
                        const SizedBox(height: 6),
                        Text('Muddat: ${item.duration}', style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bu xizmat nima uchun kerak?', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                const SizedBox(height: 6),
                Text(service.purpose),
                const Divider(height: 20),
                Text('Bitish muddati: ${service.duration}', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('To‘lov: ${service.cost}'),
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
                      ? 'Endi bemalol DXM (Yagona darcha)ga borishingiz mumkin. Hech kim sizdan ortiqcha qog‘oz talab qila olmaydi.'
                      : 'Belgilanmagan hujjatlarni yuqorida ko‘rsatilgan joydan olib, keyin boring.',
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
