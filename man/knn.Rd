% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/knn.R
\name{knn}
\alias{knn}
\title{Generic function to make a prediction for a time series.
If a knn model is provided as the first argument, knn_forecast
will be directly called. If single values are provided as k and d
as no parameter search can be perfomed, knn_forecast will be
called automatically. If no values are provided for k and/or d,
values 1 to 50 will be used by default.}
\usage{
knn(
  y,
  k = 1:50,
  d = 1:50,
  initial = NULL,
  distance = "euclidean",
  error_measure = "MAE",
  weight = "proportional",
  v = 1,
  threads = 1
)
}
\arguments{
\item{y}{A time series or a trained kNN model generated by the
knn_param_search function. In case that a model is provided the knn_forecast
function will be automatically called.}

\item{k}{Values of k's to be analyzed or chosen k for knn forecasting.
Default value is 1 to 50.}

\item{d}{Values of d's to be analyzed or chosen d for knn forecasting.
Default value is 1 to 50.}

\item{initial}{Variable that determines the limit of the known past for
the first instant predicted.}

\item{distance}{Type of metric to evaluate the distance between points.
Many metrics are supported: euclidean, manhattan, dynamic time warping,
camberra and others. For more information about the supported metrics check
the values that 'method' argument of function parDist (from parallelDist
package) can take as this is the function used to calculate the distances.
Link to package info: https://cran.r-project.org/web/packages/parallelDist
Some of the values that this argument can take are "euclidean", "manhattan",
"dtw", "camberra", "chord".}

\item{error_measure}{Type of metric to evaluate the prediction error.
Five metrics supported:
\describe{
  \item{ME}{Mean Error}
  \item{RMSE}{Root Mean Squared Error}
  \item{MAE}{Mean Absolute Error}
  \item{MPE}{Mean Percentage Error}
  \item{MAPE}{Mean Absolute Percentage Error}
}}

\item{weight}{Type of weight to be used at the time of calculating the
predicted value with a weighted mean. Three supported: proportional,
average, linear.
\describe{
  \item{proportional}{the weight assigned to each neighbor is inversely
                      proportional to its distance}
  \item{average}{all neighbors are assigned with the same weight}
  \item{linear}{nearest neighbor is assigned with weight k, second closest
                neighbor with weight k-1, and so on until the least nearest
                neighbor which is assigned with a weight of 1.}
}}

\item{v}{Variable to be predicted if given multivariate time series.}

\item{threads}{Number of threads to be used when parallelizing, default is 1}
}
\value{
A matrix of errors, optimal k and d. All tested ks and ks and all
the used metrics.
}
\description{
Generic function to make a prediction for a time series.
If a knn model is provided as the first argument, knn_forecast
will be directly called. If single values are provided as k and d
as no parameter search can be perfomed, knn_forecast will be
called automatically. If no values are provided for k and/or d,
values 1 to 50 will be used by default.
}
\examples{
knn(AirPassengers, 1:5, 1:3)
knn(LakeHuron, 1:10, 1:6)
}
