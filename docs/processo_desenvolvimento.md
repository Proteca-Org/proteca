# Processo de Desenvolvimento

O desenvolvimento do jogo segue um processo iterativo, orientado por feedbacks e voltado à melhoria contínua. As etapas principais estão representadas no diagrama a seguir:

![Diagrama do Processo](diagramas/processo_geral.png)

## Visão Geral

- **Caminho Feliz**: Recebimento do GDD → Análise de Requisitos → Desenvolvimento → Avaliação → OK (fim)
- **Fluxos Alternativos**:
  - Após o Desenvolvimento, é possível retornar à Análise de Requisitos, se forem necessárias complementações.
  - Após a Avaliação, se forem encontrados problemas, um Relatório de Defeitos é gerado e o fluxo pode seguir para o Desenvolvimento (ajuste técnico) ou para a Análise de Requisitos (ajuste conceitual).

## 1. Análise de Requisitos

A partir do GDD (Game Design Document), são extraídos os requisitos do jogo, incluindo mecânicas principais, objetivos educacionais e assets necessários (imagens, sons, personagens, cenários, etc.).

**Possível retorno**: se após o desenvolvimento ou testes forem percebidas lacunas conceituais, o fluxo pode retornar para esta fase para ajustes.

## 2. Desenvolvimento

Esta fase compreende a implementação do jogo, dividida em três etapas integradas:

### 2.1 Codificação
Implementação das funcionalidades com base nas Histórias de Usuário (HU) e nas decisões arquiteturais.

**Produto esperado**: código versionado, limpo e alinhado às decisões arquiteturais.

### 2.2 Revisão de Código
O código é analisado por outro membro da equipe, promovendo boas práticas e alinhamento técnico.

**Produto esperado**: comentários registrados na ferramenta de versionamento (ex: GitHub/GitLab).

### 2.3 Integração ao Repositório
Após a revisão, o código é integrado ao repositório oficial do projeto, acionando pipelines de build e testes.

**Produto esperado**: integração validada com sucesso.

**Possível retorno**: caso a avaliação final aponte falhas técnicas, o fluxo pode retornar para cá para correções.

## 3. Avaliação (Playtest)

O jogo é executado com foco na validação da experiência do usuário. São coletados feedbacks da equipe e, quando possível, de usuários reais.

**Produto esperado**: item avaliado e validado.  
**Possíveis saídas**:
- Se OK, o processo é encerrado.
- Se forem encontrados problemas, é gerado um Relatório de Defeitos, e o fluxo pode seguir:
  - Para o Desenvolvimento (ajustes técnicos)
  - Para a Análise de Requisitos (problemas conceituais)

## 🧭 Entendendo o Fluxo do Processo

Nosso processo é flexível — ele foi desenhado para apoiar o aprendizado, evitar retrabalho e permitir melhorias constantes no jogo. Para isso, usamos fluxos alternativos que ajudam a voltar etapas quando necessário.

No diagrama acima, você vai notar formas em losango com símbolos dentro. Esses são os chamados gateways, e eles nos ajudam a decidir para onde o fluxo vai.

### 🔘 Inclusivo (OR): mais de uma opção pode acontecer

Exemplo:
Após a Análise de Requisitos, podemos:
- seguir para o Desenvolvimento e/ou
- voltar para complementar requisitos, se algo estiver faltando.

Nesse ponto, mais de uma saída pode ser verdadeira — por isso usamos o OR (círculo).

### ❌ Exclusivo (XOR): só um caminho será seguido

Exemplo:
Depois da Avaliação, decidimos:
- se está tudo certo, o processo termina.
- se tiver algum problema, criamos um relatório de defeitos e voltamos para corrigir.

Aqui, só uma dessas opções vai acontecer — por isso usamos o XOR (um X dentro do losango).


## 🔄 Resumo dos Caminhos

| Situação                             | Para onde o fluxo vai?                                | Tipo de Decisão |
|-------------------------------------|--------------------------------------------------------|------------------|
| Após entender o GDD                 | Vai para Análise de Requisitos                         | (início direto)  |
| Após Análise de Requisitos          | Vai para Desenvolvimento, ou volta para complementar   | OR               |
| Após Desenvolvimento                | Vai para Avaliação, ou volta para requisitos (se preciso) | OR            |
| Após Avaliação                      | Vai para o fim (se OK) ou para correção (Dev ou Requisitos) | XOR         |

---

Esses fluxos garantem que o processo avance com base em decisões conscientes e sustentadas, permitindo melhorias contínuas no jogo de forma colaborativa.
