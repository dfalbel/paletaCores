<!-- README.md is generated from README.Rmd. Please edit that file -->
Esse simples pacote tem o intúito de criar paleta de cores a partir de imagens. Ele utiliza uma clusterização por meio do método k-means para separar os pixels da imagens em grupos de cores.

Funcionamento
-------------

O funcionamento do pacote é muito simples. Ele possui apenas duas funções:

-   `criar_paleta`: recebe o caminho de uma imagem e o número de cores desejadas e retorna a paleta de cores.
-   `exibir`: exibe a paleta de cores criada

Exemplos
--------

![david bowie](inst/david%20bowie.jpeg)

``` r
library(magrittr)
library(paletaCores)
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> 
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
paleta <- criar_paleta("inst/david bowie.jpeg")
exibir(paleta)
```

![](README-unnamed-chunk-2-1.png)
