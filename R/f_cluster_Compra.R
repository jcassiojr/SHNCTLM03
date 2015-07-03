# carrega dados de CarteCArtoes para análise de cluster
f_cluster_Compra <- function(mm_aaaa)
{ 
    #if (!requireNamespace("openxlsx", quietly = TRUE)) {
    #    stop("openxlsx needed for this function to work. Please install it.",
    #         call. = FALSE)
    #} else {
    #    if(!require(openxlsx)){install.packages("openxlsx")}
    #}  
    #if (!requireNamespace("dplyr", quietly = TRUE)) {
    #    stop("dplyr needed for this function to work. Please install it.",
    #         call. = FALSE)
    #} else {
    #    if(!require(dplyr)){install.packages("dplyr")}
    #}  
    # mm_aaaa <- "06.2015"
    # le arquivo cartecartoes
    filein1 <- paste0("./tidydata/", mm_aaaa,"/tidyCarteProd.csv")
    df_carprod <- read.csv(filein1, sep = ";")
    # seleciona somente as colunas desejadas para a analise de cluster
    df_carprod <-
        df_carprod %>%
        select(SOCIEDADE, CHAINEORI,LOCAL, PRODALP, DURFIN,MTFI,NBFI)
    
    # acertando escala para CHAINEORI (subtraindo 9100000)
    df_carprod <-
        df_carprod %>%
        filter(CHAINEORI != 0) %>%
        mutate(CHAINEORI = CHAINEORI - 9100000)
        #select(CANALAQU, CHAINEORI, MTTOT, NBFATURA, MTLMABASE, MTLMAABERTURA,
        #     NBBASERET, NBBASE, NBATIVODIFZERO, NBATIVOMAIORQUATRO, 
        #       NBATIVOMAIORZERO, QTDMOVIMENTADA, NBSEGURO)
    # mudando valore de canalaqu para numericos
    # CTLM = 1, CONS = 2, TELN = 3, SUBA = 4
    df_carprod <-
        df_carprod %>%
        mutate (SOCIEDADE = ifelse (SOCIEDADE == "CTLM",1,
                            ifelse (SOCIEDADE == "CONS",2,
                            ifelse (SOCIEDADE == "TELN",3,4))))
    # CTLM = 1, CONS = 2, TELN = 3, SUBA = 4
    df_carprod <-
        df_carprod %>%
        mutate (PRODALP = ifelse (PRODALP == "CRAF",1,
                            ifelse (PRODALP == "CREF",2,
                            ifelse (PRODALP == "EPSF",3,
                            ifelse (PRODALP == "PFRA",4,
                            ifelse (PRODALP == "PPSA",5,
                            ifelse (PRODALP == "PPSI",6,
                            ifelse (PRODALP == "RCET",7,
                            ifelse (PRODALP == "CRSP",8,
                            ifelse (PRODALP == "RBMG",9,
                            ifelse (PRODALP == "RAC",10,
                            ifelse (PRODALP == "RAG",11,
                            ifelse (PRODALP == "REA",12,
                            ifelse (PRODALP == "REN",13, PRODALP))))))))))))))
    
    return(df_carprod)    
}