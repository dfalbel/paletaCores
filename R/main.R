#' Ler Imagem
#'
#' copiada do captchasaj/ só mudei que o arquivo é JPEG
#'
ler <- function(a) {
  #img <- png::readPNG(a)
  img <- jpeg::readJPEG(a)
  img_dim <- dim(img)
  img_df <- data.frame(
    x = rep(1:img_dim[2], each = img_dim[1]),
    y = rep(img_dim[1]:1, img_dim[2]),
    r = as.vector(img[,,1]),
    g = as.vector(img[,,2]),
    b = as.vector(img[,,3])
  )
  d <- dplyr::mutate(img_df, cor = rgb(r, g, b), id = 1:n())
  d <- dplyr::filter(d, cor != '#FFFFFF')
  d
}

#' Exibir um conjunto de cores
#'
#' copiada e modificada do pacote wesanderson
#' https://github.com/karthik/wesanderson
#'
#'@export
exibir <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
}

#' Criar a paleta de cores
#'
#'@param img caminho p/ a imagem da qual deseja criar a paleta
#'@param n número de cores na paleta
#'
#'@export
criar_paleta <- function(img, n = 5){
  # leitura do arquivo
  foto <- ler(img)
  # cluster das cores
  cluster <- kmeans(x = foto %>% dplyr::select(r,g,b), centers = n)
  foto$grupo <- cluster$cluster
  # definição das cores médias
  grupos <- foto %>%
    dplyr::group_by(grupo) %>%
    dplyr::summarise(
      r = mean(r),
      g = mean(g),
      b = mean(b)
    ) %>%
    dplyr::mutate(
      cor = rgb(r,g,b)
    )
  return(grupos$cor)
}

#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL

