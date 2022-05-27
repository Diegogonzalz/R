#introduccion a R y R-studio

#Clase 1 

#Variables en R

#a) operaciones aritmeticas 
#b) variable a un script en EStudio
#c) identificar datos

#ejercicio a(aritmetica):
1+1-1*(1+1-1)/1+1*(-1)

#ejemplo b (variables):
naranjo <- 10
roja <- 5
verde <- 15

#sol:
resultado <- 2*verde + 4*roja + 1.5*naranjo

resultado

#ejemplo c (tipo de dato):
class(resultado)

nombre <- "Diego"
class(nombre)

1 > 2
class(1>2)

#error:
nombre + resultado


#clase 2

#vectores en R

#a) vectores con script
#b) operaciones aritmeticas
#c) seleccionar elementos de un vector

#ejercicio a (crear vectores):

nombre <- c("shrek", "shrek 2", "shrek 3", "shrek: felices por siempre")
puntuacion <- c(7.9, 7.2, 6.1, 6.3)

posteriro_2005 <- c(FALSE, F, TRUE, T)

nombre
puntuacion
posteriro_2005

#ejercicio b (operar):
puntuacion + 2
puntuacion/2
puntuacion_Diego <- c(10, 9, 6, 7)
puntuacion_Diego - puntuacion

#longitud:
length(puntuacion)

#promedio:
mean(puntuacion)

#ejemplo c (elementos especificos):
nombre[3]
nombre[c(1, 4)]
puntuacion_baja <- puntuacion < 7
puntuacion_baja #logico(TRUE o FALSE)

puntuacion[puntuacion_baja] #numerica

nombre[puntuacion_baja] #caracter


#clase 3

#matrices en R

#a) crear matrices 
#b) operaciones
#c) seleccionar elementos de una matriz

#ejemplo a (crear matriz):
matrix(data,        #contenido
       nrow = 1,    #fila
       ncol = 1)    #columnas

#crear vectores para columnnas de la matriz
warner <- c(20, 20, 16, 17, 17, 22, 17, 18, 19)
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)
fox <- c(18, 15, 15, 15, 16, 17, 15, 13, 11)

peliculas <- matrix(c(warner, disney, fox),
                    nrow = 9,
                    ncol = 3)
peliculas
#matriz sin nombres de fila o columna 

#agregar nombre de columnas y filas
colnames(peliculas) <- c("warner", "disney", "fox")
rownames(peliculas) <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")

peliculas

#ejemplo b (operaciones):
peliculas - 5
peliculas + peliculas
peliculas * peliculas

#ejemplo c (elementos):
peliculas[3, 2]
peliculas["2012", "disney"]

#mas de un elemento
peliculas[c(3, 4), c(2, 3)]
peliculas[c(3, 4), c("disney", "fox")]

#seleccion fila
peliculas[3, ]
peliculas["2012", ]

#seleccion columna
peliculas[, 2]
peliculas[, "disney"]


#clase 4

#factores en R

#a) crear factores
#b) recodificar niveles de un factor
#c) ordenar niveles de un factor

#ejemplo a (crear factores):
#crear vector de ventas
tallas <- c("m", "g", "s", "s", "m", "M")

#graficar (error)
plot(tallas)

#utilizando factor factor()
tallas_factor <- factor(tallas)

#graficar sin error
plot(tallas_factor)

#mirar niveles de factor
levels(tallas_factor)


#ejemplo b (recodificar nivel de factor):
tallas_recodificado <- factor(tallas,
                              levels = c("g", "m", "M", "s"),
                              labels = c("G", "M", "M", "S"))
plot(tallas_recodificado)


#ejemplo c (ordenar):
tallas_ordenadas <- factor(tallas,
                           ordered = T,
                           levels = c("s", "m", "M", "g"),
                           labels = c("S", "M", "M", "G"))
plot(tallas_ordenadas)


#clase 5 

#dataframe

#a) crear dataframe
#b) seleccionar elementos de un dataframe
#c) ordenar dataframe por columnas

#ejemplo a (dataframe):
nombre <- c("Shrek", "Shrek 2", "Shrek 3", "Shrek: Felices por siempre")
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
posterior_2005 <- c(FALSE, FALSE, TRUE, TRUE)

#crear dataframe de vectores
peliculas_df <- data.frame(nombre,
                           puntuacion,
                           posterior_2005)

peliculas_df

#cambiar el nombre de dataframe
names(peliculas_df) <- c("NOMBRE", 
                         "PUNTUACION", 
                         "POSTERIOR_2005")
peliculas_df

#ejemplo b (seleccionar elementos):
peliculas_df[3, 2]
peliculas_df[3, "PUNTUACION"]

#seleccionar mas de un elemento en el dataframe
peliculas_df[c(3, 4), c(2, 3)]
peliculas_df[c(3, 4), c("PUNTUACION", "POSTERIOR_2005")]  

#sleleccionar fila o columna dataframe
peliculas_df[3, ]
peliculas_df[, 2]
peliculas_df[, "PUNTUACION"]

# $ seleccionar
peliculas_df$PUNTUACION

#ejemplo c (ordenar):
peliculas_df

#segun puntuacion mostrar indices de columna puntuacion
order(peliculas_df$PUNTUACION)

#ordenar de menor a mayor
orden_menor_mayor <- order(peliculas_df$PUNTUACION,
                           decreasing = F)
peliculas_df[orden_menor_mayor, ]

#mamyor a menor 
orden_menor_mayor <- order(peliculas_df$PUNTUACION,
                           decreasing = T)
peliculas_df[orden_menor_mayor, ]

#para guardar dataframe ordenado
df_ordenado <- peliculas_df[orden_menor_mayor, ]
df_ordenado


#clase 6

#listas en R

#a) crear listas
#b) seleccionar elementos de una lista
#c) agregar/eliminar elementos de una lista 

#ejemplo a (listas):
nombre <- c("Shrek", "Shrek 2", "Shrek Tercero", "Shrek: Felices por siempre")
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
posterior_2005 <- c(FALSE, FALSE, TRUE, TRUE)

warner <- c(20, 20, 16, 17, 17, 22, 17, 18, 19)
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)
fox <- c(18, 15, 15, 15, 16, 17, 15, 13, 11)

# crear diferentes estructuras de datos en R
vector_titulos <- nombre
matriz_peliculas <- matrix(c(warner, disney, fox),
                           nrow = 9,
                           ncol = 3)
peliculas_df <- data.frame(nombre,
                           puntuacion,
                           posterior_2005)

#crear lista
lista_curso <- list(vector_titulos,
                    matriz_peliculas)

lista_curso

#cambiar nombre de dataframe
names(lista_curso) <- c("vector",
                        "matriz")

#ejemplo b (seleccionar elementos):
#seleccionar vector de la lista
lista_curso[["vector"]]

#seleccionar el tercer elemento del vector de la lista
lista_curso[["vector"]][3]

#seleccionar fila 5 y columna 3 de la matriz de la lista
lista_curso[["matriz"]][5, 3]


#ejemplo c (agregar/eliminar):
#agregar dataframe a la lista
lista_curso[["data_frame"]] <- peliculas_df

lista_curso

#eliminar un elemento
lista_curso[["vector"]] <- NULL

lista_curso




#FIN T1
#https://www.youtube.com/c/RafaGonzalezGouveia
#muy buen curso 