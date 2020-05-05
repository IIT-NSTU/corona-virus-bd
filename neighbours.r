population<-read.csv(file='population_density_bd.csv')
districts<-population$district
d_no<-population$D_No
neighbours_zero<-population$N_ZERO
may_04_cases<-population$May_04
neighbours_zero_may_04_cases<-c()
for (d in d_no) {
  print(districts[d])
  print(neighbours_zero[d])
  ns <- (stringr::str_split(neighbours_zero[d],'-'))
  ns_score <-0
  for (n in ns[[1]]) {
    if(n!='0'&&n!='65'&&n!='66'){
      d_n <- as.integer(n)
      ns_score<-ns_score + may_04_cases[d_n]
    }
  }
  print(ns_score)
  neighbours_zero_may_04_cases<-c(neighbours_zero_may_04_cases,ns_score)
}
population<-cbind(population,neighbours_zero_may_04_cases)
write.csv(population,file = 'may_04_n_zero.csv')