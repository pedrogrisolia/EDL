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