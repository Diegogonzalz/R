#introduccion2 a R y R-studio

#clase 1

#instalar paquetes en R

#a) ¿Que es?
#b) instalar paquetes
#c) cargar paquetes instalados

#ejemplo a (Que es) --> muchos paquetes juntos: 
#-funciones de R
#-codigo
#-datos

#repositorios:
#-CRAN
#-GitHub
#-Bioconductor

#ejemplo b (instalar):

install.packages("ggplot2")

#ejemplo c (cargar):

library(ggplot2)


#Clase 2

#importar datos de Excel a R

#a) ¿Que se necesita?
#b) como importar datos con codigo R
#c) como importar datos con interfaz de RStudio NO necesario

#ejemplo a (antes de):
#instalar readxl 
install.packages("readxl")
library(readxl)

#ejemplo b (importar daos con R):
#conocer la ruta o path
file.choose()

#copiamos la ruta y la guardamos como una variable
ruta_excel <- "C:\\Users\\crisc\\OneDrive\\Escritorio\\Mis Estudios\\Año 2022\\Estadisticas\\R\\gapminder_importar_a_r.xlsx"

#manipular
#mirar las hojas de excel
excel_sheets(ruta_excel)

#importar datos caso ideal
caso_ideal <- read_excel(ruta_excel)

head(caso_ideal)
#con una estructura llamada tibbel = dataframe

#importar datos no estan en la primera hoja caso medio 
caso_medio <- read_excel(ruta_excel,
                         sheet = "Hoja2")
caso_medio

#importar datos no estan en hoja1 y no empiezan en A1 caso dificil
final_boss <- read_excel(ruta_excel,
                         sheet = "Hoja3",
                         range = "C7:F17")
final_boss


#clase 3

#graficar con R

#a) como se grfica con click vs con codigo
#b) graficar con R base graphics
#c) otros paquetes para graficar en R

# pag Web con galeria de visualizaciones 
https://r-graph-gallery.com/
  
#ejemplo a (graficar con click o codigo):
# datos de la primera parte
year <- c('2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018')
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)

#graficar con codigo
plot(x = year,
     y = disney)

#ejemplo b (base graphics):
plot(x = year,
     y = disney,
     main = "disney",
     xlab = "",
     ylab = "",
     col = "cornflowerblue",
     pch = 16,
     panel.first = grid())
#ejemplo c (mas funciones):
#-barplot() grafico de barras
#-hist() 
#-pie() grafico circular

#ggplot2 usa la gramatica de los grafico
#graficar con ggplot2
install.packages("ggplot2")
library(ggplot2)

#hacer dataframe
peliculas <- data.frame(year,
                        disney)
#graficar
ggplot(data = peliculas,
       mapping = aes(x = year,
                     y = disney))+
  geom_point()+
  labs(title = "disney")

#otros paquetes
#-Flexdashboard (simples)
#-RGL (3D)
#-Plotly (interactivo)
#-Leaflet (mapas)
#-RColorBrewer (manejo de color avanzado)
#-Shiny (app web)
#Highcharter
#-Dygraphs
#-sunburstR
#-Lattice
#-Ggvis

#clase 4

#histograms en R

#a) ¿Que son?
#b) histogramas con base graphics
#c) histograma con ggplot2

#ejemplo a (que es):
#grafico de barras con distribucion de frecuencia 
#identificar outlier (datos atipicos)

#ejemplo b (base graphics simple):
#cargar datos
data("mtcars")

#funcion hist()
hist(mtcars$hp)

#editar histograma
hist(mtcars$hp,
     #breaks = 10
     breaks = seq(50, 350, 50),
     col = "darkgray",
     border = "gray10",
     main = "titulo",
     xlab = "variable x",
     ylab = "conteo")

#ejemplo c (ggplot2)
library(ggplot2)

#hacer histograma en ggplot2
ggplot(data = mtcars,
       mapping = aes(x = hp))+
  geom_histogram(bins = 9)

#mas
ggplot(data = mtcars,
       mapping = aes(x = hp,
                     fill = factor(vs)))+
  geom_histogram(bins = 9,
                 position = "identity",
                 alpha = 0.8)+
  labs(title = "titulo",
       fill = "vs motor",
       x = "caballos de fuerza",
       y = "conteos",
       subtitle = "subtitulo",
       caption = "fuente de los datos: R")


#clase 5

#grafico de barras en R

#a) ¿Que son?
#b) grafico de barras con base graphics 
#c) grafico de barras con ggplot2

#ejemplo a (que es):
#utilizan variables categoricas, 
#la altura es prporcional al valor de la medida que representa

data("mtcars")
head(mtcars)

#ejemplo b (graphics):
#generar tabla agrupada
table(mtcars$cyl)

#grafica de barras basica
barplot(table(mtcars$cyl))

#grafica de barras editada
barplot(table(mtcars$cyl),
        horiz = T,
        col = "green",
        border = "red",
        main = "grafica de barras",
        sub = "subtitulo",
        xlab = "cilindros",
        ylab = "cantidad")

#ejemplo c (ggplot2):
#cargar ggplot2
library(ggplot2)

#grafica de barras basica horizontal
ggplot(data = mtcars,
       mapping = aes(x = factor(cyl)))+
  geom_bar()+
  coord_flip()

#grafica guardada en variable 
p <- ggplot(data = mtcars,
            mapping = aes(x = factor(cyl),
                          fill = factor(gear)))

#stacked bar chart (grafico de barras apiladas)
p + geom_bar(position = "stack", stat = "count")

#dodge bar chart (grafico de barras esquiva)
p + geom_bar(position = "dodge", stat = "count")

#stacked + percent barchart (grafico de barras apilado + porcentaje)
p + geom_bar(position = "fill", stat = "count")



#clase 6

#importar archivos csv a R

#a) antes de empezar 
#b) como importar datos con codigo R
#c) importar con interfaz de RStudio

#ejemplo a (antes de):
#csv es un archivo de texto 
#con columnas separadas por comas (,)
#con una fila en cada linea 
#csv = comma sepparated values

#ejemplo b (importar con codigo R):
#paquete readr -> csv 
#cargar paquete
library(readr)

#ruta del arcchivo de csv
file.choose()

#guardamos la ruta en una variable
ruta_csv <- ("C:\\Users\\crisc\\OneDrive\\Escritorio\\Mis Estudios\\Año 2022\\Estadisticas\\R\\gapminder.csv")

#para leer datos csv funcion read_csv
#importar datos gapminder
gapminder <- read_csv(ruta_csv)
gapminder

#otro caso en el que no tiene titulos (se agregara x1 para cada titulo)
file.choose()
ruta_sintitulo <- "C:\\Users\\crisc\\OneDrive\\Escritorio\\Mis Estudios\\Año 2022\\Estadisticas\\R\\gapminder_col_names.csv"
gapminder_sintitulo <- read_csv(ruta_sintitulo,
                                col_names = F)
gapminder_sintitulo
#para agregar nombre a los titulos
gapminder_sintitulo <- read_csv(ruta_sintitulo,
                                col_names = c("pais",
                                              "año",
                                              "vida",
                                              "poblacion"))
gapminder_sintitulo

#para el caso de que vengan los datos separados por punto coma (;)
file.choose()
ruta_puntocoma <- "C:\\Users\\crisc\\OneDrive\\Escritorio\\Mis Estudios\\Año 2022\\Estadisticas\\R\\gapminder_puntoycoma.csv"
gapminder_puntocoma <- read_csv2(ruta_puntocoma)
gapminder_puntocoma

gapminder_puntocoma <- read_csv2(ruta_puntocoma,
                                col_names = c("pais",
                                              "año",
                                              "vida",
                                              "poblacion"))
gapminder_puntocoma

#ejemplo c (por interfaz):
#File -> import dataset -> from text(readr)...


#Fin...
#gua de estilo R
https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbEhZRmlXeU4tLVpoWWdDNE85SGtLYW81d1lNUXxBQ3Jtc0trVC0xcDBPUWhlblpYNFhOck1MRUVodHB2RGFlUUJhMjJRbDM0YjA0WFgyQnN6dHF4WVE2Wk5naFlXR2c4ZjhubGs4cEg0UTBoQURMeXVzMkFHM2tOam1VSFpMSnlFUTlsaHRrY0J4ajhSbEx3eFFfNA&q=https%3A%2F%2Fstyle.tidyverse.org%2FDatos&v=P6-X2DjENaU

#datos atipicos
https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbU5kdW81MFE2X3ludWh5eE1aYlF1MEJlLVhFQXxBQ3Jtc0ttRldFVHRrcmw4SFVOck5MU2c5NzhTNW90SnZHbEVOV2k4dDlDM1hIWWIxYUZ2S3J2ckxWNG9sa0loeTNXamtVd1U3aE5GRktfLTY0RWN0Uk5RYVVNZ2dQLVMyMDFfc2ZkSV91U3doT1hrYkpGd0xyUQ&q=http%3A%2F%2Frpubs.com%2FMentors_Ubiqum%2Fremoving_outliers&v=P6-X2DjENaU
#Shiny app web interactiva 
https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbEQxVDlQU3MyRDd1T3BKaEREdFlPQlZxRTBfQXxBQ3Jtc0ttMnRLLUFKZ1lLT3h3Zmp1R0xCTUlVSktiWVhnejg3WjR4cDdMZHZXOWF1dm8tT1Rhbi01bTJiNkVCZ1hTYURfc3c0M0dHd2ZHUGJMYlQxd0pPNkZXVVZ6eURNZk04VVVacEZzNVdyTGNCdXBZWU9DOA&q=https%3A%2F%2Fwww.r-bloggers.com%2Flang%2Fspanish%2F2818&v=P6-X2DjENaU

#instalar shiny
install.packages("shiny")
library(shiny)
runExample("01_hello")
