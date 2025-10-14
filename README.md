# FIAP - Faculdade de Informática e Administração Paulista

<p align="center">
<a href="https://www.fiap.com.br/">
<img src="assets/logo-fiap.png" alt="FIAP - Faculdade de Informática e Administração Paulista" border="0" width="40%" height="40%">
</a>
</p>

<br>

# 🧑‍🌾 Análise Exploratória do Agronegócio Brasileiro

## 👨‍🎓 Integrantes:

- <a href="https://www.linkedin.com/in/cauanotto">CAUAN OTTO RODRIGUES SOUSA (RM567940)</a>
- <a href="https://www.linkedin.com/in/fernando-gurgel-75aa8369">FERNANDO ARAUJO GURGEL (RM567606)</a>
- <a href="https://www.linkedin.com/in/iraci-souza-bab42034">IRACI MONTEIRO SOUZA (RM567544)</a> 
- <a href="https://www.linkedin.com/in/malu-rodrigues-bb756b271">MARIA LUISA RODRIGUES NASCIMENTO (RM567659)</a> 
- <a href="https://www.linkedin.com/in/rafaela-torres222">RAFAELA TORRES MARTINS (RM567735)</a>

## 👩‍🏫 Professores:
**Tutor(a):** [ANA CRISTINA DOS SANTOS](https://www.linkedin.com/company/inova-fusca)  
**Coordenador(a):** [ANDRÉ GODOI](https://www.linkedin.com/in/andregodoichiovato)

---
## Descrição do projet
---

## 📜 Descrição

O **agronegócio** é um dos setores mais relevantes da economia brasileira, englobando toda a cadeia produtiva — desde a **produção agrícola** até a **comercialização e distribuição** de alimentos, fibras e biocombustíveis.

Este projeto tem como objetivo **realizar análises exploratórias de dados do agronegócio**, com foco em **preços médios de produtos hortifrutigranjeiros**, permitindo compreender **padrões regionais**, **variações de preço** e **tendências temporais**.

A análise foi realizada em **R**, com o uso de bibliotecas voltadas à manipulação de dados e estatística descritiva.  
Os resultados obtidos permitem apoiar **estratégias de mercado, precificação regional e planejamento logístico**.

---

## 📁 Estrutura de pastas

- **.github/** → Configurações e automações do GitHub.  
- **assets/** → Imagens e elementos visuais (ex.: logotipos).  
- **config/** → Arquivos de configuração e parâmetros do projeto.  
- **data/** → Bases de dados utilizadas, como `PohortDiario.xlsx`.  
- **docs/** → Documentos explicativos e fontes de dados oficiais.  
- **scripts/** → Scripts em R usados para análise e visualização.  
- **outputs/** → Gráficos e tabelas geradas pela análise.  
- **README.md** → Documento principal com informações do projeto.

---

## ⚙️ Como executar o código

### 1. Pré-requisitos
Certifique-se de ter o **R (≥ 4.2.0)** instalado.  
Os seguintes pacotes serão utilizados:

```r
install.packages(c("ggplot2", "dplyr", "DescTools", "readxl", "car", "lmtest"))

### 🚀 2. Execução

Clone o repositório e acesse a pasta do projeto:

```bash
git clone https://github.com/seuusuario/analise-agronegocio.git
cd analise-agronegocio/scripts

### 🚀 Execução

Abra o arquivo **`analise_agronegocio.R`** no **RStudio** ou **Google Colab com R** e execute o script.

---

### 🧩 O código realiza as seguintes etapas:
- Leitura da base **`PohortDiario.xlsx`**  
- Limpeza e padronização dos dados  
- Cálculo de medidas descritivas (média, mediana, moda, variância etc.)  
- Geração de gráficos comparativos e temporais  
- Aplicação de regressão linear simples *(exemplo: preço da abobrinha ao longo do tempo)*  

---

## 📈 Resumo dos Resultados

### 🧮 Tendência Central  
Média e mediana indicam estabilidade em produtos como **batata** e **cebola**, enquanto outros (como **morango**) apresentam forte variação.

### 📊 Dispersão  
Produtos com alto **desvio padrão** e **coeficiente de variação** revelam maior sensibilidade à sazonalidade e à logística regional.

### 📏 Separatrizes  
Os **quartis** mostraram assimetrias em alguns produtos, sugerindo picos de preço fora do padrão.

### 📉 Gráficos  
- **Top 10 produtos com maior preço médio:** destaque para frutas e hortaliças perecíveis.  
- **Preço médio do morango em 2024:** maior variação nas regiões Sudeste e Sul, associada à sazonalidade climática.

### 📈 Regressão Linear (Abobrinha)  
Identificada tendência de **leve queda no preço entre janeiro e março de 2024**.  
Os resíduos apresentaram **distribuição normal** e **homocedasticidade satisfatória**.  

Esses resultados reforçam a importância da **análise de dados agrícolas** para decisões logísticas e de mercado.

---

## 🧠 Interpretação no Código  
Cada bloco do arquivo `.R` contém **comentários interpretativos (2–3 frases)** que explicam o significado das estatísticas e gráficos — garantindo **reprodutibilidade** e **transparência analítica**.

---

## 📚 Fontes Oficiais de Dados  

Consulte `docs/fontes_dados.md` para links e descrições completas das bases utilizadas.

| **Instituição** | **Link Oficial** | **Descrição** |
|------------------|------------------|----------------|
| CONAB | [https://www.conab.gov.br/](https://www.conab.gov.br/) | Levantamentos de safras, preços e estoques agrícolas |
| IBGE | [https://www.ibge.gov.br/](https://www.ibge.gov.br/) | Dados agropecuários, censos e séries históricas |
| MAPA | [https://www.gov.br/agricultura/pt-br](https://www.gov.br/agricultura/pt-br) | Políticas públicas e estatísticas do setor agropecuário |
| EMBRAPA | [https://www.embrapa.br/](https://www.embrapa.br/) | Pesquisa e inovação agropecuária |
| INPE | [https://www.gov.br/inpe/pt-br](https://www.gov.br/inpe/pt-br) | Dados geoespaciais e monitoramento agroambiental |
| CNA Brasil | [https://www.cnabrasil.org.br/](https://www.cnabrasil.org.br/) | Indicadores econômicos e tendências do agronegócio |

---

## 🗃 Histórico de Lançamentos  

| **Versão** | **Data** | **Descrição** |
|-------------|-----------|----------------|
| 0.1.0 | 10/2025 | Desenvolvimento trabalho acadêmico
 |


---

## 📋 Licença  

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1">
<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1">

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">
<a property="dct:title" rel="cc:attributionURL" href="https://github.com/agodoi/template">MODELO GIT FIAP</a> por 
<a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">FIAP</a> está licenciado sob 
<a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.
</p>


