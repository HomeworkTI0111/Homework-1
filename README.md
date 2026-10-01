# Homework-1

Repositório destinado à resolução, códigos em R e relatórios referentes ao **Homework 1** da disciplina de **Estatística para Engenharia**, do curso de Engenharia de Computação da Universidade Federal do Ceará (UFC).

---

## 👥 Equipe
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

```text
├── HW1_bike_sharing.csv         # Dataset original de entrada
├── main.r                       # Script com todos os códigos em R desenvolvidos
├── TI0111_HW1_assignment.pdf    # Relatório final em PDF
└── README.md                    # Documentação do repositório
