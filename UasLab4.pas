program ListKontakTeman;
uses crt;

const
  MAX = 100;

type
  Kontak = record
  nama: string;
  nomor: string;
  end;

var
  data: array[1..MAX] of Kontak;
  jumlah : integer;
  menu: integer;
  i: integer;

//PROCEDURE TAMBAH KONTAK
procedure TambahKontak;
begin
  if jumlah < MAX then
  begin
    inc(jumlah);
    write('Masukkan nama   : '); readln(data[jumlah].nama);
    write('Masukkan nomor : '); readln(data[jumlah].nomor);
    writeln('Kontak berhasil ditambahkan!');
  end
  else
    writeln('Data kontak penuh!');
end;

//PROCEDURE LIHAT KONTAK
procedure LihatKontak;
begin
  if jumlah = 0 then
    writeln('Belum ada kontak.')
  else
  begin
    writeln('=== DAFTAR KONTAK ===');
    for i := 1 to jumlah do
      writeln(i, '. ', data[i].nama, ' - ', data[i].nomor);
  end;
end;

//PROCEDURE CARI KONTAK
procedure CariKontak;
var
  cari : string;
  ketemu : boolean;
begin
  ketemu := false;
  write('Masukkan nama yang dicari: '); readln(cari);

  for i := 1 to jumlah do
  begin
    if data[i].nama = cari then
    begin
      writeln('Kontak ditemukan!');
      writeln('Nama  : ', data[i].nama);
      writeln('Nomor : ', data[i].nomor);
      ketemu := true;
    end;
  end;

  if ketemu = false then
    writeln('Kontak tidak ditemukan.');
end;

//PROCEDURE HAPUS KONTAK
procedure HapusKontak;
var
  hapus : string;
  pos   : integer;
begin
  write('Masukkan nama kontak yang akan dihapus: '); readln(hapus);

  pos := 0;
  for i := 1 to jumlah do
    if data[i].nama = hapus then
      pos := i;

  if pos <> 0 then
  begin
    for i := pos to jumlah - 1 do
      data[i] := data[i + 1];
    dec(jumlah);
    writeln('Kontak berhasil dihapus.');
  end
  else
    writeln('Kontak tidak ditemukan.');
end;

//PROGRAM UTAMA
begin
  clrscr;
  jumlah := 0;

  repeat
    writeln;
    writeln('===== MENU LIST KONTAK =====');
    writeln('1. Tambah Kontak');
    writeln('2. Lihat Kontak');
    writeln('3. Cari Kontak');
    writeln('4. Hapus Kontak');
    writeln('5. Keluar');
    write('Pilih no menu: '); readln(menu);

    case menu of
      1: TambahKontak;
      2: LihatKontak;
      3: CariKontak;
      4: HapusKontak;
      5: writeln('Terima kasih telah menggunakan program kami.');
    else
      writeln('Menu tidak valid!');
    end;
  until menu = 5;
end.