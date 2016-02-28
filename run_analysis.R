run_analysis<-function(dir) {
    rd_dir1<-paste0(dir,"/train/X_train.txt")
    rd_dir2<-paste0(dir,"/test/X_test.txt")
    rd_dir3<-paste0(dir,"/activity_labels.txt")
    rd_dir4<-paste0(dir,"/train/y_train.txt")
    rd_dir5<-paste0(dir,"/test/y_test.txt")
    rd_dir6<-paste0(dir,"/features.txt")
    rd_dir7<-paste0(dir,"/train/subject_train.txt")
    rd_dir8<-paste0(dir,"/test/subject_test.txt")
    wrt_dir<-paste0(dir,"/final_data.txt")
    rd1<-read.table(rd_dir1)
    rd2<-read.table(rd_dir2)
    rd3<-rbind(rd1,rd2)
    rd4<-read.table(rd_dir3)
    colnames(rd4)<-c("ser_no","activity")
    rd5<-read.table(rd_dir4)
    rd6<-read.table(rd_dir5)
    rd7<-rbind(rd5,rd6)
    rd8<-sapply(rd7$V1,function(x) x<-as.character(rd4$activity)[x])
    rd9<-as.data.frame(rd8)
    rd10<-cbind(rd3,rd9)
    clmn_rd<-read.table(rd_dir6)
    clmn_name<-as.character(clmn_rd$V2)
    clmn_name<-c(clmn_name,"activity")
    colnames(rd10)<-clmn_name
    mn_list<-grep("mean",clmn_name)
    std_list<-grep("std",clmn_name)
    mn_table<-rd10[,mn_list]
    std_table<-rd10[,std_list]
    rd12<-read.table(rd_dir7)
    rd13<-read.table(rd_dir8)
    rd14<-rbind(rd12,rd13)
    rd21<-cbind(rd14,rd10)
    clmn_name<-c("subjectid",clmn_name)
    colnames(rd21)<-clmn_name
    mn_list<-grep("mean",clmn_name)
    final_list<-c(1,mn_list,ncol(rd21))
    final_table1<-rd21[,final_list]
    write.table(final_table1,file = wrt_dir)
}
    