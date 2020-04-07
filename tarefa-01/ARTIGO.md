
<img src="https://julialang.org/assets/infra/logo.svg" alt="Julia" width="300" height="300" />

# Introdução
### O que é Julia?  
Júlia é uma linguagem de programação de alto nível, _open-source_ e de propósito geral, porém voltada para computação científica, _machine learning_ e análises numéricas de alta performance. Ela compartilha paradigmas de linguagens funcionais, como funções anônimas e _closures_, e de linguagens imperativas, como a possibilidade de definir tipos mutáveis. 

Além disso, Júlia tem tipagem dinâmica, possui polimorfismo paramétrico e suporta computação paralela, concorrente e distribuída. 
Julia é uma linguagem orientada a objetos que possui multi-métodos como um de seus principais paradigmas de programação. Ela é compilada em tempo de execução através de um compilador _just-in-time_ (JIT), o que favorece ao seu alto desempenho.

Outras características notáveis de Julia incluem:
* Coletor de lixo
* Avaliação ansiosa
* Chamada direta de funções C 
* Chamada de funções Python através do pacote PyCall
* Desempenho comparável a C e Fortran

## A linha de tempo de Julia

<img src="https://i.imgur.com/ZUPOy3D.png" alt= "Julia Timeline" align="middle">

## Códigos de exemplo
Manipulação básica de Strings:
```julia
s1="Hello World!"
s2="How are you?"
# Strings podem ser concatenadas com o operador *
s3=s1*" "*s2
println(s3)
#> Hello World! How are you?

# Strings também podem ser interpoladas com o símbolo $, como em Perl.
println("$s1 $s2")
#> Hello World! How are you?

# O método abaixo retorna a posição do primeiro caracter 'a' na String s2
s1=findfirst(isequal('a'),s2)
println(s1)
#> 5

# A função split separa uma string em um array de substrings.
# Nesse exemplo, a string foi separada toda vez que houvesse o char 'o'. 
s1=split(s2,'o')
println(s1)
#> SubString{String}["H", "w are y", "u?"]
```

Arrays e funções:
```julia
function sumario(a)
    # summary retorna uma descrição do tipo
    # repr retorna o conteúdo do tipo como uma string
    println(summary(a),": ",repr(a))
# Em Julia usamos "end" para fechar funções, loops e condicionais
end

a1=[1,2,3]
sumario(a1)
#>3-element Array{Int64,1}: [1, 2, 3]

# collect retorna um array com todos os elementos dentro do range
# No exemplo abaixo collect retorna um array de inteiros de 1 a 100 e passo 3.
a2 = collect(1:3:100)
for i in a2
    if i % 2 != 0
        continue
    end
    if i >= 50
        break
    end
    print(i, ", ")
end
#>4, 10, 16, 22, 28, 34, 40, 46,
```
Exemplo com Multi-Métodos:
```julia
mutable struct CocaCola
# "::" é usado para definir o tipo da variável
    diet::Bool
    preco::Float64 # em reais
    volume::Float64 # litros
end

mutable struct Mate
    diet::Bool
    preco::Float64 # em reais
    volume::Float64 # em litros
    limao::Bool
end

function servir(qtd,bebida::Mate)
    # Aqui contruímos if-else com o operador ternário "a ? b : c"
    # "a" é a expressão condicional que, caso verdadeira, executa "b"
    #  e, caso contrário, executa "c".
    bebida.volume<qtd ? println("Poxa, não tem Mate o suficiente.") : bebida.volume-=qtd
    println("Sobrou $(bebida.volume) litros de Mate.")
end

function servir(qtd,bebida::CocaCola)
    bebida.volume<qtd ? println("Poxa, não tem Coca o suficiente") : bebida.volume-=qtd
    println("Sobrou $(bebida.volume) litros de Coca Cola.")
end
    
function advinha_diet(bebida::CocaCola)
    println("Essa Coca é Diet?")
    bebida.diet == true ? (println("Sim"); servir(0.5,bebida)) : (println("Não"); servir(0.3,bebida))
end

function advinha_diet(bebida::Mate)
    qtd=0.0
    println("Esse Mate é Diet?")
    bebida.diet == true ? (println("Sim"); qtd+=0.2) : (println("Não"); qtd+=0.1)
    println("Esse Mate é com limão?")
    if bebida.limao == true
         println("Sim")
         qtd+=0.3
         servir(qtd,bebida)
    else
         println("Não")
         qtd+=0.2
         servir(qtd,bebida)
    end
end

bebida1 = CocaCola(true,10.0,2.0)
bebida2 = Mate(false,8.0,1.5,true)

advinha_diet(bebida1)
#>Essa Coca é Diet?
#>Sim
#>Sobrou 1.5 litros de Coca Cola.
advinha_diet(bebida2)
#>Esse Mate é Diet?
#>Não
#>Esse Mate é com limão?
#>Sim
#>Sobrou 1.1 litros de Mate.
```
No exemplo acima, usamos os multi-métodos para tratar as duas bebidas, Coca e Mate, de forma diferente. Tanto a função "advinha_diet", como a "servir", possuem duas versões, com argumentos diferentes. O compilador analisa os tipos de todos os argumentos e chama a versão correspondente com o tipo de bebida que queremos.
