#https://tutorialmore.com/questions-1666690.htm

##https://qiita.com/vukujin/items/b5fac5debc7100423878


dis_1 <- data.frame()
dis_1 <- rbind(dis_1, "a")
dis_1 <- rbind(dis_1, "b")#ここでエラー

str(dis_1)

dis_1 <- data.frame(stringsAsFactors = F)
dis_1 <- rbind(dis_1, "a", stringsAsFactors = F)
dis_1 <- rbind(dis_1, "b", stringsAsFactors = F)
