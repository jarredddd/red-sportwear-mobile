Tugas 7

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
   Widget tree adalah susunan widget yang membentuk interface untuk user. Hubungan parent-child terjadi ketika satu widget, bisa disebut parent punya satu/lebih widget di dalamnya, widget di dalam parent bisa disebut child. Parent mengatur tampilan dan perilaku child-nya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
   Widget yang saya gunakan adalah :
- MyHomePage : mengatur tata letak halaman aplikasi
- InfoCard : menampilkan informasi nama, kelas, dan NPM dalam bentuk kartu
- ItemCard : menampilkan item menu yang bisa diklik, yaitu "Add Products", "My Products", dan "Create Product"
- Scaffold : menyediakan kerangka dasar halaman aplikasi
- Column : mengatur widget secara vertikal
- Row : mengatur widget secara horizontal
- GridView : mengatur tampilan item dalam bentuk grid
- Container : membungkus widget lain dan mengatur tata letak dan styling]
- Padding : memberikan jarak di sekitar widget
- SizedBox : memberikan ruang kosong di sekitar widget
- Center : memposisikan widget di area tengah
- AppBar : menampilkan title aplikasi di bagian atas halaman
- Text : menampilkan string teks
- Icon : menampilkan icon grafis
- Material : menyediakan elemen desain material
- InkWell : membuat widget menampilkan efek saat di klik
- MediaQuery : mendapatkan informasi ukuran layar perangkat yang membuka halaman aplikasi
- ScaffoldMessenger : menampilkan pesan sementara (snackbar)
- Snackbar : menampilkan pesan sementara di bagian bawah halaman

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
   Fungsi dari widget MaterialApp adalah untuk mengatur tema buat keseluruhan aplikasi kayak global.css di Django, contohnya warna, dan font Widget tersebut juga mengatur rute aplikasi kayak urls.py. MaterialApp dijadiin root karena agar design aplikasi konsisten secara keseluruhan.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
   StatelessWidget itu widget yang gak bisa diubah setelah dibuat (statis), contohnya teks atau icon. StatefulWidget itu widget yang bisa berubah (dinamis), contohnya form input/tombol yang bisa di klik. Saya milih Stateless kalo mau buat footer/header, dan stateful kalo mau buat form input/tombol

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
   BuildContext adalah lokasi sebuah widget di widget tree, penting karena membuat suatu widget bisa berinteraksi dengan widget lain yang ada di widget tree. Metode build menerima BuildContext sebagai argumen secara otomatis.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
   Hot reload memasukkan perubahan kode di aplikasi yang sedang running tanpa merestart aplikasi dan menghapus state. Hot restart merestart aplikasi dari awal yang menyebabkan state aplikasi hilang dan semua variabel balik ke kondisi awal.

Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
   Navigator.push() digunakan untuk menambahkan halaman baru di atas halaman saat ini, memungkinkan pengguna untuk kembali ke halaman sebelumnya. Digunakan kalo pengguna perlu navigasi ke halaman baru tanpa kehilangan akses ke halaman sebelumnya, contohnya saat melihat detail produk.
   Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, sehingga pengguna tidak dapat kembali ke halaman sebelumnya. Digunakan kalo pengguna abis selesaikan suatu proses dan gak perlu kembali, contohnya setelah menyelesaikan pembayaran atau mengonfirmasi pesanan.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
   Saya menggunakan Scaffold sebagai skeleton halaman aplikasi, yang menyediakan struktur umum seperti AppBar di bagian atas dan Drawer di sisi kiri. AppBar digunakan untuk menampilkan judul halaman dan navigasi utama, sementara Drawer menyediakan menu navigasi tambahan yang konsisten di seluruh aplikasi. 

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
   Kelebihan pakai Padding adalah memberikan jarak yang konsisten di sekitar elemen form, sehingga tampilan lebih rapi dan mudah dibaca. SingleChildScrollView memungkinkan konten form yang panjang untuk di-scroll, sehingga pengguna dapat mengakses semua elemen tanpa terpotong. ListView berfungsi buat nampilin daftar elemen form yang disusun secara vertikal, seperti daftar produk atau kategori.
   Contoh penggunaannya di aplikasi saya adalah dengan menggunakan ListView untuk drawer, sehingga tombol 'Home' dan 'Add Product' bisa tersusun secara vertikal. Saya juga menggunakan Padding di sekitar setiap elemen form untuk memberikan space kosong agar tampilan tidak terlalu padat. 

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
   Saya menggunakan ColorScheme di MaterialApp untuk mengatur warna primary, secondary, teks dan ikon. ColorScheme tersebut terletak di file main.dart, di dalam ThemeData. 
