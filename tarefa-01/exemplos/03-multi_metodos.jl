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