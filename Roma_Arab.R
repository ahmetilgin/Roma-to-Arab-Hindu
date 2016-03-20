#Roma Rakamlarının karşılıklarını geri döndürür.  
#Buda iyi.
romaDegeri<-function(x)         
{
  
  switch (x,
            I = return (1),
            V = return (5),
            X = return (10),
            L = return (50),
            C = return (100),
            D = return (500),
            M = return (1000),
            "- I" = return (-1),
            "- V" = return (-5),
            "- X" = return (-10),
            "- V" = return (-50),
            "- C" = return (-100),
            "- D" = return (-500),
            NULL
  )
  
  
}
bonusFunc<-function()
{
  cat("Kaça Kadar ? \n")
  k<-readLines("stdin",n=1)
  k<-1000
  
  dizi<-NULL
  for(c in 1:k)
  { 
    tersC<-as.numeric(paste(rev(strsplit(as.character(c),"")[[1]]),collapse=""))
    dizi[c]<-c-tersC
  }
  png('plot.png', width = 1366, height = 768)
  plot(dizi,xlab = "Sonuç",ylab="Sayılar",pch=1,cex=0.1,col="BLUE")
  lines(dizi,col="red")
  Palindrom<-dizi==0
  Palindrom<-which(Palindrom==TRUE)
  dizi[Palindrom]
  cat("Palindrom Sayilar\n",Palindrom)
  points(dizi==0,cex=0.01,col="BLUE")
  dev.off()
  Sys.sleep(2)
  cat(summary(dizi))
}


#Sayının Roma karşılığını verir., Bu tamam..
sayiRoma<-function()
{  
   system("clear")
   cat("\t\tArab/Hinduyu Roma Rakamına Çevirme\n \nLütfen Arabic Sayıyı Giriniz:")
   x<-readLines("stdin",n=1)  ## kullanıcı girene kadar bekle           ## tek boyuta indirgedim
   x<-as.numeric(x)
   if(x>3888 || x<0 || is.na(x))
   { 
     cat("Hatalı giriş yaptınız.")
     Sys.sleep(1.7)
     return(1)
   }
  sayac<-1
  dizi<-NULL 
  
  while(x != 0)
  {
    while(x>999)          ## sürekli 1000 çıakrıyorum ta ki 100 den küçük olana kadar
    {
      x=x-1000            
      dizi[sayac]<-"M"   # her 1000 için M ekliyorum
      sayac=sayac+1 # sayaci bi artir
    }
    
    if(x>= 900)       
    {
      x=x-900
      dizi[sayac]<-"CM"
      sayac=sayac+1
    }
    if(x>=500)
    {
      x=x-500
      dizi[sayac]<-"D"
      sayac=sayac+1
    }
    while(x>99)
    {
      x<-x-100
      dizi[sayac]<-"C"
      sayac=sayac+1
    }
    if(x>=90)
    {
      x<-x-90
      dizi[sayac]<-"XC"
      sayac=sayac+1
    }
    if(x>=50)
    {
      x<-x-50
      dizi[sayac]<-"L"
      sayac=sayac+1
    }
    if(x>=40)
    {
      x<-x-40
      dizi[sayac]<-"XL"
      sayac=sayac+1
    }
    
    while(x>9)
    {
      
      x<-x-10
      dizi[sayac]<-"X"
      sayac=sayac+1
    }
    if(x>=9)
    {
      x<-x-9
      dizi[sayac]<-"IX"
      sayac=sayac+1
    }
    if(x>=5)      
    {
      x<-x-5
      dizi[sayac]<-"V"
      sayac=sayac+1
    }
    if(x>=4)      
    {
      x<-x-4
      dizi[sayac]<-"IV"
      sayac=sayac+1
    }
    while(x>0)
    {
      
      x<-x-1
      dizi[sayac]<-"I"
      sayac=sayac+1
      
    }
    if(x==0)
      cat(dizi)
     x<-readLines("stdin",n=1)
    break
    
    
    
    
  }
  
  
  
}

#Roma Rakamını Arab Rakamına döndermek için ilk işlemler.

romaToArab<-function()
{ 
  system("clear")  ## ekranı temizle
  secenek<-NULL
  arabicDizi<-NULL
  isaretliDizi<-NULL        
  sonDizi<-NULL
  cat("\t\tRoma Rakamından Arabic Sayi Sistemine Çevirme\n\nLütfen Roma Rakamını Giriniz:")
  a<-readLines("stdin",n=1)  ## kullanıcı girene kadar bekle           ## tek boyuta indirgedim
  
  a<-strsplit(a,"")          ## Parçaladım 
  a<-a[[1]]      
  if(any(ftable(a[duplicated(a)]) > 2) || (!is.character(a) && (as.numeric(a)))  ) ## 3 kez tekrar ettiğinin tespiti hiç 3 kez tekrar etmiş mi
  { 
    cat("Hatalı Giriş Yaptınız.Lütfen Tekrar Deneyin.\n")
    Sys.sleep(1.7)
    return (0)
  }
 # for(ct in 1:length(a)-1)
 #{
 #    if(a[ct] ==)
 #}
  
  for(x in 1:length(a))      ## x 1 den dizinin son elemanına kadar arabic diziye aktardım
  {   
    arabicDizi[x]<-romaDegeri(a[x])
  }
  uzunluk<-length(a)-1
  if(length(a)==1)
  {
  	cat(romaDegeri(a[1]),"\n")
  	Sys.sleep(2.3)
  	return (1)
  }
  for(x in 1:uzunluk)
  {
    if(((as.numeric(arabicDizi[x]) < as.numeric(arabicDizi[x+1])) && (arabicDizi[x] == 5 || arabicDizi[x]==50 || arabicDizi[x]==500)))
    {
      cat("Hatalı Giriş Yaptınız.Lütfen Tekrar Deneyin.\n")
      Sys.sleep(1.7)
      return (1)
    }
  }
  for(x in 2:length(a)-1)                                        # ilk indeksen sondan bi öncekine
  {
    if(as.numeric(arabicDizi[x]) < as.numeric(arabicDizi[x+1]))  # bir sonrakinden küçük mü
    {
      isaretliDizi[x]<--arabicDizi[x]                            ## burda eklisini aldım yazdım.
    }else
    {
      isaretliDizi[x]<-arabicDizi[x]
    }
    if(x == length(a)-1)
    {
      isaretliDizi<-append(isaretliDizi,arabicDizi[length(a)])
    }
    
    
  }
  cat(sum(isaretliDizi),"\n")
  a<-readLines("stdin",n=1)
}

#Romayı Binary e çevirme tamamdır..
binaryRoma<-function()    
{
  secenek<-NULL
  arabicDizi<-NULL
  isaretliDizi<-NULL        
  sonDizi<-NULL
  binaryDizi<-NULL
  sonDizi1<-NULL
  w<-NULL
  sayiDizisi<-NULL      
  system("clear")
  işaret<-NULL
  cat("\t\tRoma Rakamını Binary Sayıya Çevirme İşlemi\n\nLütfen Roma Rakamını Giriniz:")
  a<-readLines("stdin",n=1)
  ## kullanıcı girene kadar bekle        
  a<-strsplit(a,"")          ## Parçaladım 
  a<-a[[1]]     ## tek boyuta indirgedim
  uzunluk<-length(a)-1
  # tek boyut
  for(x in 1:length(a))      ## x 1 den dizinin son elemanına kadar arabic diziye aktardım
  {   
    arabicDizi[x]<-romaDegeri(a[x])
  }
  if(any(ftable(a[duplicated(a)]) > 2) ) ## 3 den fazla tekrar ettiğinin tespiti 
  {          
    cat("Hatalı Giriş Yaptınız.Lütfen Tekrar Deneyin.")
    Sys.sleep(2.3)
    return (0)
  }

  if(length(arabicDizi) ==1  && arabicDizi[1]<=10)
  {
    binaryDizi<-as.numeric(paste(sapply(strsplit(paste(rev(intToBits(arabicDizi[1]))),""),`[[`,2),collapse=""))
    cat(binaryDizi)   
     Sys.sleep(3.3)
     return (0)
  }else
  {
  for(x in 1:uzunluk)
  {
    if(((as.numeric(arabicDizi[x]) < as.numeric(arabicDizi[x+1])) && (arabicDizi[x] == 5 || arabicDizi[x]==50 || arabicDizi[x]==500)))
    {
      cat("Hatalı Giriş Yaptınız.Lütfen Tekrar Deneyin.\n")
      Sys.sleep(1.7)
      return (1)
    }
  }
 
  for(x in 1:uzunluk)                                        # ilk indeksen sondan bi öncekine
  {
    if(as.numeric(arabicDizi[x]) < as.numeric(arabicDizi[x+1]))  # bir sonrakinden küçük mü
    {
      isaretliDizi[x]<--arabicDizi[x]                            ## burda eklisini aldım yazdım.
    }else
    {
      isaretliDizi[x]<-arabicDizi[x]
    }
    if(x == length(a)-1)
    {
      isaretliDizi<-append(isaretliDizi,arabicDizi[length(a)])
    }
    
    
  }
  sayimiz<-sum(isaretliDizi)


    
    tekmi<-sayimiz
    for(ct in 12:0)      ## 12 den 1 e kadar 4096
    { 
      
      üssü<-2^ct
      if(üssü>sayimiz)    
      { 
        binaryDizi[ct]<-0
      }else
      { 
        binaryDizi[ct]<-1
        sayimiz<-sayimiz-üssü
        
      }
      
      
    }
    
    binaryDizi<-rev(binaryDizi)  # diziyi ters çevirdim ekrar
    if(tekmi %% 2== 0)
    {
      binaryDizi<-append(binaryDizi,0)
    }else
    {
      binaryDizi<-append(binaryDizi,1)
    }
  }
    cat(binaryDizi,"\n")
    Sys.sleep(3)
  
}



#Roma Çıkarma İşlemi
romaÇıkar<-function()
{ 
  secenek<-NULL
  toplam<-NULL
  toplam1<-NULL
  toplam2<-NULL
  işaret<-NULL
  işaret2<-NULL
  birlesik<-NULL
  arabicDizi<-NULL
  system("clear")  ## ekranı temizle
  
  cat("1-) Toplama İçin\n2-) Çıkarma için\n")
  #secenek<-readLines("stdin",n=1)
  
  system("clear")  ## ekranı temizle
  
  cat("İlk roma rakami\n")
  #ilki<-readLines("stdin",n=1)
  ilki<-"XVC"
  cat("İkinci roma rakami\n")
  ikinci<-"XC"
  #ikinci<-readLines("stdin",n=1)
  if(any(ftable(ilki[duplicated(ilki)]) > 3) && any(ftable(ikinci[duplicated(ikinci)]) > 3) ) ## 3 kez tekrar ettiğinin tespiti hiç 3 kez tekrar etmiş mi
  {          
    cat("Bir Sayi 3 den fazla yan yana yazılamaz.")
    return (0)
  }
  ilki<-strsplit(ilki,"")          ## Parçaladım    
  ilki<-ilki[[1]] 
  ikinci<-strsplit(ikinci,"")          ## Parçaladım 
  ikinci<-ikinci[[1]] 
  
  for(ct in 2:length(ilki)-1)      ## x 1 den dizinin son elemanına kadar arabic diziye aktardım
  {   
    a<-romaDegeri(ilki[ct])
    b<-romaDegeri(ilki[ct+1])
    
    if(as.numeric(a)<as.numeric(b))
    {
      ilki[ct]<-paste("-",ilki[ct])
    }
  }
  for(ct in 2:length(ikinci)-1)      ## x 1 den dizinin son elemanına kadar arabic diziye aktardım
  {   
    a<-romaDegeri(ikinci[ct])
    b<-romaDegeri(ikinci[ct+1])
    
    if(as.numeric(a)<as.numeric(b))
    {
      ikinci[ct]<-paste("-",ikinci[ct])
    }
  }
  
  birlesik<-append(ilki,ikinci)     ## iki diziyi birleştir
  tekrarlananİndex<-which(duplicated(birlesik)) # işareti aynı olup tekrar edenler
  
  
  
  for(ct2 in 1:length(tekrarlananİndex))   ## tekrarlanan index kadar dön
  {
    for(ct in 1:tekrarlananİndex[ct2])  
    {
      if(birlesik[ct] == birlesik[tekrarlananİndex[ct2]])   ## farklılığı tespit et ve sil
      {
        birlesik[ct]<-0     ## Dizinin tekrar eden elemanıyla kendisini sil 
        birlesik[tekrarlananİndex[1]]<-0    #Tekrar edenleri ve kendilerini sildik
      }
      
    }
    
  }
  a<-length(ilki)+1
  for(ct in a:length(birlesik))      ## x 1 den dizinin son elemanına kadar arabic diziye aktardım
  {   
    birlesik[ct]<-paste("-",birlesik[ct])
  }
  for(ct in 1:length(birlesik))
  {
      toplam2[ct]<-romaDegeri(birlesik[ct])
  }
  sonuç<-sum(toplam1)
  
  cat(sayiRoma(sonuç),"\n")
  # sayi<-readLines("stdin",n=1)
  
  
  
  
  
  

  }
cıkıs<-TRUE
while(cıkıs)
  {
cat("1-) Roma Rakamı Arab/Hindu.\n2-) Arab/Hindu rakamı Roma.\n3-) Roma Rakamının 2'li tabanda yazılması.\n4-) Bonus Palindrom\n5-) Çıkış.
    ")
secenek<-NULL
secenek <- readLines("stdin",n=1)


if(any(unique(secenek == 1:5)))  
{
  if(secenek == 1) romaToArab()
  
  if(secenek == 2) sayiRoma()
  
  if(secenek == 3) binaryRoma()

  if(secenek == 4) bonusFunc()
  
  if(secenek == 5) cıkıs=FALSE
}else
{
  
  
  cat("1-5 Arası Değer Girin.Devam Etmek için bir tuşa basınız")
  devam <- readLines("stdin",n=1)
}
system("clear")
}
secenek<-NULL






##TEST
binarytoplamaçıkarma<-function()
{
sonDizi[[count]]<-binaryDizi 
count=count+1

binaryDizi<-NULL
sonDizi1<-NULL

w<-as.vector(c(sonDizi))

##   for(i in 1:length(işaret))  işaret biti ekleme işlemi
##{ 
##  if(işaret[i]==TRUE)
##  {  
##    w[[i]][1]<-1
##  }else
##  {
##    w[[i]][1]<-0
##    }
##  }

temp<-0
toplam<-0
for(y in length(w[[i]]):1)
{
  for(x in 1:length(işaret))
  { 
    toplam<-temp+w[[y]][x]
    temp<-toplam
    if(temp%%2==0 && temp >= 2)
    {
      carry<-1
      toplam[y]<-0
    }else
    {
      if(temp>0)
      {
        carry<-0
        toplam(y)<-1
      } 
    }
    
  }
}
for(y in length(w[[i]]):1) ## mesela 1.den 2.yi çıkarıyorum 1e tümleyen
{
  for(x in 1:length(işaret)-1)
  { 
    if(y>1)
    {
      
      if(w[[y]][x]==0)
      {
        w[[y]][x]<- 1
      }
      else
      {
        w[[y]][x]<-0
      }
    }else
    {
      break
    }
    
  }
  
}
}


