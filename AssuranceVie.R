library(StMoMo)
library(lifecontingencies)
library(reliaR)
library(demography)
library(fanplot)

mortality_data <- read.csv("D:/springAssets/LifeTable.csv")
mortality_2015 <- subset(mortality_data, Year == 2015, select = c(Age, mx))

ITA <- hmd.mx(country = "ITA",username = "arij.aouadi@esprit.tn",password = "nin#jy7t4XAAeJv",label = "Italy")
head(ITA)

# Choix de la période de calibration des données :
x <- ITA$age[40:110]


plot(x, ITA$rate$female[40:110,"2015"], 
     type='l', 
     col='red',
     xlab= "Ages x", 
     ylab="mortality rate", 
     ylim=c(0.0,1),
     main ="Taux de mortalite 2015 (femme/homme) ")

lines(x, ITA$rate$male[40:110,"2015"], type = 'l', col="blue" )

legend(x="topleft", 
       legend = c("femme","homme"),
       col = c("red","blue"), 
       lty = 1, 
       cex=0.6,
       box.lwd = 0.3)




mortality_data_of_2016<- mortality_data[which(mortality_data$Year == 2016),names(mortality_data)]
head(mortality_data_of_2016)
df_Ita2016<-data.frame(mortality_data_of_2016)
str(df_Ita2016$Age)
df_Ita2016$Age<-as.numeric(as.character(df_Ita2016$Age))
df_Ita2016$Age[111]<-110
str(df_Ita2016$Age)



TD2016 <- new("lifetable", x=df_Ita2016$Age, lx= df_Ita2016$lx,name="Italy")


i=(1/0.97-1)
TD2016tb <- new("actuarialtable", x=TD2016@x, lx=TD2016@lx,interest=i)

VAP_capital <- Axn(TD2016tb, x=58, m=0, i=i)
print(VAP_capital)


Vkx.capannu <- function(x, k, K)
{
  prem <- Axn(TD2016tb, x=x)*K / axn(TD2016tb, x=x, m=0)
  K * Axn(TD2016tb, x=x+k) - prem * axn(TD2016tb, x=x+k, m=0)
}

Vkx.retraite <- function(x, n, k, R)
{ x <- 40
  n <- 65
  k <-0
  prem <- axn(TD2016tb, x=x, m=n-x)*R / axn(TD2016tb, x=x, m=0, n=n-x)
  k1 <- k[k < n-x]
  k2 <- k[k >= n-x]
  res <- axn(TD2016tb, x=x+k, m=n-x-k)*R - prem * axn(TD2016tb, x=x+k, m=0, n=n-x-k)
  c(res, axn(TD2016tb, x=x+k)*R)
}


vap_capannulle <- Vkx.capannu(40, 0, 100000)
print(vap_capannulle)

vap_retraite <- Vkx.retraite(40, 65, 0, 1500)
print(vap_retraite)





