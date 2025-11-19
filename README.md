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

Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    Karena model Dart memberikan struktur yang jelas untuk data JSON, memudahkan validasi tipe data, memastikan null-safety, dan meningkatkan maintainability kode. Misal price harus bertipe data namun jika kita gunakan Map tadi maka input di variabel price itu string

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
    Package http digunakan untuk melakukan permintaan HTTP (GET, POST, PUT, dan DELETE), sedangkan CookieRequest adalah ekstensi dari http yang berguna untuk mengelola cookie secara otomatis. Perbedaan utamanya adalah CookieRequest memudahkan pengelolaan sesi autentikasi dengan menyimpan dan mengirim cookie secara otomatis dalam setiap request, sementara http perlu penanganan cookie secara manual.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
   Karena CookieRequest menyimpan informasi sesi autentikasi (cookie) yang diperlukan untuk mengakses endpoint yang dilindungi di backend Django. Instance CookieRequest dibagikan ke semua komponen di Flutter untuk memastikan tiap HTTP request yang dibuat oleh Flutter dapat menyertakan cookie yang valid, sehingga pengguna tetap terautentikasi saat berinteraksi dengan backend di Django.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
- Karena alamat 10.2.0.0 adalah IP yang disediain oleh Android Emulator buat akses localhost. Alamat tersebut perlu dimasukan ke ALLOWED_HOST karena Django hanya melayani request yang alamatnya cocok dengan alamat yang ada di ALLOWED_HOST. Kalo salah, dapet error 400 Bad Request
- CORS perlu diaktifkan karena saat Flutter mengakses Django API, Django akan memblokir. Fungsi CORS adalah untuk mencegah Django memblokir Flutter. Kalo salah, Django hasilkan error "CORS policy: No 'Access-Control-Allow-Origin'" header.
- SESSION_COOKIE_SAMESITE = "None" dan CSRF_COOKIE_SAMESITE = "None" berfungsi untuk mengizinkan cookie dan CSRF token dikirim dari Flutter ke Django. Kalo salah, CSRF token tidak dikirim dan user tidak akan dianggap sudah login.
- Menambahkan izin akses internet di Android itu wajib karena Android menolak aplikasi mengakses internet kecuali diizinkan. Jika tidak ditambahkan, aplikasi gabisa lakukan HTTP request sama sekali

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    User masukan input data di form, lalu data tersebut diambil oleh controller di Flutter. Setelah itu, data dikirim ke backend Django melalui HTTP request (POST/GET) menggunakan CookieRequest. Django menerima data, memprosesnya (misal nyimpen ke database), dan mengirimkan response kembali ke Flutter. Flutter menerima response tersebut dan menampilkan data yang diterima pada UI.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    User memasukan data akun di form login/register di Flutter. Data tersebut diambil oleh controller dan dikirim ke Django melalui HTTP request (POST) menggunakan CookieRequest. Django memproses data, memvalidasi kredensial. Kalo valid, membuat sesi autentikasi dengan mengirimkan cookie sesi kembali ke Flutter. Cookie tersebut disimpan oleh CookieRequest untuk digunakan pada request berikutnya. Setelah login berhasil, Flutter menampilkan menu yang sesuai dengan status autentikasi user. Saat logout, Flutter mengirimkan request ke Django untuk menghapus sesi, dan CookieRequest menghapus cookie sesi yang tersimpan.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    - Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik. -> Saya lakukan dengan menjalankan server Django di localhost dan menguji semua endpoint API secara manual.
   
    - Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter. -> Saya lakukan dengan membuat form registrasi di Flutter, lalu menghubungkannya dengan endpoint registrasi di Django menggunakan CookieRequest.
   
    - Membuat halaman login pada proyek tugas Flutter. -> Saya lakukan dengan membuat form login di Flutter, lalu menghubungkannya dengan endpoint login di Django menggunakan CookieRequest.
   
    - Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter. -> Saya lakukan dengan memastikan CookieRequest menyimpan cookie sesi setelah login dan menggunakannya untuk request berikutnya.
   
    - Membuat model kustom sesuai dengan proyek aplikasi Django. -> Saya lakukan dengan mengakses http://localhost:8000/json dan membuat model Dart dengan memasukkan isi dari link tersebut ke website quicktype.io. Saya menyalin kode yang dihasilkan di quicktype ke dalam file yang bernama **product_entry.dart**.
   
    - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy -> Saya lakukan dengan membuat halaman di Flutter yang mengambil data dari endpoint JSON di Django menggunakan CookieRequest, lalu menampilkan data tersebut dalam bentuk ListView.
   
    - Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. -> Saya lakukan dengan menambahkan navigasi dari halaman **product_entry_list.dart** ke halaman **product_detail.dart** saat card dari product diklik, di mana halaman detail menerima objek ProductEntry dan menampilkan semua atribut dari objek tersebut. Saya menggunakan Scaffold di halaman detail untuk menampilkan AppBar, Django secara otomatis menambahkan tombol kembali karena saya menggunakan Navigator.push() untuk navigasi ke halaman detail.
   
    - Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login. -> Saya lakukan dengan menambahkan parameter user pada endpoint JSON di Django **[user=request.user]**, lalu memodifikasi query di Django untuk hanya mengembalikan item yang terasosiasi dengan user yang sedang login **[qs = Product.objects.filter(user=request.user).select_related("user")]**. Di Flutter, saya memastikan CookieRequest menyediakan cookie session saat melakukan request ke endpoint JSON.\
   

    
