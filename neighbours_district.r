population<-read.csv(file='population_density_bd.csv')
districts<-population$district
d_no<-population$D_No
neighbours_zero<-population$N_ZERO
may_04_cases<-population$May_04
for (d in d_no) {
  png(filename = paste('may_04_n_zero_plot_dist_', districts[d], '.png',sep=''))
  print(districts[d])
  print(neighbours_zero[d])
  ns <- (stringr::str_split(neighbours_zero[d],'-'))
  ns_score <-c(may_04_cases[d])
  ns_values<-as.character(districts[d])
  for (n in ns[[1]]) {
    if(n!='0'&&n!='65'&&n!='66'){
      d_n <- as.integer(n)
      ns_score<-c(ns_score, may_04_cases[d_n])
      ns_values<-c(ns_values, as.character(districts[d_n]))
    }
  }
  print(ns_values)
  print(ns_score)
  barplot(height=ns_score, main = paste('COVID-19 Total Cases of ',districts[d],' and Neighbouring Districts',sep = ''),
      ylab = 'Total Cases', names.arg = ns_values, col = ifelse(ns_values==districts[d],'blue','grey'),
       sub='May-04-2020',horiz = FALSE, cex.names = 0.7, las=2,
      ylim=c(0,max(ns_score)+10))
  dev.off()
}