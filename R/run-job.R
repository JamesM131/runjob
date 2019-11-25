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
  fs::dir_create(here::here(".tmp-jobs"))

  file_path <- here::here(".tmp-jobs", "Job.R")

  write(code, file = file_path)

  # TODO: An idea here for deleting the file after the job had finished is to include the fs file deletion code after this.
  rstudioapi::jobRunScript(file_path, workingDir = here::here(), importEnv = TRUE, exportEnv = "R_GlobalEnv")

}


run_job_from_selection <- function() {
  source_context <- rstudioapi::getSourceEditorContext()
  code <- source_context$selection[[1]]$text

  run_job(code)
}




