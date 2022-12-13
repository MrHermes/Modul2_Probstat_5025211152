# Modul2_Probstat_5025211152
Repository untuk Praktikum Modul 2 Probabilitas dan Statistika 2022 Informatika ITS
Oleh Frederick Hidayat 5025211152 
Probabilitas dan Statistika A

## 1. Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 
FOTOOOOOOOOOOOOOOOOOOOOOOOO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

#### a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

Dengan data selisih pasangan pengamatan tabel, maka akan didapatkan standar deviasi sesuai pengelompokannya 

```R
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

difference <- after - before
sd(difference)
```

Dengan ditemukannya selisih dari data pengamatan tersebut, maka akan bisa digunakan nantinya untuk mendapatkan standar deviasi yang diinginkan

Dimana didapatkan output terkait untuk standar deviasi
![1a](https://user-images.githubusercontent.com/90272678/207394488-468f557c-7781-437c-af35-183b16cfdd80.png)

#### b. carilah nilai t (p-value)

```R
t.test(after, before, paired = TRUE )
```
Dimana dalam rumus ini after dan before merupakan data yang diberi oleh soal. Karena parameter masukan merupakan data kelompok maka data akan dipasangkan satu per satu sehingga paired akan di set menjadi true

Dimana didapatkan output 
![1b](https://user-images.githubusercontent.com/90272678/207394565-32b2b868-b9a7-423f-a755-3769b12290fd.png)

#### c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

###### Berdasarkan hasil yang telah didapatkan bahwa nilai dari uji t(p-value) yang mana adalah 6.003e-05 memiliki nilai yang lebih kecil dari significant level 𝛼 = 0.05, sehingga dapat ditarik keputusan yaitu hipotesis nol ditolak dan dapat ditarik kesimpulan bahwa ada bukti bahwa hipotesis alternatif mempunyai pengaruhnya

###### Sehingga dapat dikonklusi bahwa terdapat bukti pengaruh yang signifikan dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui significant level 𝛼 = 0.05 

## 2. (Hipotesa 1 sampel)
### Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 

```R
install.packages("BSDA")
library(BSDA)
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```
Didapatkan hasil sebagai berikut 
![2](https://user-images.githubusercontent.com/90272678/207394842-c90c9ad2-6328-4791-b471-ce40b2f1a41f.png)

#### a. Apakah Anda setuju dengan klaim tersebut?

###### Setuju dengan klaim terkait 

#### b. Jelaskan maksud dari output yang dihasilkan!

Dari perhitungan yang dilakukan melalui rumus di bawah ini

```R
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
```
Didapatkan bahwa rata-rata jarak tempuh mobil per tahun berada dalam selang 22726,16 sampai 24273,84 km, dengan pengaturan bawaan dari R yang memberikan confidence level 95%. Didapatkan data juga bahwa t = 60.256 dengan p-value < 2.2e-16.
Sehingga dapat kita ambil kesimpulan bahwa rata-rata jarak tempuh mobil berada pada selang 22726,16 sampai 24273,84 km sehingga bisa dikatakan ada cukup bukti yang mendukung klaim terkait yaitu bahwa rata-rata mobil dikemudikan adalah lebih dari 20000 kilometer per tahun.

#### c Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

###### Dari nilai p-value yang ada dan significant level 𝛼 = 0.05 (didapatkan dari 100 % - confidence level ) dapat diputuskan bahwa hipotesis nol ditolak. Setelah itu, dapat disimpulkan bahwa ada cukup bukti yang mendukung klaim bahwa rata-rata mobil dikemudikan adalah lebih dari 20000 kilometer per tahun. 

## 3. (Hipotesa 2 sampel) Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
FOTOOOOOOOOOOOOOOOOOOOO !!!!!!!!!!!!!!
## Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah:
#### a. H0 dan H1

###### H0 : μ1 = μ2 
###### H1 : μ1 ≠ μ2

Dengan μ1 adalah rata-rata saham di Bandung dan μ2 adalah rata-rata saham di Bali

#### b. Hitung Sampel Statistik

```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79 , s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```

Dengan x merupakan data dari Bandung dan y merupakan data dari Bali. Alternative = "greater" menyatakan bahwa x mempunyai mean lebih besar dari y dan var.equal = TRUE menyatakan bahwa variansi kedua sampel sama. Confidence level mengikuti pengaturan bawaan dari R yaitu 95 %.

Dimana didapatkan output

![3bhisto](https://user-images.githubusercontent.com/90272678/195279325-f1440a3f-1aed-4ba2-8530-26ff3666b6f7.png)
![3bsummary_value](https://user-images.githubusercontent.com/90272678/195279374-87252ce3-9d66-44fd-860e-4ca1168479a3.png)

#### c. Lakukan Uji Statistik (df=2)

Digunakan distribusi t yang memenuhi informasi yang diberikan, lalu kita gambarkan dengan plotDisc() untuk uji statistik dengan derajat bebas 2

```R
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2)
```

Didapatkan output sebagai berikut,

FOTOOOOOOOOOOOOOOOOOOOOOOOOO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#### d. Nilai Kritikal

```R
qchisq(p = 0.05, df = 2, lower.tail = FALSE)
```
Dengan keterangan, p adalah α yang diberikan, dan df (degrees of freedom) mengikuti informasi yang diberikan, serta lower.tail = FALSE akan memberikan nilai di sisi kanan dari nilai yang dikehendaki

Dimana didapatkan output

![3d](https://user-images.githubusercontent.com/90272678/195280789-ad356d21-c76e-4df9-a65d-58c2a7ff248c.png)

#### e. Keputusan

###### Diambil keputusan yaitu H0 tolak 

#### f. Kesimpulan

###### Diambil kesimpulan yaitu ada bukti yang cukup untuk mengatakan bahwa μ1 ≠ μ2
###### atau ada bukti yang cukup untuk mengatakan bahwa rata-rata saham di Bandung berbeda dengan di Bali

## 4. (Anova satu arah) Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
### Jika : 

### diketahui dataset  https://intip.in/datasetprobstat1 "H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama"    

### Maka Kerjakan atau Carilah:

#### a. Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

Dengan diketahui data maka akan kita masukan data yang ada kemudian dilakukan grouping beserta dengan rumus untuk melakukan gambaran plot yang diinginkan

```R
datano4 <- read.table("data_4.txt", h = T)
attach(datano4)
names(datano4)

datano4$Group <- as.factor(datano4$Group)
datano4$Group = factor(datano4$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(datano4$Group)

Group1 <- subset(datano4, Group == "Kucing Oren")
Group2 <- subset(datano4, Group == "Kucing Hitam")
Group3 <- subset(datano4, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)
```
Dengan keterangan, `x` adalah data vektor, dan `v` adalah *degree of freedom* 

Dimana didapatkan output

![4a](https://user-images.githubusercontent.com/90272678/195287949-e90a1370-a656-4b0b-aeba-78da8fb9b876.png)

#### b. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```R
bartlett.test(Length ~ Group, data = datano4)
```

Untuk mendapatkan homogeneity of variances maka dipakai fungsi di atas dengan paramerter dari data

Dimana didapatkan output

![4b](https://user-images.githubusercontent.com/90272678/195287987-3c0ddea2-b8fd-4718-9bb4-742464042c24.png)

#### c. Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.

```R
model1 = lm(Length ~ Group, data = data4)
anova(model1)
```

Dimana didapatkan output 

![4c](https://user-images.githubusercontent.com/90272678/195289562-5bb48dc1-1d74-47de-9456-a7f423deb781.png)

#### d. Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?

###### Dari hasil yang didapatkan, ditemukan bahwa p-value bernilai 0.0013. Sehingga dapat disimpulkan bahwa terdapat cukup bukti yang menyatakan perbedaan panjang kucing yang signifikan berdasarkan grupnya

#### e. Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

```R
TukeyHSD(aov(model1))
```

Dari TukeyHSD, didapatkan hasil bahwa perbedaan panjang kucing yang signifikan adalah pada kucing hitam yang terlihat pada hasil memberikan diff cukup besar

Berikut outputnya :
FOTOOOOOO !!!!!!!!

#### f. Visualisasikan data dengan ggplot2

```R
install.packages("ggplot2")
library("ggplot2")

ggplot(datano4, aes(x = Group, y = Length)) + geom_boxplot(fill = "blue", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

```

Berikut Outputnya
FOTOOOOOOOOOOO !!!!

## 5. (Anova dua arah) 
## Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 

#### a. Buatlah plot sederhana untuk visualisasi data 

Dapat dilakukan pembacaan dataset setelah 
```R
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("data_5.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```
Dengan keterangan, `lambda` adalah *rate* dari distribusi exponential, dan `rexp()` digunakan untuk men-*generate* data random

Dimana didapatkan output

![5a](https://user-images.githubusercontent.com/90272678/195295311-9592d375-14b6-49f5-a87c-e504b2e8e0fc.png)

#### b. Lakukan uji ANOVA dua arah untuk 2 faktor

```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
Dilakukan pengujian anova dengan menggunakan rumus diatas dan didapatkan output terkait

Berikut output di atas

![5b](https://user-images.githubusercontent.com/90272678/195297501-638ada5d-6429-4476-9ffa-6c0413ffc248.png)

#### c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
Berikut tabel dari mean dan standar deviasi keluaran cahaya untuk setiap perlakuan

Dimana didapatkan output

![5c](https://user-images.githubusercontent.com/90272678/195298673-a9391a4e-0bc7-45bf-a1a4-2fb650ad0b53.png)

#### d. Lakukan uji Turkey

```R
tukey <- TukeyHSD(anova)
print(tukey)
```

Didapatkan Output 
FOTOOOOO~~~~

#### e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)

write.csv("GTL_summary.csv")
```
Dimana didapatkan output
FOTOOOOO

# Sekian, Terima Kasih
