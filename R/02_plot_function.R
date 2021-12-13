
pokebytype <- as.data.frame(table(poke$type1))
colnames(pokebytype)[colnames(pokebytype)=="Var1"] <- "type"
poke$generation <- as.factor(poke$generation)
poke <- poke[complete.cases(poke$weight_kg), ]
poke <- poke[-which(poke$weight_kg < quantile(poke$weight_kg, probs = c(0.05, 0.95))[[1]]),]
poke <- poke[-which(poke$weight_kg > quantile(poke$weight_kg, probs = c(0.05, 0.95))[[2]]),]


library(ggplot2)  
#' This function take as input 
#'
#' @return
#' @export
#'
#' @examples
pokeplot <- function(){
#Plot frequence of each type
p1 <- ggplot(pokebytype, aes(x=type, y=Freq)) +
  geom_bar(stat="identity", fill="steelblue") +
  theme_bw()
#Plot correlation between weight and attack
p2 <- ggplot(poke, aes(x=weight_kg, y=attack, color=generation, shape=generation)) +
  geom_point() + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)
#Merge both graphs
p3 <- ggpubr::ggarrange(p1, p2, ncol = 1, nrow = 2)
#Save image
ggsave(filename="02_plot_function_general_plot.png", 
       plot=p3, 
       path = here::here("outputs/"), 
       width=2500, height=2500, units="px",
       bg = NULL)
}

