#Cargar librerías 
library(tidyverse)
library(tidymodels)
library(broom)

#Cargar y mirar los datos 
library(faraway)
glimpse(gala)

#Ajustar un modelo lineal 
model_fit <- lm(Species ~ Elevation, data=gala) 

#Construir un tibble para resumir información estadística sobre el ajuste del modelo
tidy(model_fit) 

#Construir un resumen de otras informaciones relacionadas al ajuste del modelo
glance(model_fit)

#Agregar columnas con información relacionada a los datos que se modelaron
augment(model_fit)

#Graficar el ajuste del modelo
info_fit<-
  augment(model_fit) 

info_fit %>% 
  ggplot(aes(x=Elevation,y=Species))+ 
  geom_jitter(alpha=.2)+
  geom_line(aes(x=Elevation,y=.fitted))+
  theme_bw()


