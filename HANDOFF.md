# PROJECT HANDOFF: TopLoker Job Portal App - Flutter

## Konteks Proyek
Anda adalah Flutter Expert. Ini adalah proyek aplikasi pencarian kerja bernama **"TopLoker"** yang dibangun menggunakan **Flutter**.
Aplikasi ini didesain dengan tema **Modern Minimalis** yang premium dan memanfaatkan elemen **Glassmorphism**. Aplikasi saat ini sudah *fully functional* di sisi UI, dilengkapi dengan animasi yang *smooth*, dan kodenya sangat teroptimasi (`flutter analyze` menunjukkan **0 issues/errors**).

---

## 🎨 Desain & Branding
- **Konsep:** Glassmorphism yang sangat ringan dan responsif.
- **Color Palette Utama (`lib/theme/colors.dart`):**
  - Primary: Navy (`#0F1B5B`)
  - Secondary: Royal Blue (`#1E3A8A`)
  - Accent / Orange Primary: `#F57C00` (Untuk elemen interaktif/sorotan)
  - Orange Hover: `#FB8C00`
  - Background: Light Gray (`#F8FAFC`)

---

## 🏗️ Arsitektur & Status Terkini
1. **Model Data (`lib/models/job.dart`):** Terdapat data *mock* (dummy) untuk pekerjaan yang lengkap dengan fitur *WhatsApp Chat-to-apply*, badge BKK STEKOM, dan List Katalog Template CV Gratis.
2. **State & Navigasi (`lib/screens/main_screen.dart`):** Menggunakan *floating glassmorphism bottom navigation bar*. Berpindah halaman (Beranda, Tersimpan, Profil) menggunakan `AnimatedSwitcher` agar transisinya menggunakan efek *fade* yang halus.
3. **Widget Animasi Kustom (`lib/widgets/`):**
   - `glass_container.dart`: Container utama dengan `BackdropFilter` efek kaca.
   - `animated_list_item.dart`: Wrapper widget untuk animasi *staggered entrance* (fade + slide-up) saat memuat daftar.
   - `scale_tap.dart`: Wrapper gesture untuk memberikan *micro-animation* mengecil (scale 0.97) saat item ditekan.

---

## 🔄 Pembaruan Terakhir (Sesi Ini)
Kami telah menyelesaikan beberapa konfigurasi penting untuk distribusi aplikasi:
1. **Pembersihan Device Preview:**
   - Dependency `device_preview` telah dihapus sepenuhnya dari `pubspec.yaml` dan `lib/main.dart` agar aplikasi saat diinstal langsung menampilkan halaman utama aplikasi utama saja.
2. **Dukungan Refresh Rate Tinggi (144 FPS):**
   - Menambahkan dependency `flutter_displaymode: ^0.7.0` untuk meminta sistem Android menjalankan aplikasi dengan refresh rate tertinggi yang didukung oleh layar HP (90Hz / 120Hz / 144Hz) secara dinamis.
3. **Konfigurasi Build Android (NDK & Gradle):**
   - Versi NDK didefinisikan secara statis ke `"30.0.14904198"` di `android/app/build.gradle.kts` dikarenakan NDK default (v28) yang diunduh otomatis mengalami kerusakan file (corrupt zip).
4. **Hasil Build Sukses:**
   - **Release APK** berhasil dibuat tanpa kendala di path: `build/app/outputs/flutter-apk/app-release.apk` (Ukuran file: 46.1 MB).
   - Analisis kode selesai dengan status **no issues found**.

---

## ⚠️ Instruksi Ketat untuk Anda (Agent Berikutnya)
1. **Pertahankan Gaya Desain:** Jika Anda diminta membuat halaman atau komponen baru, WAJIB menggunakan palet warna dari `AppColors` dan bungkus *card/button* menggunakan widget `ScaleTap` dan `GlassContainer` yang sudah ada agar konsisten.
2. **Pertahankan Performa Tinggi:** Kodingan saat ini sangat optimal. Pastikan Anda SELALU menggunakan `const` constructor. JANGAN gunakan API yang sudah *deprecated* (contoh: gunakan `.withValues(alpha: ...)` alih-alih `.withOpacity(...)` untuk *Color*).
3. **Integrasi Lancar:** Silakan telaah `lib/screens/home_screen.dart` dan `lib/screens/job_detail_screen.dart` sejenak jika Anda perlu referensi implementasi animasi `Hero` dan transisi halamannya.

**Silakan sapa pengguna, konfirmasi bahwa Anda telah membaca status proyek yang diperbarui di atas, dan tanyakan fitur spesifik apa yang ingin dikerjakan atau diubah selanjutnya!**
