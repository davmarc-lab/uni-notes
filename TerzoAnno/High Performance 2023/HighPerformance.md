### Lezioni
|   |   |
|---|---|
|Mercoledì|10-12|
|Giovedì|14-17|
---
### Index
- [[#Lezioni]]
- [[#Index]]
- [[#Introduzione]]
    - [[#Sum-Reduction]]
        - [[#Memoria condivisa]]
        - [[#Memoria distribuita]]
    - [[#Task parallelism vs Data Parallelism]]
- [[#Architetture parallele]]
    - [[#Architettura di Von Neumann seriale]]
    - [[#Caching]]
        - [[#Gerarchia delle memorie cache]]
        - [[#Funzionamento]]
        - [[#Esempio prodotto matrice x matrice]]
        - [[#Rappresentazione di una matrice]]
        - [[#Ottimizzazione della memoria access pattern]]
- [[#Instruction-Level-Parallelism ILP]]
    - [[#Hardware multithreading]]
    - [[#Tassonomia di Flynn]]
        - [[#SISD]]
        - [[#MISD]]
    - [[#SIMD]]
    - [[#MIMD]]
        - [[#MIMD architectures]]
    - [[#Architetture ibride]]
- [[#Pattern per la programmazione parallela]]
    - [[#Embarrassingly Parallel]]
    - [[#Partition]]
        - [[#Tipi di partizioni]]
        - [[#Grandezza di una partizione]]
        - [[#Fine grained vs Coarse grained partitioning]]
        - [[#Esempio Mandelbrot set]]
    - [[#Bilanciamento del carico]]
    - [[#Master-worker pradigm]]
    - [[#Scelta della grandezza della partizione]]
    - [[#Stencil]]
        - [[#Celle fantasma]]
        - [[#Parallelizzare stencil]]
        - [[#Parallelizzazione stencil su sistemi distribuiti]]
    - [[#Reduce pattern]]
        - [[#sum-reduce]]
    - [[#Scan pattern]]
        - [[#Scan, Prefix Sum]]
    - [[#Conclusioni]]
- [[#Performance evaluation]]
    - [[#Speedup]]
        - [[#Attenzione]]
    - [[#Porzioni non parallelizzabili]]
    - [[#Legge di Amdahl]]
    - [[#Scaling efficiency]]
        - [[#Strong Scaling Efficiency]]
        - [[#Weak Scaling Efficiency]]
- [[#Parallelizing Loops]]
    - [[#Definition]]
        - [[#Data Dependence]]
    - [[#Teorema fondamentale delle Dipendenze]]
    - [[#Rimozione delle dipendenze]]
        - [[#Loop aligning]]
        - [[#Loop interchange]]
        - [[#Difficult dependencies]]
- [[#Programmazione memoria distribuita con MPI]]
    - [[#SPMD, Single Program Multiple Data]]
    - [[#Passaggio dei messaggi con MPI]]
    - [[#Principali funzioni]]
        - [[#Compilazione]]
        - [[#Esecuzione]]
        - [[#Esecuzione specifica]]
        - [[#MPI Functions]]
        - [[#Esempio programma MPI]]
    - [[#Concetti fondamentali]]
    - [[#Tipi di dati]]
    - [[#Tag MPI]]
    - [[#Invii bloccanti]]
    - [[#Ricezione bloccante]]
---
# Introduzione
## Sum-Reduction
### Memoria condivisa
Dividere il carico di un vettore con n elementi a P processori
```C++
mutex m;
sum = 0.0;
do in parallel {
	my_start = (n * my_id) / p;
	my_end = (n * (my_id + 1) / p);
	for (my_i = my_start; my_i < my_end; my_i++;) {
		mutex_lock(&m);
		sum += v[my_id];
		mutex_unlock(&m);	
	}
}
```
```C++
mutex m;
sum = 0.0;
do in parallel {
	my_start = (n * my_id) / p;
	my_end = (n * (my_id + 1) / p);
	my_sum = 0.0;
	for (my_i = my_start; my_i < my_end; my_i++;) {
		my_sum += v[my_i];
	}
	mutex_lock(&m);
	sum += v[my_id];
	mutex_unlock(&m);
}
```
### Memoria distribuita
```C++
my_sum = 0.0;
my_start = …, my_end = …;
for ( i = my_start; i < my_end; i++ ) {
	my_sum += get_value(i);
}
if ( 0 == my_id ) {
	for ( i=1; i<P; i++ ) {
		tmp = receive from proc i;
		my_sum += tmp;
	}
	printf(“The sum is %f\n”, my_sum);
} else {
	send my_sum to proc 0;
}
```
![[Untitled.png]]
**Parallel Reduction**
![[Untitled 1.png]]
## Task parallelism vs Data Parallelism
- **Task parallelism**
    - Distribuisce diverse operazioni ai processori
- **Data parallelism**
    - Distribuisce i dati ai processori
    - Ogni processore esegue la stessa operazione ma con dati differenti
# Architetture parallele
È un’architettura composta da più unità di esecuzione e unità di memoria interconnesse da una rete di interconnessione.
![[Untitled 2.png]]
## Architettura di Von Neumann seriale
Modello di architettura **seriale**, ovvero non parallela.
![[Untitled 3.png]]
Program Counter, Instruction register, registro per overflow
## Caching
### Gerarchia delle memorie cache
![[Untitled 4.png]]
### Funzionamento
La memoria cache è una memoria veloce, spesso inserita nel chip del processore. È una memoria molto costosa e poco capiente.
La cache contiene una copia dei contenuti di alcune locazioni di memoria a cui si è acceduti recentemente, se la stessa locazione di memoria viene acceduta nuovamente, e il suo contenuto è nella cache, invece di leggere i dati dalla RAM vengono direttamente letti dalla memoria cache (**località temporale**). Invece la località **spaziale** si ha quando la cache deve accedere alla memoria adiacente ad una locazione.
![[Untitled 5.png]]
![[Untitled 6.png]]
### **Esempio prodotto matrice x matrice**
```C++
void matmul( double *p, double* q, double *r, int n)
{ 
	int i, j, k;
	for (i=0; i<n; i++) {
		for (j=0; j<n; j++) {
			double s = 0.0;
			for (k=0; k<n; k++) {
				s += p[i*n + k] * q[k*n + j];
			}
			r[i*n + j] = s;
		}
	}
}
```
### Rappresentazione di una matrice
Le matrici in C vengono memorizzate per riga, gli elementi di ogni riga sono continui nella memoria.
![[Untitled 7.png]]
Molto efficiente per la memorizzazione delle righe nella cache
![[Untitled 8.png]]
### Ottimizzazione della memoria access pattern
Per effettuare il prodotto riga x colonna di due matrici è più efficiente creare una matrice trasposta della matrice di cui vengono selezionate **solamente** le colonne. Trasponendo la matrice le colonne della matrice diventano le righe.
![[Untitled 9.png]]
[https://www.moreno.marzolla.name/teaching/HPC/parallel-architectures.pdf](https://www.moreno.marzolla.name/teaching/HPC/parallel-architectures.pdf)
Pagina 25-28 per informazioni sul comando _perf_
# Instruction-Level-Parallelism ILP
Utilizza molteplici unità funzionali per incrementare le prestazioni di un processore:
- **Pipelining**: le unità funzionali sono organizzate come una catena di montaggio, e possono essere usate in un ordine specifico
- **Multiple issue**: le unità funzionali possono essere utilizzate quando sono necessarie
    - **statico**, l’ordine delle unità funzionali viene deciso a **compile time**
    - **dinamico**, l’ordine delle unità funzionali viene deciso a **run time**
![[Untitled 10.png]]
## Hardware multithreading
Permette alle CPU di cambiare operazione da eseguire quando l’operazione corrente è in fase di stallo.
- **Fine-grained multithreading**, la cpu può cambiare operazione quando si presentano talli di durata corta.
- **Coarse-grained multithreading**, viene utilizzato solo per thread che bloccano le operazioni I/O, la cpu è meno efficiente in presenza di stalli di poca durata.
- **Simultaneous multithreading SMT**, è un’implementazione di **fine-grained multithreading** dove thread differenti possono usare più unità differenti allo stesso momento
- **HyperThreading**, implementazione di SMT creata da Intel, ogni core è visto dal sistema operativo come due processori logici. Ogni processore logico mantiene un set completo sullo stato dell’architettura.  
	Le pipeline create sono divise da due buffer, uno per ogni thread esecutivo, se un thread è in fase di stallo allora l’altro potrebbe andare avanti e riempire gli slot della pipeline, aumentando l’utilizzo del processore.  
    [http://www.cs.virginia.edu/~mc2zk/cs451/vol6iss1_art01.pdf](http://www.cs.virginia.edu/~mc2zk/cs451/vol6iss1_art01.pdf)

![[Untitled 11.png]]
20% di prestazioni in più rispetto ad un processore che non utilizza questo sistema
## Tassonomia di Flynn
![[Untitled 12.png]]
### SISD
![[Untitled 13.png]]
### MISD
![[Untitled 14.png]]
## SIMD
![[Untitled 15.png]]
Le istruzioni **SIMD** applicano le stesse operazioni a più dati diversi.
## MIMD
![[Untitled 16.png]]
Nei sistemi **MIMD** ci sono più unità di esecuzione che possono eseguire più sequenze di istruzioni, **Multiple Instruction Streams**; ogni unità di esecuzione generalmente opera su propri dati in input, **Multiple Data Streams**.
### MIMD architectures
- **Memoria condivisa**, un set di processori condividono uno spazio di memoria comune, ogni processore può accedere a qualsiasi locazione di memoria
![[Untitled 17.png]]
- **Memoria distribuita**, un set di nodi computazionali sono connessi da una rete di interconnessione, i nodi possono condividere i dati attraverso esplicite comunicazioni
![[Untitled 18.png]]
## Architetture ibride
Alcuni sistemi HPC sono basati su architetture ibride, ogni nodo computazionale è un multiprocessore a memoria condivisa. Un gran numero di nodi sono connessi attraverso una rete di interconnessione.
![[Untitled 19.png]]
# Pattern per la programmazione parallela
Un pattern di design è una soluzione generale per un problema ingegneristico. Un pattern non è una soluzione per un problema ma è una descrizione di come un certo problema può essere risolto.
- Embarrassingly Parallel
- Partition
- Master-Worker
- Stencil
- Reduce
- Scan
## Embarrassingly Parallel
Si applica quando la computazione può essere decomposta in **task indipendenti** che richiedono un minimo o nessuna comunicazione:
- Vector sum
- Mandelbrot set
- 3D rendering
- Brute force password cracking
![[Untitled 20.png]]
Decompone l’input per poi elaborare ogni singolo pezzo, infine lo riassembla il risultato
## Partition
Lo spazio dei dati di input viene diviso in regioni chiamate **partizioni**, ogni processore opera su una partizione. Questo pattern è particolarmente utile quando l’applicazione presenta [**principio di località**](https://it.wikipedia.org/wiki/Principio_di_localit%C3%A0_\(informatica\)) (**località spaziale**).

> Durante l'esecuzione di una data istruzione presente in memoria, con molta probabilità le successive istruzioni saranno ubicate nelle vicinanze di quella in corso. Nell'arco di esecuzione di un programma si tende a fare riferimenti continui alle stesse istruzioni
- Matrix-vector product, Ax = b
![[Untitled 21.png]]
### Tipi di partizioni
- **Regolare**, il dominio è diviso in partizioni della stessa grandezza e forma
- **Irregolare**, le partizioni non necessariamente hanno la stessa grandezza o forma (Heath transfer on irregular solids)
### Grandezza di una partizione
- **Fine-Grained**, tante ma piccole partizioni
- **Coarse-Grained**, poche ma grandi partizioni
![[Untitled 22.png]]
1-D Partitioning
![[Untitled 23.png]]
2-D Block Partitioning
![[Untitled 24.png]]
2-D Cyclic Partitioning
![[Untitled 25.png]]
2-D Cyclic Partitioning
### Fine grained vs Coarse grained partitioning
- **Fine-grained Partitioning**, miglior bilanciamento del carico specialmente se combinato con il master-worker pattern; se la divisione è troppo piccola il ratio di computazione/comunicazione può diventare troppo piccolo
- **Coarse-grained Partitioning**, in generale migliora il ratio di computazione/comunicazione; può causare lo sbilanciamento del carico
### Esempio Mandelbrot set
Il Mandelbrot set è un set di punti $c$ su un piano complesso con la sequenza $z_n(c)$ definita come segue:
$$z_n(c) = \begin{cases}  
0 & \text{if } n = 0 \\  
z_{n - 1}^2(c) + c & altrimenti  
\end{cases} \newline  
\text{Non diverge quando } n \to +\infty$$
Se il modulo di $z_n(c)$ non supera 2 dopo $nmax$ iterazioni, il pixel viene colorato di nero, altrimenti il colore dipende dal numero di iterazioni della serie.
```C
maxit = 1000;
for each point (cx, cy) {
	x = y = 0;
	it = 0;
	while ( it < maxit AND x*x + y*y ≤ 2*2 ) {
		xnew = x*x - y*y + cx;
		ynew = 2*x*y + cy;
		x = xnew;
		y = ynew;
		it = it + 1;
	}
	plot(cx, cy, it);
}
```
## Bilanciamento del carico
Idealmente ogni processore dovrebbe avere lo stesso carico di lavoro degli altri processori. Se il task si sincronizza alla fine della computazione, il tempo di esecuzione sarà quello del task più lento.
![[Untitled 26.png]]
Il carico di lavoro è bilanciato se ogni processore esegue lo stesso o quasi carico di lavoro degli altri.
Due possibili modi per bilanciare il carico sono:
- fine-grained partitioning, potrebbero esserci delle comunicazioni overhead se il task deve comunicare
- dynamic task allocation, **master-worker paradigm**, l’allocazione dinamica dei task potrebbe incorrere in un overhead più alto rispetto all’allocazione statica
## Master-worker pradigm
Applica la tecnica di fine-grained partitioning, dove il numero di task è molto maggiore rispetto al numero di unità esecutive. Ogni task viene assegnato al primo worker disponibile.
![[Untitled 27.png]]
## Scelta della grandezza della partizione
![[Untitled 28.png]]
## Stencil
La computazione Stencil coinvolge una griglia dove i valori sono aggiornati seguendo un preciso pattern chiamato **stencil**.
![[Untitled 29.png]]
La computazione _stencil_ di solito impiega due domini per mantenere il corrente e il prossimo valore. I valori sono letti dal dominio corrente, quelli nuovi vengono scritti nel dominio successivo. I due domini vengono scambiati alla fine di ogni step.
![[Untitled 30.png]]
### Celle fantasma
Per alcune applicazioni le celle del dominio vengono arricchite da un contorno di _celle fantasma_, ovvero un bordo di celle con l’unico scopo di delimitare l’analisi del dominio effettivo senza andare fuori dal range (_periodic boundary conditions_).
![[Untitled 31.png]]
### Parallelizzare stencil
La computazione del prossimo dominio nella parallelizzazione stencil, ha una struttura di tipo **embarrassingly parallel**.
```C
Initialize current domain
while (!terminated) {
	Init ghost cells
	Compute next domain in parallel
	Exchange current and next domains
}
```
### Parallelizzazione stencil su sistemi distribuiti
Le _ghost cells_ sono essenziali per implementare stencil in modo efficiente in architetture a memoria distribuita
![[Untitled 32.png]]
## Reduce pattern
Una **reduction** è l’applicazione di un operatore binario associativo agli elementi di un array.
- sum-reduce: $\left[ x_0, x_1, \dots, n_{n-1} \right] = x_0 + x_1 + \dots + x_{n-1}$
- min-reduce: $\left[ x_0, x_1, \dots, n_{n-1} \right] = \min \space \{x_0, x_1, \dots, x_{n-1}\}$
Una riduzione può essere eseguita in $O(\log_2 n)$ step paralleli
### sum-reduce
![[Untitled 33.png]]
## Scan pattern
==Uno== ==_scan_== ==calcola tutti i prefissi di un array== $\left[ x_0, x_1, \dots, x_{n-1} \right]$ utilizzando un dato operatore di associazione binaria.
### Scan, Prefix Sum
$\left[ y_o, y_1, \dots, y_{n-1} \right] = \text{ inclusive-scan}( op, \left[ x_0, x_1, \dots, x_{n-1} \right])$
$$\begin{align*}  
\text{where} \newline  
&y_0 = x_0 \\  
&y_1 = x_0 \space op \space x_1 \\  
&y_2 = x_0 \space op \space x_1 \space op \space x_2 \\ &\dots \\  
&y_{n-1} = x_0 \space op \space x_1 \space op \space \dots \space op \space x_{n-1}  
\end{align*}$$
```C
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
## Conclusioni
In conclusione un pattern di programmazione parallela definisce un partizionamento dei dati di input e definisce una struttura di comunicazione tra i task paralleli.
I pattern aiutano a definire algoritmi efficienti, molti problemi possono essere risolti utilizzando uno o più pattern diversi.
# Performance evaluation
## Speedup
Definiamo:
- $p$ = number of processors / cores
- $T_{serial}$ = tempo di esecuzione del programma seriale
- $T_{parallel}(p)$ = tempo di esecuzione del programma in parallelo con $p$ processori/cores
$$S(p) = \frac{T_{serial}}{T_{parallel}(p)} \approx \frac{T_{parallel}(1)}{T_{parallel}(p)}$$
Nel caso ideale, la programmazione parallela richiede $1 / p$ volte il programma sequenziale.
$S(p) = p$ è il caso ideal del **linear speedup**, ma realisticamente $S(p) \le p$
### Attenzione
Non usare un programma seriale per calcolare $T_{serial}$, bisogna sempre usare il programma parallelo con $p = 1$ processori.
## Porzioni non parallelizzabili
Supponiamo che una frazione $\alpha$ del tempo di esecuzione totale del programma seriale non può essere parallelizzato. Supponiamo che la rimanente frazione $(1 - \alpha$) può essere **completamente parallelizzabile**, allora abbiamo:
$$T_{parallel}(p) = \alpha T_{serial} + \frac{(1 - \alpha) T_{serial}}{p}$$
![[Untitled 34.png]]
supponiamo che $T_{serial} = 20s$, il $10\%$ del tempo è speso nella porzione seriale allora ⇒ $T_{parallel}(p) = 0.1T_{serial} + {0.9T_{serial} \over p} = 2 + {18 \over p}$
## Legge di Amdahl
Quanto vale in massimo speedup?
$$\begin{align*}  
S(p) &= \frac{T_{serial}}{T_{parallel}(p)} \\  
&= \frac{T_serial}{\alpha T_{serial} + {(1 - \alpha)T_{serial} \over p}} \\  
&= \frac{1}{\alpha + {1 - \alpha} \over p}  
\end{align*}$$
Dall’equazione $S(p) = \frac{1}{\alpha + {1 - \alpha} \over p}$ otteniamo uno speedup asintotico di $1 / \alpha$ quando $p$ cresce all’infinito. Se una frazione $\alpha$ del tempo totale di esecuzione è utilizzato da una porzione di programma seriale, allora lo speedup massimo ottenibile è $1 / \alpha$.
![[Untitled 35.png]]
## Scaling efficiency
- **Strong scaling**: incrementa il numero di processori $p$ mantenendo la dimensione del problema totale uguale. Il carico di lavoro totale rimane invariato, ma per ogni processore il carico di lavoro diminuisce. **L’obiettivo è quello di ridurre il tempo totale di esecuzione aggiungendo processori**
- **Weak scaling**: incrementa il numero di processori mantenendo il carico di lavoro per processore invariato. Il totale carico di lavoro aumenta con l’aumentare di $p$; l’obiettivo è risolvere grandi problemi impiegando lo stesso tempo
### Strong Scaling Efficiency
$E(p)$ = **Strong Scaling Efficiency**
$$E(p) = {S(p) \over p} = {T_{parallel}(1) \over p \times T_{parallel}(p)}$$
dove $T_{parallel}(p)$ è il tempo di esecuzione del programma parallelo con $p$ processori
![[Untitled 36.png]]
### **Weak Scaling Efficiency**
$W(p)$ = **Weak Scaling Efficiency**
$$W(p) = {T_1 \over T_p}$$
dove:
- $T_1$ è il tempo necessario per completare 1 lavoro con un solo processore
- $T_p$ è il tempo necessario per completare p lavori con p processori
**Weak Scaling**
Definisco $f(n_p, p)$ come la quantità, o il carico, di lavoro fatto da ogni processore, data la dimensione dell’input $n_p$ e $p$ processori. Vogliamo calcolare le dimensioni dell’input $n_p$ tale che: $f(n_p, p) = costante$.
![[Untitled 37.png]]
Esempio per calcolare la $f(n_p, p)$ costante
# Parallelizing Loops
## Definition
In pratica per parallelizzare un ciclo occorre effettuare le iterazioni dei cicli in parallelo: il numero delle unità di esecuzione deve essere più o meno il numero di iterazioni, altrimenti una unità può occuparsi di più iterazioni dello stesso ciclo in un ordine non specificato.
![[Untitled 38.png]]
### Data Dependence
Due accessi in memoria sono coinvolti in una **dipendenza** se la memoria fa riferimento alla stessa locazione e una delle referenze è una scrittura.
- **Data-Flow**, _true dependence →_ RAW _Read After Write_
![[Untitled 39.png]]
![[Untitled 40.png]]
- **Anti dependence** → WAR _Write After Read_
- **Output dependence** → WAW _Write After Write_
![[Untitled 41.png]]
- **Control dependence**: se il ritorno di un’operazione $S1$ determina se $S2$ viene eseguito o no

    ![[Untitled 42.png]]
## Teorema fondamentale delle Dipendenze

> Una trasformazione di riordinamento che preserva ogni dipendenza nel programma allora mantiene il significato del programma.
> 
> _Any reordering transformation that preserves every dependence in a program preserves the meaning of that program_
![[Untitled 43.png]]

> Per vedere se un ciclo è PROBABILMENTE parallelizzabile, riscrivere il ciclo al contrario, ovvero invece che i = 0, 1, …, n-1; provare a vedere se il ciclo che ha i = n-1, n-2, …, 1, 0; ottiene lo stesso risultato.

Ogni iterazione non dipende da una precedente, non ci sono dipendenze che superano i limiti dell’iterazione. Questo ciclo è completamente parallelizzabile:
- le iterazioni possono essere eseguite in modo concorrente in qualsiasi ordine
- le iterazioni possono essere spalmate su tutti i processori
## Rimozione delle dipendenze
### Loop aligning
Le dipendenze spesso possono essere rimosse **allineando le iterazioni** dei cicli
![[Untitled 44.png]]
### Loop interchange
Scambiare gli indici dei cicli potrebbe rendere il ciclo parallelizzabile
![[Untitled 45.png]]
### Difficult dependencies
![[Untitled 46.png]]
Le dipendenze in questo caso sono molto forti e complesse e portano ad una non parallelizzazione dei cicli.  
Una soluzione possibile è parallelizzare il ciclo interno ma facendolo lavorare sulla diagonale, dove le dipendenze non sono importanti.  
![[Untitled 47.png]]
# Programmazione memoria distribuita con MPI
Lo scambio di _**messaggi**_ è il modello di programmazione predominante per supercomputer e cluster.
**MPI** è una libreria usata da linguaggi sequenziale come Fortran, C e C++, basata su **Single Program**, **Multiple Data (SPMD) paradigm**. Isola e separa lo spazio di indirizzi:
- non sono presenti condition races ma sono possibili problemi di comunicazione
- espone il modello di esecuzione e forza il programmatore a pensare localmente
- complessità e codice crescono
## SPMD, Single Program Multiple Data
Lo stesso programma viene eseguito da $P$ processi, ogni processo può scegliere un differente path di esecuzione a seconda del suo ID, _rank_.
![[Untitled 48.png]]
## Passaggio dei messaggi con MPI
Tutte le operazioni di comunicazione e sincronizzazione hanno bisogno di chiamate di _subroutine_, **senza variabili condivise**.
- **Comunicazione**, a coppie o punto-punto, può coinvolgere più processi
- **Sincronizzazione**, barriere e non sono necessari dei _lock_ perché non ci sono variabili condivise da proteggere
- **Queries**
## Principali funzioni
- `MPI_Comm_size()` ⇒ ritorna il numero di processori
- `MPI_Comm_rank()` ⇒ ritorna il _rank_, un numero compreso tra 0 e $(size-1)$, identificati dal processo chiamante
```C
\#include <stdio.h>
\#include <mpi.h>
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
### Compilazione
```Bash
mpicc -Wal- file.c -o file
```
### Esecuzione
```C
mpirun -n 8 ./file
// n = num_process
```
### Esecuzione specifica
```C
mpirun -H foo,foo,bar ./file
// due processi hostano "foo", un processo hosta "bar"
```
### MPI Functions
- `MPI_Init`, inizia la sezione MPI
- `MPI_Finalize`, conclude la sezione MPI
- `MPI_Comm_size`, numero di processi
- `MPI_Comm_rank`, rank corrente
- `MPI_Send`, invia un blocco
- `MPI_Recv`, riceve un blocco
- `MPI_Abort`, interrompe la computazione
### Esempio programma MPI
```C
\#include <stdio.h>
\#include <mpi.h>
int main( int argc, char *argv[])
{
	int my_rank, buf;
	MPI_Status status;
	MPI_Init(&argc, &argv);
	MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);
	/* process 0 sends and process 1 receives */
	if (my_rank == 0) {
		buf = 123456;
		MPI_Send(&buf, 1, MPI_INT, 1, 0, MPI_COMM_WORLD);
	} else if (my_rank == 1) {
		MPI_Recv(&buf, 1, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
		printf("Received %d\n", buf);
	}
	MPI_Finalize();
	return 0;
}
```
## Concetti fondamentali
I processi sono organizzati in **gruppi**, un gruppo e un contesto insieme formano un **comunicatore**. Un processo è identificato da un **rank** nel gruppo associato ad un comunicatore.
È presente un comunicatore predefinito formato da un gruppo che contiene tutti i processi, chiamato `MPI_COMM_WORLD`.
## Tipi di dati
I dati inviati e ricevuti dai processi è identificato da una tripletta caratterizzata da:
- indirizzo
- contatore
- tipo di dato
Un dato MPI è definito in modo ricorsivo da:
- un tipo predefinito (`MPI_INT`, `MPI_DOUBLE`)
- un array continuo di dati MPI
- uno _strided block_ di dati MPI
- un array indicizzato di blocchi di dati MPI
- una struttura arbitraria di dati MPI
Esistono funzioni MPI che costruiscono dati MPI personalizzati.
![[Untitled 49.png]]
## Tag MPI
I messaggi sono inviati accompagnati da **tag** interi definiti dall’utente, con lo scopo di assistere il processo ricevitore per identificare il messaggio. I messaggi possono essere visualizzati alla fine della ricezione dal tag specifico, o non visualizzati specificando `MPI_ANY_TAG` come tag.

> Se il ricevitore riceve un messaggio con un tag differente da quello specificato nella chiamata di `MPI_Recv()`, il messaggio viene tenuto in sospeso e aspetta di essere associato a future `MPI_Recv()` con il tag corretto
## Invii bloccanti
![[Untitled 50.png]]
```C
int MPI_Send(const void *buf, int count, MPI_Datatype datatype,
						int dest, int tag, MPI_Comm comm)
```
- Il buffer dei messaggi è definito da **(buf, count, datatype)**
    - **count** è il numero di _elementi_ da inviare **(NON il numero di byte)**
- **dest** è il rank del processo destinatario
    - se il destinatario è `MPI_PROC_NULL`, allora l’operazione `MPI_Send` non ha effetto
- **tag** è il tag del messaggio
- se la funzione ritorna un valore, allora i dati sono stati inviati e può essere riutilizzato il buffer, **ma potrebbe succedere che il messaggio non è ancora stato ricevuto dal processo destinatario**.
## Ricezione bloccante
![[Untitled 51.png]]
```C
int MPI_Recv(void *buf, int count, MPI_Datatype datatype,
						int source, int tag, MPI_Comm comm, MPI_Status *status)
```
- Aspetta fino a quando un messaggio non fa match (sia sorgente che tag), e il buffer può essere usato successivamente
- **source**, è il rank del processo nel comunicatore specificato da `comm`, o `MPI_ANY_SOURCE`
- **tag**, è il tag del messagio da matchare, o `MPI_ANY_TAG`
- se vengono ricevuti meno items di **count** non vi è alcun problema, ma riceverne di più scatena un errore, `MPI_ERROR_TRUNCATE`
- **status**, contiene altre informazioni, si usa `MPI_STATUS_IGNORE` se non ci sono informazioni