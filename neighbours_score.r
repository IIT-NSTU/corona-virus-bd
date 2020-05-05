population<-read.csv(file='may_04_n_zero.csv')
districts<-population$district
d_no<-population$D_No
neighbours_zero<-population$N_ZERO
may_04_cases<-population$May_04
neighbours_zero_may_04_cases<-population$neighbours_zero_may_04_cases
for (d in levels(population$division)) {
  #kkkkkkkkkkkkkkkkkkk

  png(filename = paste('may_04_n_zero_plot_stack_div_',d,'.png',sep =''))
  df<-subset(population,population$division==d)
  score<-rbind(df$May_04,df$neighbours_zero_may_04_cases)
  print(d)
  print(score)
  barplot(height=score,
          main = paste('COVID-19 Total Cases of Districts of ',d,' Divisions',sep = ''),
          ylab = 'Total Cases (Own+NeighboursZero)',names.arg = df$district,
          sub='May-04-2020',horiz = FALSE, cex.names = 0.7, las=2,beside = FALSE)
  #polygon(a_x,a_y,col = 'green')
  dev.off()
}