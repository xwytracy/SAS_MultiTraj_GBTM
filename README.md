## Authors

- **Weiyi Xia** 
- **Haiqun Lin**

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Group-Based (Multi-)Trajectory Model
This is the SAS macro that enables the group-based trajectory model with truncated normal measurements.

### Notation
We use letters to denote different variables used in the analysis. 
- $X$: A latent class variable representing different clusters based on observed trajectory patterns in the sample. Assume there are a total of $C$ classes, each with distinct trajectories. The variable $X$ can take values $1, 2, \ldots, C$.
- $p$: The number of manifest variable trajectories included in the data analysis. In this SAS macro, it is assumed that $p = 2$.
- $k$: A time indicator specifying the time point at which a measurement is recorded.
- $Y_k^p$: The value of the manifest variable $Y^p$ observed at time $k$.

### DAG
![TikZ Plot](./image.png)

### Likelihood
The likelihood was constructed based on the finite mixture model. We build the likelihood function as $$P(\boldsymbol{Y})=\sum_{j=1}^J\pi_j\prod_{p=1}^{2}{\prod_{k=1}^Kp(Y_k^p=y_k^p|X=j)}$$.
The $p(y_k^p|X)$ can vary depending on the assumptions made and the study design. 
- $p(y_k^p|X)$ can follow a Gaussian distribution if the observed manifest indicator takes a real value.
- If the indicator is continuous but bounded by lower or upper limits (or both), it may follow a truncated normal distribution.
- Other commonly used distributional assumptions include a Bernoulli distribution for binary indicators and a Poisson distribution for indicators that take non-negative integer values starting from 0.

### Assumption
Each indicator is assumed to be independent of the equation. $$P(Y_k=y_k|X=j)\perp P(Y_p=y_p|X=j)$$ for any $$k\neq p$$

