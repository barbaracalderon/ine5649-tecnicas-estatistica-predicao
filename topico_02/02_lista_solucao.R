# Exerc�cio 1
#
# Os gr�ficos a seguir mostram a rela��o entre tempo de estudo (min/dia) vs.
# notas e n�mero de faltas vs. notas. Com base nos gr�ficos e nos seus
# respectivos valores, pede-se:
#
# a) Coeficientes de correla��o linear. Classifique a intensidade da
# correla��o entre os pares de vari�veis.
tempo_nota <- (0.80)^(1/2)
# tempo_nota = 0.894
falta_nota <- (0.91)^(1/2)
# falta_nota = 0.953
#
# b) Fa�a a interpreta��o do coeficiente angular dos modelos apresentados
# no gr�fico.
#
# Em notas vs. tempo, o coeficiente angular (+1.30) � positivo, ou seja,
# crescente. Para cada unidade de tempo de estudo, aumenta-se 1,30 unidade
# de nota.
#
# Em falta vs. notas, o coeficiente angular (-3.39) � negativo, 
# decrescente, o que se verifica no gr�fico. Para cada unidade de falta,
# diminui-se 3.39 unidade de nota.
# 
# c) Qual seria a nota esperada de um aluno que estudou 1h por dia?
#
Y <- -24.38+1.30*60
# Espera-se que ele tire a nota de Y = 53,62
#
# d) Qual seria a nota esperada de um aluno que faltou 7 vezes?
#
F <- 99.11-3.39*7
# A nota esperada � F = 75,38
#
# e) Qual das predi��es (c ou d) � mais eficiente? Justifique.
#
# Devido ao coeficiente de correla��o maior, a predi��o d � mais eficiente.
#
#
# Exerc�cio 2
# Os dados a seguir referem-se � massa muscular (Y) em rela��o �
# idade de uma pessoa (X).
Xi <- 1108
Yi <- 1530
XiYi <- 91964
Xi2 <- 70362
Yi2 <-133300
# a) Calcule a reta de m�nimos quadrados. (Y = AX + B) ou (Y = B0+B1X)
B1 <- (XiYi-(18*(Xi/18)*(Yi/18)))/(Xi2-18*(Xi/18)^2)
B0 <- (Yi/18)-B1*(Xi/18)
# Reta de m�nimos quadrados: Y = 148,19 - 1,02 * X
#
# b) Qual o valor do intercepto?
# O valor � 148,19
#
# c) Qual o valor do coeficiente angular? Interprete-o.
# O valor � -1,02, o que significa que � decrescente. Para cada unidade
# de X que cresce, Y diminui -1,02 unidades.
# 
# d) A rela��o entre X e Y � positiva ou negativa? Justifique.
# Negativa. Ver letra c.
#
# e) Uma nova pessoa de 65 anos tem sua massa muscular avaliada. Se
# considerarmos o modelo ajustado no item (a), quanto de massa muscular
# esperamos que essa pessoa tenha?
R <- 148.19 - 1.02*65
# Esperamos que tenha 81,89 de massa muscular.
#
# f) Qual a percentagem de variabilidade de massa muscular que � explicada
# pela variabilidade da idade das pessoas, por meio do modelo ajustado
# no item (a)?
# Coeficiente � R^2 = 0,70
#
#
# Exerc�cio 3
# Um corretor de im�veis gostaria de estimar o valor (xR$10.000,00) de
# alguns apartamentos em fun��o do tamanho da �rea privativa de cada
# im�vel (m^2) e da idade dos mesmos (anos). Para isto, ele ajustou dois
# modelos de regress�o linear simples como apresentado a seguir. Pede-se:
#
# a) Determine os coeficientes de correla��o linear entre "�rea privativa"
# vs. "valor do im�vel" e "idade do im�vel" vs. "valor do im�vel". Discuta
# sobre o tipo de rela��o encontrado por meio do coeficiente de correla��o.
area_valor = 0.82^(1/2) # 0.9055
idade_valor = 0.05^(1/2) # 0.2236
# A �rea do im�vel incide mais fortemente sobre o pre�o do mesmo, do que
# a idade do im�vel sobre o pre�o.
#
# b) Fa�a a interpreta��o do coeficiente angular dos modelos apresentados
# no gr�fico.
# No gr�fico �rea-valor, o coeficiente angular � positivo: quanto maior
# a �rea do im�vel, maior o seu pre�o.
# No gr�fico idade-valor, o coeficiente � negativo: quanto mais idade
# o im�vel tem, menor o seu pre�o.
#
# c) Qual seria o valor esperado de um im�vel com �rea privativa de
# 50m^2?
imovel_50 <- -31.65 + 1.27 * 50
imovel_50 * 10000
# O valor esperado � de R$318.500,00
#
# d) Qual seria o valor esperado de um im�vel constru�do h� 6 meses?
imovel_6m <- 116.78 - 1.86 * 0.5
imovel_6m * 10000
# O valor esperado � de R$1.158.500,00
#
# e) Qual das predi��es (c ou d) � mais eficiente? Justifique.
# A predi��o por �rea (c) porque o coeficiente de correla��o � maior.
# 0.9055 vs. 0.2236
#
#
# Exerc�cio 4
# Um estudo foi desenvolvido para verificar o quanto o comprimento [...].
#
# a) Construa o diagrama de dispers�o
comp_cabo <- c(8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15)
taxa_falha <- c(0.79, 0.74, 1.10, 1.06, 1.41, 1.50, 1.82, 1.77, 2.28, 2.16, 2.53, 2.57, 2.96, 2.86, 3.34)
dados <- data.frame(comp_cabo, taxa_falha)
library(ggplot2)
ggplot() + 
  geom_point(data = dados,
             aes(x = comp_cabo, y = taxa_falha)) +
  labs(x = 'Comprimento do Cabo (m)', y = 'Taxa de Falha') +
  theme_minimal()
#
# b) Encontre a reta de m�nimos quadrados, esbo�ando-a no gr�fico de
# dispers�o obtido no item (a).
modelo <- lm(taxa_falha ~ comp_cabo)
coef(modelo)
# B0 = -2.193 e B1 = 0.365
# A reta de m�nimos � Y = -2.193 + 0.365 * X
ggplot() + 
  geom_point(data = dados,
             aes(x = comp_cabo, y = taxa_falha)) +
  geom_smooth(data = dados, 
              aes(x = comp_cabo, y = taxa_falha),
              method = 'lm', se=F) +
  labs(x = 'Comprimento do Cabo (m)', y = 'Taxa de Falha') +
  theme_minimal()
#
# c) Interprete o valor encontrado para o coeficiente angular.
# Para cada uma unidade de cabo, a taxa de falha aumenta em 0.365 unidades
#
# d) Encontre as estimativas de vari�ncia e desvio-padr�o dos erros.
# S^2 e S
summary(modelo) # Encontrar "Residual Standard Error" aqui e elevar ao 
# quadrado para ter S^2
S2 <- 0.04799^2 # S2 = 0.002303
S <- S2^(1/2) # S = 0.04799
# R^2 = 0.9969
#
# e) Considerando a reta de m�nimos quadrados calculada, estime qual ser� a
# taxa de falha m�dia para um cabo de 8,5m.
falha_8m <- -2.193 + 0.365 * 8.5
# A taxa de falha m�dia � de 0.9095 
#
# f) Qual o coeficiente de determina��o? Interprete o resultado. (R^2)
# S� ver dentro do summary(modelo) pen�ltima linha "Multiple R-squadred"
# que � de R^2 = 0.9969. Ou seja, 99,69% da variabilidade da taxa de falha
# pode ser explicada pela variabilidade do comprimento do cabo.
#
#
# Exerc�cio 5
# Um estudo foi desenvolvido para verificar o quanto o tamanho do im�vel [...].
# 
# a) Escreva a reta de m�nimos quadrados estimado para o problema.
# Y = 226.19 + 8.6471 * X
#
# b) Interprete o valor encontrado para o coeficiente angular.
# A cada aumento na unidade de tamanho, o aluguel aumenta em 8.6471 vezes.
#
# c) Qual o valor esperado de um im�vel de 100m^2?
valor_100 <- 226.19 + 8.6471 * 100
# O valor esperado �  de 1090.9 ou $1090.9
#
# d) Qual o percentual de variabilidade do valor do aluguel do im�vel que � 
# explicado pela variabilidade do tamanho do im�vel, por meio do modelo de
# regress�o linear ajustado?
# Em m�dia 22.62% da variabilidade pode ser explicada pela variabilidade
# do tamanho do im�vel por meio do modelo de regress�o linear.
#
# e) Baseado no percentual obtido em d, quais outras vari�veis voc� acredita
# que poderia influenciar o valor do aluguel de um im�vel.
# -