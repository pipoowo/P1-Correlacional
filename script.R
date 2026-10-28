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

summary(dataset4$apoyo_dem)
frq(dataset4$sexo)

colSums(is.na(dataset4))

# EJERCICIO 1: ASOCIACIÓN
## Asociación 2 variables: correlación.
## Correlación de Pearson
## Haremos C. de Pearson porque las v. de ingresos y apoyo a la dem. son cuantitativas.

cor.test(dataset4$apoyo_dem, dataset4$ingresos, method = "pearson") # -1 al 1

## Inferencia: diferencia a nivel población, estadísticamente significativo
## Correlación: asociación, significancia (valor-t; valor-p), la magnitud de efecto y la dirección
## 0.05 (95%; *); 0.01 (99%; **) y 0.001 (99.9%; ***)
## magnitud de efecto: criterios de Cohen, muy pequeña (0.1); pequeña (0.1 a 0.3); mediana (0.3 a 0.5); grande (0.5 a 1)
## dirección: + (relación pos. /) y - (relación negativa \)

sjPlot::plot_scatter(data = dataset4, x = ingresos, y = apoyo_dem)

datos_matriz <- dataset4 %>% 
  dplyr::select(apoyo_dem, ingresos, ingresos_rec)

colSums(is.na(datos_matriz)) ## 15%

## Listwise: 1 NA --> eliminamos a Pepito
## Pairwise: 1 NA --> solamente las correlaciones entre los pares de variables disponibles
## 10%: Si los casos perdidos son menores al 10% --> listwise; si no pairwise

sjPlot::tab_corr(datos_matriz,
                 na.deletion = "pairwise", 
                 triangle = "lower")

# Ejercicio 3
## Sexo: dicotómica y nivel de ingresos: nominal politómica; Chi2

dataset4 %>%
  sjPlot::sjtab(sexo,
                ingresos_rec,
                show.row.prc = TRUE, # porcentaje fila
                show.col.prc = TRUE, # porcentaje columna
                )

matriz <- cep_proc %>% select(edad_dico, educ_dico) # creamos matriz con var de interes

x <- chisq.test(dataset4$sexo, dataset4$ingresos_rec)
x

