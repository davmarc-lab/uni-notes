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

## Misurare il tempo

>[!warning] **40 MINUTI ALLA LEZIONE 2024-10-03**

# Parallelizzare i cicli
## Loop Carried Dependency