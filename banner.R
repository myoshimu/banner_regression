d<-read.csv("click2.csv",header=T)
d2<-d[2:16,]

#分割した画面に箱ひげ図描写
par(mfrow=c(2,3),omi=c(0,0,0,0))
boxplot(click~a1,data=d,main="a1")
boxplot(click~a2,data=d,main="a2")
boxplot(click~a3,data=d,main="a3")
boxplot(click~a4,data=d,main="a4")
boxplot(click~a5,data=d,main="a5")
boxplot(click~a6,data=d,main="a6")

#外れ値を除く箱ひげ図

par(mfrow=c(2,3),omi=c(0,0,0,0))
boxplot(click~a1,data=d2,main="a1")
boxplot(click~a2,data=d2,main="a2")
boxplot(click~a3,data=d2,main="a3")
boxplot(click~a4,data=d2,main="a4")
boxplot(click~a5,data=d2,main="a5")
boxplot(click~a6,data=d2,main="a6")

#dのポワソン回帰
g<-glm(click~.,data=d,family=poisson)
summary(g)
g2<-glm(click~.,data=d2,family=poisson)
summary(g2)

#変数選択を実施
g<-step(g)

#負の二項分布
library(MASS)
glm<-glm.nb(click~.,d)