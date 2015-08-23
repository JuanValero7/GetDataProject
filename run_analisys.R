##Reading the Data##

TestX<-read.table("X_test.txt")
TrainX<-read.table("X_train.txt")
SubTest<-read.table("subject_test.txt")
SubTrain<-read.table("subject_train.txt")
TestY<-read.table("y_test.txt")
TrainY<-read.table("y_train.txt")
Feat<-read.table("features.txt")

##Merging Test and Train##

Test<-data.frame(Subject=SubTest,Y=TestY,X=TestX)
Train<-data.frame(Subject=SubTrain,Y=TrainY,X=TrainX)
TestAndTrain<-merge(Test,Train,by.x="V1",by.y="V1",all=TRUE)

##Take only mean and std measurements##

Feat<-read.table("features.txt")
FeatV<-as.vector(Feat[,2])
FeatMeanX<-grep("mean",FeatV)+2
FeatStdX<-grep("std",FeatV)+2
FeatMeanY<-grep("mean",FeatV)+564
FeatStdY<-grep("std",FeatV)+564
FeatMaS<-c(FeatMeanX,FeatStdX,FeatMeanY,FeatStdY)
NewTaT<-TestAndTrain[,c(1,2,564,FeatMaS)]


##Labels with descriptive variable names##
TestXwN<-read.table("X_test.txt",col.names=Feat[,2])
TrainXwN<-read.table("X_train.txt",col.names=Feat[,2])

##Creating the new data set##

ActTest<-TestY[,1]
ActTrain<-TrainY[,1]

TestF<-data.frame(Subject=SubTest[,1],ActTest,TestXwN)
TrainF<-data.frame(Subject=SubTrain[,1],ActTrain,TrainXwN)
FeatMeanTest<-grep("mean",FeatV)+2
FeatStdTest<-grep("std",FeatV)+2
TestVF<-TestF[,c(1,2,FeatMeanTest,FeatStdTest)]
TrainVF<-TrainF[,c(1,2,FeatMeanTest,FeatStdTest)]

dataframe1=data.frame()
SepTrainSubject<-split(TrainVF,TrainVF$Subject)
n=1
j=1
for(i in 1:21){
SepTrainSubject1<-SepTrainSubject[[i]]
while(j<=6){
SepTrainSubAct<-split(SepTrainSubject1,SepTrainSubject1$ActTrain)
SepTrainSubAct1<-SepTrainSubAct[[j]]
aver1<-colMeans(SepTrainSubAct1[,1:81])
j=j+1
dataframe1=rbind(dataframe1,aver1)
}
j=1
}

dataframe2=dataframe1
SepTestSubject<-split(TestVF,TestVF$Subject)
n=1
j=1
for(i in 1:9){
SepTestSubject1<-SepTestSubject[[i]]
while(j<=6){
SepTestSubAct<-split(SepTestSubject1,SepTestSubject1$ActTest)
SepTestSubAct1<-SepTestSubAct[[j]]
aver<-colMeans(SepTestSubAct1[,c(1:81)])
j=j+1
dataframe2=rbind(dataframe2,aver) #ver como los mete en un data frame
}
j=1
}
library(plyr)
help(rename)
final<-rename(dataframe2,c(X1="Subject",X1.1="Activity",))

write.table(dataframe2,file="aver.txt")
FeatMeanTest1<-grep("mean",FeatV)
FeatStdTest1<-grep("std",FeatV)
fgh<-c(FeatMeanTest1,FeatStdTest1)
Nnames<-FeatV[fgh]
Nnames<-c("Subject","Activity",Nnames)
Nnames
asdf<-read.table("aver.txt",col.names=Nnames)
betica<-asdf[,2]

##Transform numbers activity in names activity##

for(i in 1:length(betica)){
	if(asdf[i,2]==1){
		asdf[i,2]="Walking"
}
	if(asdf[i,2]==2){
		asdf[i,2]="Walking upstair"
}
	if(asdf[i,2]==3){
		asdf[i,2]="Walking downstair"
}
	if(asdf[i,2]==4){
		asdf[i,2]="Sitting"
}
	if(asdf[i,2]==5){
		asdf[i,2]="Standing"
}
	if(asdf[i,2]==6){
		asdf[i,2]="Laying"
}
}

write.table(asdf,file="Tidy Data.txt",row.name=FALSE)
