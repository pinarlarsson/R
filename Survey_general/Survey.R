library(data.table)


# total answer count
answer_count = fread("~/Documents/Survey/Total number of answers/answer_count_per_question.csv")
question_answer = answer_count[,.(questionId,Answer_count)]
barplot(question_answer$Answer_count, names = question_answer$questionId, xlab = "Questions", ylab = "Number of answers")
rm(quesion_answer)

# Gender/Age plots
F_age = fread("~/Documents/Survey/Total number of answers/F_age_nbofanswers")
M_age = fread("~/Documents/Survey/Total number of answers/M_age_nbofanswers")
barplot(F_age$Female, names = F_age$Age_Group, xlab = "Age groups", ylab = "Number of answers", main = "Female answers")
barplot(M_age$Male, names = M_age$Age_Group, xlab = "Age groups", ylab = "Number of answers", main = "Male answers")

Merged_age =merge(F_age,M_age,by="Age_Group")

subset <- t(data.frame(Merged_age$Female, Merged_age$Male))
barplot(subset, legend = c("Female", "Male"), names.arg=Merged_age$Age_Group, beside = TRUE, xlab = "Age groups", ylab = "Number of answers", ylim = c(0,10000))

Merged_age[,Female_ratio := Female/(Female+Male)]
Merged_age[,Male_ratio := Male/(Female+Male)]
subset2 <- t(data.frame(Merged_age$Female_ratio, Merged_age$Male_ratio))
barplot(subset2, legend = c("Female_ratio", "Male_ratio"), names.arg=Merged_age$Age_Group, xlab = "Age groups", ylab = "Percentage of answers",ylim = c(0,1))
abline(h = 0.5, v = NULL, col = "red")

Merged_age[,Total := Female+Male]
barplot(Merged_age$Total, names = Merged_age$Age_Group, xlab = "Age groups", ylab = "Total number of answers",ylim = c(0,12000))

Merged_age[,Total_ratio := Total/29557]
barplot(Merged_age$Total_ratio, names = Merged_age$Age_Group, xlab = "Age groups", ylab = "Ratio",ylim = c(0,1), main = "Ratio of total responses per age")

# Question 6
M_yes = fread("~/Documents/Survey/question6_M_yesanswer")
M_no = fread("~/Documents/Survey/question6_M_noanswers")
M_dnk = fread("~/Documents/Survey/question6_M_donotknow") 
F_yes = fread("~/Documents/Survey/question6_F_yesanswers")
F_no = fread("~/Documents/Survey/question6_F_noanswers")
F_dnk = fread("~/Documents/Survey/question6_F_donotknow") 

tempF = merge(F_yes,F_no, by="Age_Group")
Merged_F =merge(tempF, F_dnk, by="Age_Group")
tempM = merge(M_yes,M_no, by="Age_Group")
Merged_M =merge(tempM, M_dnk, by="Age_Group")

subsetF <- t(data.frame(Merged_F$Total_female_yes_answers, Merged_F$Total_female_no_answers,Merged_F$Total_female_dnk_answers))
barplot(subsetF, legend = c("Total_female_yes_answers", "Total_female_no_answers","Total_female_dnk_answers"), names.arg=Merged_F$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Number of answers", ylim = c(0,1000))
subsetM <- t(data.frame(Merged_M$Total_male_yes_answers, Merged_M$Total_male_no_answers,Merged_M$Total_male_dnk_answers))
barplot(subsetM, legend = c("Total_male_yes_answers", "Total_male_no_answers","Total_male_dnk_answers"), names.arg=Merged_M$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Number of answers", ylim = c(0,1000))

Merged_F[,yes_ratio := Total_female_yes_answers/(Total_female_yes_answers+Total_female_no_answers+Total_female_dnk_answers)]
Merged_M[,yes_ratio := Total_male_yes_answers/(Total_male_yes_answers+Total_male_no_answers+Total_male_dnk_answers)]
Merged_F[,no_ratio := Total_female_no_answers/(Total_female_yes_answers+Total_female_no_answers+Total_female_dnk_answers)]
Merged_M[,no_ratio := Total_male_no_answers/(Total_male_yes_answers+Total_male_no_answers+Total_male_dnk_answers)]
Merged_F[,dnk_ratio := Total_female_dnk_answers/(Total_female_yes_answers+Total_female_no_answers+Total_female_dnk_answers)]
Merged_M[,dnk_ratio := Total_male_dnk_answers/(Total_male_yes_answers+Total_male_no_answers+Total_male_dnk_answers)]

subsetFratio <- t(data.frame(Merged_F$yes_ratio, Merged_F$no_ratio,Merged_F$dnk_ratio))
barplot(subsetFratio, legend = c("yes_ratio", "no_ratio","dnk_ratio"), names.arg=Merged_F$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of answers", ylim = c(0,1), main = "Female")
subsetMratio <- t(data.frame(Merged_M$yes_ratio, Merged_M$no_ratio,Merged_M$dnk_ratio))
barplot(subsetMratio, legend =c("yes_ratio", "no_ratio","dnk_ratio"), names.arg=Merged_M$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of answers", ylim = c(0,1), main = "Male")

subsettemp <- t(data.frame(Merged_F$yes_ratio, Merged_M$yes_ratio))
barplot(subsettemp, legend = c("Merged_F.yes_ratio", "Merged_M.yes_ratio"), names.arg=Merged_F$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of answers", ylim = c(0,0.2))

#RECALL
library(data.table)
F_RECALL_yes = fread("~/Documents/Survey/F_yesanswer_RECALL")
M_RECALL_yes = fread("~/Documents/Survey/M_yesanswers_RECALL")
subsettempRECALL <- t(data.frame(F_RECALL_yes$yes_ratio, M_RECALL_yes$yes_ratio))
barplot(subsettempRECALL, legend = c("F_RECALL_yes.yes_ratio", "M_RECALL_yes.yes_ratio"), names.arg=M_RECALL_yes$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of answers", ylim = c(0,0.6))
F_RECALL_no = fread("~/Documents/Survey/F_noanswer_RECALL")
M_RECALL_no = fread("~/Documents/Survey/M_noanswer_RECALL")
F_RECALL_dnk = fread("~/Documents/Survey/RECALL_q2_dnk_F")
M_RECALL_dnk = fread("~/Documents/Survey/RECALL_q2_dnk_M")
tempRECALL_F = merge(F_RECALL_yes,F_RECALL_no, by="Age_Group")
MERGED_RECALL_F = merge(tempRECALL_F,F_RECALL_dnk, by="Age_Group")
tempRECALL_M = merge(M_RECALL_yes,M_RECALL_no, by="Age_Group")
MERGED_RECALL_M = merge(tempRECALL_M,M_RECALL_dnk, by="Age_Group")
colnames(MERGED_RECALL_F) <- c("Age_Group","F_yes", "F_no", "F_dnk")
colnames(MERGED_RECALL_M) <- c("Age_Group","M_yes", "M_no", "M_dnk")
MERGED_RECALL_F[,yes_ratio_F := F_yes/(F_yes + F_no + F_dnk)]
MERGED_RECALL_M[,yes_ratio_M := M_yes/(M_yes + M_no + M_dnk)]

barplot(MERGED_RECALL_F$yes_ratio_F, names = MERGED_RECALL_F$Age_Group, xlab = "Age groups", ylab = "Ratio of Yes Answers",ylim = c(0,0.6), main = "Ratio of Positive Female Answers-RECALL")
barplot(MERGED_RECALL_M$yes_ratio_M, names = MERGED_RECALL_M$Age_Group, xlab = "Age groups", ylab = "Ratio of Yes Answers",ylim = c(0,0.6), main = "Ratio of Positive Male Answers-RECALL")

subsettempRECALL <- t(data.frame(MERGED_RECALL_F$yes_ratio_F, MERGED_RECALL_M$yes_ratio_M))
barplot(subsettempRECALL, legend = c("MERGED_RECALL_F$yes_ratio_F", "MERGED_RECALL_M$yes_ratio_M"), names.arg=MERGED_RECALL_F$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of Positive Answers-RECALL", ylim = c(0,0.6))

MERGED_RECALL_F[,yes_ratio_F := F_yes/(F_yes + F_no  + F_dnk)]
MERGED_RECALL_M[,yes_ratio_M := M_yes/(M_yes + M_no + M_dnk)]

#PURCHASE INTENT

F_INTENT_OUR = fread("~/Documents/Survey/Purchase Intent/F_INTENT_ourbrand")
F_INTENT_OTHER = fread("~/Documents/Survey/Purchase Intent/F_INTENT_otherbrand")
F_INTENT_NONE = fread("~/Documents/Survey/Purchase Intent/F_INTENT_nobrand")
M_INTENT_OUR = fread("~/Documents/Survey/Purchase Intent/M_INTENT_ourbrand")
M_INTENT_OTHER = fread("~/Documents/Survey/Purchase Intent/M_INTENT_otherbrand")
M_INTENT_NONE = fread("~/Documents/Survey/Purchase Intent/M_INTENT_nobrand")

temp_INTENT_F = merge(F_INTENT_OUR,F_INTENT_OTHER,by = "Age_Group")
Merge_F_INTENT = merge(temp_INTENT_F,F_INTENT_NONE,by = "Age_Group")
temp_INTENT_M = merge(M_INTENT_OUR,M_INTENT_OTHER,by = "Age_Group")
Merge_M_INTENT = merge(temp_INTENT_M,M_INTENT_NONE,by = "Age_Group")
Merge_F_INTENT[,our_F:=Total_F_ourbrand_INTENT/(Total_F_ourbrand_INTENT+Total_F_anotherbrand_INTENT+Total_F_nobrand_INTENT)]
Merge_M_INTENT[,our_M:=Total_M_ourbrand_INTENT/(Total_M_ourbrand_INTENT+Total_M_anotherbrand_INTENT+Total_M_nobrand_INTENT)]
Merge_F_INTENT[,none_F:=Total_F_nobrand_INTENT/(Total_F_ourbrand_INTENT+Total_F_anotherbrand_INTENT+Total_F_nobrand_INTENT)]
Merge_M_INTENT[,none_M:=Total_M_nobrand_INTENT/(Total_M_ourbrand_INTENT+Total_M_anotherbrand_INTENT+Total_M_nobrand_INTENT)]

barplot(Merge_F_INTENT$our_F, names = Merge_F_INTENT$Age_Group, xlab = "Age groups", ylab = "Ratio of Yes Answers",ylim = c(0,0.4), main = "Ratio of Female Answers-Chosen our brand-INTENT")
barplot(Merge_M_INTENT$our_M, names = Merge_M_INTENT$Age_Group, xlab = "Age groups", ylab = "Ratio of Yes Answers",ylim = c(0,0.4), main = "Ratio of Positive Male Answers-Chosen our brand-INTENT")

barplot(Merge_F_INTENT$none_F, names = Merge_F_INTENT$Age_Group, xlab = "Age groups", ylab = "Ratio of No Brand Answers",ylim = c(0,0.6), main = "Ratio of Positive Female Answers-Chosen no brand-INTENT")
barplot(Merge_M_INTENT$none_M, names = Merge_M_INTENT$Age_Group, xlab = "Age groups", ylab = "Ratio of No Brand Answers",ylim = c(0,0.6), main = "Ratio of Positive Male Answers-Chosen no brand-INTENT")

subsetourINTENT <- t(data.frame(Merge_F_INTENT$our_F, Merge_M_INTENT$our_M))
barplot(subsetourINTENT, legend = c("(Merge_F_INTENT$our_F", "(Merge_M_INTENT$our_M"), names.arg=Merge_M_INTENT$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of Answers-our brand-INTENT", ylim = c(0,0.6))

subsetnoneINTENT <- t(data.frame(Merge_F_INTENT$none_F, Merge_M_INTENT$none_M))
barplot(subsetnoneINTENT, legend = c("Merge_F_INTENT$none_F", "Merge_M_INTENT$none_M"), names.arg=Merge_M_INTENT$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of Answers-no brand-INTENT", ylim = c(0,0.8))

#Question 7

F_Q7_yes = fread("~/Documents/Survey/Question 7/F_yes_Q7")
F_Q7_no = fread("~/Documents/Survey/Question 7/F_no_Q7")
F_Q7_dnk = fread("~/Documents/Survey/Question 7/F_dnk_Q7")
M_Q7_yes = fread("~/Documents/Survey/Question 7/M_yes_Q7")
M_Q7_no = fread("~/Documents/Survey/Question 7/M_no_Q7")
M_Q7_dnk = fread("~/Documents/Survey/Question 7/M_dnk_Q7")

temp_Q7_F = merge(F_Q7_yes,F_Q7_no,by = "Age_Group")
Merge_F_Q7 = merge(temp_Q7_F,F_Q7_dnk,by = "Age_Group")
temp_Q7_M = merge(M_Q7_yes,M_Q7_no,by = "Age_Group")
Merge_M_Q7 = merge(temp_Q7_M,M_Q7_dnk,by = "Age_Group")
Merge_F_Q7[,yes_F:=Total_F_yes_Q7/(Total_F_yes_Q7+Total_F_no_Q7+Total_F_dnk_Q7)]
Merge_M_Q7[,yes_M:=Total_M_yes_Q7/(Total_M_yes_Q7+Total_M_no_Q7+Total_M_dnk_Q7)]

Merge_F_Q7[,dnk_F:=Total_F_dnk_Q7/(Total_F_yes_Q7+Total_F_no_Q7+Total_F_dnk_Q7)]
Merge_M_Q7[,dnk_M:=Total_M_dnk_Q7/(Total_M_yes_Q7+Total_M_no_Q7+Total_M_dnk_Q7)]

Merge_F_Q7[,no_F:=Total_F_no_Q7/(Total_F_yes_Q7+Total_F_no_Q7+Total_F_dnk_Q7)]
Merge_M_Q7[,no_M:=Total_M_no_Q7/(Total_M_yes_Q7+Total_M_no_Q7+Total_M_dnk_Q7)]

subsetQ7 <- t(data.frame(Merge_F_Q7$yes_F, Merge_M_Q7$yes_M))
barplot(subsetQ7, legend = c("Merge_F_Q7$yes_F", "Merge_M_Q7$yes_M"), names.arg=Merge_M_Q7$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of Yes Answers Q7", ylim = c(0,0.2))

subsetQ7 <- t(data.frame(Merge_F_Q7$dnk_F, Merge_M_Q7$dnk_M))
barplot(subsetQ7, legend = c("Merge_F_Q7$dnk_F", "Merge_M_Q7$dnk_M"), names.arg=Merge_M_Q7$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of Dnk Answers Q7", ylim = c(0,0.4))

subsetQ7 <- t(data.frame(Merge_F_Q7$no_F, Merge_M_Q7$no_M))
barplot(subsetQ7, legend = c("Merge_F_Q7$no_F", "Merge_M_Q7$no_M"), names.arg=Merge_M_Q7$Age_Group ,beside=TRUE, xlab = "Age groups", ylab = "Ratio of No Answers Q7", ylim = c(0,1.5))
abline(h = 1, v = NULL, col = "red")

subsetQ7 <- t(data.frame(Merge_F_Q7$yes_F, Merge_F_Q7$no_F, Merge_F_Q7$dnk_F))
barplot(subsetQ7, legend = c("Merge_F_Q7$yes_F", "Merge_F_Q7$no_F", "Merge_F_Q7$dnk_F"), names.arg=Merge_F_Q7$Age_Group , xlab = "Age groups", ylab = "Ratio of Female Answers Q7", ylim = c(0,2))
abline(h = 1, v = NULL, col = "red")

subsetQ7 <- t(data.frame(Merge_M_Q7$yes_M, Merge_M_Q7$no_M, Merge_M_Q7$dnk_M))
barplot(subsetQ7, legend = c("Merge_M_Q7$yes_M", "Merge_M_Q7$no_M", "Merge_M_Q7$dnk_M"), names.arg=Merge_M_Q7$Age_Group , xlab = "Age groups", ylab = "Ratio of Male Answers Q7", ylim = c(0,2))
abline(h = 1, v = NULL, col = "red")

#Relevance-without age
library(data.table)
F_Relevance = fread("~/Documents/Survey/Relevance/F_allanswers")
M_Relevance = fread("~/Documents/Survey/Relevance/M_allanswers")
F_Relevance[,ratio_F := Relevance_F/15998]
M_Relevance[,ratio_M := Relevance_M/10743]
subsetRelevance <- t(data.frame(F_Relevance$ratio_F, M_Relevance$ratio_M))
barplot(subsetRelevance, legend = c("F_Relevance$ratio_F", "M_Relevance$ratio_M"), names.arg=F_Relevance$Degrees ,beside=TRUE, xlab = "Degrees", ylab = "Ratio of answers", ylim = c(0,0.5))

#Relevance-with age (only yes answers i.e 4-5)
F_yesRelevance = fread("~/Documents/Survey/Relevance/F_yesanswers_RELEVANCE")
M_yesRelevance = fread("~/Documents/Survey/Relevance/M_yesanswers_RELEVANCE")
F_yesRelevance[,ratio_F := Total_F_yesanswers_RELEVANCE/3173]
M_yesRelevance[,ratio_M := Total_M_yesanswers_RELEVANCE/1958]

subsetyesRelevance <- t(data.frame(F_yesRelevance$ratio_F, M_yesRelevance$ratio_M))
barplot(subsetyesRelevance, legend = c("F_yesRelevance$ratio_F", "M_yesRelevance$ratio_M"), names.arg=F_yesRelevance$Age_Group ,beside=TRUE, xlab = "Age Groups", ylab = "Ratio of yes answers (4-5)", ylim = c(0,0.5))

#reward type - only age
library(data.table)
donation_age =  fread("~/Documents/Survey/Reward type/donation_age")
movie_age =  fread("~/Documents/Survey/Reward type/movie_age")
none_age =  fread("~/Documents/Survey/Reward type/none_age")

temp_reward = merge(donation_age, movie_age,by= "Age_Group")
merge_reward_age = merge(temp_reward, none_age,by= "Age_Group")

subset_reward_age <- t(data.frame( merge_reward_age$Movie,merge_reward_age$Donation, merge_reward_age$No_reward))
barplot(subset_reward_age, legend = c("merge_reward_age$Movie","merge_reward_age$Donation", "merge_reward_age$No_reward"), names.arg=merge_reward_age$Age_Group, beside = TRUE, xlab = "Age groups", ylab = "Number of answers",ylim = c(0,12000))

merge_reward_age[,Donation_ratio := Donation/(Donation+Movie+No_reward)]
merge_reward_age[,Movie_ratio := Movie/(Donation+Movie+No_reward)]
merge_reward_age[,No_reward_ratio := No_reward/(Donation+Movie+No_reward)]

subset_reward_age_ratio <- t(data.frame( merge_reward_age$Movie_ratio,merge_reward_age$Donation_ratio, merge_reward_age$No_reward_ratio))
barplot(subset_reward_age_ratio, legend = c("merge_reward_age$Movie_ratio","merge_reward_age$Donation_ratio", "merge_reward_age$No_reward_ratio"), names.arg=merge_reward_age$Age_Group, beside = TRUE, xlab = "Age groups", ylab = "Ratio of answers",ylim = c(0,1.8))
abline(h = 0.06, v = NULL, col = "red")

#reward type - age+gender
donation_F =  fread("~/Documents/Survey/Reward type/donation_F")
movie_F =  fread("~/Documents/Survey/Reward type/movie_F")
none_F =  fread("~/Documents/Survey/Reward type/none_F")
donation_M =  fread("~/Documents/Survey/Reward type/donation_M")
movie_M =  fread("~/Documents/Survey/Reward type/movie_M")
none_M =  fread("~/Documents/Survey/Reward type/none_M")

temp_reward_F = merge(donation_F, movie_F,by= "Age_Group")
merge_reward_F = merge(temp_reward_F, none_F,by= "Age_Group")
temp_reward_M = merge(donation_M, movie_M,by= "Age_Group")
merge_reward_M = merge(temp_reward_M, none_M,by= "Age_Group")

merge_reward_F[,Donation_F_ratio := Donation_F/(Donation_F+Movie_F+None_F)]
merge_reward_F[,Movie_F_ratio := Movie_F/(Donation_F+Movie_F+None_F)]
merge_reward_F[,No_reward_ratio_F := None_F/(Donation_F+Movie_F+None_F)]
merge_reward_M[,Donation_M_ratio := Donation_M/(Donation_M+Movie_M+None_M)]
merge_reward_M[,Movie_M_ratio := Movie_M/(Donation_M+Movie_M+None_M)]
merge_reward_M[,No_reward_ratio_M := None_M/(Donation_M+Movie_M+None_M)]

#start-finish
library(data.table)
donation =  fread("~/Documents/Survey/Start-Finish/donation")
movie =  fread("~/Documents/Survey/Start-Finish/movie")
none =  fread("~/Documents/Survey/Start-Finish/none")

mean_movie = mean(movie$minutes)
mean_movie
mean_donation = mean(donation$minutes)
mean_donation
mean_none = mean(none$minutes)
mean_none

median_movie = median(movie$minutes)
median_movie
median_donation = median(donation$minutes)
median_donation
median_none = median(none$minutes)
median_none

mean_movie = mean(movie$seconds)
mean_movie
mean_donation = mean(donation$seconds)
mean_donation
mean_none = mean(none$seconds)
mean_none


median_movie = median(movie$seconds)
median_movie
median_donation = median(donation$seconds)
median_donation
median_none = median(none$seconds)
median_none

temp <- table(as.vector(movie$seconds))
names(temp)[temp == max(temp)]

temp <- table(as.vector(donation$seconds))
names(temp)[temp == max(temp)]

temp <- table(as.vector(none$seconds))
names(temp)[temp == max(temp)]

sd_movie = sd(movie$seconds)
sd_movie
sd_donation = sd(donation$seconds)
sd_donation
sd_none = sd(none$seconds)
sd_none

movie_new = subset(movie, hours < 1)
donation_new = subset(donation, hours < 1)
none_new = subset(none, hours < 1)

57123

median_movie_new = median(movie_new$seconds)
median_movie_new

sd_movie_new = sd(movie_new$seconds)
sd_movie_new
sd_donation_new = sd(donation_new$seconds)
sd_donation_new
sd_none_new = sd(none_new$seconds)
sd_none_new

movie_temp = subset(movie, hours >= 1)
donation_temp = subset(donation, hours >= 1)

# Filled Density Plot
d <- density(movie_new$seconds)
plot(d, main="Density of seconds")
polygon(d, col="red")

d_movie <- density(movie_new$minutes)
d_donation <- density(donation_new$minutes)
d_none <- density(none_new$minutes)
plot(d_min, main="Density of minutes")
lines (density(d_donation))
lines (density(d_none))
polygon(d_min, col="red")
polygon(d_donation, col="blue")
polygon(d_none, col="green")
library(data.table)
movie_new[,type:="movie"]
donation_new[,type:="donation"]
none_new[,type:="none"]

temp_rew = rbind(movie_new,donation_new)
reward = rbind(temp_rew,none_new)

comp_new = rbind(temp_rew,movie_9_12_new)
library(ggplot2)
ggplot(reward) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.5)
ggplot(reward) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)
ggplot(temp_rew) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)
ggplot(comp_new) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)

comp_new1000 = subset(comp_new, seconds < 1000)
ggplot(comp_new1000) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)

movie[,type:="movie"]
donation[,type:="donation"]
none[,type:="none"]
temp_rewall = rbind(movie,donation)
rewardall = rbind(temp_rewall,none)
ggplot(rewardall) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)

movie_10 = subset(movie_new, minutes < 10)
donation_10 = subset(donation_new, minutes < 10)
none_10 = subset(none_new, minutes < 10)

temp_10 = rbind(movie_10,donation_10)
reward_10 = rbind(temp_10,none_10)


ggplot(reward_10) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)

ggplot(movie_10) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)
ggplot(donation_10) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)
ggplot(none_10) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)


movie_6 = subset(movie_new, minutes < 6)
donation_6 = subset(donation_new, minutes < 6)
none_6 = subset(none_new, minutes < 6)

temp_6 = rbind(movie_6,donation_6)
reward_6 = rbind(temp_6,none_6)


ggplot(reward_6) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)

movie_3 = subset(movie_new, minutes < 3)
donation_3 = subset(donation_new, minutes < 3)
none_3 = subset(none_new, minutes < 3)

temp_3 = rbind(movie_3,donation_3)
reward_3 = rbind(temp_3,none_3)


ggplot(reward_3) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)

movie_sec300 = subset(movie_new, seconds < 300)
donation_sec300 = subset(donation_new, seconds < 300)
none_sec300 = subset(none_new, seconds < 300)

temp_sec300 = rbind(movie_sec300,donation_sec300)
reward_sec300 = rbind(temp_sec300,none_sec300)


ggplot(reward_sec300) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.25)

movie_sec200 = subset(movie_new, seconds < 200)
donation_sec200 = subset(donation_new, seconds < 200)
none_sec200 = subset(none_new, seconds < 200)

temp_sec200 = rbind(movie_sec200,donation_sec200)
reward_sec200 = rbind(temp_sec200,none_sec200)


ggplot(reward_sec200) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.25)

movie_short = fread("~/Documents/Survey/Start-Finish/movie_short")
movie_short[,type := "movie_short"]
movie_short_new = subset(movie_short, minutes<60)
short_survey = rbind(donation_new,movie_short_new)

library(ggplot2)
ggplot(short_survey) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.5)

movie_short_new3 = subset(movie_short_new, minutes < 3)
reward_new_3 = rbind(movie_short_new3,donation_3)
ggplot(reward_new_3) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.25)

short_survey300 = subset(short_survey, seconds < 300)
ggplot(short_survey300) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)

movie_9_12 = fread("~/Documents/Survey/Start-Finish/movie_9_12")
movie_9_12[,type := "movie_9_12"]
movie_9_12_new = subset(movie_9_12, minutes<60)
short_survey_9_12 = rbind(donation_new,movie_9_12_new)


ggplot(short_survey_9_12) + geom_density(aes(x=seconds,group=type,fill=type),alpha = 0.5)
ggplot(short_survey_9_12) + geom_density(aes(x=minutes,group=type,fill=type),alpha = 0.5)



#donation - fast answerers' demographics

donation_F_less60sec = fread("~/Documents/Survey/Start-Finish/donation_F_less60sec")
donation_M_less60sec = fread("~/Documents/Survey/Start-Finish/donation_M_less60sec")
donation_less60sec = merge(donation_M_less60sec, donation_F_less60sec, by = "Age_Group")
donation_less60sec[,F_ratio:=Donation_F_less60sec/(Donation_F_less60sec+Donation_M_less60sec)]
donation_less60sec[,M_ratio:=Donation_M_less60sec/(Donation_F_less60sec+Donation_M_less60sec)]

subset_less60sec <- t(data.frame( donation_less60sec$F_ratio,donation_less60sec$M_ratio))
barplot(subset_less60sec, legend = c("donation_less60sec$F_ratio","donation_less60sec$M_ratio"), names.arg=donation_less60sec$Age_Group, xlab = "Age groups", ylab = "Ratio of answers",ylim = c(0,1))
abline(h = 0.5, v = NULL, col = "red")




#intent vs email
Q7_email = fread("~/Documents/Survey/Intent vs e-mail/Q7.csv")
Q7_email[,ratio := Purchase_Intent/1248]

barplot(Q7_email$ratio, names = Q7_email$Answers, xlab = "Answer types", ylab = "Ratio of answers", main = "Ratio for respondents with e-mail for Q7",ylim = c(0,0.8))


#relevance vs email

relevance_email = fread("~/Documents/Survey/Relevance vs email/relevance_email.csv")
relevance_email[,ratio := Relevance/15735]

barplot(relevance_email$ratio, names = relevance_email$Degrees, xlab = "Degrees", ylab = "Ratio of answers", main = "Ratio for respondents with e-mail",ylim = c(0,0.4))

#email by age and gender

email_f = fread("~/Documents/Survey/email/f_without92")
email_m = fread("~/Documents/Survey/email/m_without92")
email = merge(email_f,email_m, by="Age_Group")
email[,f_ratio := Female/(Female+Male)]
email[,m_ratio := Male/(Female+Male)]

subset_email <- t(data.frame(email$f_ratio,email$m_ratio))
barplot(subset_email,legend = c("email$f_ratio","email$m_ratio"), names.arg=email$Age_Group, xlab = "Age groups", ylab = "Number of answers",ylim = c(0,1))
abline(h = 0.5, v = NULL, col = "red")

#number of questions

nb_of_questions = fread("~/Documents/Survey/Overview/nb_of_questions")
nb_movie = fread("~/Documents/Survey/Overview/nb_movie")
count <- nb_movie$Number
hist(count)

nb_movie10 = subset(nb_movie, Number == 10)
nb_movie11 = subset(nb_movie, Number == 11)
nb_movie12 = subset(nb_movie, Number == 12)
nb_movie18 = subset(nb_movie, Number == 18)

