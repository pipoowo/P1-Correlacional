pacman::p_load(tidyverse, # Manipulacion de datos
               car, # Recodificar
               sjPlot, # Tablas y graficos
               sjmisc, # Descriptivos
               kableExtra, # Tablas
               psych, # Bivariados
               corrplot, # Graficos correlacioj
               broom) # Varios

options(scipen = 999) # para desactivar notacion cientifica
rm(list = ls()) # para limpiar el entorno de trabajo

load(url("https://github.com/cursos-metodos-facso/datos-ejemplos/raw/refs/heads/main/dataset4.RData")) # base de datos a utilizar

summary(dataset4)
frq(dataset4$sexo)
