pokeclean <- function(poke){
  poke2 <- poke[-poke$generation %in% c("4", "5", "6", "7"), ]
  poke3 <- poke2[,-which(names(poke2) %in% c("japanese_name","classfication"))]
  return(poke3)
}
