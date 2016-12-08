.onLoad <- function(libname, RRRR615){
  packageStartupMessage("Please type in ?RRRR615 to get started, or ?RRLM for documentation on the main function.")
}

.onUnload <- function (libpath) {
  library.dynam.unload("RRRR615", libpath)
}