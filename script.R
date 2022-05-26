# Proyecto econometria intermedia

rm(list=ls())

setwd('C:/Users/Sebastian/Desktop/Documento UR/2022 S1(Coterminal)/Temas en econometria/Proyecto')

library(lmtest) # Para hacer la correccion y mostrar el 'z estadistico'
library(sandwich) #Correccion de errores robustos
library(foreign)

Panel <- read.csv("Panel_datos_proyecto.csv",)
Panel<-Panel[-1]
departamentos_niveles <- c('BOGOTÁ D.C.', 'AMAZONAS', 'ANTIOQUIA', 'ARAUCA', 'VAUPÉS', 'BOLÍVAR', 
                           'BOYACÁ', 'CALDAS', 'CAQUETÁ', 'CASANARE', 'CAUCA','CESAR','CHOCÓ',
                           'CUNDINAMARCA', 'CÓRDOBA', 'GUAINÍA', 'GUAVIARE','HUILA', 
                           'LA GUAJIRA', 'MAGDALENA', 'META', 'NARIÑO','NORTE DE SANTANDER', 
                           'PUTUMAYO', 'QUINDÍO', 'RISARALDA', 'SANTANDER', 'SUCRE', 'TOLIMA', 
                           'VALLE DEL CAUCA', 'VICHADA','EXTERIOR','SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA (ARCHIPIÉLAGO)',
                           'ATLÁNTICO')
Panel$depto<-factor(Panel$depto,levels=departamentos_niveles)
Panel$Iniciativa_Ataques_Belicos<-as.factor(Panel$Iniciativa_Ataques_Belicos)
Panel$gp_res_atentados_terr<-as.factor(Panel$gp_res_atentados_terr)
Panel$gp_res_masacre<-factor(Panel$gp_res_masacre,levels=)


# Graficas de variables de interés

plot(x=as.factor(Panel$anio),y=Panel$PIB_pc__depto_deflactado, 
     main = "Evolucion PIB per capita",xlab='año',ylab='PIB_pc')
plot(x=Panel$tot_vic_Ataques_Belicos,y=Panel$PIB_pc__depto_deflactado, 
     main = "PIB per capita - Victimas Ataques Belicos",xlab='Victimas Ataques Belicos',ylab='PIB_pc',type = 'p')
plot(y=Panel$PER_OCU,x=Panel$anio, 
     main = "PIB per capita - Evento por ocurrencia",xlab='Evento por ocurrencia',ylab='PIB_pc',type = 'p')


# Regresion

reg0 <- lm(formula = PIB_pc__depto_deflactado ~ PER_OCU,data = Panel)
summary(reg0)

rob0 <- coeftest(reg0, vcov = vcovHC(reg0, "HC1"))
stargazer(rob0,type="text",se= list(rob0[,"Std. Error"]))

#######################################################################

reg1 <- lm(formula = PIB_pc__depto_deflactado ~ PER_OCU+depto,data = Panel)
summary(reg1)

rob1 <- coeftest(reg1, vcov = vcovHC(reg1, "HC1"))
stargazer(rob1,type="text",se= list(rob1[,"Std. Error"]))

#################################################################################

reg2 <- glm(formula = PIB_pc__depto_deflactado ~ PER_OCU+tot_vic_Ataques_Belicos+
              tot_vic_atentados_terr+tot_vic_masacre, data = Panel)
summary(reg2)
rob2 <- coeftest(reg2, vcov = vcovHC(reg2, "HC1"))
rob2

stargazer(rob2,type="text",se= list(rob2[,"Std. Error"]))

#################################################################################

reg3 <- glm(formula = PIB_pc__depto_deflactado ~ PER_OCU+tot_vic_Ataques_Belicos+
              tot_vic_atentados_terr+tot_vic_masacre+depto, data = Panel)
summary(reg3)
rob3 <- coeftest(reg3, vcov = vcovHC(reg3, "HC1"))
rob3
stargazer(rob3,type="text",se= list(rob3[,"Std. Error"]))
#################################################################################



