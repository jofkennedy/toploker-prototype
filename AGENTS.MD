    **[PROJECT HANDOFF: TopLoker Job Portal App - Flutter]**                                                                          
                                                                                                                                      
    **Konteks Proyek:**                                                                                                               
    Anda adalah Flutter Expert. Ini adalah proyek aplikasi pencarian kerja bernama "TopLoker" yang dibangun menggunakan **Flutter**.  
  Aplikasi ini didesain dengan tema **Modern Minimalis** yang premium dan memanfaatkan elemen **Glassmorphism**. Aplikasi saat ini    
  sudah *fully functional* di sisi UI, dilengkapi dengan animasi yang *smooth*, dan kodenya sangat teroptimasi (tidak ada             
  *warning/error* di `flutter analyze`).                                                                                              
                                                                                                                                      
    **Desain & Branding:**                                                                                                            
    - **Konsep:** Glassmorphism yang sangat ringan dan responsif.                                                                     
    - **Color Palette Utama (`lib/theme/colors.dart`):**                                                                              
      - Primary: Navy (`#0F1B5B`)                                                                                                     
      - Secondary: Royal Blue (`#1E3A8A`)                                                                                             
      - Accent / Orange Primary: `#F57C00` (Untuk elemen interaktif/sorotan)                                                          
      - Orange Hover: `#FB8C00`                                                                                                       
      - Background: Light Gray (`#F8FAFC`)                                                                                            
                                                                                                                                      
    **Arsitektur & Status Terkini:**                                                                                                  
    1. **Model Data (`lib/models/job.dart`):** Terdapat data *mock* (dummy) untuk pekerjaan yang sudah lengkap dengan fitur *WhatsApp 
  Chat-to-apply*, badge BKK STEKOM, dan List Katalog Template CV Gratis.                                                              
    2. **State & Navigasi (`lib/screens/main_screen.dart`):** Aplikasi menggunakan *floating glassmorphism bottom navigation bar*.    
  Berpindah halaman (Beranda, Tersimpan, Profil) menggunakan `AnimatedSwitcher` agar transisinya menggunakan efek *fade* yang halus.  
    3. **Widget Animasi Kustom (`lib/widgets/`):**                                                                                    
       - `glass_container.dart`: Container utama dengan `BackdropFilter` efek kaca.                                                   
       - `animated_list_item.dart`: Wrapper widget untuk animasi *staggered entrance* (fade + slide-up) saat memuat daftar.           
       - `scale_tap.dart`: Wrapper gesture untuk memberikan *micro-animation* mengecil (scale 0.97) saat item ditekan.                
                                                                                                                                      
    **Pembaruan Terakhir (Sesi Ini):**
    1. **Device Preview Dihapus:** Dependency `device_preview` telah dihapus sepenuhnya dari `pubspec.yaml` dan `lib/main.dart`. Aplikasi saat ini langsung memuat aplikasi utama secara penuh.
    2. **144 FPS Support:** Ditambahkan package `flutter_displaymode: ^0.7.0` untuk mengaktifkan mode high refresh rate (90Hz/120Hz/144Hz) secara dinamis pada perangkat Android yang mendukung.
    3. **NDK Fix:** Dikonfigurasi menggunakan NDK versi `"30.0.14904198"` secara statis pada gradle untuk menghindari error file corrupt pada NDK default.
    4. **Sistem Login Premium & Animasi Scroll:** Ditambahkan `lib/screens/login_screen.dart` dengan UI Glassmorphic, `BouncingScrollPhysics` di halaman login & profil, serta animasi staggered entrance `AnimatedListItem` saat memuat login.
    5. **Release APK Berhasil:** Sukses build di `build/app/outputs/flutter-apk/app-release.apk` (46.1 MB).
                                                                                                                                      
    **Instruksi Ketat untuk Anda (Agent Berikutnya):**                                                                                
    1. **Pertahankan Gaya Desain:** Jika Anda diminta membuat halaman atau komponen baru, WAJIB menggunakan palet warna dari          
  `AppColors` dan bungkus *card/button* menggunakan widget `ScaleTap` dan `GlassContainer` yang sudah ada agar konsisten.             
    2. **Pertahankan Performa Tinggi:** Kodingan saat ini sangat optimal. Pastikan Anda SELALU menggunakan `const` constructor. JANGAN
  gunakan API yang sudah *deprecated* (contoh: gunakan `.withValues(alpha: ...)` alih-alih `.withOpacity(...)` untuk *Color*).        
    3. **Integrasi Lancar:** Silakan telaah `lib/screens/home_screen.dart` dan `lib/screens/job_detail_screen.dart` sejenak jika Anda 
  perlu referensi implementasi animasi `Hero` dan transisi halamannya.                                                                
                                                                                                                                      
    **Silakan sapa pengguna, konfirmasi bahwa Anda telah membaca status proyek yang diperbarui di atas, dan tanyakan fitur spesifik apa yang ingin dikerjakan atau diubah selanjutnya!** 