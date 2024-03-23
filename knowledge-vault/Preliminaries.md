dev# Asymptotic Notation
***Asymptotic notation*** is used to express ***growth rates*** of functions in a concise manner. For any $f$ and $g$ both defined on some *unbounded subset* of *positive integers* to the *non-negative real numbers*, such that $g(n)$ is *strictly positive* for *large enough* $n$, we have
$$
\begin{align}
&f(n) = o(g(n)) &&\bigg|&&
\text{$f$ is dominated by $g$ asymptotically} &&\bigg|&&
\lim_{ n \to \infty } \frac{f(n)}{g(n)} = 0 &&\bigg|&&
\forall k>0, \exists N \in \mathbb{N}, \forall n>N: \ \ |f(n)| < k g(n)
\\ \\
&f(n) = O(g(n) &&\Bigg|&&
\begin{aligned}
&\text{$|f|$ is asymptotically} \\
&\text{bounded above by $g$, upto} \\
&\text{constant factor $k$}
\end{aligned} &&\Bigg|&&
\limsup_{ n \to \infty } \frac{f(n)}{g(n)} < \infty &&\Bigg|&&
\exists k>0, \exists N \in \mathbb{N}, \forall n>N: \ \ |f(n)| \leq k g(n)
\\ \\
&f(n) = \Theta(g(n)) &&\Bigg|&&
\begin{aligned}
&\text{$f$ is asymptotically bounded} \\
&\text{by $g$ both above and below,} \\
&\text{with constant factors} \\
&\text{$k_{1}$ and $k_{2}$ respectively}
\end{aligned} &&\Bigg|&&
\begin{aligned}
&f(n) = O(g(n)) \ \text{and} \\ & g(n) = O(f(n))
\end{aligned} &&\Bigg|&&
\begin{aligned}
&\exists k_{1}, k_{2} > 0, \exists N \in \mathbb{N}, \forall n>N: \\ &k_{1} g(n) \leq f(n) < k_{2} g(n)
\end{aligned}
\\ \\
&f(n) \sim g(n) &&\bigg|&&
\text{$f$ is equal to $g$ asymptotically} &&\bigg|&&
\lim_{ n \to \infty } \frac{f(n)}{g(n)} = 1 &&\bigg|&&
\forall \varepsilon>0, \exists N \in \mathbb{N}, \forall n>N: \ \ \left| \frac{f(n)}{g(n)} - 1 \right| < \varepsilon
\\ \\
&f(n) = \Omega(g(n) &&\Bigg|&&
\begin{aligned}
&\text{$f$ is asymptotically } \\
&\text{bounded below by $g$, upto} \\
&\text{constant factor $k$}
\end{aligned} &&\Bigg|&&
\liminf_{ n \to \infty } \frac{f(n)}{g(n)} > 0 &&\Bigg|&&
\exists k>0, \exists N \in \mathbb{N}, \forall n>N: \ \ f(n) \geq k g(n)
\\ \\
&f(n) = \omega(g(n)) &&\bigg|&&
\text{$f$ dominates $g$ asymptotically} &&\bigg|&&
\lim_{ n \to \infty } \frac{f(n)}{g(n)} = \infty &&\bigg|&&
\forall k>0, \exists N \in \mathbb{N}, \forall n>N: \ \ f(n) > k g(n)
\end{align}
$$
The usage of the ***equality*** symbol is informal, and meant to be understood as a "one-way" relation. For example $f(n) = O(n)$ means $f$ ***is*** a function that grows linearly; it would be ***wrong*** to say the inverse of that. Formally, you would say $f \in O(n)$, where $O(n)$ is the set of functions that grow linearly.

## Interpreting Expressions
It is common to see expressions involving ***Asymptotic notation*** such as
$$
\begin{align}
g(n) &= h(n) + \Omega(f(n)) \\
(n + O(n^{1/2})) \cdot (n + O(\log n))^2 &= n^3 + O(n^{5/2}) \\
n^{O(1)} &= O(e^n)
\end{align}
$$
Just as before, the the ***equality*** symbol is informal, and meant to be understood as a "one-way" relation. Interpreting an expression like this can be tough of as, for all functions that satisfy each ***Asymptotic notation*** on the $\text{LHS}$, there exist functions that satisfy the ***Asymptotic notation*** on the $\text{RHS}$, such that $\text{LHS} = \text{RHS}$ when substituting them into the expression. Continuing with the examples above, this interpretation states that
$$
\begin{align}
g(n) &= h(n) + \Omega(f(n)) &&\iff&& \exists k \in \Omega(f(n)): \ \ g(n) = h(n) + k(n) \\
(n + O(n^{1/2})) \cdot (n + O(\log n))^2 &= n^3 + O(n^{5/2}) &&\iff&& \begin{aligned}
\forall f \in O( n^{1/2} ), \forall g \in O(\log n), \exists h \in O(n^{5/2}): \ \\
(n + f(n)) \cdot (n + g(n))^2 = n^3 + h(n)
\end{aligned} \\
n^{O(1)} &= O(e^n) &&\iff&& \forall k \in O(1), \exists f \in O(e^n): \ \ n^{k(n)} = f(n)
\end{align}
$$
In terms of using set-notation, as above, is meaning is that both sides of the expression form sets of functions called $\text{LHS}$ and $\text{RHS}$ respectively, and $\text{LHS} \subseteq \text{RHS}$. For example if we consider the expression $n^{\large O(1)} = O(e^n)$, we get
$$
\begin{align}
&&& \text{LHS} = \{ \ n \mapsto n^{f(n)} \ | \ f \in O(1) \ \} \\
&&& \text{RHS} = \{ \ n \mapsto f(n) \ | \ f \in O(e^n) \ \} = O(e^n) \\
\\ \therefore &&&  \{ \ n \mapsto n^{f(n)} \ | \ f \in O(1) \ \} \subseteq O(e^n)
\end{align}
$$
That result at the end makes intuitively, since, if a function is bound above by *polynomial functions*, then it is ***definitely*** bound above by *exponential functions*.

## Useful Results
Above, the general rules are outlined. But there are some ***useful results*** for interpreting these expressions. For example, arithmetic operations like $g(n) = h(n) + O(f(n))$ are equivalent to $g(n) - h(n) = O(f(n))$, and so on. 

Or another example, the result that if $f(n) = n^{\large -\omega(1)}$, then $f$ is ***negligible***. That expression, when [[#Interpreting Expressions|interpreted and manipulated]], yields the following definition for ***negligible*** functions:
$$\text{$f$ is negligible} \iff \forall c>0, \exists N \in \mathbb{N}, \forall n>N: \ \ |f(n)| < \frac{1}{n^c}$$

# Finite Fields
Given any field $\large(\mathbb{F}_{q}, +, \cdot)$, we call it a ***finite field*** if the number is elements in $\large\mathbb{F}_{q}$ is $q$, and $q$ is a *power* of a *prime number*. More formally, $\large\mathbb{F}_{q}$ is a ***finite field*** if there exists some prime $p \in \mathbb{P}$ and some natural number $n \in \mathbb{N}^+$, for which $\large q = |\mathbb{F}_{q}| = p^n$.

When $q$ is itself prime, then every $\large\mathbb{F}_{q}$ is isomorphic to $\large\mathbb{Z}_{q}$, meaning that for every theorem or property that holds in $\large\mathbb{F}_q$, there is a *mirror* theorem or property that holds in $\large\mathbb{Z}_q$, and vice versa. Here is why this is useful. Lets say you are working with *(a really intuitive and nice to work with)* finite field $\large\mathbb{F}_{q}$, and you end up proving a ***super*** useful property. What you can now do, is *engineer* the finite field $\large\mathbb{G}_{q}$ who's structure is designed to allow for algorithmic shortcuts and efficient computation. You can then just find the *mirror* theorem, for $\large\mathbb{G}_{q}$, and you're all set to *efficiently* compute useful results.

# Hadamard Product
For any two matrices $\mathbf{A}, \mathbf{B}$ of the same dimension $n \times m$, the ***Hadamard product*** is defined as
$$
\large
\mathbf{A} \odot \mathbf{B} = \begin{pmatrix}
a_{11} & \dots & a_{1m} \\
\vdots & \ddots & \vdots \\
a_{n1} & \dots & a_{nm}
\end{pmatrix} \odot \begin{pmatrix}
b_{11} & \dots & b_{1m} \\
\vdots & \ddots & \vdots \\
b_{n1} & \dots & b_{nm}
\end{pmatrix} = \begin{pmatrix}
a_{11} \cdot b_{11} & \dots & a_{1m} \cdot b_{1m} \\
\vdots & \ddots & \vdots \\
a_{n1} \cdot b_{n1} & \dots & a_{nm} \cdot b_{nm}
\end{pmatrix}
$$
Similarly, for any two vectors $\mathbf{a} = (a_{1},\dots,a_{n}), \mathbf{b} = (b_{1},\dots,b_{n})$, the ***Hadamard product*** is defined as
$$
\large
\mathbf{a} \odot \mathbf{b}
= \begin{pmatrix} a_{1} \\ \vdots \\ a_{n} \end{pmatrix}
\odot \begin{pmatrix} b_{1} \\ \vdots \\ b_{n} \end{pmatrix} 
= \begin{pmatrix} a_{1} \cdot b_{1} \\ \vdots \\ a_{n} \cdot b_{n}
\end{pmatrix}
$$

# Convolution Product
For any vector $\mathbf{a} = (a_{1}, \dots, a_{n})$, the ***cyclic rotation*** of $\mathbf{a}$ is defined as $\large \mathrm{rot}(\mathbf{a}) = (a_{n}, a_{1},\dots,a_{n-1})$. Similarly, the ***circulant matrix*** of $\mathbf{a}$ is defined as $\large \mathrm{Rot}(\mathbf{a}) = \left[\mathbf{a}, \mathrm{rot}(\mathbf{a}), \mathrm{rot}^2(\mathbf{a}), \dots, \mathrm{rot}^{n-1}(\mathbf{a})\right]$ where each element is a column. Written out component-wise, $\large \mathrm{Rot}(\mathbf{a})$ is
$$
\large \mathrm{Rot}(\mathbf{a}) = \begin{pmatrix}
a_1 & a_{n} & \cdots & a_3 & a_2 \\
a_2 & a_1 & a_{n} & & a_{3} \\
\vdots & a_2 & a_1 & \ddots & \vdots \\
a_{n-1} &  & \ddots & \ddots & a_{n} \\
a_{n} & a_{n-1} & \cdots & a_2 & a_1
\end{pmatrix}
$$
The ***convolution product*** of two *vectors* $\mathbf{a} = (a_{1},\dots,a_{n}), \mathbf{b} = (b_{1},\dots,b_{n})$ is defined as $\large \mathbf{a} \otimes \mathbf{b}  = \mathrm{Rot}(\mathbf{a}) \cdot \mathbf{b}$. The $i$-th component of $\large \mathbf{a} \otimes \mathbf{b}$ is defined by the equation
$$\large (\mathbf{a} \otimes \mathbf{b})_i = \sum_{j=1}^{n} a_j \cdot b_{({i-j} \mod n) \ + \ 1}$$

# Hadamard Product Rings
Given any [[#Finite Fields|finite field]] $\large \mathbb{F}_{q}$ we we can construct the ring $\large (\mathbb{F}_{q}^n, +, \odot)$ where $+$ is ***vector addition*** and $\odot$ is the [[#Hadamard Product|Hadamard product]]. Such a ring, I will call a ***Hadamard product ring***, or ***product ring*** $\large \mathbb{F}_{q}^n$ of $n$-dimensional vectors.

The ***additive*** and ***multiplicative identity*** elements of ***product ring*** $\large \mathbb{F}_{q}^n$ are $\mathbf{0} = (0, \dots, 0) \in \large \mathbb{F}_{q}^n$ and $\mathbf{1} = (1, 1, \dots, 1) \in \large \mathbb{F}_{q}^n$, where $0 \in \large \mathbb{F}_{q}$ and $1 \in \large \mathbb{F}_{q}$ are the *additive* and *multiplicative identity* elements $\large \mathbb{F}_{q}$. 

# Convolution Rings
Given any [[#Finite Fields|finite field]] $\large \mathbb{F}_{q}$ we we can construct the ***coordinate vector space*** $\large\mathbb{F}_{q}^n$ over $\large \mathbb{F}_{q}$. Elements of $\large\mathbb{F}_{q}^n$ are $n$-dimensional ***coordinate vectors***, who's components are elements of $\large\mathbb{F}_{q}$. We can then construct the ring $\large (\mathbb{F}_{q}^n, +, \otimes)$ where $+$ is ***vector addition*** and $\otimes$ is the [[#Convolution Product|convolution product]]. Such a ring, I will call a ***convolution ring***, or ***convolution product ring*** $\large \mathbb{F}_{q}^n$ of $n$-dimensional vectors.

The ***additive*** and ***multiplicative identity*** elements of ***convolution ring*** $\large \mathbb{F}_{q}^n$ are $\mathbf{0} = (0, \dots, 0) \in \large \mathbb{F}_{q}^n$ and $\mathbf{1} = (1, 0, \dots, 0) \in \large \mathbb{F}_{q}^n$, where $0 \in \large \mathbb{F}_{q}$ and $1 \in \large \mathbb{F}_{q}$ are the *additive* and *multiplicative identity* elements $\large \mathbb{F}_{q}$. 


# Ajtai Hash Function Family 
For any $n, m, q \in \mathbb{Z}^+$ such that $n \log_{2} q < m < \large\frac{q}{2n^4}$ and $q=O(n^c)$ for some constant $c>0$, the ***Ajtai hash function family*** $\large \mathcal{F}_{n,m,q} = \{ \ f_{\mathbf{A}}: \{ 0,1 \}^m \to \mathbb{Z}_{q}^n \ | \ \mathbf{A} \in {\mathbb{Z}_{q}}^{n \times m} \ \}$ is defined by
$$\large f_{\mathbf{A}}(\vec{x}) = \mathbf{A} \vec{x} \mod q$$
where $\large \mathbb{Z}_{q}$ is the *quotient ring* of $\mathbb{Z}$ modulo $q$; $\large \mathbb{Z}_{q}^n$ is the corresponding [[#Hadamard Product Rings|product ring]].

# Generalised Knapsack Function Family
For any ring $(R, +, \cdot)$, subset $S \subset R$ and integer $m\geq 1$, the ***generalised knapsack function family*** $\large \mathcal{H}(R, S, m) = \{ \ f_{\mathbf{a}} : S^m \to R \ | \ \mathbf{a} \in R^m \ \}$ is defined by
$$\large f_{\mathbf{a}}(\mathbf{x}) = \sum_{i=1}^m \mathbf{a}_{i} \cdot \mathbf{x}_{i}$$
which is computed using $R$'s ring *addition* $(+)$ and ring *multiplication* $(\cdot)$. This family is a generalisation of [[#Ajtai Hash Function Family|Ajtai functions]]; just set $R=\large\mathbb{Z}_{q}^n$and $S = \{ \mathbf{0}, \mathbf{1} \}$, and interpret $\mathbf{a} \in R^m$ as the matrix $\mathbf{A} \in \large{\mathbb{Z}_{q}}^{n \times m}$, and you will recover the [[#Ajtai Hash Function Family|Ajtai functions]].

# SWIFFT Function Family
Let $n$ be a power of $2$, $m>0$ be small integer, and $p>0$ be a modulus (not *necessarily* prime, but certain primes are convenient). Define $\large R = \mathbb{Z}_{p}[\alpha]/(\alpha^n+1)$ to be the ring of polynomials (in $\alpha$) having integer coefficients, modulo $p$ and $a^n + 1$. Thus, for any element $\mathbf{x} = x_{0} + \dots + x_{n-1}\alpha^{n-1} \in R$, it's coefficients $x_{0}, \dots, x_{n-1}$ will be elements of $\large \mathbb{Z}_{p} = \{ 0,\dots,p-1 \}$. The $n$-tuple $(x_{0}, \dots, x_{n-1}) \in \large\mathbb{Z}_{p}^n$ corresponds to the polynomial $\mathbf{x}$, creating a connection between elements of $R$ and $\large \mathbb{Z}_{q}^n$. Let $\{ 0, 1 \} \subset \large \mathbb{Z}_{q}$ be the set of ***binary coefficients***, and $\{ 0, 1 \}^n \subset R$ be the set of ***polynomials with binary coefficients***.

The ***SWIFFT Function Family*** $\large \mathcal{W_{n,m,p}}$ is defined to be the [[#Generalised Knapsack Function Family|knapsack function family]] $\large \mathcal{H}(R, \{ 0,1 \}^n, m)$. A particular function $\large f_{\mathbf{a}} \in \mathcal{W}_{n,m,p}$ is parameterised on $\mathbf{a} = (\mathbf{a}_{1}, \dots, \mathbf{a}_{1}) \in R^m$, where $\mathbf{a}_{1}, \dots, \mathbf{a}_{1} \in R$ are called the multipliers. The function $\large f_{\mathbf{a}}$ takes $\mathbf{x} = (\mathbf{x}_{1},\dots,\mathbf{x}_{m}) \in (\{ 0, 1 \}^n)^m$ as inputs (corresponding to an input length of $mn$ bits), and is defined as
$$\large f_{\mathbf{a}}(\mathbf{x}) = \sum_{i=1}^m \mathbf{a}_{i} \cdot \mathbf{x}_{i}$$
Suppose that $p$ is prime and $p-1$ is a multiple of $2n$, hen $\mathbb{Z}_{p}$ is a [[#Finite Fields|finite field]] and it contains a *multiplicative subgroup* of order $2n$ who's elements are all the $2n$-th roots of unity in $\mathbb{Z}_{p}$ (i.e. the roots of the polynomial $\alpha^{2n}-1 \mod p$). Let $\omega \in \mathbb{Z}_{p}$ be some generator of this subgroup, i.e., an element of order $2n$. The $n$ *odd* powers $\omega, \omega^3, \dots, \omega^{2n-1}$ are exactly the *primitive* $2n$-th roots of unity (i.e. tje roots of $\alpha^n+1$). 

In order to compute a polynomial product $\mathbf{a}_{i} \cdot \mathbf{x}_{i}$, modulo $p$ and $\alpha^n + 1$, it suffices to compute only the $n$ primitive Fourier coefficients of $\mathbf{a}_{i}$ and $\mathbf{x}_{i}$, (i.e. the values $\mathbf{a}_{i}(\omega), \mathbf{a}_{i}(\omega^3),\dots,\mathbf{a}_{i}(\omega^{2n-1})$ and likewise for $\mathbf{x}_{i}$). The primitive coefficients can be computed all at once by pre-processing the input and then applying an $n$-dimensional FFT (which uses half the space). Furthermore, because the field $\mathbb{Z}_{p}$ has roots of unity, the FFT can be performed over $\mathbb{Z}_{p}$ using the $n$-th primitive root of unity $\omega^2$, instead of over $\mathbb{C}$.

In addition to using an FFT, other significant optimisations are possible when computing $\large f_{\mathbf{a}}$. First, because the multipliers $\mathbf{a}_{i}$ are fixed in advance and determined uniquely by their primitive Fourier coefficients, we can simply store and work with their Fourier representation. Additionally, because the FFT is linear and a bijection, there is no need to even apply an inverse FFT. In other words, the value of $\large f_{\mathbf{a}}$ is correctly and uniquely determined by summing the Fourier representations of $\mathbf{a}_{i} \cdot \mathbf{x}_{i}$.

Now pick the parameters $n=64, m=16, p=257$, corresponding to an input length of $mn = \text{1024 bits (128 bytes)}$, to an output in the range $\large \mathbb{Z}^n_{q}$, which has size $p^n = 257^{64} \approx 2^{512}$. An output in $\large \mathbb{Z}^n_{q}$ can easily be represented using $\text{528 bits (66 bytes)}$. Other unambiguous representations (using > $\text{512 bits}$) are also possible; the representation does not affect security.

Here is how the choice of parameters was made. The first consideration is the security of the compression function. The function corresponds to a subset-sum from $mn$ bits to roughly $n \log_{2} p$ bits. First set the constraints $mn= 1024$ and $n \log_{2} p \approx 512$, because solving such subset-sum problems appears to be intractable. In order for proofs of security to go through, the polynomial $\alpha ^n+1$ must be irreducible over $\mathbb{Z}[\alpha]$, which is true if and only if $n$ is a power of $2$.

Next, to optimize the running time and space of the function, choose $n$ to be relatively large, and $p$ and $m$ to be small, subject to the above constraints. As discussed above, the FFT is most efficiently and conveniently computed when $p$ is prime and $p − 1$ is a multiple of $2n$.

Finally, to fix one concrete function from the family, the multipliers $\mathbf{a}_{i}$ should be chosen *uniformly* and *independently* at random from the ring $R$; this is equivalent to choosing their primitive Fourier coefficients uniformly and independently at random from $\mathbb{Z}_{p}$. We note that the multipliers (or their Fourier coefficients) should be chosen using ***trusted randomness***, otherwise it may be possible to embed a ***backdoor*** in the resulting function. For example, one might derive the multipliers using some deterministic transformation on the digits of $\pi$.