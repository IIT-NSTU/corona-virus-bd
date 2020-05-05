  population<-read.csv('population_density_bd.csv')
  for (d in levels(population$division)) {
    png(filename = paste('Population_Density_Plot_bd_',d,'.png',sep =''))
    df<-subset(population,population$division==d)
    plot(df$area.km2,df$population_thousands,main = paste('Population vs Area of Districts of ',d ,' Bangladesh',sep = ''), xlab = 'Area(sq. KM) ',
         ylab = 'Population(Thousands) ',
         col= ifelse(df$population_thousands/df$area.km2 >= 1.0, "red", ifelse(df$population_thousands/df$area.km2 <= 1.0,"green", "black")), pch = 19, cex = 2, lty = "solid", lwd = 2)
    text(df$area.km2,df$population_thousands, labels=df$district, cex= 0.7)
    abline(a=0,b=1)
<<<<<<< HEAD
    legend(1, 95, legend=c("Population to Area Ratio"), lty=1:2, cex=0.8)
    dev.off()
  }
=======
    dev.off()
  }
>>>>>>> 1cb9de0196c8f7b93b9113327389bbda382ccd49
