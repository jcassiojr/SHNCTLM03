
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
        selectInput('xcol', 'Variável X', names(df_compr),
                    selected=names(df_compr)[[4]]),
        selectInput('ycol', 'variável Y', names(df_compr),
                    selected=names(df_compr)[[5]]),
        numericInput('clusters', 'Cluster count', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1'),
        helpText('LEGENDA para PRODALP:'),
        helpText('CRAF = 1,CREF = 2,EPSF = 3,PFRA = 4,PPSA = 5,PPSI = 6'),
        helpText('RCET = 7,CRSP = 8,RBMG = 9,RAC = 10,RAG = 11,REA = 12,REN = 13'),
        helpText('LEGENDA para SOCIEDADE:'),
        helpText('CTLM = 1,CONS = 2,TELN = 3,SUBA = 4')
        )
    )
)

