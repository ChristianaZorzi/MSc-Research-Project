# Scope
This repository contains the R code developed for the research project "Going from Offline to Online Change-Point Detection", conducted under the supervision of Dr. Andreas Anastasiou at the Department of Mathematics and Statistics, University of Cyprus, during the Fall Semester 2025.

The project introduces Pseudo-Online Isolate-Detect (POID), an adaptation of the Isolate-Detect algorithm for sequential change-point detection.

There are three main parts in this repository:

1. Change in the mean  
The R functions implementing the POID method for detecting changes in the mean, together with the functions for the original Isolate-Detect method. This folder also contains the scripts used for the corresponding simulation studies.

2. Change in the slope  
The R functions implementing the POID method for detecting changes in the slope of continuous piecewise-linear signals, together with the Isolate-Detect functions and the scripts used for the corresponding simulation studies.

3. Real Data Applications  
The R scripts used to apply the proposed POID methodology to real data, including applications for both changes in the mean and changes in the slope.

The simulation scripts are organized in the respective Simulations folders, while the main POID and Isolate-Detect functions are provided within the Change in the mean and Change in the slope folders.
