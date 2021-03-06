% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ShedsHT.R
\name{dir.inhal.aer}
\alias{dir.inhal.aer}
\title{dir.inhal.aer}
\usage{
dir.inhal.aer(sd, cd, cb, io)
}
\arguments{
\item{sd}{The chemical-scenario data specific to relevant combinations of chemical and scenario. Generated internally.}

\item{cd}{The list of scenario-specific information for the chemicals being evaluated. Generated internally.}

\item{cb}{A copy of the \code{base} data set output from the \code{\link{make.cbase}} function, with columns added for
exposure variables.}

\item{io}{A binary variable indicating whether the volume of the aerosol is used to approximate the affected volume.}
}
\value{
dir.inh.aer The calculated quantity of chemical inhalation from aerosols, like hairspray and similar products,
that are directly injected into the air on or around each exposed person.
}
\description{
Models the inhalation exposure from the use of aerosol products for each theoretical person.
}
\details{
This scenario considers inhalation exposure from the use of aerosol products. Typical examples include hairspray
and spray-on mosquito repellent.
The function produces a \code{prevalence} value, which reflects the fraction of the population who use this scenario at all.
It also produces a \code{frequency} value, which is the mean number  of times per year this scenario occurs among that
fraction of the population specified by prevalence.
Since SHEDS operates on the basis of one random day, the \code{frequency} is  divided by 365 and then passed to
the \code{\link{p.round}} (probabilistic rounding) function, which rounds either up or down to the nearest integer. Very
common events may happen more than once in a day.
The function also produces a \code{mass} variable, which refers to the  mass of the product in grams in a typical usage
event. The \code{composition} is the percentage of that mass that is the chemical in question.
\code{frac.aer} is the fraction of the product mass that becomes aerosolized, and the \code{volume} affected by the use is
approximated to allow the calculation of a concentration or density. Defaults are set in the code if these variables  are
missing from the input file.
Exposure for the inhalation pathway has units of micrograms per cubic meter, reflecting the average air concentration of
the chemical. An \code{airconc} variable is defined using \code{mass}, \code{composition}, \code{frac.aer}, and \code{volume}.
Since exposure depends on the time-averaged concentration, a duration is necessary. For example, if one spends five minutes
in an aerosol cloud and the rest of the day in clean air, the daily exposure is the cloud concentration multiplied by 5/1440
(where 1440 is the number of minutes in a day).
This function also calculates the inhaled dose, in units of micrograms per day. The dose equals the product of
\code{exposure} (g/m3), basal ventilation rate, \code{bvr} (m3/day), the METS factor of 1.75 (typically people inhale air
at an average of 1.75 times the basal rate to support common daily activities), and a  conversion factor of 1E+06 from grams
to micrograms.
}
\author{
Kristin Isaacs, Graham Glen

keyword{ ~SHEDS }
}
