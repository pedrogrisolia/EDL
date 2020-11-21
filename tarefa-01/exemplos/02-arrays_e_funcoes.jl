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