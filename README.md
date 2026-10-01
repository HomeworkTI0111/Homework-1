# Homework-1

Repositório destinado à resolução, códigos em R e relatórios referentes ao **Homework 1** da disciplina de **Estatística para Engenharia**, do curso de Engenharia de Computação da Universidade Federal do Ceará (UFC).

---

## 👥 Equipe e Contribuições Individuais
* **Maria Paula Mesquita Silva Saraiva** - Matrícula: 582204
* **Cecília Fernandes Kalume** - Matrícula: 590055
* **Francisco Davi Moreira** - Matrícula: 582887
* **João Pedro de Castro Alves** - Matrícula: 582929

* **Professora:** Michela Mulas

---

## 📌 Visão Geral do Projeto

O objetivo deste trabalho é realizar uma análise estatística descritiva sobre o dataset de um sistema de compartilhamento de bicicletas (`HW1_bike_sharing.csv`). 

A amostragem de dados do grupo (data_group) foi filtrada a partir do maior valor de matrícula dos integrantes (M = 590055), definindo a linha inicial do dataset pela fórmula: `r = 1 + (M mod 100) = 56`. Assim, a partir da linha 56, foram selecionadas 300 observações consecutivas.

---

## 🛠️️ Tecnologias e Ferramentas Utilizadas

* **Linguagem:** R
* **Bibliotecas R:** 
  * ggplot2 (para gráficos customizados de Histograma e Boxplot)
  * Funções nativas do R (aggregate, quantile, ts, cor, etc.)

---

## 📂 Estrutura do Repositório

* HW1_bike_sharing.csv         # Dataset original de entrada
* main.r                       # Script com todos os códigos em R desenvolvidos
* TI0111_HW1_assignment.pdf    # Relatório final em PDF
* README.md                    # Documentação do repositório


---

## 🤝 Divisão de Tarefas
A equipe dividiu-se em duplas para otimização do trabalho. Porém, vale ressaltar que todos os integrantes participaram ativamente de todo o processo, acompanhando a resolução completa da atividade do início ao fim e realizando a revisão cruzada das etapas desenvolvidas pelos demais.

* **Maria Paula Mesquita Silva Saraiva e Francisco Davi Moreira**
  * **Foco principal:** Questões 1 e 2.
  * **Contribuições:**
    * Implementação do filtro de amostragem (r = 56);
    * Definição do conjunto de dados utilizados (`data_group`);
    * Definição da variável `total_user`;
    * Classificação das variáveis qualitativas e quantitativas;
    * Definição da amostragem reduzida (`data_groupinho`);
    * Verificação de dados nulos;
    * Cálculo de medidas descritivas (tendência central, quartis e IIQ);
    * Validação dos cálculos estatísticos;
    * Definição do limiar de baixa utilização (`low_usage`);
    * Plotagem dos gráficos de Histogramas e Boxplots.

* **João Pedro de Castro Alves e Cecília Fernandes Kalume**
  * **Foco principal:** Questões 3 e 4.
  * **Contribuições:**
    * Plotagem de Boxplots;
    * Identificação de relações entre variáveis;
    * Análise estatística da utilização por estação do ano (`season`) e condição meteorológica (`weathersit`);
    * Análise e construção de gráficos para melhor visualização de dados;
    * Análise de dispersão e cálculo dos coeficientes de correlação entre temperatura e demanda;
    * Estruturação da série temporal (`total_user_ts`);
    * Identificação de padrões de sazonalidade;
    * Elaboração da síntese e conclusões do estudo.
 
