## Authors

- **Weiyi Xia** 
- **Haiqun Lin**

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## SAS_MultiTraj_GBTM
This is the SAS macro that enables the group-based trajectory model with truncated normal measurements.

## Notation
We use letters to denote different variable used in the analysis. 


\begin{figure}
    \centering
\begin{tikzpicture}
    \node[shape=circle, draw = black,inner sep=0.5pt,align=center] (X)    at (0,0)  {Latent\\Trajectory \\$X=1,...,C$};
     \node[ state,dashed,inner sep=4pt,minimum height=5.2cm,minimum width=12cm,draw=gray] (Y)    at (0,-4.2)  { };
      \node[state, align=center] (Y1)    at (-4,-3)  { Indicator I\\ at Time 1,\\$Y^1_{t=1}$};
      \node[state, align=center] (Y2)    at (-0.4,-3)  { Indicator I\\ at Time 2,\\$Y^1_{t=2}$};
      \node[align=center] (Y3)  at (1.7,-3)  {...};
      \node[state, align=center] (Y20)    at (4,-3)  { Indicator I\\ at Time K,\\$Y^1_{t=K}$};
            \node[state, align=center] (Y12)    at (-4,-5)  { Indicator II\\ at Time 1,\\$Y^2_{t=1}$};
      \node[state, align=center] (Y22)    at (-0.4,-5)  { Indicator II\\ at Time 2,\\$Y^2_{t=2}$};
      \node[align=center] (Y32)  at (1.7,-5)  {...};
      \node[state, align=center] (Y202)    at (4,-5)  { Indicator II\\ at Time K,\\$Y^2_{t=K}$};
\coordinate[label= {Manifest Indicators $\boldsymbol Y$},below=3cm of Y2] (y);
\path (X) edge (Y1.north east);
\path (X) edge (Y2);
\draw  (X) to   (Y20.north west);
\path (X) edge  (Y12.north east);
\draw  (X) to  [bend left=20] (Y22.north east);
\draw  (X) to (Y202.north west);
\end{tikzpicture}
    \caption{Directed Acyclic Graph for Longitudinal Indicators }
\end{figure}

The likelihood was constructed based on the finite mixture model. We build the likelihood function as

$$P(\boldsymbol{Y})=\sum_{j=1}^J\pi_j\prod_{k=1}^Kp(Y_k=y_k|X=j)$$


## Assumption
Each indicator is assumed to be independent of the equation. $$P(Y_k=y_k|X=j)\perp P(Y_p=y_p|X=j)$$ for any $$k\neq p$$

