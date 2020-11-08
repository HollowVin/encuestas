library(ggplot2)

barplot.1 <- function(datos, col.1, qualitative = TRUE, na.values = "-") {
  datos.tmp <- datos[,col.1]
  names(datos.tmp) <- c("var1")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  
  datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1)%>%  
    na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
    dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
  
  p <- ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var1))) + theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") + guides(fill = guide_legend(title = ""))
  p <- p + (if (qualitative) geom_bar(stat = "identity", position = "dodge") else geom_histogram())
  return(p)
}

barplot.2 <- function(datos, col.1, col.2, qualitative = TRUE, na.values = "-") {
  datos.tmp <- datos[,c(col.1, col.2)]
  names(datos.tmp) <- c("var1", "var2")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  
  datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2)%>%  
    na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
    dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
  
  p <- ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var1))) + theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") + guides(fill = guide_legend(title = "")) + facet_grid(. ~ var2)
  p <- p + (if (qualitative) geom_bar(stat = "identity", position = "dodge") else geom_histogram())
  return(p)
}

barplot.3 <- function(datos, col.1, col.2, col.3, qualitative = TRUE, na.values = "-") {
  datos.tmp <- datos[,c(col.1, col.2, col.3)]
  names(datos.tmp) <- c("var1", "var2", "var3")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  datos.tmp$var3[is.na(datos.tmp$var3)] <- na.values
  datos.tmp$var3 <- factor(datos.tmp$var3, ordered = TRUE)
  
  datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2, var3)%>%  
    na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
    dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
  
  p <- ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var1))) + theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") + guides(fill = guide_legend(title = "")) + facet_grid(var3 ~ var2)
  p <- p + (if (qualitative) geom_bar(stat = "identity", position = "dodge") else geom_histogram())
  return(p)
}

barplot.4 <- function(datos, col.1, col.2, col.3, col.4, qualitative = TRUE, na.values = "-") {
  datos.tmp <- datos[,c(col.1, col.2, col.3, col.4)]
  names(datos.tmp) <- c("var1", "var2", "var3", "var4")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  datos.tmp$var3[is.na(datos.tmp$var3)] <- na.values
  datos.tmp$var3 <- factor(datos.tmp$var3, ordered = TRUE)
  datos.tmp$var4[is.na(datos.tmp$var4)] <- na.values
  datos.tmp$var4 <- factor(datos.tmp$var4, ordered = TRUE)
  
  datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2, var3, var4)%>%  
    na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
    dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
  
  p <- ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var4))) + theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") + guides(fill = guide_legend(title = "")) + facet_grid(var3 ~ var2)
  p <- p + (if (qualitative) geom_bar(stat = "identity", position = "dodge") else geom_histogram())
  return(p)
}

barplot.5 <- function(datos, col.1, col.2, col.3, col.4, col.5, filter = NA, qualitative = TRUE, na.values = "-") {
  datos.tmp <- datos[,c(col.1, col.2, col.3, col.4, col.5)]
  names(datos.tmp) <- c("var1", "var2", "var3", "var4", "var5")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  datos.tmp$var3[is.na(datos.tmp$var3)] <- na.values
  datos.tmp$var3 <- factor(datos.tmp$var3, ordered = TRUE)
  datos.tmp$var4[is.na(datos.tmp$var4)] <- na.values
  datos.tmp$var4 <- factor(datos.tmp$var4, ordered = TRUE)
  datos.tmp$var5[is.na(datos.tmp$var5)] <- na.values
  datos.tmp$var5 <- factor(datos.tmp$var5, ordered = TRUE)
  
  if (!is.na(filter)) {
    datos.tmp <- datos.tmp %>% dplyr::filter(var5 == filter)
  }

  datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2, var3, var4) %>%  
    na.omit() %>% dplyr::summarise(n = dplyr::n()) %>%
    dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
  
  p <- ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var4))) + theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") + guides(fill = guide_legend(title = "")) + facet_grid(var3 ~ var2)
  p <- p + (if (qualitative) geom_bar(stat = "identity", position = "dodge") else geom_histogram())
  return(p)
}
