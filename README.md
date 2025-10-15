# FIAP - Faculdade de Informática e Administração Paulista


<img width="2385" height="642" alt="image" src="https://github.com/user-attachments/assets/594c28cc-66ae-40ac-b8a6-8c39e6f14de4" />


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
## Descrição do projeto
---

## 📜 Descrição

O **agronegócio** é um setor estratégico que envolve todas as atividades relacionadas à **produção, transformação, distribuição e comercialização** de produtos agrícolas e pecuários. É um dos pilares da economia mundial, garantindo o abastecimento de alimentos e promovendo desenvolvimento socioeconômico.

---

## 📁 Estrutura de pastas

├── trabalho/
│   ├── Decolando_CD.R
│   └── PohortDiario.xlsx
├── README.md
├── .gitignore

---

## ⚙️ Como executar o código

### 1. Pré-requisitos
Certifique-se de ter o **R (≥ 4.2.0)** instalado.  
Os seguintes pacotes serão utilizados:

r
install.packages(c("ggplot2", "dplyr", "DescTools", "readxl", "car", "lmtest"))

### 🚀 2. Execução

Clone o repositório e acesse a pasta do projeto:

bash
git clone https://github.com/fiap-ia-trabalho/Cap7_Decolando_Ciencias_Dados cd Fase2_Cap7_Decolando_Ciencias_Dados

### 🚀 Execução

Salve o arquivo xlsx
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
# Análise de Regressão Linear do Preço em Função da Data

Foi ajustado um modelo de regressão linear simples para analisar a variação do preço em função da data:

\[
\text{preco} \sim \text{data}
\]

## Resultados Estatísticos

**Resíduos:**
| Estatística | Valor |
|------------|-------|
| Mínimo    | -219.00 |
| 1º Quartil| -183.46 |
| Mediana   | 15.43  |
| 3º Quartil| 135.26 |
| Máximo    | 708.99 |

**Coeficientes do modelo:**
| Coeficiente | Estimativa     | Erro Padrão | t-valor | p-valor  |
|------------|----------------|------------|---------|---------|
| Intercepto | -9.760 × 10³   | 4.095 × 10³ | -2.383  | 0.0173 * |
| Data       | 5.843 × 10⁻⁶   | 2.398 × 10⁻⁶ | 2.437   | 0.0150 * |

**Medidas de ajuste do modelo:**
- Residual Standard Error: 187.7
- R²: 0.00477
- R² Ajustado: 0.00397
- F-statistic: 5.939 (p = 0.01495)

---

<img width="1144" height="550" alt="image" src="https://github.com/user-attachments/assets/db921cde-3c0c-4d8a-b25b-0016be46ac9d" />


## Interpretação

- O **coeficiente da data** é positivo e estatisticamente significativo (`p < 0.05`), indicando uma **leve tendência de aumento do preço ao longo do tempo**.
- No entanto, o **R² muito baixo (0,48%)** indica que o modelo **explica praticamente nada da variação dos preços**.
- Os **resíduos apresentam outliers significativos**, sugerindo que há pontos que não seguem o padrão geral.
- O modelo é estatisticamente significativo pelo teste F, mas o efeito prático da data no preço é **muito pequeno**.

---

## 📚 Fonte de Dados  


| **Instituição** | **Link Oficial** | **Descrição** |
|------------------|------------------|----------------|
| CONAB | [https://www.conab.gov.br/](https://www.conab.gov.br/) | Levantamentos de safras, preços e estoques agrícolas |

➡ Acesse Pohort Diário

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


