This document contains build and release instructions for jsr223. Instructions are specific to RStudio and Eclipse IDE for Java.

- Make sure the following packages are installed/updated.

  pander
  rmarkdown
  testthat

- Close all sessions using the package.

- Uninstall jsr223: detach("package:jsr223", unload=TRUE); remove.packages("jsr223")
  Sometimes the JAR files fail to update during build in RStudio.

- In Java project...

--- If changing the major and minor (not build) version numbers, change the version numbers for JAR file names.
    Delete previous-version JAR files in the R project folder to prevent distributing multiple versions in the R package.
    NOTE: As of this writing, there is not a JAR manifest file. If you add one, update the versions in the manifest file.
    Double-click *.jardesc objects in the project explorer to change output file names.

---- Build both source and binary JAR files (right-click *.jardesc files in project explorer and select `Create Jar`).

- In R project...

--- Update documentation (man files and vignettes). Use `devtools::install(build_vignettes = TRUE)` to preview vignette
    build in package. Test links in the documentation.

--- Change version numbers and dependencies in DESCRIPTION file. Update versions and release info in NEWS and user manual.

--- Build and test R project on all supported platforms.
    Run standard tests with `devtools::test()`.
    Run the non-distributed tests in the tests folder above the R project folder (if any). Be sure to read testing instructions
    in each file carefully.
    Run `devtools::check()`.

--- Build R project source package.

- Move source package into an empty directory and check it using `R CMD check --as-cran` using Java 8, 9, and 10 (set
  JAVA_HOME to the appropriate Java folder).

- Copy source package to releases folder.

- Push changes to GitHub.

- Create release tag in GIT repository. https://github.com/floidgilbert/jsr223/releases
