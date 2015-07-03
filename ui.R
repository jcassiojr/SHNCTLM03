
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
source("./R/f_cluster_Compra.R")
df_compr <- f_cluster_Compra("06.2015")
shinyUI(pageWithSidebar(
    headerPanel('Análise de cluster de compras'),
    sidebarPanel(
        selectInput('xcol', 'Variável X', names(df_compr)),
        selectInput('ycol', 'variável Y', names(df_compr),
                    selected=names(df_compr)[[2]]),
        numericInput('clusters', 'Cluster count', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1'),
        helpText('Para os gráficos, a linha azul mostra a tendência dos dados,
                        enquanto a região em cinza mostra o intervalo de confiança
                        (valores fora dessa região tem probabilidade baixa de ocorrência,
                        5%, devendo ser investigados)')
        )
    )
)