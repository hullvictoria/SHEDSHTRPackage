% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Fugacity.R
\name{get.fug.concs}
\alias{get.fug.concs}
\title{get.fug.concs}
\usage{
get.fug.concs(sdata, chem.data, x, cfug)
}
\arguments{
\item{sdata}{The chemical-scenario data specific to relevant combinations of chemical and scenario. Generated internally.}

\item{chem.data}{The list of scenario-specific information for the chemicals being evaluated. Generated internally.}

\item{x}{The output of the \code{\link{add.fugs}} function.}

\item{cfug}{The output of the \code{\link{chem_fug}} function, a data set with the chemical specific parameters for each
combination of chemical and simulated person. For each chemical, the chemical specific parameters assigned to a given person
are randomly sampled from distributions on those parameters. These distributions are created from point estimates to reflect
real-world uncertainty and variability.}
}
\value{
concs A data set containing calculated dynamic chemical flows for each unique combination
of simulated person and chemical.
}
\description{
Performs fugacity calculations to evaluate time-dependent chemical flows.
}
\details{
This is one of two functions that perform fugacity calculations. This one evaluates dynamic or time-dependent chemical
First, a set of local variables are determined for use in later calculations.  These are a mix of fixed and chemical-dependent
variables (evaluated separately for each person).  Some variables, like chemical mass and app.rates, vary with each source, so
these calculations are repeated for each source-scenario.
Second, the eigenvalues and eigenvectors of the jacobian matrix are calculated.  Since the fugacity model has been reduced to
just two compartments (air and surface), the solutions can be expressed analytically, and there is no explicit invocation of
any linear algebra routines that would normally be required.
Third, the variables composing the \code{concs} output are evaluated. The variables \code{m.c.air} and \code{m.c.sur}
are the time-constant masses, while \code{m.t0.air} and \code{m.t0.sur} are the time-dependent masses at t=0. The
time-constant parts are zero here because the permanent sources (i.e. \code{c.src.air} and \code{c.src.sur}) are
assumed to be zero in these calculations.  The time-dependent masses are multiplied exponentially as a function of time,
and thus approach zero when enough time has passed.
}
\seealso{
\code{\link{chem_fugs}}, \code{\link{Fugacity}}, \code{\link{Run}}, \code{\link{run}}, \code{\link{get.y0.concs}}
}
\author{
Kristin Isaacs, Graham Glen
}
\keyword{SHEDS}
\keyword{kwd2}
