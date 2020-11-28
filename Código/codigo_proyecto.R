Datos = read_csv("C:/Users/PC/Desktop/u/LET/proyecto_final/Base_de_datos_sin_procesar_excell.csv")
Datos
#plot(Datos$length,Datos$Birthweight, xlab = "Altura del bebé", ylab = "Peso del bebé", main = "Relación peso-altura", col = "red")



Datos_A = Datos[,-1] #Datos_A serán mis datos modificados y aquí saco la variable ID pues no me importa identificar a los bebés en mi estudio, y puede dificultar hacer mis regresiones
Datos_A = Datos_A[,-14]
for (i in 1:length(Datos_A$LowBirthWeight)){ #Aquí transformo la variable LowBirthWeight a números
  if (Datos_A$LowBirthWeight[i]== "Low"){Datos_A$LowBirthWeight[i] = 0}
  if (Datos_A$LowBirthWeight[i]== "Normal"){Datos_A$LowBirthWeight[i] = 1}
}
Datos_A2 = Datos_A[,-1]
Datos_A2 = Datos_A2[,-1]
Datos_A2 = Datos_A2[,-1]

write.csv(Datos_A, file = "Datos_Actualizados1.csv")
write.csv(Datos_A2, file = "Datos_Actualizados2.csv")

#Datos_A2 es una versión con menos variables pues creo que no son rasgos externos que afecten al bebé

regresion_fumador = lm(LowBirthWeight ~ smoker, data = Datos_A)
regresion_cigarros_madre = lm(LowBirthWeight ~ mnocig, data = Datos_A)
regresion_cigarros_padre = lm(LowBirthWeight ~ fnocig, data = Datos_A)
regresion_todo = lm(LowBirthWeight ~ ., data = Datos_A)
regresion_util = lm(LowBirthWeight ~ ., data = Datos_A2)

plot(regresion_fumador)
plot(regresion_cigarros_madre)
plot(regresion_cigarros_padre)
plot(regresion_todo)
plot(regresion_util)
