# INTEGRANTES:
# CAUAN_OTTO_RODRIGUES_SOUSA_RM567940_FASE2_CAP7
# FERNANDO_ARAUJO_GURGEL_RM567606_FASE2_CAP7
# IRACI_MONTEIRO_SOUZA_RM567544_FASE2_CAP7
# MARIA_LUISA_RODRIGUES_NASCIMENTO_567659_FASE2_CAP7
# RAFAELA_TORRES_MARTINS_RM567735_FASE2_CAP7

# ---- BIBLIOTECAS ----
library(ggplot2)
library(dplyr)
library(DescTools)
library(readxl)
library(car)
library(lmtest)

# ---- LEITURA DOS DADOS ----
db_precos <- read_excel("C:/Users/Rafa Torres/Downloads/PohortDiario.xlsx", sheet = 1)
head(db_precos)

# ---- TRATAMENTO DOS DADOS ----
names(db_precos) <- c(
  "municipio",
  "cod_ibge_municipio",
  "uf",
  "ceasa",
  "produto",
  "unidade_medida",
  "data",
  "preco"
)

print(unique(db_precos$unidade_medida))

db_precos <- db_precos %>%
  filter(unidade_medida == "KG") %>%
  mutate(
    regiao = case_when(
      uf %in% c("AC","AP","AM","PA","RO","RR","TO") ~ "Norte",
      uf %in% c("AL","BA","CE","MA","PB","PE","PI","RN","SE") ~ "Nordeste",
      uf %in% c("DF","GO","MT","MS") ~ "Centro-Oeste",
      uf %in% c("ES","MG","RJ","SP") ~ "Sudeste",
      uf %in% c("PR","RS","SC") ~ "Sul",
      TRUE ~ "Outro"
    )
  ) %>%
  mutate(
    ano_mes = format(as.Date(data), "%Y-%m"),
    ano_mes = factor(ano_mes, levels = sort(unique(ano_mes)), ordered = TRUE)
  ) %>%
  select(ano_mes, everything())

head(db_precos, 10)

# ---- ANÁLISES ----

# MEDIDAS DE TENDÊNCIA CENTRAL (MÉDIA, MEDIANA, MODA)
analise_tendencia_central_dados <- db_precos %>%
  group_by(produto) %>%
  summarize(
    media = mean(preco, na.rm = TRUE),
    mediana = median(preco, na.rm = TRUE),
    moda = DescTools::Mode(preco)
  )

print(analise_tendencia_central_dados)

# MEDIDAS DE DISPERSÃO
analise_dispersao_dados <- db_precos %>%
  group_by(produto) %>%
  summarize(
    minimo = min(preco, na.rm = TRUE),
    maximo = max(preco, na.rm = TRUE),
    amplitude = max(preco, na.rm = TRUE) - min(preco, na.rm = TRUE),
    variancia = var(preco, na.rm = TRUE),
    desvio_padrao = sd(preco, na.rm = TRUE),
    coeficiente_variacao = (sd(preco, na.rm = TRUE) / mean(preco, na.rm = TRUE)) * 100,
    .groups = "drop"
  )

print(analise_dispersao_dados)

# MEDIDAS SEPARATRIZES (QUARTIS)
analise_separatriz_quartis_dados <- db_precos %>%
  group_by(produto) %>%
  summarize(
    Q1 = quantile(preco, 0.25, na.rm = TRUE),
    Q2 = quantile(preco, 0.50, na.rm = TRUE),
    Q3 = quantile(preco, 0.75, na.rm = TRUE),
    .groups = "drop"
  )

print(analise_separatriz_quartis_dados)

# ---- ANÁLISE GRÁFICA: TOP 10 PRODUTOS COM MAIOR PREÇO MÉDIO ----
top_produto <- analise_tendencia_central_dados %>%
  arrange(desc(media)) %>%
  slice_head(n = 10)

ggplot(top_produto, aes(x = reorder(produto, media), y = media)) +
  geom_bar(stat = "identity", fill = "#6bb88a", width = 0.7) +
  geom_text(aes(label = round(media, 2)), hjust = 1.05, color = "white", size = 3) +
  ggtitle("TOP 10 PRODUTOS COM MAIOR PREÇO MÉDIO (KG)") +
  xlab("") +
  ylab("Preço Médio (R$)") +
  theme_minimal(base_size = 10) +
  theme(
    axis.text.y = element_text(size = 8),
    plot.title = element_text(face = "bold", size = 12, hjust = 0.5)
  ) +
  coord_flip()

# ---- ANÁLISE GRÁFICA: FREQUÊNCIA DE REGISTROS POR PRODUTO ----
freq_produto <- db_precos %>%
  group_by(produto) %>%
  summarize(frequencia = n()) %>%
  arrange(desc(frequencia)) %>%
  slice_head(n = 20)

ggplot(freq_produto, aes(x = reorder(produto, frequencia), y = frequencia)) +
  geom_bar(stat = "identity", fill = "#f3a36b", width = 0.7) +
  geom_text(aes(label = frequencia), hjust = 1.1, color = "white", size = 3) +
  coord_flip() +
  ggtitle("TOP 20 REGISTROS POR PRODUTO") +
  xlab("Produto") +
  ylab("Qtde de Registros") +
  theme_minimal(base_size = 10) +
  theme(
    axis.text.x = element_text(size = 8),
    axis.text.y = element_text(size = 9),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 12)
  )

# ---- ANÁLISE GRÁFICA: PREÇO MÉDIO DO MORANGO 2024 ----
db_precos_morango <- db_precos %>%
  filter(produto == "MORANGO", data >= '2024-01-01', data <= '2024-12-31')

analise_tendencia_central_dados_morango <- db_precos_morango %>%
  group_by(produto, regiao, ano_mes) %>%
  summarize(media = mean(preco, na.rm = TRUE), .groups = "drop")

print(analise_tendencia_central_dados_morango)

ggplot(analise_tendencia_central_dados_morango, aes(x = ano_mes, y = media, color = regiao, group = regiao)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  ggtitle("PREÇO MÉDIO DO MORANGO (KG) EM 2024") +
  xlab("Ano-Mês") +
  ylab("Preço Médio (R$)") +
  theme_minimal(base_size = 8) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 12)
  ) +
  scale_color_brewer(palette = "Set1")

# --- ANALISE REGRESSÃO LINEAR SIMPLES ----

db_regressao <- db_precos %>% filter(produto == "ABOBRINHA", data >= '2024-01-01', data <= '2024-03-31')

reg_simples <- lm(preco ~ data, data = db_regressao)
summary(reg_simples)

# VERIFICAÇÃO DE LINEARIDADE

plot(db_regressao$data, db_regressao$preco,
     xlab = "DATA", ylab = "PREÇO",
     main = "ANÁLISE DE LINEARIDADE - ABOBRINHA",
     col = "#becec4", pch = 16)
abline(reg_simples, col = "red", lwd = 2)

# VERIFICAÇÃO DE HOMOSCEDASTICIDADE

plot(reg_simples$fitted.values, resid(reg_simples),
     xlab = "VALORES AJUSTADOS", ylab = "RESÍDUOS",
     main = "HOMOSCEDASTICIDADE - ABOBRINHA",
     col = "#becec4", pch = 16)
abline(h = 0, col = "red", lwd = 2)

# VERIFICAÇÃO DE NORMALIDADE (GRÁFICO Q-Q)

qqPlot(reg_simples, main = "NORMALIDADE DOS RESÍDUOS - ABOBRINHA")

# TESTE DE INDEPENDÊNCIA (DURBIN-WATSON)

dwtest(reg_simples)