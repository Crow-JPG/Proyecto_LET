Datos = read.csv("C:/Users/PC/Desktop/u/LET/proyecto final/Base_de_datos_procesada.csv", header=TRUE)
Datos
plot(Datos$length,Datos$Birthweight, xlab = "Altura del bebé", ylab = "Peso del bebé", main = "Relación peso-altura", col = "red")