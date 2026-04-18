# Programmazione parallela
La programmazione parallela consiste nello scomporre il problema in più sottoproblemi e distribuirli alle unità di esecuzione disponibili.
Consente di risolvere i sottoproblemi in modo indipendente riducendo il tempo di esecuzione, bilancia il carico di lavoro sulle unità esecutive e riduce l'overhead causato dalla comunicazione e dalla sincronizzazione.
## Task e Data parallelism
> [!note] Task parallelism
> Significa che ogni unità di esecuzione risolve problemi diversi fra loro
> ![[Pasted image 20250703114623.png#center]]

> [!note] Data parallelism
> In questo caso vengono distribuiti i dati ai processori che eseguono lo stesso tipo di computazione su dati diversi.
> ![[Pasted image 20250703114558.png#center]]
# Architetture Parallele
## Caching
La cache è una memoria molto più veloce rispetto alla RAM ma sono molto più ridotte in fatto di dimensione.
Vengono utilizzate per memorizzare delle porzioni di dati che vengono acceduti molto frequentemente con lo scopo di velocizzare la lettura dei dati dalla memoria.
Esistono due modi per utilizzare la memoria cache dedicata:
- **località spaziale**, se viene fatto l'accesso frequentemente ad un byte di memoria siccome è molto probabile che accede ai byte successivi, vengono memorizzati nella cache anche gli altri byte vicini
- **località temporale**, se in un certo momento un unità di esecuzione legge delle informazioni in memoria è probabile che si acceda nuovamente alla stessa unità di memoria
>[!note] Esempio con il prodotto riga per colonna fra due matrici
>Quando si vuole calcolare il prodotto riga per colonna fra due matrici, una matrice in memoria è memorizzata a partire dalla prima riga fino all'ultima in maniera continua, quindi se si vuole leggere una colonna della matrice bisogna leggere il `j`-esimo elemento di ogni riga. Questa operazione non sfrutta la cache perché viene salvata ogni volta la riga corrente ma ad ogni lettura cambio riga.
>Per questo motivo è possibile calcolare la trasposta della matrice, dove vengono lette le colonne, in questo modo le colonne della matrice diventano le righe e in memoria saranno memorizzate le colonne in modo contiguo. In questo modo ogni colonna della matrice viene memorizzata nella cache siccome accede molto spesso alla stessa area di memoria.
## Hardware multithreading
Meccanismo utilizzato anche in sistemi con un singolo core per poter rendere più efficiente l'esecuzione di una serie di processi. Viene utilizzato per esempio quando bisogna attendere un input/output oppure quando bisogna leggere dalla memoria, in questi casi quel processo potrebbe essere stoppato e viene eseguito un altro processo in attesa che il processo precedente si sblocchi.

Esistono due tipi di multithreading:
- **fine-grained multithreading**, multi threading a grana fine, si applica quando la CPU è in grado di effettuare un *context switch*, ovvero passare ad un flusso di esecuzione ad un altro, a costo zero.
  È possibile nascondere le latenze degli accessi alla memoria purché ci siano un numero sufficiente di thread in esecuzione in modo concorrente sulla CPU e quando un thread rimane bloccato (aspetta i dati dalla memoria) ce ne sia almeno un altro per proseguire l'esecuzione
- **coarse-grained multithreading**, multi threading a grana grossa, si applica quando la CPU non è in grado di effettuare un *context switch*, ovvero passare ad un flusso di esecuzione ad un altro, non a costo zero.
  Viene utilizzato per nascondere le latenze delle azioni di input/output, non è adatto per aspettare la lettura dalla memoria perché si rischia che il tempo di effettuare il context switch sia superiore al tempo richiesto per leggere i dati dalla memoria
>[!note] Simultaneous multithreading (SMT)
> È un implementazione particolare del *fine-grained multithreading* dove thread differenti possono usare differenti unità di calcolo nello stesso momento.
> Per esempio l'**HyperThreading** è un'implementazione di SMT di Intel: consiste nel dividere ogni core fisico in 2 core logici, il sistema operativo vedrà automaticamente in doppio dei core logici quando in realtà di core fisici sono la metà; ogni core logico è composto sia da risorse hardware condivise del core fisico sia da una copia di alcune proprietà architetturali come ad esempio:
>  - alcuni registri general purpose
>  - i registri di controlli
>  - i registri APIC (Advanced Programmable Interrupt Controller)
>  - alcuni registri `machine state`
> Prima vengono riempiti i core fisici, nel momento in cui i core fisici sono pieni vengono utilizzati i core logici "virtuali".

![[Pasted image 20250703144955.png]]
La struttura della pipeline viene divisa in questo modo e ad ogni fase viene eseguita una fase dell'esecuzione dell'istruzione.
Viene inserita fa due fasi delle pipeline una coppia di code così facendo la pipeline può prendere due flussi di istruzioni diversi, il processore è in grado di decidere quale processo fra le due code deve procedere con la prossima fase della pipeline senza causare uno stallo.
## Tassonomia di Flynn
### SISD
Single Instruction Single Data stream
![[Pasted image 20250703151858.png]]
### MISD
Multiple Instruction stream, Single Data stream (non esistono nella realtà)
![[Pasted image 20250703151952.png]]
### SIMD
Single Instruction stream, Multiple Data stream
![[Pasted image 20250703152025.png]]
### MIMD
Multiple Instruction stream, Multiple Data stream
![[Pasted image 20250703152136.png]]
Le architetture di tipo MIMD si dividono in due categorie:
- **Memoria condivisa**, sono presenti una serie di unità di esecuzione che sono connessi ad un'unica memoria, possono avere problemi di race condition ma sono le più efficienti. Non ci possono essere troppe unità di calcolo (core)
  ![[Pasted image 20250703152642.png]]
- **Memoria Distribuita**, ogni unità di calcolo possiede una memoria, tutte collegate fra loro attraverso una rete, ad esempio un cluster di PC connessi tramite cavo Ethernet, ogni nodo può mandare dei dati ad altri nodi attraverso la rete sottostante
  ![[Pasted image 20250703152701.png]]
### Vantaggi e Svantaggi
>[!note] Memoria Condivisa
> **Vantaggi**
> - Semplici da programmare
> - Si ottengono le prestazioni migliori su applicazioni con pattern di accesso ai dati non regolari (informazioni che non vengono lette in modo sequenziale)
>
> **Svantaggi**
>  - Bisogna gestire le race condition
>  - Limite di banda della memoria
>  - Scarsa scalabilità

>[!note] Memoria Distribuita
> **Vantaggi**
>  - Sono molto scalabili, fino a quando è possibile aggiungere nodi al bus di interconnessione
>  - Si possono applicare efficacemente ad applicazioni che hanno una forte località spaziale
>  - Non ci sono race condition
>
> **Svantaggi**
>  - Potrebbero esserci dei deadlock (due nodi in attesa che l'altro riceva un messaggio)
>  - Alta latenza della rete di interconnessione
>  - Sono più complicati da programmare
## Architetture Ibride
Nella realtà molti supercomputer hanno diverse unità di calcolo all'interno che utilizzano diversi paradigmi di programmazione:
- MPI, per far comunicare tutti i nodi fra loro
- OpenMP, per parallelizzare la computazione all'interno dello stesso processore multicore
- CUDA o OpenCL, per sfruttare le GPU che un nodo potrebbe avere
# Pattern di Programmazione Parallela
Scrivere un programma parallelo significa **applicare dei pattern di programmazione** spesso combinati fra loro.
Un **pattern** di programmazione parallela non è una soluzione ad un problema, ma è una descrizione su **come un certo problema può essere risolto**.
Un singolo problema può richiedere di utilizzare una versione di un pattern specifica, oppure un'insieme di pattern.
I più comuni sono:
- Embarrassingly Parallel
- Partition
- Master-Worker
- Stencil
- Reduce
- Scan
## Embarrassingly Parallel
Un problema è di questo tipo se è possibile decomporre il problema in sottoproblemi, in modo tale che ogni sottoproblema possa essere risolto in maniere indipendente con poca o nessuna comunicazioni con le altre unità di esecuzione.
Dal punto di vista parallelo sono i problemi più semplici da parallelizzare essendo scomposti in sottoproblemi indipendenti.
 - Somma di due array
 - Insieme di Mandelbrot
 - 3D Rendering
 - Crack di password brute force
## Partition
Suddivide i dati di input, chiamati **dominio**, in blocchi chiamate **partizioni**, non per forza disgiunte: un dato può trovarsi in più partizioni. Ogni unità di calcolo processa una sola partizione.
>[!note] Esempio $Ax=b$
> Per esempio in questo caso avendo una matrice $A$ e un vettore $b$ con lo stesso numero di righe di $A$, se voglio parallelizzare un algoritmo che calcola la $x$ posso utilizzare questo pattern di programmazione suddividendo la matrice $A$ per righe e assegnare ad ogni core una serie di righe di $A$ consecutive; è possibile che ogni core abbia un diverso numero di righe.
>
> Suddividendo la matrice in questo modo, suddividendola in $n$ porzioni dove $n$ è il numero di core che ho a disposizione, riesco a bilanciare il carico sull'unità di calcolo.

Esistono due tipi di partizioni:
- **regolare**, le partizioni hanno circa la stessa "forma"
- **irregolare**, le partizioni non hanno necessariamente una forma regolare

La dimensione di ogni partizione si può scegliere in due modi: ^476c9e
- **fine-grained (grana fine)**, ho molte partizioni piccole; in questo modo ho un migliore bilanciamento del carico supponendo che la quantità di lavoro sia proporzionale alla dimensione delle partizioni; però se ho troppi blocchi piccoli è possibile avere un overhead significativo dovuto alla distribuzione dei blocchi ed eventualmente alla comunicazione o alla sincronizzazione: nel caso di sincronizzazioni dovrei fare tante sincronizzazioni quanti sono i blocchi
- **coarse-grained (grana grossa)**, ho poche partizioni grandi; in questo modo miglioro la computazione e riduco la comunicazione fra unità di calcolo, però potrei avere dello sbilanciamento del carico di lavoro perché un blocco potrebbe avere più operazioni rispetto ad un altro
![[Pasted image 20250703161907.png]]
>[!note] Block partitioning indexing
>`global_index = local_index + block_id * BLKLEN`

### Sbilanciamento del carico
Si verifica quando una serie di task indipendenti non terminano tutti nello stesso istante, facendo così l'esecuzione termina quando l'unità di computazione più "lenta" (perché appunto la quantità di dati potrebbe non essere uguali alle altre) conclude l'esecuzione.

Per bilanciare il carico è possibile applicare i seguenti meccanismi:
- utilizzare un partitioning a grana fine, ma non troppo perché potrebbe portare ad un overhead dovuto alle eccessive comunicazioni o sincronizzazioni ([[#^476c9e|tipi di partition]])
- utilizzare il paradigma [[#Master-Worker]]
## Master-Worker
Vengono inseriti tutti i sottoproblemi di una applicazione parallela in un apposita struttura dati (coda, lista, etc), successivamente vengono estratti uno alla volta e vengono mandati in esecuzione al primo worker disponibile, quando un worker conclude l'esecuzione di un task preleva un sottoproblema dalla coda.
Il numero di task deve essere molto maggiore al numero di worker, altrimenti i worker finiscono il proprio task e rimangono in attesa lo stesso.
![[Pasted image 20250703163901.png]]
## Stencil
Viene presa una porzione del dominio e il valore di un solo elemento in una "griglia" dipende da tutti i valori che si trovano attorno alla cella stessa (Gaussian Smoothing, Gaussian Filter).
Sono computazioni di tipo embarrassingly parallel perché non ci sono race condition: ogni unità esecutiva modifica una sola cella alla volta e non si presentano race condition perché non viene modificato i valori del dominio originale ma vengono effettuate solo letture.
![[Pasted image 20250703164435.png|Esempio di forma di uno stencil in 2D, possono essere anche tridimensionali]]

In questo pattern viene creato un nuovo dominio dove le unità computazionali effettuano le scritture, chiamato *next domain*; invece tutte le letture vengono fatte nel dominio originale chiamato *current domain*; in questo modo si evitano le race condition.
### Ghost Cells
Sono fondamentali per implementare efficientemente la stencil su architetture a memoria distribuita.
Sorge un problema quando vengono analizzate le celle sul bordo del dominio, infatti se devo analizzare la prima cella nell'angolo in alto a sinistra, effettuo una lettura su dei valori non sono compresi nel dominio.

>[!note] Soluzione al problema dell'indice fuori dal dominio
> Per risolvere questo problema è possibile aggiungere delle celle fantasma, *ghost cells*, modificando il dominio originale prima di effettuare l'operazione: quando un'unità operativa dovrà leggere un valore al di fuori del dominio originale, grazie all'aggiunta di "bordi" al nuovo dominio l'unità esecutiva non andrà a leggere dei valori che non fanno parte del dominio.
>
> Un'altra possibile soluzione al problema precedente può essere implementata utilizzando l'operatore modulo (`%`), in questo modo quando vado a leggere delle celle fuori dal dominio grazie all'operatore l'indice della cella verrà traslato fino alla fine della riga/colonna.
> Per esempio se mi trovo in posizione `i = 0`, nel momento in cui devo vedere la cella a sinistra `i -= 1` andrei all'indice `-1` il cui corrispondente valore non esiste, utilizzando l'operatore modulo: `i = i - 1 % N` otterrei un indice pari da `N - 1`  o `N - 2` in base al resto della divisione di `i - 1` con `N`.
> L'unico problema dell'utilizzo dell'operatore modulo potrebbe essere nella "lentezza" del calcolo della divisione quando vengono tradotte le istruzioni in linguaggio macchina (istruzioni SIMD).
#### Come assegno i bordi al dominio?
Supponendo di dover creare dei bordi al seguente dominio:
![[Pasted image 20250703165942.png]]
Vengono copiate tutte le righe e le colonne nella corrispettiva posizione opposta: l'ultima riga (arancione) viene copiata nel lato opposto, ovvero, subito sopra alla prima riga (blu), poi la prima riga (blu) viene copiata nel lato opposto subito sotto l'ultima riga (arancione) e così via anche per le colonne.
Nel momento in cui ho copiato tutte le righe e le colonne nei bordi in modo appropriato, faccio la stessa cosa per il valore degli angoli del dominio originale (marrone, grigio, verde acqua, azzurro) li inserisco negli angoli del bordo rispettivamente nella posizione opposta: l'angolo in alto a destra del dominio senza bordi andrà a riempire l'angolo in basso a sinistra del dominio con i bordi e così via per tutti gli angoli.
![[Pasted image 20250703170442.png|Risultato finale]]
>[!note] Metodo alternativo
>È possibile inoltre copiare l'intera riga o colonna, compresa la ghost area, invece della sola riga o colonna originale: in questo modo ottengo lo stesso risultato senza dover successivamente andare ad inserire gli angoli
## Reduce
Una *reduce* è un'operazione che applica un operatore binario associativo a tutti gli elementi di un array producendo un singolo valore scalare.

Costo computazionale $O\left( \log_2n \right)$ step paralleli.
Ad ogni step in parallelo vengono effettuate $^n/_{2^i}$ somme al $i$-esimo step, $1$ sola somma all'ultimo step; in totale vengono effettuate $O\left( n \right)$ somme.

La reduce ha un albero di operazioni bilanciato e si dice che è un'operazione *work-efficient*, ovvero esegue lo stesso carico di lavoro dell'algoritmo ottimale seriale.
![[Pasted image 20250703173552.png]]
## Scan
La *scan* è simile alla reduction: questo pattern prende in input un array e restituisce un array a differenza della [[#Reduce]].
Esistono due tipi di scan:
- ***inclusive-scan***, $[y_0, y_1, \dots, y_{n-1}] = \text{inclusive-scan}(op, \ [x_0, x_1, \dots, x_{n-1}])$, l'array di output è così composto:
	- il primo elemento è uguale al primo elemento dell'array di input
	- il secondo elemento è pari a $x_0\ op\ x_1$
	- il terzo elemento è pari a $x_0\ op\ x_1\ op\ x_2$
	- $\dots$
	- l'ultimo elemento sarà pari a $x_0\ op\ x_1\ op\ \dots \ op\ x_{n-1}$
- ***exclusive-scan***,  $[y_0, y_1, \dots, y_{n-1}] = \text{exclusive-scan}(op, \ [x_0, x_1, \dots, x_{n-1}])$, l'array di output è così composto:
	- il primo elemento è pari **all'elemento neutro dell'operatore binario**, nel caso della somma l'elemento neutro è pari a $0$
	- il secondo elemento è pari a $x_0$
	- il terzo elemento è pari a $x_0\ op\ x_1$
	- $\dots$
	- l'ultimo elemento sarà pari a $x_0\ op\ x_1\ op\ \dots \ op\ x_{n-2}$
>[!note] Esempio nel caso della somma
>![[Pasted image 20250703174706.png]]
### Implementazione seriale
```c
void inclusive_scan(int *x, int *s, int n) // n must be > 0
{
	int i;
	s[0] = x[0];
	for (i=1; i<n; i++) {
		s[i] = s[i-1] + x[i];
	}
}
void exclusive_scan(int *x, int *s, int n) // n must be > 0
{
	int i;
	s[0] = 0;
	for (i=1; i<n; i++) {
		s[i] = s[i-1] + x[i-1];
	}
}
```
>[!warning] Loop carried dependence
>In queste due implementazioni si può notare che il risultato della corrente operazione dipende da quella precedente, quindi non è possibile parallelizzarlo; questo tipo di dipendenza si chiama [[#Loop Carried Dependency]]

Per risolvere questo problema è possibile risolverlo utilizzando due tipi di alberi di esecuzione.
I due nuovi procedimenti seriali non avranno più dipendenze e saranno entrambi parallelizzabili.
#### Fase Ascendente
Prima effettuo una semplice reduction verso l'alto ottenendo una serie di somme come in figura, con un costo computazionale pari a $O(\log_2 n)$.  ![[Pasted image 20250703175758.png]]
```c
for ( d=1; d<n/2; d *= 2 ) {
	for ( k=0; k<n; k+=2*d ) {
		  x[k+2*d-1] = x[k+d-1] + x[k+2*d-1];
	}
} // Algoritmo seriale fase ascendente
```
#### Fase Discendente
Successivamente viene effettuata un'operazione discendente dove vengono effettuate copie (in verde) e somme appropriate fino ad ottenere il risultato corretto, costo computazionale $O(\log_2n)$.
![[Pasted image 20250703180224.png]]
```c
x[n-1] = 0;
for ( ; d > 0; d >>= 1 ) {
	for (k=0; k<n; k += 2*d ) {
		float t = x[k+d-1];
		x[k+d-1] = x[k+2*d-1];
		x[k+2*d-1] = t + x[k+2*d-1];
	}
} // Algoritmo seriale fase discendente
```
# Valutazione delle Prestazioni
## Scalabilità
Può voler dire:
- quanto più velocemente riesco a risolvere un problema con $p$ workers invece di uno?
- se raddoppio il numero di unità di esecuzione $p$ il tempo di esecuzione dimezza o aumenta?
- quanto lavoro in più può essere fatto se aumento il numero di unità di esecuzione $p$?
- come impattano gli overhead di comunicazione e sincronizzazione delle operazioni parallele sulle performance?
- quale frazione delle risorse di calcolo sono effettivamente utilizzare a svolgere computazione invece di svolgere overhead?
## Speedup
Sia $p$ il numero di core, $\ts$ il tempo di esecuzione di un algoritmo seriale, $\tpp$ il tempo di esecuzione del programma parallelo con $p$ cores.
Lo *speedup* $\sp$ è definito come:
$$
\sp = \frac{\ts}{\tpp} \approx \frac{\tp\tlr 1}{\tpp}
$$
>[!warning] Attenzione
>Si utilizza la seconda formula (considerando il $\ts$ come il tempo di esecuzione del programma parallelo con un solo core) perché alcune volte è possibile che il programma seriale sia più veloce di quello parallelo dato dalla "semplicità" del codice seriale rispetto al codice parallelo.
>Se si utilizza il tempo seriale è possibile notare uno *speedup* super lineare dove non esiste.

Nel caso ideale, il programma parallelo impiega $1 \over p$ tempo rispetto al programma seriale.
Il caso in cui $\sp = p$ si ottiene lo **speedup ottimale**, realisticamente non si ottiene quasi mai e quindi basta che lo speedup sia $\sp \le p$.
>[!note] Speedup superlineare
>Si ottiene quando $\sp > p$, ovvero quando lo speedup diminuisce più del "normale" aumentando il numero di unità esecutive.
>Può capitare quando la partizione creata per ogni singolo core diventa talmente piccola che riesce ad essere memorizzata nella cache e quindi aumentano le prestazioni.
### Porzioni non parallelizzabili
Si suppone che una frazione $\a$ dove l'esecuzione non può essere parallelizzata, di conseguenza la frazione $(1 - \a)$ può essere completamente parallelizzabile, allora abbiamo:
$$
\tpp = \a\ts + \frac{(1 - \a)\ts}{p}
$$
![[Pasted image 20250703190732.png]]
## Legge di Amdahl
Lo [[#Speedup|speedup]] massimo di una porzione parallela è pari a:
$$
\begin{align*}
\sp &= \frac{\ts}{\tpp}\\
&= \frac{\ts}{\a\ts+\frac{(1-\a)\ts}{p}} \\
&= \frac{1}{\a + \frac{1-\a}{p}}
\end{align*}
$$
Dall'espressione:
$$
\sp = \frac{1}{\a + \frac{1-\a}{p}}
$$
si ottiene uno speedup asintotico $1 \over \a$ quando $p$ cresce all'infinito.
Questo significa che una parte seriale in un programma parallelo rallenta fortemente lo speedup del programma stesso, bloccando il massimo speedup raggiungibile a $1 \over \a$.
![[Pasted image 20250703191511.png|Grafico con doppia scala logaritmica]]
## Scaling Efficiency
Ci sono due metriche per misurare l'efficienza di un programma parallelo:
- **strong scaling**, misura quanto migliora il tempo di esecuzione aumentando il numero di processori $p$ mantenendo fissa la dimensione del problema.
- **weak scaling**, misura quanto migliora il tempo di esecuzione aumentando il numero di processori $p$, contemporaneamente aumento la dimensione del problema in modo tale che ogni singolo processore abbia la stessa quantità di lavoro da svolgere.
  In altre parole quanto bene il programma è in grado di risolvere i problemi più grandi nella stessa quantità di tempo totale all'aumentare del numero di unità di esecuzione
[Come misurare i tempi: minuto 40>>](https://unibo.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=3898b636-e5f6-401c-a2c0-b1fe00ba1c03)
### Strong scaling efficiency
$$
\ep = \frac{\sp}{p} = \frac{\tp\tlr 1}{p \times \tpp}
$$
dove:
- $\tpp$, è il tempo di esecuzione del programma parallelo con $p$ unità di esecuzione
>[!note]
>L'efficienza è un numero reale compreso fra $0$ e $1$, idealmente dovrebbe essere molto vicino a $1$

![[Pasted image 20250703193653.png|Strong Scaling Efficiency and Amdahl law, logarithmic scale]]
### Weak Scaling Efficiency
$$
\wp = \frac{\ti}{\tp}
$$
dove:
- $\ti$, è il tempo necessario per completare una unità di lavoro con $1$ processore
- $\tp$, è il tempo necessario per completare $p$ unità di lavoro con $p$ processori
Sia $\fnp$ l'ammontare del lavoro effettuato da ogni processore, data la dimensione dell'input $\np$ e $p$ processore, vogliamo calcolare la dimensione dell'input $\np$ tale che:
$$
\fnp = \text{costante}
$$
>[!note] La dimensione dell'input deve rimanere costante sia per $\ti$ che per $\tp$






## Presentazione dei dati
Il miglior modo per rappresentare i risultati è utilizzare grafici con i dati calcolati e misurati.
### Rappresentare un grafico
Un grafico deve permettere al lettore di capire immediatamente cosa si sta rappresentando, quindi evitare di utilizzare simboli nella legenda o nelle etichette.
È necessario fornire un numero sufficiente di informazioni per rendere il grafico più possibile auto-contenuto, cioè deve essere compreso senza che il lettore debba per forza andare a leggere il testo.
- *asse delle x*, dovrebbe contenere la causa
- *asse delle y*, dovrebbe contenere l'effetto della causa => $f(x)$







# Parallelizzare i cicli
L'obiettivo è parallelizzare tutti i cicli enumerativi, cioè quelli che lavorano con un indice che ha un passo di incremento costante e ha una fine stabilita a priori.
I cicli vengono trasformati ma viene mantenuta la semantica del ciclo stesso
![[Pasted image 20250704105704.png]]
>[!note] Ogni unità di esecuzione esegue un iterazione del ciclo

**Problemi**
- non sempre si effettuano un numero di iterazioni pari al numero di unità di esecuzione, in questi casi una singola unità di esecuzione lavorerà su un blocco di iterazioni del ciclo
- non tutti i cicli possono essere parallelizzati: bisogna riconoscere le dipendenze all'interno di ogni iterazione, per poter parallelizzare un ciclo bisogna risolvere tutte le dipendenze a ogni iterazione
- non è possibile sapere l'ordine di esecuzione delle iterazioni: la prima iterazione potrebbe essere eseguita per ultima
## Data Dependence
Si verificano quando si effettuano delle operazioni di assegnamento.
>[!note] Definizione
> Due accessi alla memoria causano una dipendenza se fanno riferimento alla stessa locazione di memoria e almeno una effettua una scrittura
> Se il contenuto della memoria rimane costante, anche se effettuo calcoli senza modificare la memoria, non è presente una dipendenza

Ci sono diversi tipi di dipendenze:
- **Data-Flow or True Dependence**, *RAW* (Read After Write), ho due operazioni che non possono essere invertite
  ![[Pasted image 20250704111536.png]]
  $$
  \begin{matrix*}
  a = b + c \\
  d = 2 * a
  \end{matrix*}
  $$
- **Anti Dependence**, *WAR* (Write After Read)
  ![[Pasted image 20250704111710.png]]
  $$
  \begin{matrix*}
  c = a + b \\
  a = 2 * a
  \end{matrix*}
  $$
- **Output Dependence**, *WAW* (Write After Write)
  ![[Pasted image 20250704111907.png]]
  ```c
  a = k
  if (a > 0)
	  a = 2 * c
	  ```
- **Control Dependence**, un istruzione ha una *control dependence* su un altra se il risultato di un'istruzione determina se viene eseguita un istruzione o un altra
  ![[Pasted image 20250704112501.png]]
>[!note]
>![[Pasted image 20250704114826.png|S2 dipende da S1]]
## Teorema Fondamentale delle Dipendenze
Ogni permutazione delle istruzioni di un programma che preserva le dipendenze, preserva anche la semantica del programma.

![[Pasted image 20250704115009.png]]
In questo caso in ogni iterazione non ci sono dipendenze, quindi il ciclo è completamente parallelizzabile.
- Le operazioni possono essere eseguite in modo concorrente in qualsiasi ordine
- Le iterazioni possono essere distribuite in diverse unità computazionali
## Loop Carried Dependency
![[Pasted image 20250704115145.png]]
In questo caso ogni iterazione dipende dall'iterazione precedente, ha quindi una dipendenza ti tipo *RAW*.
Questo tipo di dipendenze vengono chiamate **loop-carried dependence**, ciò significa che il ciclo non può essere parallelizzato.

![[Pasted image 20250704115345.png]]
Anche in questo caso si ha una loop-carried dependence. Non può essere parallelizzato in maniera ovvia ma posso applicare il pattern *reduction* e e parallelizzare il ciclo.

## Rimozione delle dipendenze
Le dipendenze all'interno di una iterazione possono essere rimosse applicando delle particolari tecniche.
### Allineamento delle iterazioni
Una possibile soluzione consiste nel riscrivere il ciclo in modo diverso ma mantenendo la semantica e in modo da essere parallelizzato.
Si allineano le iterazioni del ciclo in modo da rimuovere le dipendenze su iterazioni precedenti o successivi.
![[Pasted image 20250704132334.png]]
>[!warning] Attenzione
>Allineando i cicli non tutti i valori potrebbero essere elaborati dalle unità di esecuzione, perciò bisogna gestire queste situazioni effettuando le operazioni necessarie prima e dopo il ciclo parallelizzato
### Scambio dei cicli
Un altro approccio consiste nello scambiare gli indici di cicli, permettendo la parallelizzazione del ciclo esterno, utilizzato per modificare la granularità del parallelismo
![[Pasted image 20250704133414.png|Parallelizzo l'esecuzione delle righe e non delle colonne]]
### Wavefront Sweep
Computazione parallela effettuata in una matrice dove ogni iterazione considera i valori in diagonale della matrice
![[Pasted image 20250704134918.png]]
```c
for (slice=0; slice < n + m - 1; slice++) {
	z1 = slice < m ? 0 : slice - m + 1;
	z2 = slice < n ? 0 : slice - n + 1;
	/* The following loop can be parallelized */
	for (i = slice - z2; i >= z1; i--) {
		j = slice - i;
	/* process a[i][j] … */
	}
}
```
# OpenMP
È un modello di programmazione parallela per architetture a memoria condivisa. È compatibile con molte architetture diverse essendo il compilatore a "tradurre" il codice OpenMP.
Consente una forma di *parallelismo incrementale*: si parte dal programma seriale e si inseriscono le direttive per parallelizzare dei cicli ed infine il programma viene compilato dal compilatore.
Può essere utilizzato per programmi scritti in C, C++ e Fortran.
>[!note] Vantaggi OpenMP
> - Permette di separare un programma in regioni seriali e parallele
> - Offre delle strutture per sincronizzazione

>[!note] Svantaggi
> - Non parallelizza automaticamente
> - Non garantisce lo speedup
> - Non gestisce le race condition

## Modello esecutivo
Un tipico programma OpenMP fa uso del parallelismo di tipo *fork-join*:
1. un solo flusso di esecuzione
2. viene creata una pool di thread che eseguiranno le regioni parallele
3. al termine di ogni regione parallela avviene una fase di sincronizzazione implicita
4. la pool di thread viene deallocata
5. se incontra una nuova regione parallela torna al punto 2
## Uso di OpenMP
Per definire una regione parallela in OpenMP si utilizza il `#pragma`, una direttiva che viene gestita dal compilatore non originale del C.
I compilatori che non riconoscono le istruzioni di OpenMP le ignorano senza dare errore.

Vengono utilizzati dei **blocchi strutturati** per racchiudere le istruzioni delle operazioni svolte in parallelo:
- un blocco strutturato è caratterizzato da un punto di entrata e un punto di uscita, le operazioni possono essere o una singola riga o se sono più di una si può raggruppare il tutto utilizzando le parentesi graffe `{}`
- un blocco strutturato ha un solo punto di ingresso e un solo punto di uscita (non è possibile accedere ad un'istruzione all'interno di un blocco strutturato se non dall'inizio del blocco, non è possibile effettuare un `return` all'interno del blocco)
### `#pragma omp parallel`
Quando viene utilizzata la direttiva `parallel` viene creato un *team* (pool) di thread e il thread specifico che esegue la direttiva diventa il thread `master` con ID pari a $0$.

Il numero di thread creati se non viene specificato vengono assegnati a seconda dell'implementazione e della macchina dove il programma è in esecuzione.

Il codice all'interno della regione parallela viene copiato all'interno di ogni thread, eseguono la porzione di codice, e alla fine della regione parallela si sincronizzano attendendo che tutti i thread finiscano di eseguire le operazioni (*barrier* virtuale).

>[!note]
>Alla fine dell'esecuzione il *team* di thread potrebbe non essere eliminato perché il compilatore potrebbe aver ottimizzato le operazioni evitando di allocare nuovamente i thread

```c
#include <stdio.h>
#include <omp.h>
void say_hello( void )
{
	int my_rank = omp_get_thread_num();
	int thread_count = omp_get_num_threads();
	printf("Hello from thread %d of %d\n",
	my_rank, thread_count);
}
int main( void )
{
	#pragma omp parallel
	say_hello();
	
	return 0;
}
```

- `omp_get_thread_num()` ritorna il numero di thread attivi nel *team* allocato
- `omp_get_max_threads()` ritorna il numero massimo di thread che possono essere creati

>[!note] È possibile definire per ogni regione parallela il numero di thread massimi che vengono creati
>Si utilizza la funzione: `omp_set_num_threads(n)`, dove `n` è il numero di thread da assegnare, oppure si può definire quando si definisce la regione parallela utilizzando: `#pragma omp parallel num_threads(n)`
### Parallelismo annidato
È possibile utilizzare una regione parallela all'interno di un'altra regione parallela.
>[!note] Di default la regione parallela innestata avrà dimensione $1$.

Per utilizzare più thread all'interno di una regione parallela innestata è necessario abilitare la variabile globale: `OMP_NESTED=true`.
![[Pasted image 20250707153807.png]]
>[!warning] La funzione per prendere il numero di thread ritornerà il numero di thread del suo rispettivo blocco strutturale da dove viene chiamato

>[!warning] Gli ID dei thread (ranghi) vengono riassegnati da $0$

## Scope
Nella programmazione parallela in OpenMP è possibile modificare la visibilità delle variabili dichiarate fuori dalla regione parallela.
Di default tutte le variabili prima della regione parallela sono definite come `shared`, ovvero visibili a tutti i thread della regione parallela; invece le variabili definite all'interno di un blocco parallelo sono definite come `private`.

>[!note]
>In OpenMP lo *scope* delle variabili viene considerato come la visibilità delle variabili all'interno dei thread in esecuzione

### Tipi di Scope
I tipi di scope delle variabili sono 3:
- `shared(x)`, tutti i thread hanno accesso alla stessa area di memoria
- `private(x)`, ogni thread ha una propria copia della variabile `x`, tutte le istanze **non sono inizializzate**; quando si esce dalla regione parallela tutte le modifiche effettuate alla variabile `x` sono persi, soltanto in OpenMP $\le$ 3.0 i valori rimangono aggiornati
- `firstprivate(x)`, come in `private` ma la variabile `x` è inizializzata al valore che aveva prima del blocco parallelo

È possibile definire un comportamento di default per tutte le variabili esterne al blocco parallelo. Per farlo si utilizza la direttiva `default(SCOPE)`, dove viene passato come parametro lo scope di default di tutte le variabili (è possibile anche utilizzare come valore `none`).
>[!note] default(none)
>Se si utilizza questo scopo è necessario specificare tutti gli scope per ogni variabile esterna al blocco parallelo

```c
#pragma omp parallel num_threads(10) private(a) shared(b) firstprivate(c)
```

>[!note]
>Si può specificare anche lo scope per gli array
## La direttiva `atomic` 
Questa direttiva garantisce che soltanto un thread alla volta aggiorna una variabile con scope `shared`.
```c
#pragma omp parallel
{
	partial_result = ...
#pragma omp atomic
	result += partial_result;
}
```
>[!note] È possibile utilizzare al posto di `atomic` una `reduction`
### `critical`
Questa direttiva funziona come `atomic` con la differenza che in questo blocco strutturato non è necessario effettuare soltanto aggiornamenti, ma consente l'esecuzione seriale delle operazioni nel blocco evitando *race conditions*.
>[!note] `critical` protegge porzioni di codice invece `atomic` protegge le locazioni di memoria
## La clausola `reduction`
OpenMP con questa clausola gestisce le operazioni di riduzione sulle variabili automaticamente.
```c
// reduction( <op> : <variable> )
#pragma omp parallel reduction(+:result)
{
	double partial_result = ...
	result += partial_result;
}
```
>[!note] Non è necessario specificare lo `scope` delle variabili in una reduction
### Operatori della `reduction`
Un operatore di una reduction è un operatore di associazione binaria come addizioni, moltiplicazioni, `and` e `or` bit a bit.
Ad ogni iterazione viene applicato l'operatore binario alla sequenza di operandi per ottenere un unico risultato.
![[Pasted image 20250709110333.png]]
#### Funzionamento
- Viene creata una copia con scope `private` della variabile
- Ogni copia viene inizializzata con l'elemento neutrale dell'operatore binario specificato (ad esempio $1$ per la moltiplicazione o $0$ per la somma)
- Ogni thread esegue la regione parallela
- Quando tutti i thread finiscono l'esecuzione della regione parallela l'operatore di riduzione viene applicato all'ultimo valore che ogni thread ha calcolato e il valore che la variabile aveva prima della regione parallela
```c
#include <stdio.h>
#include <omp.h>
#define N 10
int main( void )
{
	int s[N] = {0};
#pragma omp parallel reduction(+:s[:N])
	{
		const int my_id = omp_get_thread_num();
		for (int i = 0; i<N; i++) {
			s[i] += my_id;
		}
	}
	// If there are P threads,
	// s[i] = 0 + 1 + … + (P-1), for all i
	return 0;
}
```
![[Pasted image 20250709114332.png]]
## La direttiva `omp for`
Viene utilizzato all'interno di una regione parallela, è necessario posizionare questa direttiva immediatamente sopra ad un ciclo for.
Gestisce automaticamente le iterazioni del ciclo in modo tale che ogni thread esegue un blocco di operazioni su $n$ elementi (partizionamento a grana grossa).
>[!note] Le variabili del ciclo for di default hanno lo scope `private`
### `omp parallel for`
Permette di creare una regione parallela immediatamente prima di un ciclo for.
```c
double trap3( double a, double b, int n )
{
	double result = 0;
	const double h = (b-a)/n;
#pragma omp parallel for reduction(+:result)
	for ( int i = 0; i<n-1; i++ ) {
		result += h*(f(a+i*h) + f(a+(i+1)*h))/2;
	}
	return result;
}
```
![[Pasted image 20250709115001.png|Tipi di cicli for che possono essere parallelizzati con questa direttiva]]
- L'indice deve essere una variabile `int` o un puntatore (non può essere `float` o `double`)
- Le espressioni `start`, `end` e `incr` devono essere di tipi compatibili
- Le espressioni `start`, `end` e `incr` non possono variare all'interno di ogni esecuzione delle iterazioni
- La variabile `index` può essere modificata solo dal ciclo stesso
### Dipendenze dei Dati
Questa direttiva non gestisce le dipendenze dei dati all'interno di un ciclo.
Per poter utilizzare questa direttiva ed ottenere un risultato corretto è necessario risolvere tutte le dipendenze.
>[!note] Un ciclo può essere parallelizzato?
>Un ciclo per essere parallelizzato in questo modo non deve avere nessuna dipendenza all'interno (*loop-carried dependence*).
>Un modo veloce per riconoscere se un ciclo è parallelizzabile consiste nell'eseguire il ciclo al contrario:
>![[Pasted image 20250709115803.png|Se il risultato è lo stesso allora il ciclo è parallelizzabile (non è affidabile al 100% ma funziona nella maggior parte dei casi]]

## La clausola `schedule(type, chunksize)`
È possibile modificare il tipo di partizionamento dei dati e la dimensione di ogni partizione.
**`type`**
- `static`, le iterazioni sono assegnate ciclicamente ai thread; se non viene specificato il `chunksize` allora viene calcolato come: $chunksize = \lceil n\_iterations / n\_threads\rceil$ 
- `dynamic` o `guided`, le iterazioni vengono assegnate ai thread utilizzando il paradigma [[#Master-Worker]]; la dimensione di default del chunksize è di $1$
- `auto`, il compilatore e/o il sistema run-time determina lo schedule
- `runtime`, lo schedule è determinato a run-time utilizzando la variabile d'ambiente `OMP_SCHEDULE`: `OMP_SCHEDULE="static, 1" ./program.exe`
>[!note] Lo schedule se non specificato viene specificato è *implementation dependent*: gcc utilizza di default lo schedule `static`
### Lo schedule dinamico/guided
Viene utilizzato il paradigma [[#Master-Worker]] dove ogni thread esegue un chunk e alla fine un singolo thread rielabora il risultato.
>[!note] Schedule `dynamic`
>Nello schedule dinamico funziona come per lo schedule statico con l'unica differenza che non è presenta un'allocazione predefinita per ogni thread ma viene assegnato il blocco di dati specificato al primo thread libero.
>Viene utilizzato quando la quantità lavoro è pre-determinata e predicibile per ogni iterazione (poco lavoro a run-time in quanto lo scheduling viene fatto a compile-time)

>[!note] Schedule `guided`
>Nello schedule guided invece la dimensione del blocco (chunk) viene diminuita ogni volta che un chunk viene completato.
>Viene utilizzato quando la quantità di lavoro non è predicibile e può variare ad ogni iterazione (maggiore overhead, molto lavoro fatto a run-time con l'uso di logica di scheduling complessa a run-time)
## La direttiva `collapse`
Può essere utilizzata per collassare più cicli for annidati in un unico spazio di iterazione suddiviso in base alla clausola `schedule`. Non devono essere presenti righe di codice fra i cicli for che si vogliano collassare.
```c
int x, y;
#pragma omp parallel for collapse(2)
	for ( y = 0; y < ysize; y++ ) {
		for ( x = 0; x < xsize; x++ ) { // le variabili x e y sono private
			drawpixel( x, y );
		}
	}
```
### Come vengono collassati i cicli
Se ho per esempio effettuo delle operazioni su una matrice, utilizzando la direttiva `collapse` la matrice viene scomposta per riga: viene assegnato un blocco ad ogni thread, della dimensione specificata, a partire dal primo elemento fino al chunksize-esimo e il successivo blocco partirà dall'elemento subito successivo.
Quindi in pratica la matrice viene scomposta in un'unico array poi suddiviso in blocchi come se fosse un normale array.
![[Pasted image 20250709134338.png]]
```c
#pragma omp parallel for num_threads(5) collapse(2)
for (int i=0; i<4; i++) {
	for (int j=0; j<5; j++) {
		do_work(i,j);
	}
}
```
>[!warning] Cicli non rettangolari
>```c
>#pragma omp parallel for collapse(2)
> for (int i=0; i<n; i++) {
> 	for (int j=i+1; j<n; j++) {
> 		do_work(i,j);
> 	}
> }
> ```
> In questi casi soltanto OpenMP 5.0 è in grado di collassare questi due cicli, se non è possibile utilizzare il collapse si può scegliere di parallelizzarne uno dei due

## Sincronizzazione in OpenMP
### `barrier`
>[!note]
>Tutti i thread attivi nel *team* devono raggiungere questo punto prima di procedere con le successive computazioni
### `master`
>[!note]
>Si applica ad un blocco strutturato, permette di eseguire delle operazioni soltanto al thread *master* mentre gli altri saltano questo blocco. Non è presente una [[#`barrier`|barrier]] alla fine quindi non c'è sincronizzazione 
### `single`
>[!note]
>Si applica ad un blocco strutturato, permette di eseguire delle operazioni al primo thread che arriva a questo punto della regione parallela. È presente una [[#`barrier`|barrier]] alla fine del blocco strutturato: tutti gli altri thread che non eseguono queste operazioni devono aspettare il thread che la sta eseguendo fino a quando non conclude la computazione

## Task parallelism con OpenMP
>[!note] Tasks
>Un task è un'unità di lavoro indipendente, un task è composto da:
>- codice da eseguire
>- dati da elaborare
>
> Vengono assegnati dei thread per eseguire il lavoro di ogni task:
> - il thread che incontra il costrutto di un task può eseguirlo immediatamente
> - i thread possono eseguire i task non sincronicamente
> Inoltre i task possono essere innestati fra loro, eventualmente generando altri task

### `pragma omp task`
Crea un task che eseguirà un blocco strutturato, vengono salvati in una struttura apposita che gestirà OpenMP.
>[!warning] Non è possibile creare un task all'esterno di una regione parallela
>Per questo motivo spesso quando si utilizzano i task indirettamente vengono utilizzate le direttive `single` oppure `master` in modo che un solo thread crea i vari task.

La regione parallela termina se tutti i task messi in coda hanno terminato la loro esecuzione.
#### Scope delle variabili nei task
Le variabili all'interno di un task vengono prese in considerazione quando il task stesso viene eseguito.
È possibile specificare lo scope delle variabili come in una normale [[#Scope|regione parallela]]:
- se una variabile è `shared` ogni riferimento alla variabile all'interno del task fa riferimento alla variabile che era stata create prima dell'inizio del task all'interno della regione parallela
- se una variabile è `private` viene creata una nuova variabile inizializzata e all'interno del task si fa riferimento alla nuova variabile creata quando il task viene eseguito
- se una variabile è `firstprivate` viene creata una nuova variabile `private` inizializzata con il valore che aveva prima della creazione del task
>[!note]
>Tipicamente lo scope più utilizzato nei task è il `firstprivate`, perché non si può conoscere quando un task viene messo in esecuzione e quindi quella stessa variabile potrebbe essere andata out of scope.

![[Pasted image 20250709161609.png|Semplice esempio sugli scope all'interno dei task, di default tutte le variabili al di fuori della regione parallela sono di tipo shared che successivamente diventano private all'interno dei task. Invece la variabile `b` non viene inizializzata e quindi nel task rimarrà tale]]

#### Quando e dove i task concludono?
- Se è presente una [[#`barrier`|barrier]], si applica a tutti i task generati nella regione parallela corrente
- Se è presente la direttiva `taskwait`, ogni i task che raggiungono questa direttiva prima di continuare aspetta che tutti gli altri task si trovino in questo punto del codice:
  ```c
  #pragma omp taskwait
  ```
# Memoria Distribuita con MPI
È una libreria usata con linguaggi di programmazione sequenziali come Fortran, C, C++; si basa sul paradigma Single Program Multiple Data (SPMD).
## Scambio di messaggi con MPI
- non sono presenti più thread all'interno dello stesso programma ma diversi processi, potrebbero esserci errori di comunicazione
- programmi più complicati, verbosi ma ottime performance
Sono necessarie operazioni di comunicazione esplicita per poter comunicare:
- **Comunicazione**, o punto-punto o collettive
- **Sincronizzazione**, barrier e non sono presenti mutex non essendo presenti variabili condivise
- **Query**
## SPMD
```c
MPI_Init(...);
...
foo(); /* executed by all processes */
if ( my_rank == 0 ) {
	do_something(); /* executed by process 0 only */
} else {
	do_something_else(); /* executed by all other processes */
}
...
MPI_Finalize();
```

>[!note] Lo stesso programma viene eseguito su $p$ processi diversi
## Ambiente MPI
- `MPI_Comm_size()` restituisce il numero di processi
- `MPI_Comm_rank()` restituisce il *rank* del processo corrente $[0, size-1]$
```c
#include <stdio.h>
#include <mpi.h>
int main( int argc, char *argv[] )
{
	int rank, size, len;
	char hostname[MPI_MAX_PROCESSOR_NAME];
	MPI_Init( &argc, &argv );
	MPI_Comm_rank( MPI_COMM_WORLD, &rank );
	MPI_Comm_size( MPI_COMM_WORLD, &size );
	MPI_Get_processor_name( hostname, &len );
	printf("Greetings from process %d of %d running on %s\n",
	rank, size, hostname);
	MPI_Finalize();
	return 0;
}
```
## Invio/Ricezione di messaggi MPI
I processi MPI sono organizzati in *gruppi*, un gruppo e un contesto insieme formano un *communicator*; quello di default è chiamato `MPI_COMM_WORLD`.
### Tipi di dati MPI
Quando si esegue una comunicazione con MPI i dati trasmessi e ricevuti sono identificati da una tripla (`address, count, datatype`).
Un tipo in MPI è definito da:
- un tipo predefinito (`MPI_INT`, `MPI_DOUBLE`)
- un array contiguo di *MPI Datatypes*
- un blocco *strided* di *MPI Datatypes*, ovvero un array di dati spaziati fra loro di una grandezza costante
- un array indicizzato di blocchi di *MPI Datatypes*
- una struttura arbitraria di *MPI Datatypes*
![[Pasted image 20250710135639.png]]
>[!note]
>È possibile definire tipi di dati personalizzati
### Tag MPI
I messaggi in MPI sono accompagnati da un tag, un numero intero, che assiste durante il processo di ricezione dei messaggi per identificarli. In questo modo è possibile ricevere messaggi soltanto con un tag specifico.
È inoltre possibile non filtrare i messaggi ricevuti con i tag semplicemente usando `MPI_ANY_TAG` che ignora i tag dei messaggi.

### `MPI_Send()`
Operazione bloccante di invio di un messaggio. Bloccante perché quando viene inviato un messaggio ed inserito il contenuto del buffer nel sotto sistema MPI allora la funzione ritorna e si passa all'operazione successiva.

`MPI_Send(&buf, count, MPI_Datatype, dest, tag, MPI_Comm, MPI_Status*)`
- `buf`, il buffer da inviare
- `count`, il numero di elementi che contiene il buffer
- `MPI_Datatype`, il tipo di dati all'interno del buffer
- `dest`, il rango del processo che riceve il messaggio (`MPI_PROC_NULL` utilizzata per non far fare nulla alla `Send`)
- `tag`, il tag del messaggio (`MPI_ANY_TAG` per non specificare nessun tag)
- `MPI_Comm`, il *communicator* utilizzato (`MPI_COMM_WORLD` default)
- `MPI_Status`, conterrà le informazioni del messaggio (`MPI_STATUS_IGNORE` per non specificarle)
### `MPI_Recv()`
Operazione simmetrica alla [[#`MPI_Send()`|send]]. Bloccante perché il processo prima di eseguire l'operazione successiva rimane in attesa fino alla ricezione di un messaggio da parte del processo sorgente specificato.

`MPI_Send(&buf, count, MPI_Datatype, source, tag, MPI_Comm, MPI_Status*)`
- `buf`, il buffer dove salvare i dati
- `count`, il numero di elementi da ricevere (può essere maggiore al numero di elementi inviati ma non inferiore - `MPI_ERR_TRUNCATE` error)
- `MPI_Datatype`, il tipo di dati all'interno del buffer
- `source`, il rango del processo che invia il messaggio (`MPI_ANY_SOURCE` utilizzata per ricevere un messaggio da qualsiasi processo)
- `tag`, il tag del messaggio (`MPI_ANY_TAG` per non specificare nessun tag)
- `MPI_Comm`, il *communicator* utilizzato (`MPI_COMM_WORLD` default)
- `MPI_Status`, conterrà le informazioni del messaggio (`MPI_STATUS_IGNORE` per non specificarle)
### `MPI_Sendrecv()`
Permette ad un processo di eseguire l'invio di un messaggio e la ricezione di un messaggio in una singola operazione. Utilizzato per esempio nell'*Odd-Even Transposition Sort* per evitare il deadlock durante la comunicazione fra due processi.
```c
MPI_Sendrecv(
	void* sendbuf,
	int sendcount,
	MPI_Datatype sendtype,
	int dest,
	int sendtag,
	void* recvbuf,
	int recvcount,
	MPI_Datatype recvtype,
	int source,
	int recvtag,
	MPI_Comm comm,
	MPI_Status* status
)
```
- *dest* e *source* possono essere uguali o differenti
- MPI gestisce la comunicazione in modo da evitare crash del programma
>[!note] I parametri sono gli stessi della [[#`MPI_Send()`|send]] e della [[#`MPI_Recv()`|receive]].
### `MPI_Status`
È una struttura C che contiene i seguenti campi:
- `MPI_SOURCE`
- `MPI_TAG`
- `MPI_ERROR`
>[!note] Utile per verificare ad esempio se ci sono stati errori nella comunicazione o chi ha inviato il messaggio

### `MPI_Get_count()`
Viene utilizzata per verificare il numero di elementi di uno specifico `MPI_Datatype` sono stati effettivamente ricevuti in un messaggio.

`MPI_Get_count(MPI_Status*, MPI_Datatype, count*`
- `MPI_Recv` può concludere anche se sono stati ricevuti meno elementi di quanti la variabile `count` specifica: supponendo che la [[#`MPI_Send()`|send]] abbia inviato meno elementi.
### Comunicazioni bloccanti e deadlocks
Il problema principale delle comunicazioni bloccanti in MPI riguarda la capacità dei buffer: se un processo invia un messaggio con una send bloccante ed il buffer di ricezione è pieno, la send non ritornerà mai un valore fino a quando il messaggio non viene copiato nel buffer, ma per copiarlo è necessario che venga svuotato tramite una *receive* di un altro processo.

Se ci sono due processi che effettuano una send ed entrambi si mettono in attesa di ricevere un messaggio subito dopo, se i buffer di ricezione sono pieni e non vengono svuotati si entra in una situazione di deadlock dove nessuno dei due processi entrerà mai nella fase di ricezione di un messaggio.
![[Pasted image 20250710151708.png|Si illustra la situazione precedentemente spiegata]]
>[!note] Possibile soluzione al problema
>Dal lato destinatario si effettua prima una receive e successivamente una send
>![[Pasted image 20250710151848.png]]
### Send non bloccante
Un altra possibile soluzione allo stesso problema può consistere nell'utilizzare una send non bloccante, che prima di continuare non aspetta la fase di copiatura del messaggio all'interno del buffer di ricezione.

`MPI_Isend(start*, count, MPI_Datatype, dst, tag, MPI_Comm, MPI_Request*`
- `start*`, puntatore al buffer da inviare
- `count`, numero di elementi contenuti nel buffer
- `MPI_Datatype`, tipo di dato contenuto nel buffer
- `dst`, rango del processo a cui inviare il messaggio all'interno del *communicator*
- `tag`, il tag del messaggio
- `MPI_Comm`, il *communicator* utilizzato
- `MPI_Request*`, indica lo stato dell'operazione (utilizzato per sapere se la richiesta è stata completata: se la richiesta è in corso non è possibile utilizzare il buffer specificato)
### Receive non bloccante
Analoga alla send non bloccante: non interrompe il flusso delle operazioni ma non è possibile utilizzare il buffer specificato se prima non sono stati memorizzati all'interno di esso
`MPI_Irecv(start*, count, MPI_Datatype, source, tag, MPI_Comm, MPI_Request*`
- `start*`, puntatore del buffer dove memorizzare il messaggio
- `count`, numero di elementi contenuti nel buffer
- `MPI_Datatype`, tipo di dato contenuto nel buffer
- `source`, rango del processo che invia il messaggio all'interno del *communicator*
- `tag`, il tag del messaggio
- `MPI_Comm`, il *communicator* utilizzato
- `MPI_Request*`, indica lo stato dell'operazione (utilizzato per sapere se la richiesta è stata completata: se la richiesta è in corso non è possibile utilizzare il buffer specificato)
È necessario chiamare `MPI_Wait()` o `MPI_Test` per determinare se l'operazione non bloccante è conclusa.
### `MPI_Test()`
Funzione non bloccante che determina lo stato corrente della richiesta.
`MPI_Test(request*, flag*, status*)`
- `request*`, puntatore alla richiesta di cui si vuole conoscere l'esito
- `flag*`, valore che può essere $0$ o $1$ rispettivamente se la richiesta è in corso oppure è conclusa
- `status*`, la variabile di stato della richiesta
### `MPI_Wait()`
Aspetta che la richiesta specificata termini prima di proseguire (*busy waiting*)
`MPI_Wait(request*, status*)`
- `request*` puntatore alla richiesta
- `status*`, lo stato della richiesta
## Interruzione delle operazioni
Per terminare un programma in esecuzione prima del previsto, non si utilizza la `exit()` o la `abort()` ma si invoca la funzione di MPI chiamata `MPI_Abort(comm, err)`:
- `comm` è il comunicatore che si vuole interrompere
- `err` il codice di errore che si vuole ritornare
## Comunicazioni Collettive
Si basano su un pattern chiamato: *bulk synchronous* che consiste nell'effettuare delle computazioni sui dati e poi c'è una fase di comunicazione per aggiornare i dati globali.
Le operazioni collettive vengono eseguite da tutti i processi nel gruppo per eseguire e condividere dei risultati globali.
![[Pasted image 20250712152240.png]]
### `MPI_Barrier()`
È un'operazione di sincronizzazione in un gruppo: quando viene raggiunta quest'istruzione, il processo si blocca fino a quando tutti gli altri processi del gruppo non raggiungono la barrier, successivamente si continua l'esecuzione.
### `MPI_Bcast()`
Permette di inviare il contenuto di un buffer a tutti i processi di un comunicatore.
`MPI_Bcast(buf*, count, MPI_Datatype, src, MPI_Comm)`
- `buf*`, puntatore al buffer da inviare
- `count`, numero di elementi nel buffer
- `MPI_Datatype`, tipo di dato contenuto nel buffer
- `src`, rango del processo che invia il messaggio
- `MPI_Comm`, comunicatore dove inviare il messaggio
>[!note] È necessario che tutti i processi chiamino la `MPI_Bcast()` per poter inviare e ricevere il messaggio
### `MPI_Scatter()`
Distribuisce con partizionamento ciclico a grana grossa il contenuto di un array da un processo a tutti gli altri (**versione sincrona**).
La dimensione del messaggio inviato è uniforme.
`MPI_Scatter(sendbuf, sendcnt, MPI_Datatype, recvbuf, recvcnt, MPI_Datatype, src, MPI_Comm)`
- `sendbuf`, buffer dove sono contenuti i dati da inviare
- `sendcnt`, numero di elementi da inviare a ciascun processo
- `recvbuf`, buffer dove memorizzare i dati ricevuti
- `recvcnt`, numero di elementi da ricevere
- `src`, rango del processo che invia i dati
![[Pasted image 20250712154011.png]]
>[!note] La scatter è equivalente ad una serie di send e recv:
>![[Pasted image 20250712154104.png]]
>![[Pasted image 20250712154118.png]]
### `MPI_Gather()`
Ogni processo ha un proprio buffer e vengono inviati ad un solo processo in un solo buffer locale. Vengono riordinati in base al rango dei processi.
`MPI_Gather(sendbuf, sendcnt, MPI_Datatype, recvbuf, recvcnt, MPI_Datatype, dst, MPI_Comm)`
- `sendbuf`, buffer dove sono contenuti i dati da inviare
- `sendcnt`, numero di elementi che ogni processo invia
- `recvbuf`, buffer dove memorizzare i dati ricevuti
- `recvcnt`, numero di elementi da ricevere da ogni processo
- `dst`, rango del processo che memorizza i dati
#### `MPI_Allgather()`
Come la [[#`MPI_Gather()`|gather]] ma il risultato finale viene inviato a tutti i processi del comunicatore.
`MPI_Allgather(sendbuf, sendcnt, MPI_Datatype, recvbuf, recvcnt, MPI_Datatype, MPI_Comm)`
- `sendbuf`, buffer dove sono contenuti i dati da inviare
- `sendcnt`, numero di elementi che ogni processo invia
- `recvbuf`, buffer dove memorizzare i dati ricevuti
- `recvcnt`, numero di elementi da ricevere da ogni processo
>[!note] Manca il parametro `dst` perché appunto tutti i processi ricevono il risultato finale
### `MPI_Scatterv() / MPI_Gatherv()`
I messaggi inviati potrebbero non avere la stessa grandezza e potrebbero non essere contigui; inoltre possono essere distribuiti ai processi in qualsiasi ordine.
`MPI_Scatterv(sendbuf*, sendcnts*, displs*, sendtype, recvbuf*, recvcnt, recvtype, root, MPI_Comm)`
- `sendbuf*`, puntatore del buffer da inviare
- `sendcnt*`, array che ha $p$ elementi ($p =$ numero di processi MPI), numeri di elementi di ogni blocco da inviare
- `displs*`, array che ha $p$ elementi, il numero di elementi che ci sono prima del buffer i-esimo
- `sendtype`, tipo di dati da inviare
- `recvbuf*`, puntatore al buffer dove salvare i dati ricevuti
- `recvcnt`, numero di elementi ricevuti
- `recvtype`, tipo di dati ricevuti
- `root`, rango del processo che invia i messaggi
- `MPI_Comm`, comunicatore dove inviare i messaggi
```c
int sendbuf[] = {10, 11, 12, 13, 14, 15, 16}; /* at master */
int displs[] = {3, 0, 1}; /* assume P=3 MPI processes */
int sendcnts[] = {3, 1, 4};
int recvbuf[5];

MPI_Scatterv(sendbuf, sendcnts, displs, MPI_INT, recvbuf, 5,
MPI_INT, 0, MPI_COMM_WORLD);
```
![[Pasted image 20250712165134.png]]
### `MPI_Reduce()`
Esegue un'operazione di [[#Reduce|reduce]] con l'operatore specificato e invia il risultato finale ad un processo.
`MPI_Reduce(sendbuf, recvbuf, count, sendtype, MPI_SUM, dst, MPI_Comm)`
- `sendbuf`, buffer di invio
- `recvbuf`, buffer di ricezione
- `count`, numero di elementi nei buffer sia di ricezione che di invio (uniformi)
- `sendtype`, tipo di dati da inviare
- `MPI_SUM`, operatore di riduzione (oppure operazioni di riduzioni *custom*)
- `dst`, rango del processo che riceve il risultato finale
- `MPI_Comm`, comunicatore dove inviare i messaggi
![[Pasted image 20250712165515.png|Con `count` pari a $1$]]

>[!note] Nel caso in cui il numero di elementi è maggiore di $1$ allora il processo che riceve i dati finali ottiene un array contenente la riduzione dell'elemento i-esimo all'interno di ogni processo. Per ottenere il risultato finale è necessario applicare l'operatore di riduzione scelto a quest'ultimo array.
>![[Pasted image 20250712171240.png|Con `count` pari a $3$]]

#### `MIN_LOC` e `MAX_LOC`
Questi operatori si applicano a una coppia di dati (`valore, indice`) e restituisce una coppia con il massimo o il minimo e il rispettivo indice.
![[Pasted image 20250712171523.png|Da notare il tipo di dato `MPI_DOUBLE_INT`]]
### `MPI_Allreduce()`
Esegue l'operazione [[#`MPI_Reduce()`|reduce]] ma il risultato viene inviato a tutti i processi del comunicatore.
Tutti i processi devono avere il buffer di invio e di ricezione.
![[Pasted image 20250712171752.png]]
### `MPI_alltoall()`
Tutti i processi devono avere un array di input da inviare, alla fine i processi avranno un array contenente tutti i dati distribuiti in modo particolare.
>[!note] È come fare una [[#`MPI_Scatter()`|scatter]] e una [[#`MPI_Gather()`|gather]]
>Ogni processo effettua una scatter.
>Utilizzata per fare la trasposta delle matrice invece di calcolarla in modo seriale

`MPI_Alltoall(sendbuf, sendcnt, MPI_INT, recvbuf, recvcnt, MPI_INT, MPI_COMM_WORLD)`
![[Pasted image 20250712172111.png]]

### `MPI_Scan()`
Effettua l'operazione [[#Scan|scan]] inclusiva.
`MPI_Scan(sendbuf, recvbuf, count, MPI_INT, MPI_SUM, MPI_COMM_WORLD)`
![[Pasted image 20250712172342.png|Con `count` pari a $1$]]

Come per la [[#`MPI_Reduce()`|reduce]] se `count` è maggiore di $1$ allora ogni processo ottiene una array dove ogni i-esimo elemento è la somma degli elementi partendo dal primo fino al $n$-esimo processo, dove $n$ è il rango del processo:
![[Pasted image 20250712172602.png|Con `count` pari a $3$]]
### Esempio Odd-Event Transposition Sort
Si ordinano le coppie (pari, dispari) e l'iterazione successiva ordina le coppie (dispari, pari) e così via. **Per ogni fase dell'algoritmo con MPI si alternano i due processi comunicanti**.
In MPI si divide l'array iniziale in blocchi tanti quanti sono i processi MPI (partizionamento a grana grossa) e viene assegnato ad ogni processo un blocco; ogni processo ordina il suo blocco e successivamente iniziano le iterazioni dell'algoritmo:
- il processo $i$ invia una copia del proprio blocco al processo $i+1$
- il processo $i+1$ invia una copia del proprio blocco al processo $i$
- il processo $i$ esegue l'operzione di merge del suo blocco con quello dell'altro processo, e scarta la parte superiore (dopo la metà) 
- il processo $i+1$ esegue l'operzione di merge del suo blocco con quello dell'altro processo, e scarta la parte inferiore (prima della metà)
![[Pasted image 20250713130337.png|Esempio di un'iterazione dell'algoritmo]]
>[!warning] Questo metodo funziona solo nel caso in cui la dimensione dell'array originale è multiplo del numero di processi MPI utilizzati
>Per far si che funzioni per qualsiasi dimensione dell'array originale è necessario che nella fase finale, dopo aver scartato la metà corretta, è necessario che ogni processo abbia un risultato con dimensione pari alla dimensione dell'array iniziale **dell'altro processo**. Inoltre bisogna fare attenzione al **massimo numero di elementi** che ogni buffer **può** ricevere.
>![[Pasted image 20250713131548.png]]
#### Fasi dell'algoritmo
![[Pasted image 20250713130504.png]]
>[!note] Deadlock quando due processi comunicano
>Essendo presente una send e una receive per ogni processo le operazioni si bloccano ([[#Comunicazioni bloccanti e deadlocks|deadlock]])
>![[Pasted image 20250713130658.png]]
>Per questo motivo si utilizza la [[#`MPI_Sendrecv()`|`MPI_Sendrecv()`]].
## MPI Datatypes
MPI consente di definire diversi tipi di dati derivati:
- *contiguous*, un insieme contiguo di elementi
- *vector*, array composto da blocchi di dimensioni uniforme equispaziati
- *indexed*, insieme di blocchi con dimensione arbitraria che sono in posizioni arbitrarie
- *struct*, una collezione di blocchi anche di tipi diversi
### `MPI_Type_contiguous()`

```c
MPI_Datatype rowtype;
MPI_Type_contiguous( 4, MPI_FLOAT, &rowtype );
MPI_Type_commit(&rowtype);
// 1 elemento di tipo rowtype = 4 MPI_FLOAT
```
`MPI_Type_contiguous(int count, MPI_Datatype oldtype, MPI_Datatype *newtype)`
- `count`, numero di elementi
- `oldtype`, tipo degli elementi
- `newtype`, puntatore ad un `MPI_Datatype`
>[!note] Esempio
>`MPI_Send(&a[2][0], 1, rowtype, dest, tag, MPI_COMM_WORLD);`
### `MPI_Type_vector()`

```c
MPI_Datatype columntype;
MPI_Type_vector( 4, 1, 4, MPI_FLOAT, &columntype );
MPI_Type_commit(&columntype);
```
`MPI_Type_vector(int count, int blocklen, int stride, MPI_Datatype oldtype, MPI_Datatype *newtype)`
- `count`, numero di blocchi 
- `blocklen`, lunghezza di ciascun blocco
- `stride`, distanza tra l'inizio di un blocco e il blocco successivo
- `odltype`, tipo di dati all'interno del blocco
- `newtype`, puntatore ad un `MPI_Datatype`
![[Pasted image 20250713181034.png|Esempio di un type vector]]
### `MPI_Type_indexed()`
`MPI_Type_indexed(int count, const int array_of_blklen[], const int array_of_displ[], MPI_Datatype oldtype, MPI_Datatype *newtype)`
- `count`, numero di blocchi
- `array_of_blocklen`, numero di elementi in ogni blocco (con `count` elementi)
- `array_of_displ`, posizione di ogni blocco rispetto all'inizio del buffer (con `count` elementi)
```c
int count = 3; int blklens[] = {1, 3, 4}; int displs[] = {2, 5, 12};
MPI_Datatype newtype;
MPI_Type_indexed(count, blklens, displs, MPI_FLOAT, &newtype);
MPI_Type_commit(&newtype);
```
![[Pasted image 20250713181811.png]]
>[!note] Attenzione al tipo di dati MPI che si riceve:
>![[Pasted image 20250713181925.png|Si invia e si riceve `newtype`]]
>![[Pasted image 20250713182003.png|Si invia un `newtype` e si ricevono $8$ `MPI_FLOAT`]]
>A seconda del tipo di dati che si riceve varia il modo in cui viene memorizzato in memoria
### Combinare Datatypes
In MPI è possibile combinare due o più tipi di dati derivati baste che siano *contiguous* o *vector* o *indexed*.
```c
int count, blocklen, stride;
MPI_Datatype vec, vecvec;
count = 2; blocklen = 2; stride = 3;
MPI_Type_vector(count, blocklen, stride, MPI_FLOAT, &vec);
MPI_Type_commit(&vec);
count = 2; blocklen = 1; stride = 3;
MPI_Type_vector(count, blocklen, stride, vec, &vecvec);
MPI_Type_commit(&vecvec);
```
![[Pasted image 20250713182414.png]]
### `MPI_Type_create_struct()`
`MPI_Type_create_struct(int count, int *array_of_blklen, MPI_Aint *array_of_displ, MPI_Datatype *array_of_types, MPI_Datatype *newtype)`
- `count`, numero di blocchi
- `array_of_blklen`, numero di elementi in ogni blocco
- `array_of_displ`, displacements in **byte** di ogni blocco dall'inizio del buffer all'inizio della struttura dati (deve essere di tipo `MPI_Aint`, ricavata con `MPI_Type_get_extent()`)
- `array_of_types`, array di `MPI_Datatype`
```c
typedef struct {
	float x, y, z, v;
	int n, t;
} particle_t;

int count = 2; int blklens[2];
MPI_Aint displs[2], lb, extent;
MPI_Datatype oldtypes[2], newtype;
oldtypes[0] = MPI_FLOAT; blklens[0] = 4; displs[0] = 0;
MPI_Type_get_extent(MPI_FLOAT, &lb, &extent);
// prende il numero di byte utilizzati in memoria per creare un MPI_FLOAT
// lb (lower bound) viene utilizzato per definire dei buchi (se ce ne sono) all'inizio del tipo
oldtypes[1] = MPI_INT; blklens[1] = 2; displs[1] = 4*extent;
MPI_Type_create_struct(count, blklens, displs, oldtypes, &newtype);
MPI_Type_commit(&newtype);
```
![[Pasted image 20250713183122.png]]
## Riassunto
MPI si basa su un modello semplice di scambio di messaggi, molto a basso livello e pesante causato dalla comunicazione stessa. Il codice è molto verboso e la maggior parte è solamente codice per comunicare.
# CUDA
Tecnologia proprietaria di NVIDIA che espone un modello di programmazione *data-parallel*.
>[!note] Host
>Comprende la CPU e la sua memoria chiamata *host memory*

>[!note] Device
>La GPU e la sua memoria chiamata *device memory*

Il programma viene eseguito sulla CPU e una sotto parte viene eseguita sulla GPU. Per poter fare delle operazioni sui dati sfruttando la GPU è necessario prima inviare i dati dall'host al device, sarà l'host a chiamare le funzioni che inizieranno la computazione sulla GPU.

Le fasi di un programma in CUDA sono le seguenti:
- si copiano i dati dalla memoria della CPU sulla memoria della GPU
- si carica il programma sulla GPU e viene eseguito, sfruttando la cache al suo interno per aumentare le performance
- si copiano i risultati dalla memoria della GPU sulla memoria della CPU
## Architettura di una GPU
![[Pasted image 20250713210653.png]]
>[!note]
>Ottimizzata per l'esecuzione di codice tipo SIMD (Single Instruction Multiple Data).
>Ha un numero elevato di core ottimizzati per l'esecuzione di un flusso comune di istruzioni.

Comprende i seguenti componenti:
- una memoria globale
- i modelli recenti hanno una cache L2
- un insieme di processori chiamati *streaming multiprocessor*, sono ottimizzati per eseguire operazioni SIMD ed ognuno di essi è composto da: una serie di *streaming processors*, un *warp scheduler*, elevato numero di registri, una cache L1 e una memoria condivisa
### Dal punto di vista di un programmatore
Una GPU è composta da *thread*, *block* e *grid*.
- Un **thread** è la minima unità di lavoro assegnata alla GPU, tutti i thread eseguono la stessa funzione *kernel*. Oppure la computazione che deve essere fatta per produrre un singolo risultato.
- Un **blocco** è una sottocomponente indipendente di lavoro che può essere eseguito in qualsiasi ordine dal *streaming multiprocessor*. Contiene una matrice 3D di thread.
- Una **grid** è una parte di lavoro che può essere eseguita sulla GPU: è un insieme di blocchi
![[Pasted image 20250713211649.png]]
 >[!note] CUDA warp
 >Un CUDA warp è la minima unità di lavoro mandata in esecuzione ed è composto da 32 thread, è possibile ricavare i thread che fanno parte di uno stesso warp dividendo il loro ID per $32$.
 >È possibile che warp diversi eseguano diverse istruzioni, ma per rendere la computazione efficiente è necessario che tutti i thread di un warp eseguano le stesse operazioni.
### SIMD nei thread
![[Pasted image 20250714101239.png]]
- Ogni thread esegue le prime due linee di codice
- Se è presente una divergenza, prima viene eseguita tutta la parte vera del "test" successivamente i thread eseguono la parte falsa della divergenza
- Alla fine riprendono tutti l'esecuzione del programma
## Introduzione a CUDA
```c
#include <stdio.h>
__global__ void mykernel(void) { }

int main(void)
{
	mykernel<<<1,1>>>( );
	printf("Hello World!\n");
	return 0;
}
```

La funzione `mykernel` viene chiamata *kernel* e viene eseguita sulla GPU, non può essere chiamata come in un normale programma C, ma bisogna utilizzare una chiamata del tipo: `mykernel<<<1,1>>>( )`.
La keyword `__global__` distingue una normale funzione da eseguire sull'host da un kernel da eseguire sul device.
>[!note] I kernel non devono avere nessun `return` di alcun tipo
>Il compilatore di CUDA, *nvcc* separa il codice sorgente da eseguire sull'host e sul device
### Gestione della memoria
La memoria dell'host e del device sono entità separate:
- la memoria del device riguarda tutta la memoria della GPU
- la memoria dell'host è tutta la memoria della CPU (cache, ram, etc)
Tramite CUDA è possibile copiare il contenuto della memoria della CPU alla memoria del device e viceversa tramite la funzione `cudaMemcpy()`.
>[!note] Non si può dereferenziare la memoria dell'host nel device e viceversa

>[!note] Coordinazione di host e device
>Le chiamate ai kernel sono asincrone: la CPU una volta che ha chiamato un kernel continua l'esecuzione del suo programma. DI conseguenza prima di prendere i risultati ha bisogno di sincronizzarsi con il device
>![[Pasted image 20250714111203.png]]

## Esecuzione in parallelo
### Blocchi CUDA
```c
add<<<N, 1>>>();
```
La chiamata precedente indica che il kernel `add` viene eseguito utilizzando le seguenti risorse:
- $N$ blocchi utilizzati dalla GPU
- $1$ thread utilizzato per ogni blocco utilizzato ($N \times 1$ thread in totale)

Ogni blocco ha un proprio indice all'interno della *grid* e si può ottenere tramite la struttura dati `blockIdx`:
```c
_global__ void add(int *a, int *b, int *c)
{
	c[blockIdx.x] = a[blockIdx.x] + b[blockIdx.x];
}
```
![[Pasted image 20250714112835.png|Ogni blocco esegue la propria operazione su un elemento dell'array]]
### Thread CUDA
Un blocco è diviso in thread paralleli, ognuno con un proprio indice chiamato `threadIdx`, una struttura dati che contiene al suo interno l'indice del thread corrente.
```c
__global__ void add(int *a, int *b, int *c)
{
	c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}
```
In questo caso si vuole effettuare la computazione parallela all'interno di un blocco solo.
![[Pasted image 20250714132052.png]]
### Combinare Thread e Blocchi
Supponendo di effettuare un'operazione per thread in 3 blocchi, ogni blocco utilizza 8 thread l'individuazione del singolo thread diventa la seguente:
```c
int index = threadIdx.x + blockIdx.x * blockDim.x
```
![[Pasted image 20250714144025.png]]
>[!note] La variabile `blockDIm.x` contiene l'indice del blocco del thread che esegue il kernel.

>[!warning] Caso in cui la dimensione dell'array non è multipla di $1024$ (dimensione di un blocco)
>È possibile che vengano utilizzati più thread di quanti necessari, per risolvere questo problema è necessario che il kernel sappia la dimensione dell'array, in questo modo se l'indice del blocco-thread è superiore alla dimensione dell'array non viene eseguita l'operazione.
>![[Pasted image 20250714144406.png]]
>Invece la chiamata del kernel diventa la seguente:
>`add<<<(N + BLKDIM-1)/BLKDIM, BLKDIM>>>(d_a, d_b, d_c, N)`
>La frazione viene arrotondata per eccesso.
### Espressioni da ricordare
- `add<<<(N + BLKDIM-1)/BLKDIM, BLKDIM>>>(…)`
- `blockIdx.x` per accedere al blocco
- `threadIdx.x` per accedere al thread all'interno di un blocco
- `int index = threadIdx.x + blockIdx.x * blockDim.x` per assegnare ogni elemento di un array ai thread necessari
>[!note] I thread in CUDA hanno la possibilità di comunicare e sincronizzarsi fra loro

## Cooperazione fra Thread
Quando più thread accedono alla stessa locazione di memoria più volte è possibile utilizzare la memoria condivisa di ogni blocco della GPU così da velocizzare l'accesso ai valori.
Si utilizza la direttiva `__shared__` che memorizza dei valori all'interno della memoria condivisa di ogni blocco; questa memoria è visibile solo ai thread all'interno dello stesso blocco.
![[Pasted image 20250714150821.png|Modello delle memorie in una GPU moderna]]

