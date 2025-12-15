program list_kontak_teman;
uses crt;

const
    MAX = 50;

type
    Tkontak = record
        nama: string[25];
        telepon: string[15];
    end;

var
    kontak: array[1..MAX] of Tkontak;
    jumlahKontak: integer;
    pilihan: integer;
    kontaknm, kontaktlp: string;

//Tambah kontak; mengembalikan true kalau berhasil
function TambahKontak(nm, tlp: string): boolean;
begin
    clrscr;
    if jumlahKontak >= MAX then
        TambahKontak := false
    else
    begin
        inc(jumlahKontak);
        kontak[jumlahKontak].nama := nm;
        kontak[jumlahKontak].telepon := tlp;
        TambahKontak := true;
    end;
    readln;
    clrscr;
end;

//Tampilkan semua kontak; mengembalikan jumlah yang ditampilkan
function LihatKontak: integer;
var 
    i: integer;
begin
    clrscr;
    if jumlahKontak = 0 then
        writeln('Tidak ada kontak.')
    else
    begin
        writeln('Daftar kontak (', jumlahKontak, '):');
        for i := 1 to jumlahKontak do
            writeln(i, '. ', kontak[i].nama, ' - ', kontak[i].telepon);
    end;
    LihatKontak := jumlahKontak;
    readln;
    clrscr;
end;

//Cari kontak berdasarkan nama; kembalikan indeks (0 kalau tidak ada)
function CariKontak(nm: string): integer;
var 
    i: integer;
begin
    clrscr;
    CariKontak := 0;
    for i := 1 to jumlahKontak do
    begin
        if kontak[i].nama = nm then
        begin
            CariKontak := i;
            exit;
        end
        else
        begin
            CariKontak := 0;
        end;
    end;
    readln;
    clrscr;
end;

//Hapus kontak berdasarkan nama; kembalikan true kalau berhasil
function HapusKontak(nm: string): boolean;
var 
    idx, i: integer;
begin
    clrscr;
    idx := CariKontak(nm);
    if idx = 0 then
    begin
        HapusKontak := false;
        exit;
    end;
    for i := idx to jumlahKontak - 1 do
        kontak[i] := kontak[i + 1];
    dec(jumlahKontak);
    HapusKontak := true;
    readln;
    clrscr;
end;

//Program Utama
var
    i: integer;

begin
    clrscr;
    jumlahKontak := 0;
    repeat
        writeln('Menu Kontak Teman');
        writeln('1. Tambah Kontak');
        writeln('2. Lihat Kontak');
        writeln('3. Cari Kontak');
        writeln('4. Hapus Kontak');
        writeln('5. Keluar');
        writeln;
        write('Pilihan Anda: '); readln(pilihan);
        case pilihan of
            1: begin
                clrscr;
                write('Masukkan nama: '); readln(kontaknm);
                write('Masukkan nomor telepon: '); readln(kontaktlp);
                if TambahKontak(kontaknm, kontaktlp) then
                    writeln('Kontak berhasil ditambahkan.')
                else
                    writeln('Daftar kontak penuh.');
                readln;
                clrscr;
            end;
            2: begin
                clrscr;
                LihatKontak;
                writeln;
                writeln('Tekan enter untuk kembali ke menu.');
                readln;
            end;
            3: begin
                clrscr;
                write('Masukkan nama yang dicari: '); readln(kontaknm);
                i := CariKontak(kontaknm);
                if i <> 0 then
                    writeln('Ditemukan: ', kontak[i].nama, ' - ', kontak[i].telepon)
                else
                    writeln('Kontak tidak ditemukan.');
                readln;
                clrscr;
            end;
            4: begin
                clrscr;
                write('Masukkan nama yang akan dihapus: '); readln(kontaknm);
                if HapusKontak(kontaknm) then
                    writeln('Kontak berhasil dihapus.')
                else
                    writeln('Kontak tidak ditemukan.');
                readln;
                clrscr;
            end;
            5: writeln('Terima kasih.');
            else writeln('Pilihan tidak valid.');
        end;
        writeln;
    until pilihan = 5;
end.