```{r setup, include=FALSE, echo=FALSE}
knitr::opts_chunk$set(echo = TRUE)
library(readr)
```

| Nombre           | Tipo     | Explicación                                        | Medida   |
|------------------|----------|----------------------------------------------------|----------|
| ID               |          | número de identificación del bebé                  |          |
| length           | Numérica | largo del bebé                                     | Pulgadas |
| Birthweight      | Numérica | peso del bebé                                      | Libras   |
| headcirumference | Numérica | circunferencia de la cabeza del bebé               | Pulgadas |
| Gestation        | Numérica | tiempo de gestación del bebé                       | Semanas  |
| smoker           | Binaria  | si la madre fuma es 1, si no, es 0                 |          |
| motherage        | Numérica | edad de la madre al parir                          | Años     |
| mnocig           | Numérica | número de cigarros fumados por día por la madre    |          |
| mheight          | Numérica | altura de la madre                                 | Pulgadas |
| mppwt            | Numérica | peso de la madre antes del embarazo                | Libras   |
| fage             | Numérica | edad del padre                                     | Años     |
| fedyrs           | Numérica | tiempo que el padre estuvo en el sistema educativo | Años     |
| fnocig           | Numérica | numero de cigarros fumador por día por el padre    |          |
| fheight          | Numérica | altura del padre                                   | pulgadas |
| lowbwt           | Binaria  | si el bebé está bajo peso al nacer es 1, si no, 0  |          |
| mage35           | Binaria  | si la madre tiene más de 35 años, es 1, si no, 0   |          |

```{r}
Datos = read_csv("C:/Users/PC/Desktop/u/LET/proyecto_final/Base_de_datos_sin_procesar_excell.csv")
Datos_A = Datos[,-17]
Datos_A = Datos_A[,-1]
Datos_A = Datos_A[,-15]
nombres = c("Circunferencia_Cabeza", "Largo", "Peso", "Gestación", "Madre_Fumadora", "Edad_Madre", "Cigarrillos_Madre", "Altura_Madre", "Peso_Madre", "Edad_Padre", "Años_Educación_Padre", "Cigarrillos_Padre", "Altura_Padre", "Peso_Bajo_Bebé")
names(Datos_A) = nombres
Datos_A2 = cbind(Datos_A[,1:14])
Datos_A3 = Datos_A2[,-1]
Datos_A3 = Datos_A3[,-1]
Datos_A3 = Datos_A3[,-1]
Padre_Fumador = c()
for (i in 1:length(Datos_A$Madre_Fumadora)){
  if (Datos_A$Cigarrillos_Padre[i]== 0){Padre_Fumador[i] = 0}
  if (Datos_A$Cigarrillos_Padre[i] > 0){Padre_Fumador[i] = 1}
}
nombre = "Padre_Fumador"
names(Padre_Fumador) = nombre
Datos_A3 = cbind(Datos_A3,Padre_Fumador)
Max_Cigarrillos_Madre = max(Datos_A3$Cigarrillos_Madre)
Datos_A3$Cigarrillos_Madre = Datos_A3$Cigarrillos_Madre/Max_Cigarrillos_Madre
Max_Cigarrillos_Padre = max(Datos_A3$Cigarrillos_Padre)
Datos_A3$Cigarrillos_Padre = Datos_A3$Cigarrillos_Padre/Max_Cigarrillos_Padre
padres_fumadores = 0
madres_fumadoras = 0
for (i in 1:length(Datos_A$Madre_Fumadora)){
  if (Datos_A3$Padre_Fumador[i]== 1){padres_fumadores = padres_fumadores + 1}
  if (Datos_A3$Madre_Fumadora[i]== 1){madres_fumadoras = madres_fumadoras + 1}
}
write.csv(Datos_A, file = "Datos_Actualizados1.csv")
write.csv(Datos_A2, file = "Datos_Actualizados2.csv")
write.csv(Datos_A3, file = "Datos_Actualizados3.csv")
```
