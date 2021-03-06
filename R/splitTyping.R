#' @title splitTyping
#'
#' @description Converts a well-formed HLA allele name to a matrix of fields
#'
#' @param aChar a \code{character} array containing one or more well-formed
#' HLA alleles,
#' see http://hla.alleles.org/nomenclature/naming.html
#'
#' @return a n x 6 matrix of fields
#'
#' @examples
#'
#' ## Split one HLA typing into an array of entries
#' output <- splitTyping("HLA-DRB1*13:01:01:02")
#'
#' print(output)
#'
#' ## Split one HLA typing into an array of entries
#' output <- splitTyping(c("G*01:04:01:02", "DQA1*01:01:01:03"))
#'
#' print(output)
#'
#' @author Adewunmi Adelaja
#'
#' @importFrom stringr str_extract
#' @export
splitTyping <- function (aChar) {

    prefix <- str_extract(aChar, "(^.*[:digit:])|(^[:alpha:]+$)")
    splitted <- strsplit(prefix,"[.*:_]")
    splitted <- t(sapply(splitted, function(x) c(x, rep(NA, 5 - length(x)))))
    suffix <- str_extract(aChar, "(?<=([:digit:]|[.*:_]))[:alpha:]+$")
    output <- cbind(splitted, as.array(suffix))

    return(output)
}
