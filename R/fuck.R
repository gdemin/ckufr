#' Search last error in Google
#'
#' Just type 'fuck' or 'shit' in the console just after the error and we will google for you...
#' @return invisible character - text of the last error
#' @export
#'
#' @examples
#' \dontrun{
#' stop("my strange error")
#' fuck
#' }
fuck = function() {
    curr_error = eval(quote(trimws(geterrmessage())), envir = .GlobalEnv)
    cat("Searching the error '", curr_error, "'...\n", sep = "")
    utils::browseURL(paste0("https://www.google.com/search?q=R ", curr_error))
    invisible(curr_error)
}


class(fuck) = union("call_me", class(fuck))

#' @export
#' @rdname fuck
shit = fuck

#' @export
#' @rdname fuck
oh = fuck

#' @export
print.call_me = function(x, ...){
    invisible(x())
}

.onAttach = function(...){
    packageStartupMessage("For better googling experience set error messages language to English with Sys.setlocale(\"LC_MESSAGES\", \"C\")")
}
