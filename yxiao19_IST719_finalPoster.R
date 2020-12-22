mydata <- read.csv("C:/Users/hbjzx/Desktop/catdata.csv")

View(mydata)
str(mydata)
library(ggplot2)
#gender vs outcome
par(mfrow=c(1,1))
#barplot(table(mydata$sex_upon_outcome,mydata$outcome_type2),beside = T,
        col=c("#FF8000","#FFB266"),main="Outcome vs Sex upon outcome",xlab="Outcome",ylab="Sex upon outcome")
barplot(table(mydata$outcome_type2,mydata$sex_upon_outcome),
        col=c("#FF8000","#FFB266")
        ,main="Outcome vs Sex upon outcome",xlab="Outcome",ylab="Sex upon outcome")
table(mydata$sex_upon_outcome,mydata$outcome_type2)

#pie chart

#outcome-adoption vs coat pattern
#barplot(table(mydata$coat_pattern[mydata$outcome_type=="Adoption"]),beside = T,
        ,main="Coat pattern of adopted cats",xlab="Coat pattern",ylab="Number of adopted cats")
#barplot(table(mydata$coat_pattern),beside = T,
        ,main="Coat pattern of adopted cats",xlab="Coat pattern",ylab="Number of adopted cats")
#table(mydata$coat)
#Kitten/cat vs outcome
barplot(table(mydata$Cat.Kitten..outcome.,mydata$outcome_type2),beside = T,
        col=c("black","pink")
        ,main="Outcome vs Outcome year",xlab="Outcome",ylab="Outcome year")

#Kitten/cat vs outcome
#barplot(table(mydata$age_upon_outcome2[mydata$outcome_type2=="Adoption"],mydata$outcome_type2[mydata$outcome_type2=="Adoption"]),beside = T,
        col=c("black","pink")
        ,main="Outcome vs Outcome year",xlab="Outcome",ylab="Outcome year")
barplot(table(mydata$age_upon_outcome2,mydata$outcome_type2),beside = T,
        col=c("black","pink")
        ,main="Outcome vs Outcome year",xlab="Outcome",ylab="Outcome year")
#barplot(table(mydata$age_upon_outcome2),beside = T,
        col=c("black","pink")
        ,main="Outcome vs Outcome year",xlab="Outcome",ylab="Outcome year")


table(mydata$age_upon_outcome2,mydata$outcome_type2)
#age

#most common breed

breed<-as.data.frame(sort(table(mydata$breed),decreasing=T))
View(breed)
str(breed)
breed6<-breed[1:6,]
View(breed6)
gp1<-ggplot(aes(x=Var1,y=log(Freq)),data=breed6)+geom_bar(stat="identity",fill="#FF8000")
gp1

#most common coat color
mydata$coat<-gsub(" ", "", mydata$coat, fixed = TRUE)
color<-as.data.frame(sort(table(mydata$coat),decreasing=T))
View(color)
color8<-color[1:8,]
View(color8)
gp2<-ggplot(color8, aes(x="", y=Freq, fill=Var1))+
        geom_bar(width = 1, stat = "identity")+coord_polar("y", start=0)
        
gp2

#outcome date, single dimension
par(mfrow=c(1,2))
barplot(table(mydata$outcome_month),col="#FF8000")
barplot(table(mydata$outcome_weekday),col="#FF8000")


#word
library(tm)

library(wordcloud)

library(RColorBrewer)
wordcloud(mydata$name,max.words=200,colors=c("#FFCC99","#FF9933","#FF8000","#CC6600"))
                                             
str(mydata)                                           
                                             