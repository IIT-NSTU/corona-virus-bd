population<-read.csv(file='may_04_n_zero.csv')
districts<-population$district
d_no<-population$D_No
neighbours_zero<-population$N_ZERO
may_04_cases<-population$May_04

for (d in levels(population$division)) {
#  png(filename = paste('may_04_n_zero_plot_div_',d,'.png',sep =''))
  df<-subset(population,population$division==d)
  max_x<-max(df$May_04)
  max_y<-max(df$neighbours_zero_may_04_cases)
  neighbour_to_own_ratio<-df$neighbours_zero_may_04_cases/df$May_04
  plot(df$May_04,df$neighbours_zero_may_04_cases,main = paste('COVID-19 Total Cases of Districts vs Neighbours of ',d ,' Division',sep = ''),sub ='May-04-2020', xlab = 'Total Cases of Own',
       ylab = 'Total Cases of Neighbours(N=0)',
       col= 'red',xlim = c(-5,max_x+10),ylim=c(-5,max_y+10),
       pch = 10, cex = 1, lty = "solid", lwd = 2)
  #polygon(a_x,a_y,col = 'green')
  text(df$May_04+1,df$neighbours_zero_may_04_cases, labels=paste(df$district,df$May_04,df$neighbours_zero_may_04_cases,sep = ','), cex= 0.7)
  dev.off()
}