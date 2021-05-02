library(ggplot2)
library(ggmosaic)
library(vcd)
library(viridis)

filter_data <- function(data, variable, value) {
  if (!is.na(variable) && !is.na(value)) {
    return(dplyr::filter(data, get(variable) %in% c(value)))
  } else {
    return(data)
  }
}

colors <- function(color) {
  palette <- viridis(256, option = color)
  return(c(palette[1], palette[length(palette)]))
}

barplot.1 <- function(datos, col.1, qualitative = TRUE, filter_variable = NA, filter_value = NA, na.values = "-", color = "D") {
  filtered <- filter_data(datos, filter_variable, filter_value)
  datos.tmp <- filtered[,col.1]
  names(datos.tmp) <- c("var1")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values

  if (qualitative) 
  {
    datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
    datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1)%>%  
      na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
      dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))

    return(
      ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = var1)) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_viridis(discrete = TRUE, option = color) +
        theme(axis.text.x = element_text(angle = 90)) +
        labs(x = "", y = "%") +
        guides(fill = guide_legend(title = ""))
    )
  }
  
  else
  {
    viridis <- colors(color)
    return(
      ggplot(datos.tmp, aes(x = as.numeric(var1), fill = ..x..)) +
        geom_histogram() +
        scale_fill_gradient(low = viridis[1], high = viridis[2]) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "") +
        guides(fill = guide_legend(title = ""))
    )
  }
}

barplot.2 <- function(datos, col.1, col.2, qualitative = TRUE, filter_variable = NA, filter_value = NA, na.values = "-", color = "D") {
  filtered <- filter_data(datos, filter_variable, filter_value)
  datos.tmp <- filtered[,c(col.1, col.2)]
  names(datos.tmp) <- c("var1", "var2")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  
  if (qualitative) 
  {
    datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2)%>%  
      na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
      dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))

    return(
      ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var1))) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_viridis(discrete = TRUE, option = color) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(. ~ var2)
    )
  }
  
  else
  {
    viridis <- colors(color)
    return(
      ggplot(datos.tmp, aes(x = as.numeric(var1), fill = ..x..)) +
        geom_histogram() +
        scale_fill_gradient(low = viridis[1], high = viridis[2]) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(. ~ var2)
    )
  }
}

barplot.3 <- function(datos, col.1, col.2, col.3, qualitative = TRUE, filter_variable = NA, filter_value = NA, na.values = "-", color = "D") {
  filtered <- filter_data(datos, filter_variable, filter_value)
  datos.tmp <- filtered[,c(col.1, col.2, col.3)]
  names(datos.tmp) <- c("var1", "var2", "var3")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  datos.tmp$var3[is.na(datos.tmp$var3)] <- na.values
  datos.tmp$var3 <- factor(datos.tmp$var3, ordered = TRUE)
  
  if (qualitative)
  {
    datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2, var3)%>%  
      na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
      dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
    
    return(
      ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var1))) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_viridis(discrete = TRUE, option = color) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(var3 ~ var2)
    )
  }
  
  else
  {
    viridis <- colors(color)
    return(
      ggplot(datos.tmp, aes(x = as.numeric(var1), fill = ..x..)) +
        geom_histogram() +
        scale_fill_gradient(low = viridis[1], high = viridis[2]) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(var3 ~ var2)
    )
  }
}

barplot.4 <- function(datos, col.1, col.2, col.3, col.4, qualitative = TRUE, filter_variable = NA, filter_value = NA, na.values = "-", color = "D") {
  filtered <- filter_data(datos, filter_variable, filter_value)
  datos.tmp <- filtered[,c(col.1, col.2, col.3, col.4)]
  names(datos.tmp) <- c("var1", "var2", "var3", "var4")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  datos.tmp$var3[is.na(datos.tmp$var3)] <- na.values
  datos.tmp$var3 <- factor(datos.tmp$var3, ordered = TRUE)
  datos.tmp$var4[is.na(datos.tmp$var4)] <- na.values
  datos.tmp$var4 <- factor(datos.tmp$var4, ordered = TRUE)
  
  if (qualitative)
  {
    datos.tmp.2 <- datos.tmp %>% dplyr::group_by(var1, var2, var3, var4)%>%  
      na.omit() %>% dplyr::summarise(n = dplyr::n())%>%
      dplyr::mutate(frecuencia = round(100 * n / sum(n), 2))
    
    return(
      ggplot(datos.tmp.2, aes(x = var1, y = frecuencia, fill = factor(var4))) +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_viridis(discrete = TRUE, option = color) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(var3 ~ var2)
    )
  }
  
  else
  {
    viridis <- colors(color)
    return(
      ggplot(datos.tmp, aes(x = as.numeric(var1))) +
        geom_histogram() +
        scale_fill_gradient(low = viridis[1], high = viridis[2]) +
        theme(axis.text.x = element_text(angle = 90)) + labs(x = "", y = "%") +
        guides(fill = guide_legend(title = "")) +
        facet_grid(var3 ~ var2)
    )
  }
}

mosaic.plot <- function(datos, col.1, col.2, na.values = "-") {
  datos.tmp <- datos[,c(col.1, col.2)]
  names(datos.tmp) <- c("var1", "var2")
  
  datos.tmp$var1[is.na(datos.tmp$var1)] <- na.values
  datos.tmp$var1 <- factor(datos.tmp$var1, ordered = TRUE)
  datos.tmp$var2[is.na(datos.tmp$var2)] <- na.values
  datos.tmp$var2 <- factor(datos.tmp$var2, ordered = TRUE)
  
  SD<- structable(var1 ~ var2, data = datos.tmp)
  vcd::mosaic(SD, shade = TRUE,
         labeling = labeling_values,#,labeling_residuals
         split_vertical = c(TRUE, FALSE),
         spacing = spacing_dimequal(c(0.3,0.3)),
         labeling_args = list(abbreviate_labs = 12,
                              gp_labels = gpar(fontsize = 8),
                              varnames=c(FALSE,FALSE),
                              rot_labels=c(90,0,90,0),
                              just_labels = c("left", "right")))
  #ggplot(datos.tmp) + geom_mosaic(aes(x = product(var1, var2), fill = var1))
}
