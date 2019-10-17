getwd()
setwd("C:\\Users\\cgt\\Desktop\\startup")
library(sqldf)
library(stringr)
library(DescTools)

startup <- read.xlsx("Dados_startups.xlsx")
pipe <- read.xlsx("CGEE empresas_PIPE - resposta.xlsx")

startup_nome <- subset(startup, select = c(nome))
pipe_nome <- subset(pipe, select = c(Nome.da.Empresa))
names(pipe_nome) <- c("Nome_empresa")

startup_nome <- as.tibble(startup_nome)
pipe_nome <- as.tibble(pipe_nome)

startup_nome$nome <- str_to_lower(startup_nome$nome)
pipe_nome$Nome_empresa <- str_to_lower(pipe_nome$Nome_empresa)

pipe_nm <- word(pipe_nome$Nome_empresa, sep = fixed(" "))

df_result <- pipe_nome[pipe_nm %in% c(startup_nome$nome),]

#esta <- sqldf("select * from pipe_nome where Nome_empresa LIKE '%startup_nome$nome%'")

df_result <- startup_nome[startup_nome$nome %in% c(pipe_nome$Nome_empresa),]

