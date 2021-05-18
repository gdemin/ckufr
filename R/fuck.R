#' Search last error in Google
#'
#' Just type 'fuck' or 'shit' in the console and we will google for you...
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
    browseURL(paste0("https://www.google.com/search?q=R ", curr_error))
    invisible(curr_error)
}


class(fuck) = union("call_me", class(fuck))

#' @export
#' @rdname fuck
shit = fuck

#' @export
print.call_me = function(x, ...){
    invisible(x())
}
