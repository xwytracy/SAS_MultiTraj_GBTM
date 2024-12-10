# SAS_MultiTraj_GBTM
This is the SAS macro that enables the group-based trajectory model with truncated normal measurements.

The likelihood was constructed based on the finite mixture model. We build the likelihood function as
$$P(\boldsymbol{Y})=\sum_{j=1}^J\pi_j\prod_{k=1}^Kp(Y_k=y_k|X=j)$$
