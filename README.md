# Modul2_Probstat_5025211152
Repository untuk Praktikum Modul 2 Probabilitas dan Statistika 2022 Informatika ITS

## 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 
FOTOOOOOOOOOOOOOOOOOOOOOOOO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

#### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```R
p = 0.20
n = 3
dgeom (x = n, prob = p)
```
Dengan keterangan, `p` adalah probabilitas keberhasilan dan `x` adalah jumlah kegagalan sebelum menemui sukses

Dimana didapatkan output 

![1a](https://user-images.githubusercontent.com/90272678/195225335-563ac305-198b-4df5-946f-29ddb157bf71.png)

#### b. carilah nilai t (p-value)

```R
mean(rgeom(n = 10000, prob = p) == 3)
```
Dengan keterangan, `p` adalah probabilitas keberhasilan dan `n` adalah jumlah data random yang di bangkitkan

Dimana didapatkan output 

![1b](https://user-images.githubusercontent.com/90272678/195226962-93d29987-24a4-4348-8cc3-7aa162694f45.png)

#### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

###### Nilai yang didapatkan dari nomor 1a adalah 0.1024, disisi lain, pada 1b didapatkan nilai yang tidak jauh beda dengan 1a, sehingga dapat disimpulkan bahwa perhitungan pada 1a mendekati hasil mean data random distribusi geometrik pada 1b

#### d. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

```R
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == 3, 3, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Histogram Distribusi Geometrik , Peluang gagal Sebelum Sukses Pertama, X = 3",
       x = "Jumlah gagal sebelum berhasil pertama kali",
       y = "Probabilitas") +
  scale_fill_brewer(palette = "Pastel1")

```
Digunakan ggplot untuk merepresentasikan data.frame (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait

Dimana didapatkan output 

![1d](https://user-images.githubusercontent.com/90272678/195267750-6d9ac5cc-c542-4c0a-af1c-3b3094da6a64.png)

#### e. Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama

```R
#nilai rataan
nilai_rataan <- 1/p; nilai_rataan

#nilai varian
nilai_varian <- (1-p)/(p^2); nilai_varian
```
Dengan keterangan, `p` adalah probabilitas keberhasilan

Dimana didapatkan output 

![1e](https://user-images.githubusercontent.com/90272678/195229548-c7cf0a42-fdb2-45cc-afec-ab6718cd14f9.png)

## 2. (Hipotesa 1 sampel)
### Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 

#### a. Apakah Anda setuju dengan klaim tersebut?

```R
n = 20
p = 0.2
x = 4
dbinom (x, n, p)
```
Dengan keterangan, `n` adalah jumlah pasien yang menderita Covid19, `p` adalah probabilitas keberhasilan, dan `x` adalah jumlah pasien yang sembuh 

Dimana didapatkan output 

![2a](https://user-images.githubusercontent.com/90272678/195267949-5619acbd-d206-4661-be3c-64b1d5bebb19.png)

#### b. Jelaskan maksud dari output yang dihasilkan!

```R
library(dplyr)
library(ggplot2)

data.frame(x = 0:20, prob = dbinom(x = 0:20, size = 20, prob = 0.2)) %>%
  mutate(Sembuh = ifelse(x == 4, 4, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Sembuh)) +
  theme_minimal()+
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0) +
  labs(title = "Histogram Distribusi Binomial Probabilitas dari X=4 Sembuh dari 20",
       x = "Sembuh (x)",
       y = "Probabilitas")+
  scale_fill_brewer(palette = "Pastel1")
```
Digunakan ggplot untuk merepresentasikan data.frame (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait

Dimana didapatkan output

![2b](https://user-images.githubusercontent.com/90272678/195273606-9ccd8659-5c87-42de-beaa-556c6914ae83.png)

#### c Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

```R
#nilai rataan
nilai_rataan <- n*p; nilai_rataan

#nilai varian
nilai_varian <- n*p*(1-p); nilai_varian

```
Dengan keterangan, `n` adalah jumlah pasien yang menderita Covid19, `p` adalah probabilitas keberhasilan

Dimana didapatkan output

![2c](https://user-images.githubusercontent.com/90272678/195274223-8dd904f8-92be-41e8-8848-8b21dfbbdf07.png)

## 3. (Hipotesa 2 sampel) Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
#### a. H0 dan H1

```R
lambda = 4.5
x = 6
dpois(x, lambda)
```
Dengan keterangan, `lambda` adalah mean atau rata-rata historis, `x` adalah jumlah keberhasilan (bayi lahir di rumah sakit) pada interval tertentu (besok)

Dimana didapatkan output

![3a](https://user-images.githubusercontent.com/90272678/195275359-2200d25e-d954-47cb-881c-10027d676c6a.png)

#### b. Hitung Sampel Statistik

```R
random_data <- data.frame('data' = rpois(365, 4.5))
random_data %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi yang lahir per periode',
       y = 'Proporsi',
       title = 'Histogram Kelahiran 6 Bayi di Rumah Sakit Selama Setahun') +
  scale_fill_brewer(palette = "Pastel1")

random_data %>% dplyr::summarize(six_babies = sum(random_data$data == 6) / n())
```
Digunakan `ggplot` untuk merepresentasikan `data.frame` (kumpulan data sesuai dengan kasus yang diminta) kemudian akan di *highlight* pada kasus terkait
`summarize` berfungsi untuk merangkum data menjadi satu data 

Dimana didapatkan output

![3bhisto](https://user-images.githubusercontent.com/90272678/195279325-f1440a3f-1aed-4ba2-8530-26ff3666b6f7.png)
![3bsummary_value](https://user-images.githubusercontent.com/90272678/195279374-87252ce3-9d66-44fd-860e-4ca1168479a3.png)

#### c. Lakukan Uji Statistik (df=2)

#### d. Nilai Kritikal

```R
#nilai rataan
nilai_rataan <- lambda; nilai_rataan

#nilai varian
nilai_varian <- lambda; nilai_varian
```
Dengan keterangan, `lambda` adalah mean atau rata-rata berdasarkan historis
Dimana didapatkan output

![3d](https://user-images.githubusercontent.com/90272678/195280789-ad356d21-c76e-4df9-a65d-58c2a7ff248c.png)

#### e. Keputusan

#### f. Kesimpulan

## 4. (Anova satu arah) Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
### Jika : 

### diketahui dataset  https://intip.in/datasetprobstat1 "H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama"    

### Maka Kerjakan atau Carilah:

#### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

```R
x = 2
v = 10
dchisq(x, v)
```
Dengan keterangan, `x` adalah data vektor, dan `v` adalah *degree of freedom* 

Dimana didapatkan output

![4a](https://user-images.githubusercontent.com/90272678/195287949-e90a1370-a656-4b0b-aeba-78da8fb9b876.png)

#### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```R
set.seed(100)
n = 100
chisquare_data <- rchisq(n, v)

hist(chisquare_data, breaks = 10, main = "Histogram Distribusi Chi-Square dari 100 Data Random")
```
Dengan keterangan, `hist()` digunakan untuk membuat histogram dengan `breaks` sebesar 10, sedangkan `rchisq()` digunakan untuk men-*generate* data random

Dimana didapatkan output

![4b](https://user-images.githubusercontent.com/90272678/195287987-3c0ddea2-b8fd-4718-9bb4-742464042c24.png)

#### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

```R
#nilai rataan
nilai_rataan <- v; nilai_rataan

#nilai varian
nilai_varian <- 2*v; nilai_varian
```
Dengan keterangan, `v` adalah *degree of freedom*

Dimana didapatkan output 

![4c](https://user-images.githubusercontent.com/90272678/195289562-5bb48dc1-1d74-47de-9456-a7f423deb781.png)

#### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?

#### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

#### f. Visualisasikan data dengan ggplot2

## 5. (Anova dua arah) 
## Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 

#### a. Buatlah plot sederhana untuk visualisasi data 

```R
lambda = 3
set.seed(1)

#Misalkan ada 10 data random
dexp(rexp(10, lambda))
```
Dengan keterangan, `lambda` adalah *rate* dari distribusi exponential, dan `rexp()` digunakan untuk men-*generate* data random

Dimana didapatkan output

![5a](https://user-images.githubusercontent.com/90272678/195295311-9592d375-14b6-49f5-a87c-e504b2e8e0fc.png)

#### b. Lakukan uji ANOVA dua arah untuk 2 faktor

```R
set.seed(1)

#membuat tampilan 2x2
par(mfrow=c(2,2))

hist(rexp(10, lambda), main = "Histogram Distribusi Exponensial untuk 10 Bilangan Random")
hist(rexp(100, lambda), main = "Histogram Distribusi Exponensial untuk 100 Bilangan Random")
hist(rexp(1000, lambda), main = "Histogram Distribusi Exponensial untuk 1000 Bilangan Random")
hist(rexp(10000, lambda), main = "Histogram Distribusi Exponensial untuk 10000 Bilangan Random")
```
Dengan keterangan, `hist()` digunakan untuk membuat histogram, sedangkan `rexp()` digunakan untuk men-*generate* data random

Dimana didapatkan output

![5b](https://user-images.githubusercontent.com/90272678/195297501-638ada5d-6429-4476-9ffa-6c0413ffc248.png)

#### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```R
set.seed(1)
n = 100
lambda = 3

#nilai rataan
mean(rexp(n, lambda))

#nilai varian
var(rexp(n, lambda))
```
Dengan keterangan, `mean()` digunakan untuk mendapatkan rataan dari data terkait, sedangkan `var()` digunakan untuk mendapatkan variansi 

Dimana didapatkan output

![5c](https://user-images.githubusercontent.com/90272678/195298673-a9391a4e-0bc7-45bf-a1a4-2fb650ad0b53.png)

#### d. Lakukan uji Turkey

#### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

# Sekian, Terima Kasih
