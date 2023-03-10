% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GLMfunctions.R
\name{predict.FKM.glm}
\alias{predict.FKM.glm}
\title{Predict the model outcome for a new set of data}
\usage{
\method{predict}{FKM.glm}(object, newdata, ...)
}
\arguments{
\item{object}{An object of class \code{FKM.glm} found by modeling an
outcome based on cluster membership degrees.}

\item{newdata}{A new data containing the same variables clustered on and used
as covariates in the model.}

\item{...}{Additional arguments.}
}
\value{
A data frame containing the degree of cluster membership for each
individual in the new dataset and predicted outcome.
}
\description{
Predict the model outcome for a new set of data by first fitting
tensor-product splines to the new dataset and then identifying degree of
cluster membership for the previously identified clusters.
}
\examples{
# Fit initial model
data(TS.sim)

fitsplines <- TPSfit(TS.sim, vars=c("Var1", "Var2", "Var3"), time="Time",
     ID="SubjectID", knots_time=c(0, 91, 182, 273, 365), n_fit_times=10)

clusters1 <- cluster.fitted(fitsplines, k=3, m=1.3, seed=12345, RS=5, noise=TRUE)

model <- FKM.glm(clusters1, TS.sim, y="outcome", covariates=c("x1", "x2"),
family="binomial")

# Get new dataset
data(TS.sim.new)
predicted <- predict(model, TS.sim.new)

}
