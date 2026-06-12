import 'package:flutter/material.dart';

class Job {
  final String id;
  final String title;
  final String companyName;
  final String companyLogo;
  final String location;
  final String type; // Full-time, Remote, Part-time, Internship
  final String education; // SMA/SMK, D3, S1, S2
  final String salaryRange;
  final String postedTime;
  final String description;
  final List<String> requirements;
  final List<String> responsibilities;
  final String category;
  final String? whatsappNumber; // TopLoker "Chat to Apply" feature
  final bool isFeatured;
  bool isSaved;
  bool isApplied;

  Job({
    required this.id,
    required this.title,
    required this.companyName,
    required this.companyLogo,
    required this.location,
    required this.type,
    required this.education,
    required this.salaryRange,
    required this.postedTime,
    required this.description,
    required this.requirements,
    required this.responsibilities,
    required this.category,
    this.whatsappNumber,
    this.isFeatured = false,
    this.isSaved = false,
    this.isApplied = false,
  });
}

class CvTemplate {
  final String id;
  final String name;
  final String category;
  final String previewImage; // Visual character placeholder

  CvTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.previewImage,
  });
}

// Global list of mock jobs for TopLoker
final List<Job> mockJobs = [
  Job(
    id: '1',
    title: 'Operator Produksi (SMK Otomotif/Mesin)',
    companyName: 'PT Astra Honda Motor',
    companyLogo: 'AH',
    location: 'Cikarang, Bekasi',
    type: 'Full-time',
    education: 'SMA/SMK',
    salaryRange: 'Rp 5.200.000 - Rp 6.500.000',
    postedTime: '10 menit yang lalu',
    category: 'Manufaktur & Teknik',
    whatsappNumber: '+628123456789',
    isFeatured: true,
    description: 'Bergabunglah dengan PT Astra Honda Motor sebagai Operator Produksi untuk merakit sepeda motor kualitas terbaik di Indonesia. Posisi ini terbuka khusus bagi lulusan SMK sederajat dengan kedisiplinan dan ketahanan fisik yang baik.',
    requirements: [
      'Lulusan SMK jurusan Teknik Kendaraan Ringan, Teknik Mesin, atau Listrik.',
      'Usia maksimal 22 tahun.',
      'Tinggi badan minimal 165 cm (Pria) / 155 cm (Wanita) dengan fisik sehat.',
      'Bersedia bekerja dalam sistem shift.',
      'Memiliki ketelitian tinggi dan kemampuan kerja sama tim.'
    ],
    responsibilities: [
      'Mengoperasikan mesin perakitan otomotif sesuai instruksi kerja standar (SOP).',
      'Melakukan pemeriksaan kualitas awal (Quality Control) pada part yang dirakit.',
      'Menjaga kebersihan dan keselamatan di area kerja (5S/5R).',
      'Melaporkan kerusakan mesin atau kendala teknis kepada Group Leader.'
    ],
  ),
  Job(
    id: '2',
    title: 'Junior UI/UX Designer & Developer',
    companyName: 'Universitas STEKOM',
    companyLogo: 'US',
    location: 'Semarang, Jawa Tengah (Hybrid)',
    type: 'Full-time',
    education: 'D3/S1',
    salaryRange: 'Rp 4.500.000 - Rp 6.000.000',
    postedTime: '2 jam yang lalu',
    category: 'Design & IT',
    whatsappNumber: '+628987654321',
    isFeatured: true,
    description: 'Universitas STEKOM mencari lulusan baru berbakat untuk mengembangkan platform internal kampus dan berkontribusi langsung dalam optimalisasi aplikasi Bursa Kerja Khusus (BKK) elektronik.',
    requirements: [
      'Lulusan D3/S1 Sistem Informasi, Teknik Informatika, atau Desain Grafis.',
      'Memiliki pemahaman dasar tentang Figma dan alur UI/UX.',
      'Mengetahui dasar-dasar Flutter/HTML/CSS adalah nilai tambah.',
      'Siap belajar secara dinamis dengan bimbingan dosen senior & praktisi.',
      'Portofolio desain UI/UX sederhana wajib disertakan.'
    ],
    responsibilities: [
      'Merancang wireframe dan prototype interaktif untuk kebutuhan web kampus.',
      'Melakukan riset kepuasan pengguna (siswa SMK/mahasiswa) pada portal BKK.',
      'Bekerjasama dengan developer untuk mengimplementasikan elemen antarmuka.'
    ],
  ),
  Job(
    id: '3',
    title: 'Technical Support Staff',
    companyName: 'PT Telkom Indonesia (Persero)',
    companyLogo: 'TL',
    location: 'Jakarta Pusat',
    type: 'Full-time',
    education: 'D3/S1',
    salaryRange: 'Rp 7.000.000 - Rp 10.000.000',
    postedTime: '1 hari yang lalu',
    category: 'Design & IT',
    whatsappNumber: '+628111222333',
    isFeatured: true,
    description: 'Telkom Indonesia membuka kesempatan bagi profesional muda untuk menangani pemeliharaan jaringan telekomunikasi dan memastikan stabilitas layanan ICT bagi pelanggan korporat.',
    requirements: [
      'Pendidikan D3/S1 Teknik Telekomunikasi, Teknik Komputer, atau Elektro.',
      'Memahami dasar-dasar CCNA jaringan (TCP/IP, Routing, Switching).',
      'Memiliki kemampuan pemecahan masalah (troubleshooting) hardware & software.',
      'Bersedia dinas ke lapangan jika terjadi gangguan kritis.',
      'Mampu berkomunikasi dengan baik dan bekerja secara mandiri.'
    ],
    responsibilities: [
      'Melakukan monitoring harian stabilitas konektivitas jaringan fiber optik.',
      'Menangani tiket keluhan teknis dari pelanggan korporat (B2B) sesuai SLA.',
      'Melakukan instalasi router, switch, dan perangkat pendukung jaringan lainnya.',
      'Membuat laporan pemeliharaan sistem mingguan.'
    ],
  ),
  Job(
    id: '4',
    title: 'Staf Administrasi & Data Entry',
    companyName: 'PT Indofood Sukses Makmur',
    companyLogo: 'IF',
    location: 'Surabaya, Jawa Timur',
    type: 'Full-time',
    education: 'SMA/SMK',
    salaryRange: 'Rp 4.800.000 - Rp 5.500.000',
    postedTime: '2 hari yang lalu',
    category: 'Administrasi',
    whatsappNumber: '+628776655443',
    isFeatured: false,
    description: 'Kami mencari Staf Administrasi yang rapi dan terorganisir untuk mengelola pendokumentasian arsip logistik serta pencatatan data distribusi produk Indofood.',
    requirements: [
      'Minimal lulusan SMA/SMK (diutamakan jurusan Administrasi Perkantoran/Akuntansi).',
      'Mahir mengoperasikan Microsoft Excel (VLOOKUP, HLOOKUP, Pivot Table).',
      'Memiliki tingkat ketelitian tinggi dalam memasukkan data angka.',
      'Jujur, disiplin, dan tepat waktu dalam menyelesaikan laporan harian.'
    ],
    responsibilities: [
      'Memasukkan data pengiriman barang harian ke database SAP.',
      'Merapikan dokumen faktur, invoice, dan surat jalan ekspedisi.',
      'Membuat rekapitulasi inventaris kantor setiap akhir bulan.',
      'Menyusun arsip surat keluar dan surat masuk divisi logistik.'
    ],
  ),
  Job(
    id: '5',
    title: 'Pemasaran & Sales Promotion Representative',
    companyName: 'PT Indomarco Prismatama (Indomaret)',
    companyLogo: 'ID',
    location: 'Bandung, Jawa Barat',
    type: 'Full-time',
    education: 'SMA/SMK',
    salaryRange: 'Rp 4.000.000 - Rp 4.700.000',
    postedTime: 'Baru saja',
    category: 'Pemasaran & Media',
    whatsappNumber: '+628554433221',
    isFeatured: false,
    description: 'Indomaret membuka lowongan bagi rekan-rekan lulusan SMA/SMK untuk menjadi perwakilan penjualan kami, membantu promosi produk baru, serta melayani transaksi di kasir dengan pelayanan prima.',
    requirements: [
      'Pendidikan minimal SMA/SMK/Sederajat.',
      'Tinggi badan minimal Pria 160 cm / Wanita 155 cm.',
      'Berpenampilan menarik, ramah, dan komunikatif.',
      'Siap bekerja fleksibel di akhir pekan (Shift).',
      'Belum menikah.'
    ],
    responsibilities: [
      'Menyapa dan melayani pelanggan dengan senyum ramah di toko.',
      'Mengoperasikan mesin kasir dan menghitung uang transaksi harian secara tepat.',
      'Merapikan display barang belanjaan sesuai dengan POS planogram toko.',
      'Menawarkan program promo bulanan aktif kepada pelanggan.'
    ],
  ),
  Job(
    id: '6',
    title: 'Customer Service & BK Support',
    companyName: 'BKK Sekolah Mitra TopLoker',
    companyLogo: 'TL',
    location: 'Semarang, Jawa Tengah',
    type: 'Full-time',
    education: 'D3/S1',
    salaryRange: 'Rp 3.500.000 - Rp 4.200.000',
    postedTime: '3 hari yang lalu',
    category: 'Layanan Pelanggan',
    whatsappNumber: '+628990011223',
    isFeatured: false,
    description: 'Membantu koordinasi bimbingan konseling karier siswa di SMK Mitra TopLoker, memandu pendaftaran akun BKK Elektronik, serta menangani administrasi penyaluran kerja.',
    requirements: [
      'Pendidikan D3/S1 Psikologi, Bimbingan Konseling, atau Ilmu Komunikasi.',
      'Menyukai dunia pendidikan dan interaksi dengan remaja/siswa.',
      'Lancar berkomunikasi secara persuasif dan memiliki empati tinggi.',
      'Terbiasa mengelola grup WhatsApp dan media informasi sekolah.',
      'Fresh graduates dipersilakan melamar.'
    ],
    responsibilities: [
      'Menjawab pertanyaan siswa seputar pembuatan CV dan pendaftaran lowongan di TopLoker.',
      'Mengoordinasikan jadwal psikotes/wawancara siswa dengan perusahaan mitra.',
      'Membantu guru BK dalam memantau statistik keterserapan kerja lulusan sekolah.'
    ],
  ),
];

// Helper categories list for TopLoker
final List<Map<String, dynamic>> jobCategories = [
  {'name': 'Semua', 'icon': Icons.all_inclusive},
  {'name': 'Design & IT', 'icon': Icons.computer},
  {'name': 'Manufaktur & Teknik', 'icon': Icons.build},
  {'name': 'Administrasi', 'icon': Icons.description},
  {'name': 'Pemasaran & Media', 'icon': Icons.campaign},
  {'name': 'Layanan Pelanggan', 'icon': Icons.headset_mic},
];

// Mock CV Templates for TopLoker
final List<CvTemplate> mockCvTemplates = [
  CvTemplate(id: 'c1', name: 'Desain Minimalis Modern', category: 'Fresh Graduate', previewImage: 'CV-1'),
  CvTemplate(id: 'c2', name: 'Akademik Formal (STEKOM)', category: 'Profesional', previewImage: 'CV-2'),
  CvTemplate(id: 'c3', name: 'Kreatif Bergaya Infografis', category: 'Kreatif/Design', previewImage: 'CV-3'),
  CvTemplate(id: 'c4', name: 'Teknis ATS Friendly', category: 'IT & Engineering', previewImage: 'CV-4'),
];
