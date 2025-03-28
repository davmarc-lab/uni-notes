- [[#Combinatoria]]
    - [[#Permutazioni]]
    - [[#Permutazioni Semplici]]
    - [[#Permutazioni con ripetizione]]
    - [[#Disposizioni]]
    - [[#Disposizioni Semplici]]
    - [[#Disposizioni con ripetizione (Sequenze semplici)]]
    - [[#Sequenze k-piene]]
    - [[#Combinazioni]]
    - [[#Combinazioni Semplici]]
    - [[#Combinazioni con Ripetizione]]
    - [[#Stars and Bars]]
    - [[#Schema Combinatorio]]
- [[#Probabilità]]
    - [[#Eventi indipendenti]]
    - [[#Eventi incompatibili]]
    - [[#Probabilità di un evento]]
    - [[#Probabilità complementare]]
    - [[#Probabilità unione (totale)]]
    - [[#Probabilità condizionata]]
    - [[#Probabilità composta]]
    - [[#Bayes]]
    - [[#Valore Atteso]]
    - [[#Varianza]]
    - [[#Scarto quadratico medio]]
- [[#Variabili Aleatorie Discrete]]
    - [[#Densità discreta]]
    - [[#Densità uniforme]]
    - [[#Densità Bernoulli]]
    - [[#Densità Binomiale]]
    - [[#Densità Ipergeometrica]]
    - [[#Densità Geometrica]]
    - [[#Densità di Poisson]]
- [[#Variabili Aleatorie Continue]]
    - [[#Densità Continua (astratta)]]
    - [[#Funzione di ripartizione]]
    - [[#Valore Atteso]]
    - [[#Varianza]]
    - [[#Densità Uniforme]]
    - [[#Densità Esponenziale]]
    - [[#Densità normali]]
    - [[#Teorema del limite centrale]]

## Combinatoria

### Permutazioni

È il risultato di uno scambio dell’ordine degli elementi di una sequenza, ossia è uno dei possibili modi per ordinare gli elementi di qualsiasi tipo.

$$
\begin{matrix*}
A = \{a, b, c\} \text{ sono:} \\  
abc \quad acb \\  
bac \quad bca \\  
cab \quad cba
\end{matrix*}
$$

Si differenziano per l’ordine con cui i tre elementi si presentano.

Se invece degli elementi in $A$ si ripetono

$$
\begin{matrix*}
A = \{a, a, b\} \text{ sono:} \\  
baa \quad aab \quad aba
\end{matrix*}
$$

### Permutazioni Semplici

Possibili modi per ordinare $n$ elementi distinti.

$$P_n = n!$$

### Permutazioni con ripetizione

Possibili modi per ordinare $n$ elementi di cui alcuni sono ripetuti più volte.

$$
\begin{matrix*}
P_n^{n_1, n_2, \dots, n_k} = \frac{n!}{n_1! \cdot n_2! \cdot \dotsc \cdot n_k!} \\
\text{con } n_1 + n_2 + \dots + n_k = n
\end{matrix*}
$$

### Disposizioni

È una sequenza ordinata di $k$ elementi selezionati tra $n$ elementi distinti. Si definisce disposizione un qualsiasi raggruppamento **ordinato** di $k$ elementi estratti da un insieme che ne contiene $n$.

$$A= \{a, b, c\}, \quad n = 3, \quad k = 2 \\  
ab \quad ac \\  
ba \quad bc \\  
ca \quad cb$$

Se invece sono ammesse ripetizioni:

$$
\begin{matrix*}
A= \{a, b, c\}, \quad n = 3, \quad k = 2 \\  
aa \quad ab \quad ac \\  
ba \quad bb \quad bc \\  
ca \quad cb \quad cc
\end{matrix*}
$$

### Disposizioni Semplici

Sequenza ordinata di $k$ elementi distinti estratti tra $n$ elementi distinti, con $n \ge k$.

$$
\begin{matrix*}
D_{n, k} = \frac{n!}{(n-k)!} \\  
D_{n, k} = (n)_k
\end{matrix*}
$$

### Disposizioni con ripetizione (Sequenze semplici)

Sequenza ordinata di $k$ elementi estratti tra $n$ elementi distinti, con la possibilità che ogni elemento possa ripetersi fino a $k$ volte nella stessa sequenza.

$$D'_{n,k} = n^k$$

### Sequenze k-piene

$$\sum_{i=0}^{k}{(-1)^i\binom{k}{i}(k-i)^n}$$

### Combinazioni

È un raggruppamento di $k$ elementi, persi in qualsiasi ordine, formato a partire da $n$ elementi distinti. In generale si dice combinazione ogni sequenza di $k$ elementi estratti tra $n$ elementi distinti, nell’ipotesi che _l’_**ordine di estrazione sia ininfluente**.

$$
\begin{matrix*}
A = \{a, b, c \}, \quad n = 3, \quad k = 2 \\  
ab \quad ac \quad bc
\end{matrix*}
$$

Se sono ammesse ripetizioni:

$$
\begin{matrix*}
A = \{a, b, c \}, \quad n = 3, \quad k = 2 \\  
aa \quad bb \quad cc \\  
ab \quad ac \quad bc
\end{matrix*}
$$

### Combinazioni Semplici

Ogni sequenza di $k$ elementi distinti estratti tra $n$ elementi distinti, **indipendentemente dall’ordine** e con  
$n \ge k$.

$$C_{n,k} = \binom{n}{k} = \frac{n!}{k!(n-k)!}$$

### Combinazioni con Ripetizione

Ogni sequenza di $k$ elementi estratti tra $n$ elementi distinti, con la possibilità che ogni elemento possa ripetersi fino a $k$ volte all’interno della stessa sequenza, e **indipendentemente dall’ordine**.

$$C'_{n, k} = \binom{n+k-1}{k} = \frac{(n + k -1)!}{k!(n-1)!}$$

### Stars and Bars

$$
\begin{matrix*}
C^*_{n, k} = \binom{n - 1}{k - 1} \quad \text{senza ripetizioni} \\  
C^*_{n, k} = \binom{n + k - 1}{k - 1} \quad \text{con ripetizioni} \\  
\text{con}\rightarrow x_1 + x_2 + \dots + x_k = n
\end{matrix*}
$$

### Schema Combinatorio

1. Se **l’ordine è irrilevante** opteremo per le **combinazioni** e scegliamo:
    1. le combinazioni semplici se **non sono ammesse ripetizioni**
    2. le combinazioni con ripetizione se un elemento **può ripetersi nello stesso raggruppamento**
2. Se l’ordine è **rilevante**, useremo le **permutazioni** o le **disposizioni**:
    1. $k = n$, **permutazioni**
        1. permutazioni semplici se i  
            $k = n$ elementi sono distinti tra loro
        2. permutazioni con ripetizione se almeno un elemento è ripetuto più di una volta
    2. $k \ne n$, **disposizioni**
        1. disposizioni semplici se non possono esserci ripetizioni di uno stesso elemento
        2. disposizioni con ripetizione in caso contrario

![[assets/image.png|image 5.png]]

## Probabilità

### Eventi indipendenti

$$E, F\text{ indipendenti} \Longleftrightarrow  
P(E \cap F) = P(E) \cdot P(F)$$

$$E, F\text{ dipendenti} \Longleftrightarrow  
P(E \cap F) \ne P(E) \cdot P(F)$$

### Eventi incompatibili

$$
\begin{matrix*}
E, F \text{ incompatibili} \Longleftrightarrow E \cap F = \empty \\  
E, F \text{ incompatibili} \Longleftrightarrow P(E \cap F) = 0
\end{matrix*}
$$

### Probabilità di un evento

$$P(E) = {\# \text{ casi favorevoli} \over \# \text{ casi possibili}} = \frac{|E|}{|\Omega|}$$

### Probabilità complementare

$$
P(E^C) = 1- P(E) \quad \forall E \subseteq \Omega$$

### Probabilità unione (totale)

$$
\begin{matrix*}
P(E_1 \cup E_2) = P(E_1) + P(E_2) - P(E_1 \cap E_2) \\  
P(E_1 \cup E_2) = {\# \text{ casi favorevoli} \over \# \text{ casi possibili}} = {|E_1 \cup E_2 \over |\Omega|}
\end{matrix*}
$$

$$
\begin{matrix*}
P(E_1 \cup \dots \cup E_n) = \sum^{n}_{i=1}P(E_i) - \sum_{i \le i < j \le n}P(E_i \cap E_j) + \\  
+ \sum_{1 \le i < j < k \le n}P(E_i \cap E_j \cap E_k) - \dots + (-1)^{n+1}P(E_1 \cap \dots \cap E_n)
\end{matrix*}
$$

$$
\begin{matrix*}
P(E_1 \cup E_2 \cup E_3) = \\  
P(E_1) + P(E_2) + P(E_3) + \\  
- P(E_1 \cap E_2) - P(E_1 \cap E_3) - P(E_2 \cap E_3) + \\  
+ P(E_1 \cap E_2 \cap E_3)
\end{matrix*}
$$

### Probabilità condizionata

$$
\begin{matrix*}
P(E|F) = \frac{P(E\cap F)}{P(F)} \quad \text{con } P(F) \ne 0  
\\  
P(E_1 \cup E_2 | F) = P(E_1|F) + P(E_2|F) - P(E_1 \cap E_2|F)
\end{matrix*}
$$

### Probabilità composta

$$
\begin{matrix*}
P(E_1 \cap E_2) = P(E_1) \cdot P(E_2|E_1) \\  
P(E_1 \cap E_2) = P(E_1) \cdot P(E_2|E_1) = P(E_2) \cdot P(E_1|E_2) \\  
P(E_1 \cap E_2) = \frac{|E_1 \cap E_2|}{|\Omega|} \\  
P(E_1 \cap E_2) = P(E_1) + P(E_2) - P(E_1 \cup E_2)
\end{matrix*}
$$

$$
\begin{matrix*}
P(E_1 \cap E_2 \cap \dots \cap E_n) = \\  
P(E_1)\cdot P(E_2|E_1) \cdot P(E_3|E_1 \cap E_2) \cdot \dotsc \cdot P(E_n|E_1 \cap \dots \cap E_{n-1})
\end{matrix*}
$$

### Bayes

$$
\begin{matrix*}
P(E|F) = \frac{P(E \cap F)}{P(F)} = \frac{P(F|E)P(E)}{P(F)} \\  
P(X=x, Y=y) = P(Y=y|X=x) P(X=x) = P(X=x|Y=y) P(Y=y)
\end{matrix*}
$$

### Valore Atteso

$$
\begin{matrix*}
E[X] = \sum_{h \in \R}h * p(h) \\  
E[X + Y] = E[X] + E[Y] \\  
E[cX] = cE[X]
\end{matrix*}
$$

$$E\left[X^2\right] = \sum_{h \in \R}h^2p(h)$$

### Varianza

$$
\begin{matrix*}
Var(X) = E\left[(X - E[X])^2\right] \\  
Var(X) = E\left[X^2\right] - E[X]^2
\end{matrix*}
$$

Se $X$ e $Y$ sono indipendenti allora

$$Var(X + Y) = Var(X) + Var(Y)$$

### Scarto quadratico medio

> [!important] **!!È LA RADICE DELLA VARIANZA!!**

## Variabili Aleatorie Discrete

### Densità discreta

Una funzione si dice densità discreta (astratta) se soddisfa le seguenti proprietà:

$$
\begin{matrix*}
p_X(h) \ne 0 \quad \text{per una quantità al più numerabile di valori }h\\  
p_X(h) \ge 0 \quad \forall h \in \R \\  
\sum_{h\in \R}p_X(h) = 1
\end{matrix*}
$$

### Densità uniforme

$$
\begin{matrix*}
p_X(h) = \begin{cases}  
{1 \over n} \quad h \in \{x_1, x_2, \dots, x_n\} \\  
0 \quad \text{altrimenti}  
\end{cases}
\end{matrix*}
$$

### Densità Bernoulli

$$
\begin{matrix*}
X\sim B(1, p) \\  
p_X(h)= \begin{cases}  
p & h = 1 \\  
1 - p & h = 0\\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = p, \quad E\left[X^2\right] = p, \quad Var(X) = p(1 - p)
\end{matrix*}
$$

### Densità Binomiale

$$
\begin{matrix*}
X\sim B(n, p) \\  
p_X(k)= \begin{cases}  
\binom{n}{k}p^k(1-p)^{n-k} & k = 0, 1, \dots, n\\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = np, \quad E[X^2] = n^2p^2+np(1-p) \quad Var(X) = np(1-p)
\end{matrix*}
$$

### Densità Ipergeometrica

$$
\begin{matrix*}
X\sim H(n; b, r) \\  
p_X(k)= \begin{cases}  
\frac{\binom{b}{k}\cdot\binom{r}{n-k}}{\binom{b+r}{n}} & k = \max(0, n-r), \dots, \min(n,b) \\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = n{b \over b+r}, \quad Var(X) = \frac{r(n-r)b(n-b)}{n^2(n-1)}
\end{matrix*}
$$

### Densità Geometrica

Trova il numero di $k$ insuccessi prima di avere un successo

$$
\begin{matrix*}
X\sim G(p) \\  
p_X(k)= \begin{cases}  
p(1-p)^{k} & k = 0, 1, \dots \\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = {1 \over p} - 1, \quad Var(X) = {1-p \over p^2}
\end{matrix*}
$$

Trova il numero di $k$ tentativi prima di avere un successo

$$
\begin{matrix*}
X\sim \overline{G}(p) \\  
p_X(k)= \begin{cases}  
p(1-p)^{k-1} & k = 1, 2, \dots \\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = {1 \over p}, \quad Var(X) = \frac{1 - p}{p^2}
\end{matrix*}
$$

### Densità di Poisson

$$
\begin{matrix*}
X\sim P(\lambda) \qquad \lambda = np \rightarrow B(n, p) \\  
p_X(k)= \begin{cases}  
e^{-\lambda}\frac{\lambda^k}{k!} & k = 0, 1, \dots \\  
0 & \text{altrimenti}  
\end{cases} \\  
E[X] = \lambda, \quad Var(X) = \lambda \\  
Y = Y_1 + Y_2 \Longrightarrow \lambda = \lambda_1 + \lambda_2
\end{matrix*}
$$

## Variabili Aleatorie Continue

### Densità Continua (astratta)

$$
\begin{matrix*}
P(a \le X \le b) = \int_{a}^{b}{f(s)ds} \\  
f(s) \ge 0 \\  
\int_{-\infty}^{+\infty}{f(s) ds} = 1
\end{matrix*}
$$

### Funzione di ripartizione

$$
\begin{matrix*}
F(t) = \int_{-\infty}^{t}f(s)ds
\end{matrix*}
$$

### Valore Atteso

$$E[X] = \int_{-\infty}^{+\infty}{sf(s)ds}$$

### Varianza

$$
\begin{matrix*}
Var(X) = E\left[X^2\right] - E[X]^2 \\  
E[X^2] = \int_{-\infty}^{+\infty}{s^2f(s)ds}
\end{matrix*}
$$

### Densità Uniforme

$$
\begin{matrix*}
P(X \in [a, b]) = \int_a^b{kds} = k(b-a) \\  
\text{con densita: } f(s) = \frac{1}{b-a} \\  
E[X] = \int_a^b{s\frac{1}{b-a}ds} = {a+b \over 2} \\  
E[X^2] = \int_a^b{s^2\frac{1}{b-a}ds} = {a^2 + ab + b^2 \over 3} \\  
Var(X) = {(b-a)^2 \over 12}
\end{matrix*}
$$

### Densità Esponenziale

$$
\begin{matrix*}
X\sim Exp(a) \\  
f(s) = \begin{cases}  
ae^{-as} & s\ge 0 \\  
0 &\text{altrimenti}  
\end{cases}\\  
F_X(t) = \begin{cases}  
0 & t \le 0 \\  
1 - e^{-at} & t \ge 0  
\end{cases}\\  
E[X] = {1 \over a}, \quad E[X^2] = {2 \over a^2}, \quad Var(X) = {q \over a^2}
\end{matrix*}
$$

**Proprietà**

$$P(X \ge t + u|X \ge t) = e^{-au} = P(X \ge u)$$

### Densità normali

$$\
\begin{matrix*}
zeta \sim N(\mu, \sigma^2) \longrightarrow\zeta_0 = \frac{\zeta - \mu}{\sigma} \\  
P(\zeta < x) = \Phi\left(\frac{x-\mu}{\sigma}\right) \\  
E[\zeta] = \mu, \quad Var(\zeta) = \sigma^2
\end{matrix*}
$$

**Proprietà**

$$
\begin{matrix*}
P(\zeta < -x) = 1 - \Phi(x) \\  
P(\zeta > x) = 1 - \Phi(x) \\  
P(\zeta > -x) = \Phi(x) \\  
P(x < \zeta < y) = \Phi(y) - \Phi(x) \\  
\text{con } x = \frac{x-\mu}{\sigma} \quad y = \frac{y-\mu}{\sigma}
\end{matrix*}
$$

### Teorema del limite centrale

Sia $X_1, X_2, \dots$ una successione di variabili aleatorie indipendenti aventi tutte la stessa densità, discreta o continua, di media $\mu$ e varianza $\sigma^2$, allora per $n$ abbastanza grande si ha con buona approssimazione:

$$
\begin{matrix*}
S_n\sim N(n\mu, n\sigma^2) \\  
\overline{X}_n \sim N(\mu, {\sigma^2 \over n} )
\end{matrix*}
$$

Se la densità è già una somma di variabili aleatorie (come la binomiale), allora $X\sim N(\mu, \sigma^2)$