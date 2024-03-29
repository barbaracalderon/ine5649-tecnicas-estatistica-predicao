# leitura da vari�vel x
idade <- c(56, 42, 72, 36, 47, 55, 49, 38, 42, 68, 60, 63)
# leitura da vari�vel y
pressao <- c(147, 125, 160, 118, 128, 150, 145, 115, 140, 152, 155, 149)
plot(idade, pressao) # gr�fico de dispers�o padr�o

install.packages('ggplot2') # instala��o do pacote ggplot2
library(ggplot2) # carregar pacote ggplot2
dados <- data.frame(idade, pressao) # constru��o de um data frame
# gr�fico de dispers�o pelo ggplot
ggplot(data = dados) + 
  geom_point(aes(x = idade, y = pressao)) 

cor(idade, pressao) # c�lculo do Coeficiente de correla��o linear de Pearson

#===== Intervalo de confian�a e teste de hip�tese para \rho
# leitura da vari�vel x
idade <- c(56, 42, 72, 36, 47, 55, 49, 38, 42, 68, 60, 63)
# leitura da vari�vel y
pressao <- c(147, 125, 160, 118, 128, 150, 145, 115, 140, 152, 155, 149)

# C�lculo passo a passo
r <- cor(idade, pressao) # coeficiente de correla��o
n <- length(idade) # n�mero de observa��es
alpha <- 0.05 # n�vel de signific�ncia

est_teste <- r*sqrt(n-2)/sqrt(1-r^2); est_teste # estat�stica do teste
val_critico <- qt(alpha/2, n-2, lower.tail = FALSE) # valor cr�tico

# c�lculo do p-valor (teste bilateral)
p_valor <- 2 * pt(est_teste, n-2, lower.tail = FALSE)

# Coeficiente de correla��o e infer�ncia
cor.test(idade, pressao)
