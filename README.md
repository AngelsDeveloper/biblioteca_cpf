# 🔥 Biblioteca para CPF's 🔥

<br>

## 🚀 Sobre o Projeto 🚀

- O projeto foi criado através de um exercicio de algoritmo.
- O projeto está sendo utilizado para estudo de algoritmos.
- O projeto consiste em manipulação de CPF em geral.

<br>

## ☄ Funções ☄

### 🎇 Sanitização 🎇

- Limpa todos caracteres que sejam diferentes de números.

### 🎇 Formatação 🎇

- Formata o CPF para o modelo padrão: ###.###.###-## 

### 🎇 Validação Digito 🎇

- Calcula os ultimos digitos de um CPF de acordo com 9/10 digitos dele.

### 🎇 Validação CPF 🎇

- Utiliza a função de **Sanitizar** o CPF.
- Faz o algoritmo de Validação.
- Caso o CPF seja **válido**
- -  Ele vai retornar o CPF formatado utilizando a função de **Formatar**.
-  Caso o CPF seja **inválido**
- -  Ele vai retornar falso.

### 🎇 Gerar CPF 🎇

- Gera um CPF aleatório **válido** utilizando o algoritmo da **validação do digito**.

<br>

## 🎨 Parametros 🎨

### 🎭 SanitizarCPF 🎭

1. **CPF**, você passa um CPF para sanitizar **--Obrigatório--**

### 🎭 FormatarCPF 🎭

1. **CPF**, você passa um CPF para formatar. **--Obrigatório--**

### 🎭 ValidarDigito 🎭

1. **CPF**, você passa um CPF para calcular o digito. **--Obrigatório--**

2. **FIM**, você passa o fim do CPF, normalmente é 9/10 (depende de qual digito você vai calcular) **--Obrigatório--**

3. **MULTIPLICADOR**, você passa o multiplicador de acordo com o fim do CPF, 10 para 9 digitos, 11 para 10 digitos **--Obrigatório--**

### 🎭 ValidarCPF 🎭

1. **CPF**, você passa um CPF para verificar se ele é válido. **--Obrigatório--**

2. **FORMATADO**, você passa true ou false, assim retornando formatado ou não caso o CPF seja válido. **--Opcional--**

### 🎭 GerarCPF 🎭

1. **FORMATADO**, você passa true ou false, assim retornando um CPF gerado formatado ou não. **--Opcional--**

<br>

## ⚙ Clone ⚙

- Para clonar o repositório, utilize o comando do **git bash** abaixo

```
git clone https://github.com/AngelsDeveloper/biblioteca_cpf
```

- Ele vai estar no diretório que você abriu o **git bash**.
