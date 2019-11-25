#' Run a job based on selected code
#'
#' @param code
#'
#' @return
#' @export
#'
#' @examples
run_job <- function(code) {
  # print(code)
  rstudioapi::documentNew(code, type = "r")
}


run_job_from_selection <- function() {
  source_context <- rstudioapi::getSourceEditorContext()
  code <- source_context$selection[[1]]$text

  run_job(code)
}




