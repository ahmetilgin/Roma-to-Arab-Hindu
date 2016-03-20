# Roma-to-Arab-Hindu R script
Roman numerals to Arab/Hindu number .
Roman To binary . 
R palindrome numbers
Roman adding and subtraction. 

Open Terminal 
Type Rscript Roma_Arab.R

A-) Roma Sayı Sisteminden Arab/Hindu Sayı Sistemine geçiş

 1-Önce Roma Değerlerinin Karşılıklarını Bir Fonksiyonun içinde switch case kullanarak geri dön
       döndüren fonksiyon tanımladım.
2-Roma karakter dizisinin her bir basamağını bir diziye aktardım.
3-3 taneden fazla Roma rakamı tekrar eden roma rakamını bulmak için Şu fonksiyonu kullandım.
 Fonksiyon şu =  any(ftable(a[duplicated(a)]) burda a sayi dizisinde tekrar edenler dublicated fonksiyonuyla TRUE  olarak gösteriliyor o true ların frekans tablosunda hiç 3 den fazla tekrar eden var mı diye sordum varsa hatalıdır dedim.Eğer bunu C dilinde yapacak olsaydım for döngüsü içerisinde bubble sort algoritmasıyla karşılaştırırdım.

 4-Roma Rakamlarını Kullanıcıdan isteyip aldıktan sonra onu karakter dizisine aktardıktan sonra
for döngüsü içerisinde 1 den karakter dizisinin boyutuna kadar karakter dizisinde ki roma          drakamlarıın karşılık gelen Arab/Hindu sayı sisteminde ki değerlerini aldım.

3-Bu aldığım Roma değerlerini yine aynı for döngüsü içerisinde tek tek integer diziye aktardım.

4-O integer dizide elemanları bir baştan sonra bir sonra ki elemena bakarak büyük mü küçük diye kıyasladım bir sonra ki eleman küçükse bir önce ki elemanı eksi ile çarptım ve yerine tekrar yazdım.En sonunda çıkan integer dizisinin elemanlarını tek tek toplayıp ekrana yazdırdım.

B-) Arab/Hindu Sayı Sisteminden Roma Rakamına Geçiş

1- Bir sayıcı değişkeni tanımladım ve 1 e atadım while döngüsü içerisinde sürekli artıracağım bunu. Sayiyi istedim ve kontrol ettim 0 dan küçük mü küçükse hata ver 4000 den büyük mü büyükse hata var.
2-While döngüsü içerisinde girdiğimiz sayı 0 olana kadar Sayıdan sürekli büyükten küçüğe doğru
M,LD,D,C,XC,IX,XL,I gibi farklı sayıların arab hindu sistemde ki karşılıklarını while döngüleri içerisinde sürekli çıkarttım .Ta ki küçük olana kadar koşul while(x>999) mesela bu bir örnek.
3-Her çıkarma işlemi için o sayının karşılık geldiği Roma değerini  dizinin o anki oluşturduğum dizinin sayıcı indexine yazdırdım.
4-0 olduğunda return sayı dizisi yaptım.
C-) Roma Sayı Sisteminden 2 li Sayi tabanına çevirme.
 
1-Girdiğimiz Roma Sayısını Arab/Hindu ya çevirdikten sonra  yukarda tanımladığım  çevirme işlemi yapan fonksiyonu kullandım.
2-Sonra for döngüsü içerisinde Roma rakamları 4000 ile 1 arasında olacağından 4000 den sonra gelen en büyük 2 nin katı değer 4096 olduğu için for döngüsü içerisinde 12 den 1 e kadar bir döngü başlattım sürekli -1 yapıyor.
3-Bu döngü içerisinde döngü değişkenini 2 üzeri şeklinde atadım yeni bir değişkene
eğer yeni değişken benim sayımdan küçükse 1 yazıyor ve  2 üzeri şeklinde tanımladığım değişkenden eski sayıyı çıkartıp yeni sayıya atıyorum diziye büyükse 0 yazıyor bu şekilde 1 e kadar gidiyor. En sonunda bu 010101 dizisini geri döndürüyor

