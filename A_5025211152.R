#1
#a
before <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

difference <- after - before
sd(difference)
#b
t.test(after, before, paired = TRUE )
#c

#2
install.packages("BSDA")
library(BSDA)
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)
#a
#terlampir

#b
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100)

#c
#terlampir

#3
#a
#terlampir

#b
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
mean.y =2.79 , s.y = 1.32, n.y = 27, 
alternative = "greater", var.equal = TRUE)

#c
install.packages("mosaic")
library(mosaic)
plotDist(dist = 't', df = 2)

#d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#e
#terlampir

#f
#terlampir

#4
#a
datano4 <- read.table("C:/Users/ASUS/Desktop/data_4.txt", h = T)
attach(datano4)
names(datano4)

datano4$Group <- as.factor(datano4$Group)
datano4$Group = factor(datano4$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(datano4$Group)

Group1 <- subset(datano4, Group == "Kucing Oren")
Group2 <- subset(datano4, Group == "Kucing Hitam")
Group3 <- subset(datano4, Group == "Kucing Putih")

par(mfrow=c(2,2))

qqnorm(Group1$Length, main = "Group1")
qqline(Group1$Length)

qqnorm(Group2$Length, main = "Group2")
qqline(Group2$Length)

qqnorm(Group3$Length, main = "Group3")
qqline(Group3$Length)

#b
bartlett.test(Length ~ Group, data = datano4)

#c
model1 = lm(Length ~ Group, data = datano4)
anova(model1)

#d
#terlampir

#e
TukeyHSD(aov(model1))

#f
install.packages("ggplot2")
library("ggplot2")

ggplot(datano4, aes(x = Group, y = Length)) + geom_boxplot(fill = "blue", colour = "black") + scale_x_discrete() + xlab("Treatment Group") + ylab("Length (cm)")

#5
#a
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read_csv("C:/Users/ASUS/Downloads/data_5.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#d
tukey <- TukeyHSD(anova)
print(tukey)

#e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)

write.csv("GTL_summary.csv")







