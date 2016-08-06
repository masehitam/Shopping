-- membuat database untuk ecommmerce
IF db_id('eswup') IS NULL 
	CREATE DATABASE db_shopping;
GO

-- gunakan database yang baru saja dibuat
use eswup;

-- membuat tabel untuk produk
/*menyimpan informasi tentang produk termasuk nama produk, berat, harga, deskripsi, dsb.*/
CREATE TABLE t_procuts
(
	-- menyimpan kode unik produk
	item_code VARCHAR(20) NOT NULL,
	-- menyimpan nama produk
	item_name VARCHAR(150) NOT NULL,
	-- menyimpan merk prduk
	brand_name VARCHAR(50) NOT NULL,
	-- menyimpan nomor model produk
	model_number VARCHAR(30) NOT NULL,
	-- menyimpan berat dari produk
	weight VARCHAR(20),
	-- menyimpan dimensi dari produk
	dimension VARCHAR(50),
	-- menyimpan deskripsi barang
	description TEXT,
	-- menyimpan kategori produk
	category VARCHAR(50),
	-- menyimpan kunitas barang
	quantity SMALLINT,
	-- menyimpan harga barang
	price DECIMAL(7,2),
	-- menyimpan nama gambar barang
	imagename VARCHAR(50)
);

-- buat tabel untuk fitur porduk
/*Menyimpan fitur - fitur dari produk - produk*/
CREATE TABLE t_productfeatures
(
	-- menyimpan kode unik produk
	item_code VARCHAR(20) NOT NULL,
	-- menyimpan fitur 1 produk
	feature1 VARCHAR(255),
	-- menyimpan fitur 2 produk
	feature2 VARCHAR(255),
	-- menyimpan fitur 3 produk
	feature3 VARCHAR(255),
	-- menyimpan fitur 4 produk
	feature4 VARCHAR(255),
	-- menyimpan fitur 5 produk
	feature5 VARCHAR(255),
	-- menyimpan fitur 6 produk
	feature6 VARCHAR(255)
);

-- buat tabel keranjang
/*menyimpan informasi produk yang ditambahkan kedalam kerangjang*/
CREATE TABLE t_cart
(
	-- menyimpan session ID dari pelanggan
	cart_sess CHAR(50) NOT NULL,
	-- menyimpan kode unik dari produk yang dipilih pelanggan dalam keranjang
	cart_itemcode VARCHAR(20) NOT NULL,
	-- menyimpan kuantitas dari produk yang dipilih dalam kerangjang
	cart_quantity SMALLINT NOT NULL,
	-- menyimpan nama produk yang dipilih dalam keranjang
	cart_item_name VARCHAR(100),
	-- menyimpan harga produk yang dipilih dalam keranjang
	cart_price DECIMAL(7,2)
);

-- buat tabel pelanggan
/*menyimpan informasi pelanggan yang terdaftar*/
CREATE TABLE t_customers
(
	-- menyimpan alamat email pelanggan terdaftar. alamat email unik untuk setiap pelanggan
	email_address VARCHAR(50) NOT NULL,
	-- menyimpan kata sandi dari pelanggan terdaftar
	password VARCHAR(50) NOT NULL,
	-- menyimpan nama lengkap pelanggan terdaftar
	complete_name VARCHAR(50),
	-- diperkirakan alamat pelanggan yang besar, field ini menyimpan baris alamat pertama dari pelanggan terdaftar
	address_line1 VARCHAR(255),
	-- menyimpan baris alamat kedua pelanggan terdaftar
	address_line2 VARCHAR(255),
	-- menyimpan nama kota dimana pelanggan berada
	city VARCHAR(50),
	-- menyimpan nama provinsi dimana pelanggan berada
	state VARCHAR(50),
	-- menyimpan kode POS kota dimana pelanggan berada
	zipcode VARCHAR(10),
	-- menyimpan nama negara dari pelanggan
	country VARCHAR(50),
	-- menyimpan nomor handphone dari pelanggan terdaftar
	cellphone_no VARCHAR(15),
	PRIMARY KEY (email)
);

-- buat tabel pesanan
/*menyimpan informasi nomor pesanan, data pesanan, dan informasi pengiriman dari pelanggan yang memesan*/
CREATE TABLE t_orders
(
	-- menyimpan nomor pesanan dari pesanan yang dibuat oleh pelanggan. nomor pesanan dibangkitakan secara otomatis (tambah 1 dari nomor pesanan sebelumnya)
	order_no INT(6) NOT NULL AUTO_INCREMENT,
	-- menyimpan tanggal pelanggan membuat pesanan
	order_date DATE,
	-- menyimpan alamat email dari pelanggan yang membuat pesanan
	email_address VARCHAR(50),
	-- menyimpan nama lengkap dari pelanggan yang membuat pesanan
	customer_name VARCHAR(50),
	-- menyimpan baris alamat pertama kemana produk harus dikirimkan
	shipping_address_line1 VARCHAR(255),
	-- menyimpan baris alamat kedua kemana produk harus dikirimkan
	shipping_address_line2 VARCHAR(255),
	-- menyimpan nama kota kemana produk harus dikirimkan
	shipping_city VARCHAR(50),
	-- menyimpan nama provinsi kemana produk harus dikirimkan
	shipping_state VARCHAR(50),
	-- menyimpan nama negara kemana produk harus dikirimkan
	shipping_country VARCHAR(50),
	-- menyimpan kode POS daerah kemana produk harus dikirimkan 
	shipping_zipcode VARCHAR(10),
	PRIMARY KEY (order_no)

);

-- buat tabel detil pemesanan
/*menyimpan informasi tentang seluruh produk yang yang dibeli dalam pesanan*/
CREATE TABLE t_orders_details
(
	-- menyimpan nomor pesanan dari pesanan yang dibuat oleh pelanggan
	order_no INT(6) NOT NULL,
	-- menyimpan kode produk yang dipilih dalam pesanan
	item_code VARCHAR(20) NOT NULL,
	-- menyimpan nama produk yang dipilih dalam pesanan
	item_name VARCHAR(100) NOT NULL,
	-- menyimpan kuanttas dari produk yang dipesan
	quantity SMALLINT NOT NULL,
	-- menyimpan harga dari produk yang dipilih dalam pesanan
	price DECIMAL(7,2)
);

-- buat tabel detil pembayaran
/*menyimpan informasi tentang nomor kartu dan informasi lainnya tentang mode pembayaran yang dipilih untuk membayar pesanan*/
CREATE TABLE t_payment_details
(
	-- simpan nomor pesanna dari siapa pembayaran dibuat
	order_no INT(6) NOT NULL,
	-- simpan tangga pesanan dibuat
	order_date DATE,
	-- simpan jumlah nominal yang dibayarkan dari pesanan
	amount_paid DECIMAL(7,2),
	-- simpan alamat email pelanggan yang melakukan pembayaran
	email_address VARCHAR(50),
	-- simpan nama pelanggan yang melakukan pembayaran
	customer_name VARCHAR(50),
	-- simpan jenis pembarang
	payment_type VARCHAR(20),
	-- simpan nama yang tertera dari kartu kredit
	name_on_card VARCHAR(30),
	-- simpan nomor kartu kredit
	card_number VARCHAR(20),
	-- simpan tanggal kadaluarsa kartu kredit
	expiration_date VARCHAR(10)
);