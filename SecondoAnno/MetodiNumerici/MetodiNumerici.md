---
id: Metodi Numerici
aliases: []
tags: []
---
### Esame
[[Scheletri]]
### Email
damiana.lazzaro@unibo.it
l.pellegrini@unibo.it
marcella.lucciardi2@unibo.it

<!--toc:start-->
    - [Esame](#esame)
    - [Email](#email)
- [Introduzione](#introduzione)
  - [Problema Numerico](#problema-numerico)
    - [Algoritmo di un problema numerico](#algoritmo-di-un-problema-numerico)
    - [Classificazione dei problemi numerici](#classificazione-dei-problemi-numerici)
    - [Denoising di immagini](#denoising-di-immagini)
- [Introduzione all’Intelligenza Artificiale (AI)](#introduzione-allintelligenza-artificiale-ai)
  - [Definizione](#definizione)
  - [[#^8baed2|Machine Learning]]
    - [Applicazioni](#applicazioni)
  - [Deep Learning](#deep-learning)
  - [Paradigma generale dell’AI](#paradigma-generale-dellai)
    - [Acquisizione dei dati](#acquisizione-dei-dati)
    - [Organizzazione dei dati](#organizzazione-dei-dati)
  - [Task Machine Learning](#task-machine-learning)
    - [Classificazione](#classificazione)
    - [Regressione](#regressione)
    - [Clustering](#clustering)
- [Artificial Neural Networks](#artificial-neural-networks)
  - [Il neurone Artificiale](#il-neurone-artificiale)
  - [Funzioni di attivazione](#funzioni-di-attivazione)
  - [Tipologie di Reti Neurali](#tipologie-di-reti-neurali)
    - [Feedforward FFNN](#feedforward-ffnn)
    - [Ricorrenti](#ricorrenti)
  - [Addestramento di una rete](#addestramento-di-una-rete)
    - [Problema](#problema)
    - [Discesa del gradiente](#discesa-del-gradiente)
    - [Riassumendo](#riassumendo)
  - [Loss Function](#loss-function)
    - [Task di Regressione](#task-di-regressione)
- [Deep Learning](#deep-learning)
  - [Perché non bastano gli MLP?](#perché-non-bastano-gli-mlp)
  - [Convolutional Neural Network CNN](#convolutional-neural-network-cnn)
    - [Convoluzione](#convoluzione)
    - [Struttura si una CNN](#struttura-si-una-cnn)
    - [Altri tipi di layer](#altri-tipi-di-layer)
    - [Tipologie di Training](#tipologie-di-training)
    - [Tipologie di Reti](#tipologie-di-reti)
  - [Training: Ingredienti necessari](#training-ingredienti-necessari)
- [Condizionamento di un problema e stabilità](#condizionamento-di-un-problema-e-stabilità)
  - [Problema Matematico](#problema-matematico)
    - [Ben Posto](#ben-posto)
  - [Condizionamento di un problema](#condizionamento-di-un-problema)
    - [Quantificare il Condizionamento: Indice di Condizionamento (K)](#quantificare-il-condizionamento-indice-di-condizionamento-k)
  - [Algoritmi e Stabilità](#algoritmi-e-stabilità)
    - [Accuratezza della soluzione numerica](#accuratezza-della-soluzione-numerica)
    - [Stabilità dell’algoritmo della somma di $n$ numeri finiti](#stabilità-dellalgoritmo-della-somma-di-n-numeri-finiti)
    - [Analisi della stabilità](#analisi-della-stabilità)
    - [Bontà di un algoritmo](#bontà-di-un-algoritmo)
- [Norme vettoriali e matriciali](#norme-vettoriali-e-matriciali)
  - [Norma Vettoriale](#norma-vettoriale)
    - [Norma Infinito](#norma-infinito)
    - [Norma 1](#norma-1)
    - [Norma 2](#norma-2)
  - [Norme di Matrici](#norme-di-matrici)
    - [Norme Compatibili](#norme-compatibili)
    - [Norma Indotta](#norma-indotta)
    - [Norme Equivalenti](#norme-equivalenti)
- [Soluzione numerica di Equazioni non Lineari](#soluzione-numerica-di-equazioni-non-lineari)
    - [Condizionamento del problema del calcolo degli zeri di una funzione non lineare](#condizionamento-del-problema-del-calcolo-degli-zeri-di-una-funzione-non-lineare)
  - [Ordine di convergenza](#ordine-di-convergenza)
    - [Concetto di Ordine di Convergenza](#concetto-di-ordine-di-convergenza)
    - [Criteri di arresto](#criteri-di-arresto)
  - [Teorema degli zeri di funzioni continue](#teorema-degli-zeri-di-funzioni-continue)
    - [Metodo di Bisezione](#metodo-di-bisezione)
      - [Criterio di arresto](#criterio-di-arresto)
    - [Metodo della Regula Falsi](#metodo-della-regula-falsi)
    - [Metodi di linearizzazione](#metodi-di-linearizzazione)
      - [Metodo delle Corde](#metodo-delle-corde)
      - [Metodo delle Secanti](#metodo-delle-secanti)
        - [Confronto tra regula falsi e secanti](#confronto-tra-regula-falsi-e-secanti)
      - [Metodo di Newton](#metodo-di-newton)
        - [Problemi con il metodo di Newton](#problemi-con-il-metodo-di-newton)
        - [Ordine del metodo di Newton](#ordine-del-metodo-di-newton)
    - [Metodi a convergenza globale](#metodi-a-convergenza-globale)
    - [Metodi a convergenza locale](#metodi-a-convergenza-locale)
      - [Teorema di convergenza locale](#teorema-di-convergenza-locale)
    - [Metodi Ibridi](#metodi-ibridi)
    - [Stima numerica dell'ordine di convergenza](#stima-numerica-dellordine-di-convergenza)
- [Teorema della formula di Taylor con resto di Lagrange](#teorema-della-formula-di-taylor-con-resto-di-lagrange)
  - [Polinomio di Taylor di una funzione bivariata](#polinomio-di-taylor-di-una-funzione-bivariata)
- [Sistemi Lineari](#sistemi-lineari)
  - [Interpretazione geometrica di sistemi lineari](#interpretazione-geometrica-di-sistemi-lineari)
    - [Punto di intersezione tra due rette](#punto-di-intersezione-tra-due-rette)
  - [Teorema di Rouchè-Capelli](#teorema-di-rouchè-capelli)
  - [Condizionamento di un sistema lineare](#condizionamento-di-un-sistema-lineare)
    - [Proprietà dell'indice di condizionamento in norma $2$](#proprietà-dellindice-di-condizionamento-in-norma-2)
  - [Metodi per la soluzione di un sistema lineare](#metodi-per-la-soluzione-di-un-sistema-lineare)
    - [Metodi diretti](#metodi-diretti)
      - [Metodi diretti e fattorizzazioni associate](#metodi-diretti-e-fattorizzazioni-associate)
      - [Fattorizzazione $LU$ (di Gauss)](#fattorizzazione-lu-di-gauss)
        - [Algoritmo di fattorizzazione di Gauss](#algoritmo-di-fattorizzazione-di-gauss)
        - [Matrice di Permutazione $P$](#matrice-di-permutazione-p)
      - [Fattorizzazione di Cholesky](#fattorizzazione-di-cholesky)
      - [Fattorizzazione QR di una matrice](#fattorizzazione-qr-di-una-matrice)
    - [Stabilità di un algoritmo di fattorizzazione](#stabilità-di-un-algoritmo-di-fattorizzazione)
      - [Stabilità dell'algoritmo di Gauss](#stabilità-dellalgoritmo-di-gauss)
      - [Stabilità dell'algoritmo di Cholesky](#stabilità-dellalgoritmo-di-cholesky)
      - [Stabilità dell'algoritmo di fattorizzazione QR](#stabilità-dellalgoritmo-di-fattorizzazione-qr)
    - [Soluzione di sistemi lineari con matrici triangolari](#soluzione-di-sistemi-lineari-con-matrici-triangolari)
      - [Sostituzione in avanti (Forward Substitution)](#sostituzione-in-avanti-forward-substitution)
      - [Sostituzione all'indietro (backward Substitution)](#sostituzione-allindietro-backward-substitution)
    - [Calcolo Matrice Inversa](#calcolo-matrice-inversa)
    - [Calcolo del determinante di una matrice sfruttando la [[#^8b8885|Fattorizzazione LU]] di $PA$](#calcolo-del-determinante-di-una-matrice-sfruttando-la-8b8885fattorizzazione-lu-di-pa)
- [Sistemi di equazioni non lineari](#sistemi-di-equazioni-non-lineari)
  - [Metodo di Newton Raphson per la soluzione di un sistema di equazioni non lineari](#metodo-di-newton-raphson-per-la-soluzione-di-un-sistema-di-equazioni-non-lineari)
    - [Varianti del Metodo di Newton-Raphson](#varianti-del-metodo-di-newton-raphson)
    - [Approccio grafico per localizzare le soluzioni di un sistema di equazioni non lineari](#approccio-grafico-per-localizzare-le-soluzioni-di-un-sistema-di-equazioni-non-lineari)
  - [Minimi e massimi di una funzione in due variabili](#minimi-e-massimi-di-una-funzione-in-due-variabili)
<!--toc:end-->

# Introduzione

> [!important] **Errori del modello matematico**
> 
> Sono prodotti nel **passaggio dal problema reale al problema matematico**, dovuti all’introduzione di ipotesi semplificative nella costruzione del modello matematico che sostituisce il problema reale

> [!important] **Errori del modello numerico-computazionale**
> 
> Sono prodotti nel **passaggio dal problema matematico al problema numerico**, detti anche errori di discretizzazione o troncamento: sono gli errori che si introducono quando un procedimento infinito e approssimato mediante un procedimento finito (richiesto dalla risoluzione del problema a calcolatore)

> [!important] **Errori presenti nei dati**
> 
> Sono dovuti al fatto che i dati di un problema sono ottenuti mediante misurazioni che possono essere influenzate da errori sistematici (che dipendono dalla sensibilità dello strumento di misurazione e/o da errori random) dovuti al verificarsi di eventi imprevedibili

> [!important] **Errori di arrotondamento nei dati e nei calcoli**
> 
> Sono gli errori introdotti nella rappresentazione dei numeri (dati in ingresso o risultati di operazioni) sul calcolatore
## Problema Numerico
Per **problema numerico** si intende una **descrizione chiara e non ambigua di una relazione funzionale tra i dati (input) del problema e i risultati desiderati (output)**.
![[SecondoAnno/MetodiNumerici/assets/image.png]]
La relazione funzionale (che denotiamo con $f$) può essere espressa in forma esplicita o implicita, ossia possiamo avere le seguenti rappresentazioni semantiche di un problema numerico:
- $y = f(x)$
- $f(x, y) = 0)$
dove, a seconda del tipo di problema, $x$ e $y$ potranno essere numeri reali, vettori ecc.
### Algoritmo di un problema numerico
È una **descrizione completa e ben definita di operazioni**, che permette di trasformare (in un numero finito di passi) ogni vettore di dati $x$ nel corrispondente output $y*$ non necessariamente uguale a $y$. Ad ogni problema numerico possiamo associare più algoritmi, ognuno dei quali in genere fornirà risultati con precisione diversa.
![[SecondoAnno/MetodiNumerici/assets/image 1.png]]
### Classificazione dei problemi numerici
- **Problema diretto**, $x$ e $f$ sono dati, $y$ è incognito
    - calcolo del valore di una funzione assegnata in corrispondenza di un valore fissato della variabile indipendente
    - calcolo di un integrale definito
- **Problema inverso**, $f$ e $y$ sono dati, $x$ è incognito
    - soluzione di un sistema lineare
    - denoising di un’immagine
- **Problema di identificazione**, $x$ e $y$ sono dati, $f$ è incognito
    - approssimazione di dati sperimentali
### Denoising di immagini
La minimizzazione di questa funzione energia attraverso un problema di ottimizzazione, permette di “invertire” il processo di aggiunta del rumore e ottenere una stima dell’immagine originale.
I **modelli variazionali** sfruttano la conoscenza del modello di formazione dell’immagine rumorosa per definire una funzione energia che lega l’immagine “noisy” a quella “pulita”.
Cioè l’obiettivo è quello di “invertire” il processo di formazione dell’immagine, ovvero risalire da $u_0$ a $u$, cercando di eliminare il rumore.
L’obiettivo cruciale è preservare al contempo i dettagli importanti dell’immagine, evitando di “lisciare” via informazioni visive significative insieme al rumore.
Il problema del denoising consiste nel **rimuovere il rumore indesiderato da** $u_0(x, y)$**, ottenendo una stima dell’immagine originale** $u(x, y)$.
$$u_0(x, y) = u(x, y) + \epsilon(x, y)$$
La relazione tra l’immagine originale e quella rumorosa (processo di formazione dell’immagine osservata) è data da:
Siano $u(x, y): \Bbb R^2 \rightarrow \Bbb R$, $u_0(x, y):\Bbb R^2 \rightarrow \Bbb R$ due funzioni continue che rappresentano rispettivamente l’**immagine ideale**, priva di rumore e _l’immagine corrotta dal rumore_ e sia $\epsilon (x, y)$ una distribuzione di rumore casuale.
![[SecondoAnno/MetodiNumerici/assets/image 2.png]]
Il rumore può essere introdotto in un’immagine durante l’acquisizione.
Il denoising di immagini è un problema fondamentale nell’elaborazione delle immagini che consiste nel **rimuovere il rumore indesiderato da un’immagine preservando al contempo i dettagli importanti**.

> [!important] **Modelli Variazionali**
> 
> Invertono il modello di formazione dell’immagine rumorosa risolvendo un problema di ottimizzazione.
> 
> Data un’immagine “noisy” $u_0$, vogliamo trovare un’immagine “clean” $u$ che sia una buona approssimazione di $u_0$, ma con meno rumore. Per fare ciò, minimizziamo una funzione energia $E(u)$ che combina due termini:
> 
> 1. **termine di fedeltà ai dati**, misura quanto $u$ è “vicina” a $u_0$
> 2. **termine di regolarizzazione**, misura quanto $u$ è “liscia”
> 
> **Funzione Energia**
> 
> La funzione energia $E(u)$ è definita come:
> 
> $$E(u) = \iint{\left|u(x, y) - u_0(x, y)\right|^2dxdy} + \lambda \iint{\left|\nabla u(x, y)\right|^2dxdy}$$
> 
> dove:
> 
> - $u$, immagine “clean” da stimare
> - $u_0$, immagine “noisy” di input
> - $\lambda$, parametro di regolarizzazione (controlla il bilanciamento tra fedeltà ai dati e regolarizzazione)
> - $\nabla u$, gradiente di $u$ (misura la variazione spaziale di $u$)
> - $\iint dxdy$, integrale su tutti i pixel dell’immagine
> 
>   
> 
> **Termini della funzione energia**
> 
> - **Termine di fedeltà ai dati**: $\iint{\left|u(x, y) - u_0(x, y)\right|^2dxdy}$, penalizza le soluzioni $u$ che sono molto diverse da $u_0$, incoraggia soluzioni vicine ad $u_0$
> - **Termine di regolarizzazione**: $\iint{\left|\nabla u(x, y)\right|^2dxdy}$, penalizza le soluzioni $u$ che hanno grandi variazioni spaziali (quindi “rumorose”), incoraggia soluzioni che non hanno grandi variazioni spaziali.
> 
>   
> 
> **Minimizzazione del modello**
> 
> Per risolvere il problema di minimizzazione al computer, dobbiamo discretizzare il modello continuo. Ciò significa approssimare l’immagine $u$ e la funzione energia $E(u)$ con quantità discrete:
> 
> 1. **Discretizzazione dell’immagine**, rappresentiamo l’immagine $u$ come una matrice di pixel $u_{i, j}$ dove $i$ e $j$ sono gli indici di riga e colonna del pixel
> 2. **Discretizzazione del gradiente**, approssimiamo il gradiente di $u$ utilizzando differenze finite:
>     1. $\delta u / \delta x \approx u_{i+1, j} - u_{i, j}$
>     2. $\delta u / \delta y \approx u_{i, j+1} - u_{i, j}$
> 3. **Discretizzazione della funzione energia**, sostituiamo gli integrali con somme e le derivate con le approssimazioni di differenze finite:
>     
>     $$E(u) \approx \sum_{ij}  
>     {\left|u_{i, j} - {u_0}_{i, j}\right|^2} + \lambda \sum_{i, j}\left( \left|u_{i+1, j} - {u_0}_{i, j}\right|^2 + \left|u_{i, j+1} - {u_0}_{i, j}\right|^2 \right)$$
>     
>     dove ${u_0}_{i, j}$ è il valore del pixel $(i, j)$ nell’immagine “noisy” $u_0$.
>     
> 4. **Problema di ottimizzazione discreto**, il problema di minimizzazione diventa ora un problema di ottimizzazione discreta: trovare i valori dei pixel $u_{i, j}$ che minimizzano la funzione energia discreta $E(u)$. Possiamo risolvere questo problema utilizzando tecniche di ottimizzazione numerica, come il metodo del gradiente o il metodo di Newton. Questi modelli iterano fino a quando non trovano una soluzione che minimizza la funzione energia.
# Introduzione all’Intelligenza Artificiale (AI)

> [!important] **Test di Turing**
> 
> Criterio **oggettivo** per valutare se una macchina è intelligente o dimostra un comportamento intelligente. Si basa su un gioco.
> 
> ![[assets/image 3.png]]
## Definizione
È la **riproduzione parziale dell’attività intellettuale propria dell’uomo**, riguardo ai processi di apprendimento, di riconoscimento, di scelta, realizzata o attraverso l’elaborazione di modelli ideali, o con la messa a punto di **macchine** che utilizzano per lo più a tale fine elaboratori elettronici.
## Machine Learning![[image 3.png]]

^8baed2

La macchina impara (learn) a risolvere i problemi in modo autonomo.
![[assets/image 4.png]]
### Applicazioni
1. **Riconoscimento delle immagini**, viene utilizzato per identificare oggetti, persone, luoghi, immagini, digitali, ecc.
    
    Il caso d’uso popolare del riconoscimento delle immagini e del rilevamento dei volti è il suggerimento automatico del tagging degli amici di Facebook.
    
    Si basa sul progetto Facebook denominato “**Deep Face**”, che è responsabile del riconoscimento facciale e dell’identificazione della persona nella foto.
    
2. **Riconoscimento vocale**, si basa su **algoritmi e modelli matematici che analizzano le onde sonore della voce per trasformare il linguaggio parlato in testo o comandi vocali**.
3. **Previsione del traffico**, complessi algoritmi di intelligenza artificiale consentono di stimare con precisione l’orario di arrivo suggerendo un eventuale percorso alternativo.
    
    La previsione del traffico di Google Maps, in tempo reale, viene effettuata attraverso un’architettura di machine learning denominata **Graph Neural Network**. Se viene previsto un aumento del traffico in una direzione, Maps consiglia automaticamente un percorso alternativo.
    
4. **Raccomandazioni sui prodotti**, l’apprendimento automatico è ampiamente utilizzato da varie società di e-commerce e intrattenimento come Amazon, Netflix, ecc, per **consigliare prodotti all’utente**.
5. **Auto a guida autonoma**, Tesla sta lavorando su un’auto a guida autonoma; utilizza un metodo di apprendimento senza supervisione per addestrare i modelli di auto a rilevare persone e oggetti durante la guida.
    
    Questo metodo di apprendimento si basa
    
      
    
## Deep Learning
Il **deep learning**, o deep natural learning, è un **sottoinsieme del machine learning**, che utilizza le reti neurali per **analizzare diversi fattori con una struttura simile al sistema neurale umano**.
## Paradigma generale dell’AI
![[assets/image 5.png]]
1. **Acquisizione dati**: i dati sono l’elemento fondante di qualsiasi applicazione correlata al ML. L’acquisizione di grandi quantità di dati è oggi uno degli obiettivi principali delle migliori aziende
2. **Data processing**: tutte quelle tecniche con cui vengono elaborati i dati per adattarli al meglio al modello ML sviluppato
3. **Modello**: è il **nucleo principale** del sistema. Un modello può essere visto come un **insieme di tecniche matematiche e statistiche**, **in grado di apprendere** da una certa distribuzione di dati forniti in input e di generalizzare su nuovi dati
4. **Predizione**: l’**output** del modello può assumere molte forme a seconda dell’applicazione sviluppata. È importante valutare l’efficacia del sistema sviluppato con appropriate metriche
### Acquisizione dei dati
L’acquisizione dei dati è il primo passo nello sviluppo di un sistema ML. È possibile ottenere dati principalmente in due modi:
- usare set di dati o **database di dati pubblicamente disponibili**
- acquisendo un **nuovo set di dati**

> [!important] **Annotazione dei dati**
> 
> Non basta acquisire i dati, serve anche un’operazione solitamente chi
> 
> amata annotazione o **etichettatura**. L’etichetta (label) rappresenta il **contenuto semantico** dei dati e dipende dal problema che vogliamo risolvere e può essere **numerica** o **categorica**.
> 
> Un singolo dato è **annotato** se è **associato ad un’etichetta**. I dati raccolti **senza un’annotazione corretta ed appropriata sono spesso inutili**. Tuttavia è anche possibile “estrarre conoscenza” da dati non annotati attraverso il clustering.
> 
> Se sono presenti dati annotati, sono in un contesto di **learning supervisionato**.
> 
> Se **non ho dati annotati**, sono in un contesto di **learning non supervisionato**. L’algoritmo in questo caso deve imparare a **riconoscere pattern nell’input senza che sia data nessuna indicazione specifica dei valori in uscita**, con lo scopo di **apprendere in autonomia la struttura che possiedono i dati in ingresso**.
> 
> L’apprendimento no supervisionato è usato per **gestire problemi di clustering andando a trovare gruppi di dati in base alle caratteristiche che hanno in comune**.
> 
> Esiste anche l’apprendimento **semi-supervisionato**, se i dati di input sono una **miscela** di campioni etichettati e non etichettati. Si combinano le caratteristiche dell’apprendimento supervisionato e non. Quest’approccio non è sempre praticabile perché molti algoritmi di ML devono essere adattati al caso specifico e possono essere stati progettati per lavorare solo con dati annotati.
### Organizzazione dei dati
Una volta ottenuti i dati raccolti per il sistema ML, è necessario organizzarli come segue:
- **Training set**, i dati sui quali il modello **apprende** automaticamente durante la fase di apprendimento. Di solito, la fase di addestramento richiede GPU computazionali per l’addestramento delle Neural Networks
- **Validation set**, parte del training set. Su questi dati, vengono messi a punto gli **iperparametri**
- **Testing set**, dati su cui il modello viene testato durante la fase di test
## Task Machine Learning
- Classificazione
- Clustering
- Regressione
### Classificazione
Dato un input specifico, il modello (classificatore) emette una **classe**:
- se ci sono solo 2 classi, chiamiamo il problema **classificazione binaria**
- se ci sono più classi, chiamiamo il problema **classificazione multiclasse**
Una **classe** è un set di dati con **proprietà comuni**; il concetto di classe è correlato al concetto di “etichetta”, è un concetto **semantico**, in quanto strettamente dipendente dal contesto.
- Rilevamento spam
- Riconoscimento facciale
- Diagnosi medica
### Regressione
La regressione viene utilizzata per **modellare la relazione tra le variabili indipendenti e la variabile dipendente, in modo da poter fare previsione su nuovi dati**.

> [!important] Dato uno specifico input, il modello (regressore) restituisce un valore continuo (non una classe)
- Stima dell’altezza di una persona in base al peso
- Stima dei prezzi di vendita degli appartamenti nel mercato immobiliare
- Stima del rischio per le compagnie assicurative
- Previsione dell’energia prodotta da un sistema fotovoltaico
- Modelli di previsione dei costi sanitari
### Clustering
Identificazione i gruppi (cluster) di dati con caratteristiche simili.
Il clustering è spesso applicato in un ambiente di apprendimento non supervisionato, in cui i dati non sono etichettati e/o le classi del problema non sono note in anticipo.
Di solito, la natura non supervisionata del problema lo rende **più complesso** rispetto alla classificazione. Spesso anche il numero di cluster non è noto a priori, i cluster identificati possono essere usati come classi.
- Definizione di gruppi utenti basati sul consumo nel marketing
- Raggruppamento di individui in base alle analogie del DNA nella genetica
- Partizionamento dei geni in gruppi con caratteristiche simili nella bioinformatica
- Segmentazione non supervisionata nella visione
![[assets/image 6.png]]
# Artificial Neural Networks
## Il neurone Artificiale
![[assets/image 7.png]]
$$net_i = \sum_{j = 1, \dots, d}{w_{ji} \cdot in_j + w_{0i}} \\  
out_i = f(net_i)$$
- $in_1, in_2, \dots, in_d$ sono i $d$ **ingressi** che il neurone $i$ riceve da assoni di neuroni afferenti
- $w_{1i}, w_{2i}, \dots, w_{di}$ sono i pesi (**weight**) che determinano l’efficacia delle connessioni sinaptiche dei dendriti, l’importanza dell’input i-esimo sull’output
- $w_{0i}$ chiamato **bias**, è un ulteriore peso che si considera collegato a un input fittizio con valore sempre $1$ questo peso è utile per "tarare" il punto di lavoro ottimale del neurone
- $f(\cdot)$ è la **funzione di attivazione**, simula il comportamento del neurone biologico di attivarsi solo se i segnali in ingresso **superano una certa soglia**. È una storta di **interruttore** sulla cellula.
## Funzioni di attivazione
Una funzione di attivazione determina se un neurone deve essere **attivato o meno**, si tratta di alcune semplici **operazioni matematiche** per determinare se l’input del neurone alla rete è rilevante o meno nel processo di previsione.
Le funzioni di attivazione possono essere di diversi tipi, ma in generale devono essere **non lineari** per consentire alla rete di apprendere relazioni complessa tra le sue variabili di input, e **derivabili**.
![[assets/image 8.png]]

> [!important] **Singolo neurone artificiale che effettua una separazione lineare tra due classi**
> 
> Per semplicità consideriamo il caso di 2 soli input, con $\text{bias } = 0$
> 
> ![[assets/image 9.png]]
> 
> $$f(net) = \begin{cases}  
> -1 & net < \theta \\  
> 1 & net > \theta  
> \end{cases} \quad \text{funzione di attivazione a soglia }\theta$$
> 
> $net = w_1x_1 + w_2x_2$
> 
> $$
> w_1x_1 + w_2x_2 < \theta \rightarrow w_1x_1 + w_2x_2 - \theta < 0 \quad (x_1, x_2) \text{ sta sopra la retta} \\
> w_1x_1 + w_2x_2 > \theta \rightarrow w_1x_1 + w_2x_2 - \theta > 0 \quad (x_1, x_2) \text{ sta sotto la retta}
> $$
> 
> ![[assets/image 10.png]]
> 
> Equazione implicita della retta $w_1x_1 + w_2x_2 - \theta = 0$
> 
>   
> 
> Per porter avere separazioni più complicate rispetto a quelle lineari è necessario utilizzare più neuroni artificiali organizzati su diversi (tanti) strati (**layer**) **Multilayer Perceptron** (**MLP**)
> 
> ![[assets/image 11.png]]
## Tipologie di Reti Neurali
Le reti neurali sono composte da gruppi di neuroni artificiali organizzati in **livelli**. Tipicamente sono presenti un livello di **input**, un livello di **output** e uno o più **livelli intermedi**.
I **layer intermedi** sono chiamati **hidden layers** in quanto restano invisibili dall’esterno della rete, la quale si interfaccia all’ambiente solo tramite il layer di ingresso e quello di uscita.
### Feedforward FFNN
Nelle reti **feedforward** le connessioni collegano i neuroni di un libello con i neuroni di un livello successivo. **Non** sono consentite connessioni all’indietro o connessioni verso lo stesso livello. **È di gran lunga il tipo di rete più utilizzata**.
![[assets/image 12.png]]
### Ricorrenti
Sono previste connessioni di **feedback**, in genere verso **neuroni dello stesso livello**, ma anche all’indietro. Questo tipo di rete crea una sorta di **memoria** di quanto accaduto in passato e rende quindi l’uscita attuale **non solo dipendente dall’ingresso attuale**, ma anche da tutti gli **ingressi precedenti**.
![[assets/image 13.png]]
## Addestramento di una rete
![[assets/image 14.png]]
![[assets/image 15.png]]
### Problema

> [!important] Come faccio a capire in automatico se sto incrementando o diminuendo l’errore? Quindi se mi sto avvicinando o allontanando dalla soluzione desiderata.
> 
> Il mio obiettivo è una **funzione**, calcolo la derivata di questa funzione e capisco l’andamento.
> 
> ![[assets/image 16.png]]

> [!important] **APPRENDERE = MINIMIZZARE LA FUNZIONE OBIETTIVO**
### Discesa del gradiente
Fissata la topologia (numero di livelli e neuroni), l’addestramento di una rete neurale consiste nel determinare il valore dei pesi $w$ che determinano il **mapping desiderato** tra input e output.
Passo dopo passo, tramite la **discesa del gradiente**, mi avvicino all’obiettivo.
![[assets/image 17.png]]
### Riassumendo
![[assets/image 18.png]]
## Loss Function

> [!important] La **loss function**, o funzione di perdita, è una **misura dell’errore della previsione prodotta da un modello di machine learning rispetto ai dati di training**. Essa rappresenta la **discrepanza tra l’output previsto dal modello e l’output reale associato ai dati di training**.
La scelta della loss function dipende dal tipo di problema di machine learning che si vuole risolvere:
- se si sta risolvendo un **problema di classificazione binaria**, la loss function più comune è la funzione di entropia incrociata binaria (**Binary Cross-Entropy**):
    
    $$BCE = -y_i \cdot \log{\hat{y}_i} - (1-y_i) \cdot \log{(1-\hat{y_i})}$$
    
- se si sta risolvendo un problema di **classificazione multiclasse**, la loss function più comune è la funzione di **entropia incrociata categorica** (**Categorical Cross-Entropy**).
    
    $$CCE = -\sum_i{y_i} \cdot \log\hat{y_i}$$
    
Con $\hat{y_i}$ l’i-esimo valore scalare emesso dal modello (_predizione_), $y_i$ è la corrispondente label (_etichetta_).
  
Per usare la Cross Entropy loss, nel layer di output dobbiamo avere delle **probabilità**, solitamente si usa il **softmax layer**, per trasformare l’output della rete (_logits_) in probabilità (valori nel range $\left[0, 1\right]$ che sommano a $1$). Il **sosftmax** è una funzione continua e differenziabile.
$$p_i = \frac{e^{a_1}}{\sum_{k=1}^n {e^{a_k}}}$$
### Task di Regressione
Nel caso di un task di regressione, le **cost function** più comuni sono:
- **Errore quadratico medio** (**Mean Squared Error** o **MSE**), definito come la media dei quadrati delle differenze tra l’output previsto dal modello e l’output reale associato ai dati di training.
    
    $$C(W) = \frac{\sum_{i=1}^n{(y_i - \hat{y_i}(W))^2}}{n}$$
    
    - $n$, è il numero di esempi di training
    - $y_i$, è l’output reale associato a ciascun esempio di training
    - $\hat{y_i}(W)$, dipende dai parametri della rete che indichiamo con $W$, è l’output previsto dal modello per l’input corrispondente
- Esistono anche altre cost function utilizzate in problemi di regressione, come ad esempio la cost function di **errore assoluto medio** (**Mean Absolute Error** o **MAE**)
    
    $$C(W) = \frac{\sum_{i=1}^n{\left|y_i - \hat{y_i}(W)\right|}}{n}$$
    
# Deep Learning
## Perché non bastano gli MLP?
Le reti di tipo MLP sono computazionalmente troppo pesanti per essere impiegate **nell’elaborazione delle immagini**, in quanto sarebbe necessario prevedere **un neurone per ogni pixel**.
L’immagine viene appiattita e non si tiene conto della sua struttura 2D, si prevede un neurone per ogni pixel che è connesso con tutti i neuroni del layer successivo. Poiché ciascun neurone viene connesso a tutti i neuroni del layer successivo, il numero di parametri da stimare sarebbe eccessivo per i casi di interesse pratico.
![[assets/image 19.png]]
## Convolutional Neural Network CNN
Le **CNN** sono reti disegnate espressamente per **processare immagini**, l’idea alla base è quella di evitare di “srotolare” le immagini in input e cercare di organizzare i neuroni in 3 dimensioni.
![[assets/image 20.png]]
A differenza del MLP, le CNN hanno una struttura a 3 dimensioni:
- **larghezza** (W)
- **altezza** (H)
- **profondità** (C) $\rightarrow$di solito $> 1$, per questo è 3D
![[assets/image 21.png]]
È possibile “collegare” il kernel con l’immagine tramite la **convoluzione** applicata con un meccanismo _sliding-window_.
### Convoluzione

> [!important] La **convoluzione** è una delle più importanti operazioni di **assets/image processing** attraverso la quale si applicano filtri digitali, per estrarre feature dalle immagini.
Un filtro (_kernel_) $h$ (una piccola maschera 2D di pesi, di dimensione $F\times F$) viene fatto scorrere su ogni pixel $(x, y)$ di un’immagine di input, $f$, per ogni posizione viene generato un valore di output $g(x)$, eseguendo il prodotto scalare tra la maschera e la porzione dell’input coperta.
L’output $g(x)$ prende il nome di _features map._
$$g(x, y) = (f*h)(x, y) = \sum_{i = 0}^{F-1}{\sum_{j=0}^{F-1}{f(x, y)h(x-i, y-j)}}$$
La convoluzione è l’elemento costruttivo di base di una rete CNN, ogni **kernel** è convoluto con i dati in input, generando una **feature map**.
![[assets/image 22.png]]
Generalmente, profondità $> 1$ $\rightarrow$ più kernel $\rightarrow$ una feature map prodotta per ogni kernel
Il volume di output è quindi ottenuto mettendo assieme tutte le feature map prodotte.
Quindi i pesi, dell’MLP, vengono raggruppati nei kernel: ogni cella è un singolo peso che viene appreso.
![[assets/image 23.png]]
I layer convolutivi estraggono vari tipi di informazione visual in maniera gerarchica:
- nei layer vicini all’input, estraggono informazioni “semplici”
- nei layer vicini all’output, estraggono informazioni “complesse”
### Struttura si una CNN
![[assets/image 24.png]]
### Altri tipi di layer

> [!important] **Pooling Layer**
> 
> Il layer di pooling **riduce la dimensionalità** del volume di input, viene spesso utilizzato per una serie di ragioni:
> 
> - **invarianza** alla posizione
> - **riduzione del costo computazionale**, i volumi sono più piccoli
> - aiuta a prevenire l’**overfitting**
> 
> Esistono diverse funzioni di pooling che possono essere usate: $\max$ (la più usata), $average$, $\dots$
> 
> ![[assets/image 25.png]]

> [!important] **Flatten Layer**
> 
> È un **layer di attivazione**, tradizionalmente utilizzato per connettere il feature extractor con il classifier delle CNN: srotola il volume di input.
> 
> È possibile utilizzare altre tecniche per “srotolare” il volume di input.
> 
> ![[assets/image 26.png]]
### Tipologie di Training
- **From scratch**, la rete è addestrata partendo da una configurazione random dei pesi; sono richiesti molti dati di training ed è una procedura lunga e complessa
- **Pre-trained**, viene utilizzata una rete già addestrata, l’output corrisponde a quello originale; non c’è bisogno di training o dati
- **Fine-tuned**, viene utilizzata una rete già addestrata e vengono “congelati” i pesi del feature extractor, cambiano solamente i pesi del classifier (ad esempio per cambiare il numero di classi)
### Tipologie di Reti
- **Modelli feedforward** per la classificazione/regressione supervisionati
- **Modelli ricorrenti** con memoria e attenzione (utilizzati per sequenze)
- **Addestramento non supervisionato**: modelli addestrati a ricostruire l’input originale prendendo come input una versione a più bassa dimensionalità (utilizzati per denoising, anomaly detection)
- **Modelli “generativi”** per generare dataset sintetici (**data augmentation**) style transfer, art applications
- **Reinforcement Learning** per apprendere comportamenti
## Training: Ingredienti necessari
1. **Big Data**, disponibilità di dataset **etichettati** di **grandi dimensioni**. La superiorità delle tecniche di deep learning rispetto ad altri approcci si manifesta quando sono disponibili grandi quantità di dati di training
2. **GPU Computing**, il training di modelli complessi richiede elevate potenze computazionali. La disponibilità di **GPU** con migliaia di core e GB di memoria interna ha consentito di ridurre drasticamente i tempi di training da mesi a giorni
![[assets/image 27.png]]
# Condizionamento di un problema e stabilità
## Problema Matematico
Un **problema matematico**, che indichiamo con $f$ è una descrizione precisa e senza ambiguità di un **legame** tra i dati del problema $x$, input, e i risultati corrispondenti $y$, output.
### Ben Posto
Un problema si dice **ben posto** se la sua soluzione soddisfa tre condizioni:
- esiste
- è unica
- **dipende** in modo continuo dai dati del problema

> [!important] Definiamo **funzione dato-risultato** o **applicazione risolvente** una funzione che associa i dati del problema alla sua soluzione.
È importante osservare che, se un problema ammette una ed una sola soluzione, la funzione dato-risultato è **biettiva**, cioè ad ogni insieme di dati corrisponde una e una sola soluzione e ad ogni soluzione corrisponde un solo insieme di dati.
Oltre che ad essere biettiva, la funzione deve essere anche **continua** per garantire che il problema sia ben posto.
## Condizionamento di un problema
Quando un problema è ben posto si cerca di dare una **misura quantitativa di come la sua soluzione venga influenzata da una perturbazione dei dati**, se ne misura il condizionamento.

> [!important] Il **condizionamento** di un problema permette di misurare quanto la soluzione cambia in risposta a un cambiamento nei dati.
È importante per diversi motivi:
- **Affidabilità dei risultati**, se un problema è mal condizionato, i suoi risultati possono essere inaffidabili e sensibili a piccoli errori nei dati
- **Interpretazione dei risultati**, se un problema è mal condizionato, può essere difficile interpretare i suoi risultati e capire come dipendono dai dati
Supponiamo che i dati siano affetti da una perturbazione, indichiamo con $\tilde{x} = x + \delta x$ i dati affetti da una perturbazione $\delta x$.
Il condizionamento di un problema misura quanto i risultati $f(x)$ sono sensibili alle piccole perturbazioni nei dati $x$.
- **Problema Ben Condizionato**
    
    Se piccole variazioni nei dati $x$ portano a variazioni relativamente piccole nei risultati $f(x)$ il problema è **ben condizionato**.
    
    In termini pratici, gli errori nei dati non vengono amplificati in modo significativo nei risultati.
    
- **Problema Mal Condizionato**
    
    Se piccole variazioni nei dati $x$ portano a variazioni molto grandi nei risultati $f(x)$, il problema è **ben condizionato**.
    
    In questo caso, gli errori nei dati possono essere enormemente amplificati nei risultati, rendendo le soluzioni inaffidabili.
    
### Quantificare il Condizionamento: Indice di Condizionamento (K)
Sia $\frac{\|f(x) - f(\tilde x)\|}{\|f(x)\|}$ la misura dell’errore relativo sui risultati e $\frac{\|x - \tilde x\|}{\|x\|}$ la misura dell’errore relativo sui dati.
L’**indice di condizionamento** $K$ mette in relazione questi due errori:
$$\frac{\|f(x) - f(\tilde x)\|}{\|f(x)\|} \le K\frac{\|x - \tilde x\|}{\|x\|}$$
$K$ è detto l’indice di condizionamento, quantifica l’entità con cui l’errore relativo sui dati si amplifica sull’errore relativo sui risultati del problema.
Se $K$ è piccolo il problema è ben condizionato, l’errore relativo sui dati non viene amplificato sull’errore relativo sulla soluzione.
Se $K$ è grande il problema è mal condizionato, l’errore relativo sui dati viene amplificato in maniera incontrollata sull’errore relativo sulla soluzione.
Il condizionamento è legato al problema numerico e non ha alcun legame con gli errori di arrotondamento delle operazioni di macchine, né con il particolare algoritmo utilizzato.
## Algoritmi e Stabilità
Un **algoritmo**, che indichiamo con $\Psi$, è una sequenza di operazioni di macchina che devono essere eseguite al fine di ottenere, in un numero finito di passi, da un vettore di numeri di macchina $\tilde x$, un output $\Psi (\tilde x) = \tilde y$.

> [!important] La **stabilità** esprime il comportamento dell’algoritmo considerato rispetto alla propagazione degli errori.
La stabilità di un algoritmo valuta la reazione dell’algoritmo all’introduzione di perturbazioni nei dati iniziali.
Per analizzare la stabilità dell’algoritmo, confrontiamo il risultato prodotto dall’algoritmo con il risultato che si otterrebbe applicando la funzione originale $f$ ai dati perturbati. Questo confronto ci permette di valutare l’effetto delle operazioni di macchina sul risultato finale.
Definiamo l’**Errore Algoritmico**:
$$E_{alg} = \frac{\Psi(\tilde x) - f(\tilde x)}{f(\tilde x)}$$
Pertanto influiscono sull’errore algoritmico:
- il numero di operazioni eseguite
- l’ordine in cui le operazioni vengono eseguite
- il tipo di operazioni eseguite
### Accuratezza della soluzione numerica
Definiamo **errore inerente**, quello che deriva dalla rappresentazione finita dei numeri nel sistema di calcolo ed è legato al condizionamento del problema:
$$E_{in} = \frac{\Psi(\tilde x) - f(\tilde x)}{f(\tilde x)}$$
ed **errore algoritmico**, l’errore introdotto dalle operazioni aritmetiche in aritmetica finita durante l’esecuzione di un algoritmo:
$$E_{alg} = \frac{\Psi(\tilde x) - f(\tilde x)}{f(\tilde x)}$$
Nel calcolo di una funzione dati-risultato $f(x)$, l’**accuratezza** della soluzione numerica, cioè di quanto si discosta la soluzione numerica dalla risposta esatta della funzione dati-risultato $f(x)$:
$$E_{tot} = \frac{\Psi(\tilde x) - f(x)}{f(x)}$$
dipende sia dal **condizionamento** del problema che dalla **stabilità algoritmica**.
$$E_{tot} \approx E_{in} + E_{alg}$$
La bassa accuratezza dei risultati prodotti da un processo numerico può essere imputabile ad un **alto mal condizionamento** intrinseco del problema oppure all’**instabilità** dell’algoritmo utilizzato per produrlo.

> La stabilità dell’algoritmo non garantisce che il risultato calcolato sia accurato
Si parla di **stabilità o instabilità numerica** intendendo che gli errori sui dati non sono (o sono) amplificati durante lo sviluppo dell’algoritmo:
$$\left|E_{alg}\right| \approx g(n) \cdot \varepsilon \qquad |\varepsilon| \le u$$
- $n$, numero di operazioni effettuate
- $g(n) = c \cdot n, \quad c > 0$, **crescita dell’errore lineare**
- $g(n) = c^n, \quad c > 1$, **crescita dell’errore esponenziale**

> [!important] Un algoritmo numerico è detto **stabile** se $g(n)$ è lineare, cioè l’errore algoritmico è dell’ordine di grandezza della precisione di macchina, instabile altrimenti
### Stabilità dell’algoritmo della somma di $n$ numeri finiti
Siano $x_1, x_2, \dots, x_n$ $n$ numeri finiti da sommare. L’algoritmo di somma è il seguente:
```Python
S = x1
for i in range(2, n)
	S = S + xi
```
$$S_2 = f(S_1 + x_2) \\  
S_3 = f(S_2 + x_3) \\  
\vdots \\  
S_n = f(S_{n-1} + x_n)$$
Quindi il risultato finale $S_n$ differisce dal risultato teorico $S$. L’errore algoritmico è $\left|\frac{S-S_n}{S}\right|$, dato da:
$$\left|\frac{S-S_n}{S}\right| \le  
\frac{(|x_1|n + |x_2|(n-1) + \dots + |x_n|)}{|S|} \cdot 1.01 \cdot \varepsilon$$
dove $|\varepsilon| \le u$
Da qui si nota che ogni addendo è moltiplicato per un peso fisso. Tale formula mostra che, assegnati i numeri finiti $x_1, x_2, \dots, x_n$ **la maggiorazione dell’errore relativo della loro somma “finita” è minima se si sommano questi numeri in modo che i loro valori assoluti siano in ordine crescente**, cioè $|x_1| \le |x_2| \le \dots \le |x_n|$.
Infatti ai pesi $(1.01 \cdot \varepsilon)n, (1.01\cdot\varepsilon)(n-1)$ più grandi si associano i numeri $|x_1|, |x_2|, \dots, |x_n|$ più piccoli. Ne segue che l’errore pesa meno e si avranno perciò risultati più attendibili.
La formula può essere riscritta come:
$$\left|\frac{S-S_n}{S}\right| \le  
\frac{|x_{max}}{S}\cdot 1.01\cdot\varepsilon \frac{n\cdot(n+1)}{2}$$
che ci dice anche che l’errore dipende dal quadrato del numero degli elementi che si sommano.
Se $|x_{max}|$ è elevato ma $S$ è piccola, come può avvenire se si sommano addendi di segno opposto e modulo simile
$$\frac{|x_{max}|}{|S|}\text{ è grande}$$
cioè **l’errore relativo può crescere molto**.
- **Errore nel moltiplicare** $n$ **numeri finiti**
    
    Siano $x_1, x_2, \dots, x_n$ $n$ numeri di macchina, l’algoritmo prodotto è il seguente:
    
    ```Python
    P = x1
    for i in range(2, n)
    	P = P * xi
    ```
    
    $$P_2 = f(x_1 * x_2) \\  
    P_3 = f(P_2 * x_3) \\  
    \vdots \\  
    P_n = f(P_{n-1} * x_n)$$
    
    L’errore relativo è
    
    $$\left| \frac{P-P_n}{P} \right| \le  
    1.01 \cdot (n-1) \cdot \varepsilon$$
    
    dove $|\varepsilon| \le u$.
    
    L’errore algoritmico del prodotto di $n$ numeri di macchina quindi cresce linearmente con $n$ e non dipende dai valori degli elementi di cui si fa il prodotto.
    
      
    
### Analisi della stabilità

> [!important] L’analisi della stabilità di un metodo numerico, iniziata da Von Neumann e Goldstine nel 1947, si può effettuare seguendo strategie alternative:
> 
> - **Analisi in avanti**, si stimano le variazioni sulla soluzione dovute sia a perturbazione nei dati, sia ad errori intrinseci al metodo numerico
> - **Analisi all’indietro**, si considera la soluzione calcolata con i numeri finiti come soluzione esatta di un problema perturbato e si studia a quale perturbazione sui dati corrisponde la soluzione trovata
### Bontà di un algoritmo
Un algoritmo per essere definito “buono” oltre ad essere **generale e robusto**, applicabile cioè ad un qualsiasi insieme di dati di un certo dominio, e **stabile**, deve richiedere il **numero di operazioni minimo** possibile per ottenere il risultato ed **allocare la quantità di memoria minima possibile**.

> [!important] Si definisce **complessità computazionale** di un algoritmo il numero di operazioni aritmetiche floating point richieste per la sua esecuzione. L’unità di misura è il **flop** (1 flop = 1 operazione elementare)
# Norme vettoriali e matriciali
I dati di un problema in generale non sono solo scalari appartenenti ad $\Bbb R$, ma possono essere vettori di $\Bbb R^n$ oppure matrici di $\Bbb R^{m\times n}$. Diventa necessario introdurre uno strumento matematico che estenda l’errore relativo, definito per scalari in $\Bbb R$, al caso più generale di vettori e di matrici.
## Norma Vettoriale
La norma di un vettore è una funzione che associa ad ogni vettore una lunghezza non negativa. In altre parole è un modo per quantificare la “grandezza” di un vettore.

> [!important] Ogni applicazione $\| \cdot \| : \Bbb R^na\ R_+\ U\{0\}$ si chiama **norma su** $\Bbb R^n$, se gode delle seguenti proprietà:
> 
> - $\|x\| > 0 \quad \forall x \in \Bbb R^n$, e $\|x\| = 0 \Longleftrightarrow x = 0$
> - $\|\lambda x\| = |\lambda| \cdot \|x\| \quad \forall \lambda \in \Bbb R, \forall x \in \Bbb R^n$
> - $\|x + y \| \le \|x\| + \|y\| \quad \forall x, y \in \Bbb R^n$
### Norma Infinito
$$\|x\|_\infty = \max_i(|x_i|)$$
### Norma 1
$$\|x\|_1 = \sum_{i = 1}^n{|x_i|}$$
### Norma 2
$$\|x\|_2 = \left[\sum^n_{i=1}{x_1^2}\right]$$
Essendo il prodotto scalare canonico tra due vettori di $\Bbb R^n$ definito come la somma dei prodotti delle loro componenti, la norma due di un vettore può essere definita come la radice quadrata della somma dei quadrati delle componenti del vettore:
$$\|x\|_2 = \sqrt{x^Tx}$$
- **Norme vettoriali a confronto**
    
    La forma della sfera unitaria di $\Bbb R^2$ è interamente dipendente dalla norma scelta-
    
    $$S_2 = \left\{ x \in \Bbb R^2 : \|x\|_2 = \sqrt{x_1^2 + x_2^2} = 1 \right\}$$
    
    ![[assets/image 28.png]]
    
    $$S_\infty = \left\{ x \in \Bbb R^2 : \|x\|_\infty = \max\{|x_1|, |x_2|\} = 1 \right\}$$
    
    ![[assets/image 29.png]]
    
    $$S_1 = \left\{ x \in \Bbb R^2 : \|x\|_1 = |x_1| + |x_2| = 1 \right\}$$
    
    ![[assets/image 30.png]]
    
$S_2, S_\infty, S_1$ sono note come le sfere unitarie di $\Bbb R^2$ associate rispettivamente alla norma 2, norma infinito, norma 1.

> [!important] Per una **matrice ortogonale** $A$ (ossia $A^TA = AA^T = I$, cioè tale che **la sua inversa coincida con la sua trasposta**) risulta:
> 
> $$\|Ax\|_2 = \sqrt{(Ax)^T(Ax)} = \sqrt{x^T(A^TA)x} = \sqrt{x^Tx} = \|x\|_2 \quad \forall x \in \Bbb R^n$$
Le norme definite, nonostante producano risultati diversi, hanno la proprietà di produrre risultati “confrontabili”. Questo è garantito dal seguente teorema.

> [!important] **Teorema**
> 
> Per ogni coppia di norme di vettori, ad esempio $\|x\|$ e $\|x\|_*$, esistono costanti positive $m$ e $M$, $0 < m \le M \in \Bbb R$, tali che ogni $x \in \Bbb R^n$
> 
> $$m \cdot \|x\|_* \le \|x\| \le M \cdot \|x\|_*$$
> 
> Si dice che le norme $\|x\|$ e $\|x\|_*$ sono **equivalenti**. Quindi tutte le norme su $\Bbb R^n$ sono equivalenti.

> L’equivalenza delle norme è importante perché garantisce che i risultati ottenuti con una norma siano validi anche per le altre norme equivalenti.
## Norme di Matrici

> [!important] Sia $\Bbb R^{m\times n}$ lo spazio vettoriale delle matrici $m\times n$ su $\Bbb R$, si dice che l’applicazione $\|A\|$ da $\Bbb R^{m\times n}$ a $R_+ U\{0\}$ è norma della matrice $A$ se gode delle seguenti proprietà:
> 
> - $\|A\|>0$ per tutte $A \ne 0$ e $\|A\| = 0 \Longleftrightarrow A = 0$
> - $\|\alpha A\| = |\alpha|\|A\| \quad \forall \ A \in M(m\times n), \quad \forall \ \alpha \in \Bbb R$
> - $\|A+B\| \le \|A\| + \|B\| \quad \forall \ A, B \in M(m \times n)$
> - $\|A \cdot B\| \le \|A\| \cdot \|B\| \quad \forall \ A \in M(m\times p), B \in M(q \times n)$
### Norme Compatibili
Una **norma di una matrice** $\|A\|_M$ **è compatibile con una data norma vettoriale** $\|v\|_v$ se  
$\forall \ A \in \Bbb R^{m\times n}$ e $\forall \ x \in \Bbb R^n$ vale la seguente disuguaglianza:
$$\|Ax\|_v \le \|A\|_M \cdot \|x\|_v$$
Poiché si conoscono le norme di vettori è interessante definire norme di matrici indotte dalle corrispondenti norme di vettori.
### Norma Indotta

> [!important] Sia $A \in \Bbb R^{m\times n}$ e $x \in \Bbb R^n, \ x \ne 0$, si consideri $\|x\|_v$ e $\|Ax\|_v$. Si definisce **norma indotta**, o norma naturale, $\|A\|_N$, la più piccola costante $C$ per cui vale la maggiorazione:
> 
> $$\|Ax\|_v \le C \cdot \|x\|_v \\  
> \|Ax\|_v \le \|A\|_N \cdot \|x\|_v \\  
> \frac{\|Ax\|_v}{\|x\|_v} \le \|A\|_N$$
> 
> Sotto l’ipotesi che $x \ne 0$.
> 
> Poiché $\|A\|_N$ è la più piccola delle costanti per cui vale la relazione precedente, ciò equivale a dire che:
> 
> $$\|A\|_N = \sup_{\|x\|_v \ne 0}{\frac{\|Ax\|_v}{\|x\|_v}} = \max_{\|x\|_v = 1}{\|Ax\|_v}$$
- **Norme indotte dalle norme più comuni su** $\Bbb R^n$
    1. $p = 1 \Longrightarrow \|x\|_1 = \sum_{i = 1}^n|x_i| \Longrightarrow \|A\|_1 = \max_{j = 1, \dots, n}\sum_{i = 1}^m|a_{ij}|$, si considera la norma 1 di tutte le **colonne** e si prende il valore massimo
    2. $p = \infty \Longrightarrow \|x\|_1 = \max_j|x_j| \Longrightarrow \|A\|_\infty = \max_{j = 1, \dots, m}\sum_{i = 1}^n|a_{ij}|$, si considera la norma 1 di tutte le righe e si prende il valore massimo
    3. $p = 2 \Longrightarrow \|A\|_2 = \sqrt{\rho (A^TA)}$, dove $\rho$ è il raggio spettrale, cioè l’autovalore di modulo massimo della matrice $A^TA$.
- **Richiami**
    **Simmetrica**
    
    $A \in \Bbb R^{n\times n}$ è detta **simmetrica** se $A^T = A$.
    
    **Autovalore**
    
    $\lambda \in C$ è un autovalore di $A \in R^{n\times n}$ se esiste un vettore $x \in \Bbb R^n \setminus \{0\}$, diverso dal vettore nullo, per cui:
    
    $$Ax = \lambda x$$
    
    o equivalentemente se $det\tlr{A - \lambda I} = 0$
    
    ---
    
    - $A \in \Bbb R^{n\times n}$ è detta **semidefinita positiva** se $x^T Ax \ge 0, \quad \forall \ x \in \Bbb R^n \setminus \{0\}$
    - $A \in \Bbb R^{n\times n}$ è detta **definita positiva** se $x^T Ax > 0, \quad \forall \ x \in \Bbb R^n \setminus \{0\}$
    
    In particolare:
    
    - se la matrice $A$ è simmetrica e semidefinita positiva tutti gli autovalori di $A$ sono reali non negativi.
    - se la matrice $A$ è simmetrica e definita positiva tutti gli autovalori di $A$ sono reali e positivi.
    
    ---
    
    Se $A \in \Bbb R^{n\times n}$ è simmetrica allora $\|A\|_1 = \|A\|_\infty$.
### Norme Equivalenti

> [!important] Per ogni coppia di norme di matrici, ad esempio $\|A\|$ e $\|A\|_*$, esistono sempre due costanti positive $m$ e $M$, $0 < m\le M \in \Bbb R$, tali che $\forall \ A \in \Bbb R^{n\times n}$ si ha:
> 
> $$m\|A\|_* \le \|A\|\le M\|A\|_*$$
> 
> si dice che $\|A\|$ e $\|A\|_*$ sono **norme equivalenti**.
# Soluzione numerica di Equazioni non Lineari
Data una funzione $f:\Bbb R \to \Bbb R$ non lineare, consideriamo il problema di determinare i valori $\alpha \in \Bbb R$ tali che $f(\alpha) = 0$. Tali valori sono chiamati **zeri** o **radici** della funzione $f$.
$$P_n(x) = \textstyle\sum_{i=0}^{n}a_ix^i = 0, \quad n \ge 2 \\  
x + 4\sin(x) = 0, \quad e^x+x^2 = 0,\quad \sqrt{x}- \log(x)= 0$$

> Le radici di un’equazione non lineare non possono in generale venire espresse in “forma chiusa” e anche quando ciò è possibile la corrispondente espressione può risultare molto complessa.
> 
> Esistono formule esplicite per il calcolo delle radici di polinomi di grado minore di 5.
L’applicazione di tali formule non è però così immediata come la nota formula per il calcolo di radici di polinomi di secondo grado e risulta sicuramente preferibile disporre di **algoritmi numerici in grado di fornire soluzioni approssimate del problema**. Si ricorre a **metodi numerici iterativi approssimati**.
L’approssimazione numerica di una radice $\alpha$ di $f(x)$ si basa sull’uso di metodi iterativi che consistono nella costruzione di una successione di iterati $x_1, x_2, \dots, x_k, \dots$ che tende alla soluzione $\alpha$ del problema, cioè:
$$\lim_{k\to+\infty}{x_k} = \alpha$$
È inoltre necessario **rendere il problema ben posto**, cioè individuare un intervallo $I$ contenente una sola radice e poi applicare il metodo iterativo fino a convergenza alla soluzione (radice).

> [!important] Se $\alpha \in \Bbb R$ è tale che $f(\alpha)=0$ ed $f’(\alpha) \ne 0$, $x$ viene chiamata **radice semplice**, in generale se valgono le seguenti condizioni:
> 
> $$f^{(k)}(\alpha) = 0, \quad k = 0, \dots, m-1 \\  
> f^{(m)}(\alpha) \ne 0$$
> 
> allora $\alpha$ è detta **radice multipla di molteplicità** $m$.
### Condizionamento del problema del calcolo degli zeri di una funzione non lineare
Quando si calcola lo zero di una funzione non lineare con un calcolatore, si ottiene un’approssimazione numerica, non il valore esatto. Occorre valutare quanto differisce questa soluzione da quella vera.
Sia $\alpha$ tale che $f(\alpha)=0$, il valore calcolato numericamente $\tilde\alpha = \alpha + \delta, \ \delta > 0$ con $\delta$ piccolo, può essere visto come la radice dell’equazione:
$$\tilde f(x) = f(x) + \varepsilon g(x) = 0 \quad \varepsilon >0$$
- $\varepsilon$ piccolo
- $f(x), g(x)$ differenziabili

dove la differenza $|\tilde f(x) - f(x)| = |\varepsilon g(x)|$ rappresenta la perturbazione sulla funzione originale, quindi sui dati; la differenza $|\tilde a - a| = |\delta|$ è la perturbazione sui risultati.
Si ha quindi che $\tilde f(\tilde a) = 0$, facendo uno sviluppo in serie di Taylor del primo ordine di $\tilde f(x)$ in un intorno di $\alpha$:
$$0 = \tilde f(\alpha + \delta) = \tilde f(\alpha) + \delta\tilde f(\alpha) + {1 \over 2}\delta^2\tilde f''(\xi) \quad \xi \in (\alpha, \alpha + \delta)$$
Trascurando i termini del secondo ordine:
$$0 = \tilde f(\alpha + \delta) \approx \tilde f(\alpha) + \delta\tilde f(\alpha) \\  
0 \approx f(\alpha) + \varepsilon g(\alpha) + \delta \cdot \big( f'(\alpha) + \varepsilon g'(\alpha)\big) \\  
\varepsilon g(\alpha) + \delta f'(\alpha) + \varepsilon\cdot \delta \cdot g(\alpha) \approx 0$$
Proseguendo con un’analisi al $1°$ ordine (ossia considerando $\varepsilon \cdot \delta$ trascurabile), si ottiene:
$$\varepsilon g(\alpha) + \delta f'(\alpha) \approx 0$$
da cui:
$$\delta \approx - \frac{\varepsilon g(\alpha)}{f'(\alpha)}$$
ossia
$$|\tilde a - a| = |\delta| \approx K|\varepsilon g(\alpha)|$$
dove la quantità $K = \frac{1}{|f’(\alpha)|}$ rappresenta l’**indice di condizionamento** del problema di calcolare la radice della funzione $f(x)$.

> Se $|f’(\alpha)$ è molto piccolo, allora il problema è mal condizionato.
> 
> Viceversa il problema risulta ben condizionato e $\tilde f(x) = 0$ ha una radice $\tilde\alpha$ che non differisce molto da $\alpha$.
> 
> ![[assets/image 31.png]]
> 
> Se $f’(\alpha)$ è molto piccolo, vicino allo zero, il problema è mal condizionato

> [!important] **Problematiche legate ai metodi iterativi per la soluzione di equazioni non lineari**
> 
> - scelta del valore iniziale $x_0$ (di innesco) e **convergenza** della successione di iterati ad $\alpha$
> - **ordine di convergenza** della successione di iterati ad $\alpha$ (ordine del metodo)
> - **criterio di arresto** del metodo iterativo

> [!important] Un metodo converge **localmente** ad $\alpha$ se la convergenza della successione $\left\{x^{(k)}\right\}$ dipende in modo critico dalla vicinanza di $x_0$ ad $\alpha$. Il procedimento è **globalmente** convergente quando la convergenza non dipende da quanto $x_0$ è vicino ad $\alpha$, ossia converge per ogni scelta di $x_0$.
## Ordine di convergenza
Data una successione di iterati $\left\{x_k\right\}$, generata da un metodo numerico, convergente ad un limite $\alpha$ e sia $e_k = x_k - \alpha$. Se esistono due numeri reali $p\ge 1$ e $c > 0$, tali che:
$$\lim_{k \to +\infty}{\frac{|e_{k+1}|}{|e_k|^p}} = c$$
si dice che la successione ha **ordine di convergenza** $p$ **e fattore di convergenza** $c$.
Ciò significa che esiste un indice $k_0$, tale che per $k > k_0$ risulta
$$|e_{k+1}| \approx c|e_k|^p$$
Se $p=1$, occorre che $c <1$ affinché la successione sia convergente. In tal caso si dice convergente linearmente. Risulta:
$$|e_{k+1}| \approx c|e_k| \approx c^2|e_{k-1}| \approx \dots \approx c^{k+1}|e_0|$$
e tanto più piccolo è $c<1$ tanto migliore è la convergenza, pur rimanendo lineare.
- $p = 1$, la convergenza si dice **lineare**
- $1 < p < 2$, la convergenza si dice **superlineare**
- $p = 2$, la convergenza si dice **quadratica**
Si dice che il metodo che genera la successione $\left\{x_k\right\}$ ha velocità di convergenza di ordine $p$ se tale è la successione da esso generata.
### Concetto di Ordine di Convergenza
Sia $e_k = x_k - \alpha$, supponiamo che $|e_k| \le {1 \over 2}10^{-n}$, cioè la radice $x_k$ ha $n$ decimali corretti. Se il metodo iterativo ha ordine di convergenza $p$, allora:
$$|e_{k+1}| \approx c|e_k|^p \le c\left( {1 \over 2}10^{-n} \right)^p = {c \over 2^p} 10^{-pm}$$
cioè la radice $x_k$ ha $p \cdot n$ decimali corretti. Il numero di decimali corretti tende ad essere moltiplicato per $p$ ad ogni passo solo per $k \to \infty$.
### Criteri di arresto
Un metodo numerico convergente genera una successione $\{x_k\}$ di iterati che soddisfa il limite: $\lim_{k\to+\infty}{x_k} = \alpha$. Tuttavia, in un contesto di calcolo computazionale, non è possibile eseguire un numero infinito di passi; di conseguenza è necessario stabilire dei criteri per **arrestare il procedimento iterativo**.
- Controllo del valore della funzione nel punto $x_k$
- Controllo dell’incremento che diamo a $x_{k-1}$ per ottenere $x_k$
Il processo viene arrestato all’iterato $k$ per il quale si verifica una delle seguenti due condizioni:
1. **Condizione di arresto basata sul valore della funzione nell’iterato** $x_k$
    
    $$|f(x_k)| < \varepsilon$$
    
2. **Condizione di arresto basata sull’incremento di** $x_k$
    
    $$|x_k - x-{k-1}| < \varepsilon$$
    
Utilizzando il controllo del valore della funzione nel punto $x_k$ come criterio di arresto, si possono però presentare due situazioni problematiche:
- **Caso Restrittivo**
    
    ![[assets/image 32.png]]
	
	L'iterato $x_k$ è vicino a $\alpha$ anche se $|f(x_k)|$ è grande
    
- **Caso Ottimistico**
	![[assets/image 33.png]]
	Il valore di $x_k$ è lontano da $x^*$ ma $|f(x_k)|$ è piccolo

Si vede quindi che, se la funzione ha una derivata prima alta nell’intorno della soluzione, il test sul valore della funzione può risultare troppo restrittivo, mentre se ha una derivata piccola allora il test può risultare troppo permissivo.
Si può concludere che un criterio d’arresto basato sia sul controllo del valore della funzione sia sul controllo dell’incremento risulta molto più affidabile.

> [!important] Nella pratica conviene utilizzare il **criterio di arresto relativo**:
> 
> $$\frac{|x_k - x_{k-1}|}{|x_k|} < \varepsilon$$
- **Localizzare le radici**
    
    Determinare il numero delle soluzioni e separare ogni soluzione, cioè individuare, per ogni soluzione, un intervallo che non ne contenga altre, discretizzando l’intervallo iniziale.
    
    - Applicare per ogni intervallo determinato un metodo iterativo fino alla convergenza ad una soluzione (radice)
    
    ![[assets/image 34.png]]
    
## Teorema degli zeri di funzioni continue

> [!important] Sia $f(x)$ continua nell’intervallo $[a, b]$ e sia tale che $f(a) \cdot f(b) < 0$, allora $f$ ammette almeno uno zero in $(a, b)$, cioè esiste almeno un punto $\alpha$ in $(a,b)$ tale che $f(\alpha) = 0$.
### Metodo di Bisezione
Il metodo di bisezione si basa sul teorema degli zeri di funzioni continue. Sia $f(a)\cdot f(b) < 0$ e poniamo $[a_0, b_0] = [a,b]$.
Il metodo di bisezione consiste nel generare una successione di sottointervalli
$$I_1 = [a_1, b_1], \dots, I_k = [a_k, b_k]$$
tali che racchiudano sempre lo zero cercato, cioè:
$$f(a_k) \cdot f(b_k) < 0 \quad \text{e} \quad I_k \subset I_{k-1}$$
In particolare si determina
$$c_k = {1 \over 2}(a_{k-1} + b_{k-1})$$
successivamente si calcola $f(c_k)$ e si determina il sottointervallo che soddisfa le condizioni del teorema.
```Python
if f(ck) == 0 : ck è la radice cercata
else
	if f(a[k-1]) * f(ck) < 0 : bk = ck, ak = a[k-1]
	if f(b[k-1]) * f(ck) < 0 : ak = ck, bk = b[k-1]
```
In questo modo l’intervallo iniziale viene via via dimezzato. In particolare, dopo $k$ passi si arriva all’intervallo $[a_k, b_k]$ di ampiezza
$$(b_k - a_k) = \frac{(b_{k-1}-a_{k-1})}{2} = \dots = \frac{(b_0 - a_0)}{2^k}$$
La relazione precedente può essere utilizzata per dimostrare che il **metodo converge** con ordine di convergenza $p = 1e$ e $c = {1 \over 2}$. Infatti si ha:
$$|e_k| = |x_k-\alpha| \le {1 \over 2}|b_k-a_k| = {1 \over 2^{k+1}}|b_0-a_0|$$
Da cui segue che $\lim\limits_{k \to \infty}|e_k| = 0$, che prova che il metodo di bisezione è convergente.
Il metodo converge linearmente, infatti poiché:

$$|e_{k+1}| = |x_{k+1}-\alpha| \le {1 \over 2}|b_{k+1}-a_{k+1}| = {1 \over 2^{k+2}}|b_0-a_0|$$

risulta che
$$\frac{|e_{k+1}|}{|e_k|} \approx {1 \over 2}$$

> Il metodo di bisezione ha ordine di convergenza lineare $p=1$ e fattore di convergenza $c = {1 \over 2}$

Il metodo di bisezione converge globalmente alla soluzione con la sola ipotesi che $f$ sia continua nell’intervallo $[a, b]$. La convergenza è garantita da qualunque sia l’ampiezza dell’intervallo iniziale.
È un metodo molto lento, servono fino a $4$ iterazioni per ottenere una cifra significativa esatta nella soluzione approssimata:
$$
|e_{k+j}| \approx {1 \over 10}|e_k|
$$
Vogliamo stimare il numero di iterazioni $j$.
$$
|e_{k+j}| \le {1 \over 2^{k+1+j}}|b_0-a_0| \approx {1 \over 10}{1 \over 2^{l+1}}|b_0-a_0| \Longrightarrow {1 \over 2^j} \approx {1 \over 10} \Longrightarrow 2^j \approx 10
$$
da cui segue: $j \approx \log_2 10 \approx 3.32$

#### Criterio di arresto
Un criterio di arresto del metodo di bisezione è chiedere che l'errore al passo $k$, $|e_k|$, sia minore di una precisione fissata $\epsilon$, cioè:
$$
\left|{ b-a \over 2^{k+1} }\right| \le \epsilon
$$
Questa relazione ci permette di valutare teoricamente quante iterazioni sono necessarie per raggiungere la precisione prefissata. Infatti dalla relazione precedente si ottiene:
$$
2^{k+1} \ge {b-a \over \epsilon} \Rightarrow k \ge \log_2\left( {b-a \over \epsilon} \right) - 1
$$
Poiché il numero di iterazioni deve essere un intero superiore al numero minimo di iterazioni. Il primo intero positivo per cui risulta $k\ge \log_2\left( {b-a \over \epsilon} \right) - 1$ è $k = \upper{\log_2\left( {b-a \over \epsilon} \right) -1}$ dove la funzione `ceil(x)`, indicata con $\upper x$, arrotonda un numero reale $x$ al più vicino intero superiore.
Il metodo di Bisezione è un metodo di sicura ma lenta convergenza.

> [!important] Nel programmare l'algoritmo è utile, per vedere il segno di $f(c_k)$, utilizzare la funzione di libreria:
> $$
\text{sign(x)} = \begin{cases}
x = 1 & x > 0 \\
x = 0 & x = 0 \\
x = -1 & x < 0 \\
\end{cases}
> $$
Inoltre quando si va a calcolare il punto $c_k = {a_{k-1}+b_{k-1} \over 2}$ operando con i numeri finiti si può ottenere un risultato fuori dall'intervallo di definizione.

```python
x[k+1] = (ak + bk) / 2
if f(x[k+1]) * f(ak) < 0 :
	a[k+1] = x[k+1]
	b[k+1] = bk
else if f(x[k+1]) * f(bk) < 0 :
	a[k+1] = x[k+1]
	x[k+1] = bk
else if f(x[k+1]) == 0 :
	x[k+1] = a
k = k+1
```
### Metodo della Regula Falsi
Una spiegazione della lenta convergenza del metodo di bisezione può essere ricercata nel fatto che il metodo non trae alcun vantaggio da caratteristiche peculiari della funzione, come la sua derivabilità o la sua forma.

Un modo naturale per migliorare il metodo di bisezione è quello di considerare anche i valori che la funzione assume negli estremi dell'intervallo.
Si considera come nuova approssimazione della soluzione l'intersezione dell'asse delle ascisse con la retta passante per $(a, f(a))$ e $(b, f(b))$:
$$
\begin{cases}
y - f(a) = \frac{f(b)-f(a)}{b-a}(x-a) \\
y = 0
\end{cases}
$$
da cui si ottiene: 
$$
x = a - f(a=\frac{(b-a)}{f(b)-f(a)})
$$
Il metodo risultante è noto come metodo della **regula falsi** o **della falsa posizione**.
Genera una successione di intervalli in cui è contenuta la radice: la scelta dell'intervallo in base al segno della funzione, comporta una convergenza globale.
È più veloce rispetto al metodo di bisezione (**convergenza superlineare**).
In generale l'ampiezza dell'intervallo $[a_i, b_i]$ non tende a zero pertanto il criterio di arresto basato sull'ampiezza dell'intervallo non è applicabile.
```python
if f(a) * f(b) < 0 :
	a0 = a
	b0 = b
while (criterio di arresto)
	x[k+1] = ak - f(ak)*((bk - ak) / (f(bk) - f(ak)))
	if f(x[k+1]) * f(ak) < 0 :
		a[k+1] = ak
		b[k+1] = x[k+1]
	else if f(x[k+1]) * f(bk) < 0 :
		a[k+1] = x[k+1]
		b[k+1] = bk
	else if f(x[k+1]) == 0 :
		x[k+1] = a
	k += 1
```

### Metodi di linearizzazione
 Data $f(x), \ x_0, \ f(x_0)$: si approssima la funzione con una retta per $(x_0, f(x_0))$
 $$
 y = f(x_0) + m(x-x_0)
 $$
 Si ottiene una versione linearizzata del problema $f(x) = 0$,
 $$
 \begin{cases}
 y = f(x_0) + m(x-x_0) \\
 y = 0
 \end{cases}
 $$
 da cui
 $$
 x_1 = x_0 - \frac{f(x_0)}{m}
 $$
 In generale
 $$
 x_{k+1} = x_k-\frac{f(x_k)}{m_k}
 $$
 A seconda della scelta di $m_k$ si ottengono:
  - **metodo delle corde** $m_k = m = \text{ costante}$
  - **metodo delle secanti e metodo di Newton**
#### Metodo delle Corde
Utilizza un valore costante $m \ne 0$. Il metodo assume la forma
$$
x_{k+1} = x_k-\frac{f(x_k)}{m}
$$

> [!important] Scelta di $m$
> Una scelta classica è quella di utilizzare il coefficiente angolare della retta che congiunge i punti $(a, f(a))$ e $(b, f(b))$
> $$
> m = \frac{f(b) - f(a)}{b - a}
> $$
> da cui si ottiene la formula ricorsiva
> $$
> x_\inc k = x_k - \frac{b-a}{f(b) - f(a)}f(x_k)
> $$
#### Metodo delle Secanti
Assegnati i due valori iniziali $x_0, x_1$, al passo $k$ l'approssimazione della funzione $f$ nell'intervallo $[x_\dec k, x_k]$ è la retta che passa per i punti $(x_\dec k, f(x_\dec k)), (x_k, f(x_k))$ con coefficiente angolare:
$$
m_k = \frac{f(x_k) - f(x_\dec k)}{x_k - x_\dec k}
$$
che interseca l'asse $x$ nel punto di ascissa:
$$
x_\inc k = x_k - f(x_k)\frac{x_k - x_\dec k}{f(x_k) - f(x_\dec k)}
$$
![[Pasted image 20250327114523.png]]
La convergenza del metodo è garantita se le approssimazioni $x_0$ e $x_1$ si scelgono abbastanza vicine alla soluzione: **convergenza locale**. In tal caso la convergenza è **superlineare** $\tlr{p = \frac{(1 + \sqrt 5)}{2} \approx 1.618}$.
##### Confronto tra regula falsi e secanti
Il metodo delle secanti può essere più veloce ma non converge sempre. Non c'è più la certezza di avere sempre il punto cercato all'interno dell'intervallo.
![[Pasted image 20250327115137.png]]
![[Pasted image 20250327115156.png]]
#### Metodo di Newton
Nel metodo di Newton, ad ogni passo $k$, si considera la retta passante per il punto $\tlr{x_k, \f {x_k}}$ e tangente alla curva $\f x$ e si determina il nuovo iterato come il punto di incontro tra questa retta e l'asse delle $x$. Per far ciò, nella formula ricorsiva $|\tilde\alpha - \alpha| = |\delta| \approx K|\varepsilon \g\alpha|$, si pone $m_k = \df{x_k}$, ottenendo la formula ricorsiva:
$$
x_\inc k = x_k - \frac{\f {x_k}}{\df {x_k}}
$$
![[Pasted image 20250327120059.png]]
##### Problemi con il metodo di Newton
![[Pasted image 20250327120141.png]]
##### Ordine del metodo di Newton
Mettiamoci nell'ipotesi che $\alpha$ sia una **radice semplice di $\fx$, cioè $\f\alpha = 0$ ed $\df\alpha \ne 0$**.
Consideriamo lo sviluppo del primo ordine di $\fx$ in un intorno di $x_k$.
$$
\fx = \f{x_k} + \tlr{x-x_k} \df{x_k} + {1 \over 2}\tlr{x - x_k}^2 f'' \tlr\zeta
$$
per un opportuno $\zeta$ compreso tra $x$ ed $x_k$. Valutiamo in $\alpha$:
$$
\f\alpha = 0 = \f {x_k} + \tlr{\alpha - x_k}\df{x_k}+ {1 \over 2}\tlr{\alpha - x_k}^2f''\tlr{\zeta}
$$
Dividendo per $\df{x_k}$:
$$
{\f {x_k} \over \df{x_k}} + \tlr{\alpha - x_k}+ {{1 \over 2}\tlr{\alpha - x_k}^2f''\tlr{\zeta} \over \df{x_k}} = \tlr{\alpha - x_\inc k}+\frac{{1 \over 2}\tlr{\alpha - x_k}^2f''\tlr{\zeta}}{\df{x_k}}
$$
Ricordiamo che $e_\inc k = x_\inc k - \alpha$, $-e_\inc k + {1 \over 2}\frac{e_k^2f''\tlr\zeta}{\df{x_k}} = 0 \Longrightarrow e_\inc k = e_k^2\half\frac{f'' \tlr\zeta}{\df{x_k}}$ da cui, ricordiamo che $\lim\limits_{k \to \infty}{x_k} = \alpha$, segue che:
$$
\frac{e_\inc k}{e_k^2} {\to} \half\frac{f''\tlr\alpha}{\df\alpha}
$$
- **Ordine di convergenza** $\longrightarrow\ p = 2$
- **Fattore di convergenza** $\longrightarrow c = \half\frac{f''\tlr\alpha}{\df\alpha}$
>[!note]
>Se $\a$ è uno zero di molteplicità $m$, cioè se $f^\tlr k\tlr{\a} = 0, \ k = 0, \dots, m-1$ e $f^\tlr m\tlr\a \ne 0$, allora il **metodo di Newton** non ha più convergenza quadratica.

### Metodi a convergenza globale
La convergenza è assicurata per qualsiasi scelta del punto iniziale appartenente all'intervallo che racchiude la radice, cioè $x_0$ in $\qlr{a, b}$. (Bisezione, Regula Falsi)
### Metodi a convergenza locale
La convergenza è assicurata per $x_0$ appartenente ad un intorno della soluzione. (Secanti, Newton)
#### Teorema di convergenza locale
Se $f : \qlr{a;b} \to \R$ soddisfa le seguenti ipotesi:
- $\f a \f b < 0$
- $f, \ f',\ f''$ sono continue in $\qlr{a;b}$, ossia $f \in c^2\qlr{a;b}$
- $\df x \ne 0 \quad\forall x \in \qlr{a, b}$
allora esiste un intorno $I \subset \qlr{a, b}$ dell'unica radice $\a \in \tlr{a, b}$ tale che, se $x \in I$, allora la successione di Newton $\glr{x_i}_{i\ge1}$ converge ad $\a$.
Se la funzione soddisfa alcune condizioni, allora esiste un teorema che garantisce che il metodo di Newton converge globalmente:
>[!important] Teorema di convergenza globale del metodo di Newton
>Sia $\fx \in C^2\qlr{a, b}$, $\qlr{a,b}$ intervallo chiuso e limitato. Se sono verificate le seguenti condizioni:
> 1. $\f a \f b < 0$
> 2. $\df x \ne 0 \quad \forall x \in \qlr{a, b}$
> 3. $f''\tlr{x} > 0 \quad \text{oppure} \quad f''\tlr x < 0 \quad \forall x \in \qlr{a, b}$
> 4. $\blr{\frac{\f a}{\df a}} < b-a \quad \blr{\frac{\f b}{\df b}} < b-a$

allora il metodo di Newton **converge** all'unica soluzione $\a$ in $\qlr{a,b}$, **per ogni scelta di $x_0$ in $\qlr{a,b}$**.
- la condizione $1$ assicura che una radice in $\tlr{a, b}$ esista
- la condizione $2$ assicura che non vi siano tangenti orizzontali. Questo garantisce, insieme ad $1$, che vi sia una sola radice interna ad $\tlr{a, b}$
- la condizione $3$ assicura che la concavità o convessità sia mantenuta su tutto $\qlr{a, b}$. Questo garantisce, insieme a $2$, che gli iterati $x_k$ siano monotoni per $k > 1$
- la condizione $4$ assicura che le tangenti agli estremi intersecano l'asse $x$ internamente ad $\tlr{a, b}$. In questo modo tutti gli iterati $x_k$ (escluso eventualmente $x_0$) risulteranno interni ad $\tlr{a, b}$
Infatti, se consideriamo l'intersezione della tangente nell'estremo $b$ con l'asse $x$, si ha:
$$
\begin{cases}
y - \f b = \df b (x-b) \\
y = 0
\end{cases}
$$
Da cui segue se:
$$
\blr{\frac{\f b}{\df b}}
$$
La tangente negli estremi interseca l'asse $x$ all'interno dell'intervallo $\qlr{a, b}$.
![[Pasted image 20250327143626.png]]
### Metodi Ibridi
Il metodo di Newton e il metodo delle secanti sono metodi a convergenza locale. La difficoltà pratica sta nel trovare l'intervallo di convergenza, cioè nel trovare un valore iniziale $x_0$ tale che la successione di iterati converga alla soluzione cercata.
Un metodo pratico è quello di far precedere questi metodi da un metodo a convergenza globale come ad esempio il metodo di bisezione. Dopo alcuni passi del metodo globale si innesca quello di ordine superiore. Se esso non converge, si devono fare altri passi del metodo globale.
### Stima numerica dell'ordine di convergenza
Se il metodo ha ordine $p$, per $k$ sufficientemente grande, esiste $C$ indipendente da $k$ tale che:
$$
\begin{align}
\blr{e_\inc k} &\approx C\blr{e_k}^p \\
\blr{e_\inc[2] k} &\approx C\blr{e_\inc k}^p \\
\blr{\frac{e_\inc[2] k}{e_\inc k}} &\approx \tlr{\blr{\frac{e_\inc k}{e_k}}}^p \\
\log\tlr{\blr{\frac{e_\inc[2]k}{e_\inc k}}} &\approx \log\tlr{\blr{\frac{e_\inc k}{e_k}}}^p = p\log\tlr{\blr{\frac{e_\inc k}{e_k}}} \\
p &\approx \frac{\log\tlr{\blr{\frac{e_\inc[2]k}{e_\inc k}}}}{\log\tlr{\blr{\frac{e_\inc k}{e_k}}}}
\end{align}
$$
essendo
$$
e_k = x_k - \a \approx x_k - x_\inc k
$$
Si ha che una stima numerica dell'ordine di convergenza è:
$$
p \approx \frac{\log\tlr{\blr{\frac{x_\inc[2]k - x_\inc[3]k}{x_\inc k - x_\inc[2]k}}}}{\log\tlr{\blr{\frac{x_\inc k - x_\inc[2]k}{x_k - x_\inc k}}}}
$$
# Teorema della formula di Taylor con resto di Lagrange
> [!important] Problema
> Data $\fx$ regolare, $x_0 \in dom(f),\ n \in \N$, vogliamo trovare il **polinomio $P_n(x)$ di grado $n$ che approssima meglio $\fx$ vicino $x_0$.

Il teorema della formula di Taylor con il resto di Lagrange è un teorema fondamentale dell'analisi matematica che fornisce **un'approssimazione locale di una funzione derivabile** con un polinomio di Taylor.

> [!important] Enunciato
> Sia $\fx$ una funzione derivabile $\inc n$ volte in un intervallo di $I$ contenente il punto $x_0$. Allora, per ogni $x \in I$, esiste un punto $c$ tra $x_0$ e $x$ tale che:
> $$
\fx = P_n\tlr x + R_n\tlr x
> $$
> dove $P_n \tlr x$ è un polinomio di Taylor di ordine $n$ di $\fx$ centrato in $x_0$:
> $$
\begin{matrix*}
> P_n\tlr x = \\
>  \f{x_0} + \df{x_0}(x-x_0) + \frac{f''\tlr {x_0}}{2!}(x-x_0)^2 + \dots + \frac{f^n\tlr {x_0}}{n!}(x-x_0)^n
\end{matrix*}
> $$
> $R_n\tlr x$ è il resto di Lagrange, dato da:
> $$
> R_n\tlr x = \frac{f^n+1\tlr c(x-x_0)^{n+1}}{(n+1)!}
> $$

> [!important] Interpretazione
> Il teorema afferma che, **in un intorno di un punto $x_0$, una funzione derivabile $n$ volte può essere approssimata con un polinomio di Taylor di grado $n$**.
> L'errore di approssimazione è dato dal resto di Lagrange, che tende a zero all'aumentare di $n$.

## Polinomio di Taylor di una funzione bivariata
Sia $\f{x, y}: \R^2 \to \R$ una funzione derivabile $n$ volte in un intervallo $I \subset \R^2$ contenente il punto $P_0 = \tlr{x_0, y_0}$.
Il polinomio di Taylor di ordine $n$, $P_n\tlr{x, y}$, di $\f{x, y}$ centrato in $P_0 \equiv \tlr{x_0, y_0}$, rappresenta il polinomio bivariato di grado $n$ che meglio approssima $\f{x, y}$ in un intorno di $P_0$:
$$
\begin{matrix*}
P_n\tlr{x, y} = \f{x_0, y_0} + \sum^n_{i=1}{\sum^n_{j=0}{\frac{1}{i!j!} \frac{\delta^{i+j}\f{x_0, y_0}}{\delta x^i\delta y^i}\tlr{x- x_0}^i\tlr{y-y_0}^j}} \\
i+ j \le n
\end{matrix*}
$$
- $n=1$
	$$
	P_1\tlr x, y) = \f{x_0, y_0}+(x-x_0)\frac{\delta f}{\delta x}\tlr{x_0, y_0}+ \tlr{y-y_0}\frac{\delta f}{\delta y}\tlr{x_0, y_0}
	$$
	Rappresenta il piano che meglio approssima la funzione bivariata in un intorno del punto $P_0 = \tlr{x_0, y_0}$ e rappresenta il piano tangente alla superficie in $P_0 = \tlr{x_0, y_o}$
- $n=2$
	$$
	\begin{matrix*}
	P_n\tlr{x, y} = \f{x_0, y_0} + \tlr{x-x_0}\frac{\delta f}{\delta x}\tlr{x_0, y_0} + \tlr{y-y_0}\frac{\delta f}{\delta y}\tlr{x_0, y_0}+\\
	{1 \over 2!}\qlr{
	\tlr{x-x_0}^2\frac{\delta^2 f}{\delta x^2} \tlr{x_0, y_0} + 2\tlr{x-x_0}\tlr{y-y_0}\frac{\delta^2f}{\delta x\delta y}\tlr{x_0, y_0}+ \tlr{y-y_0}^2\frac{\delta^2f}{\delta y^2}\tlr{x_0, y_0}
	}
	\end{matrix*}
	$$
	Rappresenta il polinomio di grado $2$ bivariato che meglio approssima la funzione bivariata in un intorno del punto $P_0 = \tlr{x_0, y_0}$

# Sistemi Lineari
Consideriamo un sistema lineare:
$$
\begin{cases}
a_{11}x_1 + a_{12}x_2 + a_{13}x_3 + \dots + a_{1n}x_n = b_1 \\
a_{21}x_1 + a_{22}x_2 + a_{23}x_3 + \dots + a_{2n}x_n = b_2 \\
a_{31}x_1 + a_{32}x_2 + a_{33}x_3 + \dots + a_{3n}x_n = b_3 \\
\vdots \\
a_{m1}x_1 + a_{m2}x_2 + a_{m3}x_3 + \dots + a_{mn}x_n = b_m \\
\end{cases}
$$

Noti i coefficienti $a_{ij}, \ i = 1, \dots, m,\ j = 1, \dots, n$, e le componenti del termine noto $b_i,\ i = 1, \dots, m$, si vuole individuare il vettore $x$ incognito di $n$ componenti che soddisfa contemporaneamente le $m$ relazioni lineari.
In formato matriciale, il sistema può essere espresso come:
$$ Ax = b$$
con $A \in R^{m\times n},\ x \inf \R^n,\ b \in \R^m$
$$
\underbrace{
\begin{bmatrix}
a_{11} & a_{12} & \dots & a_{1n} \\
a_{21} & a_{22} & \dots & a_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
a_{m1} & a_{m2} & \dots & a_{mn} \\
\end{bmatrix}
}_{A}
\underbrace{
\begin{bmatrix}
x_1 \\ x_2\\ \vdots \\ x_n
\end{bmatrix}
}_{x} = 
\underbrace{
\begin{bmatrix}
b_1 \\ b_2\\ \vdots \\ b_n
\end{bmatrix}
}_{b}
$$
> [!important] Sistema Lineare Compatibile
> Un sistema lineare si dice **compatibile**  se ammette almeno una soluzione, si dice **incompatibile** nel caso non ammetta alcuna soluzione.

## Interpretazione geometrica di sistemi lineari
### Punto di intersezione tra due rette
![[Pasted image 20250331121004.png]]
![[Pasted image 20250331121050.png]]
Le due rette coincidono, **infinite soluzioni**
![[Pasted image 20250331121152.png]]
Le due rette sono parallele, **nessuna soluzione**

## Teorema di Rouchè-Capelli
Il sistema lineare $Ax = b$ ammette soluzioni se e solo se la matrice dei coefficienti $A$ e la matrice completa $\qlr{A \ b}$ hanno lo stesso rango:
$$
	\rnk A = r = \rnk{\qlr{A \ b}}
$$
Altrimenti se $\rnk A \ne r \ne \rnk{\qlr{A \ b}}$ il sistema non ammette soluzioni.
Si possono verificare i seguenti casi:
- $m < n$, cioè abbiamo **più incognite che relazioni lineari tra di esse**, il sistema si dice **indeterminato**. Se indichiamo con $k$ il rango della matrice $A$ e $k < n$, allora il sistema ammette $\infty^{n-k}$ soluzioni
- $m>n$, cioè abbiamo meno incognite che relazioni lineari tra di esse. Il sistema si dice **sovradeterminato**. In questo caso il sistema non ammette una soluzione esatta, ma una soluzione approssimata.
- $m =n$, cioè il numero di incognite è uguale al numero di relazioni lineari tra di esse. Il sistema si dice **normale** e sotto opportune ipotesi può ammettere una ed una sola soluzione

> [!important] Non Singolare
> La matrice quadrata $A$ è detta **non singolare** se soddisfa una delle seguenti condizioni equivalenti:
> - $det\tlr A \ne 0$
> - Esiste la matrice inversa $A^{-1}$ di $A$
> - $\rnk A = n$
>
> Altrimenti $A$ è singolare.

Affinché il sistema lineare $Ax=b$, $A \in \R^{m\times n}$, $x \in \R^n$, $b\in \R^n$, ammetta una ed una sola soluzione, comunque si scelga $b$, è che la matrice $A$ sia rango massimo, cioè che la matrice $A$ sia invertibile; si ha perciò:
$$
x = A^{-1}b
$$
Se il sistema è omogeneo, $b = 0$, ed $A$ è non singolare allora esiste solo la soluzione nulla $x=0$.

Il metodo dell'inversa risulta poco efficiente, perché richiede la soluzione di $n$ sistemi lineari, ma anche poco accurato.
Un metodo ben noto per la soluzione di sistemi lineari è basato sulla regola di Cramer, che calcola la componente j-esima della soluzione facendo uso del calcolo del determinante.
Questo metodo comporta una complessità computazionale di circa $\tlr{\inc n}!$ operazioni.

Nella pratica quindi vengono utilizzati altri metodi per la soluzione di un sistema lineare.
## Condizionamento di un sistema lineare
In questa sezione si vuole esaminare come perturbazioni sugli elementi della matrice $A$ e sugli elementi del termine noto $b$ influenzano la soluzione $x$ del sistema lineare. Queste perturbazioni sono tipicamente dovute sia agli errori di approssimazione quando la matrice $A$ ed il termine noto $b$ vengono rappresentati con numeri finiti, sia al fatto che tutte le operazioni dell'algoritmo risolutivo vengono effettuate in aritmetica finita.

Sia $A \in \R^{n\times n}$ a rango massimo e sia $\delta A$ una matrice di perturbazione e $\delta b$ il vettore di perturbazione del termine noto, sia $x$ la soluzione di $Ax=b$.
Un metodo numerico fornisce una soluzione approssimata, $x+\delta x$, $\delta x$ vettore di perturbazione della soluzione, che verifica un sistema perturbato:
1. **perturbazione solo sul termine noto**
	$$
	A\tlr{x+\delta x} = b + \delta b
	$$
	Vogliamo stimare $\delta x$ in funzione di $\delta b$:
	$$
	\begin{matrix*}
	Ax + A\delta x = b + \delta b \\
	x - b + A\delta x = \delta b
	\end{matrix*}
	$$
	Ma per ipotesi $Ax = b$, e quindi $Ax-b = 0$, quindi risulta
	$$
	A\delta x = \delta b \ \text{da cui } \delta x = A^{-1}\delta b
	$$
	Passando alle norme di ambo i membri
	$$
	\nm{\delta x} \le \nm{A^{-1}} \nm{\delta b}
	$$
	Inoltre da $Ax=b$ segue che
	$$
	\nm b = \nm{Ax} \le \nm A \nm x
	$$
	e quindi
	$$
	\frac{1}{\nm x} \le \nm A \cdot \frac{1}{\nm b}
	$$
	Moltiplicando membro a membro si ha:
	$$
	\frac{\nm{\delta x}}{\nm x} \le \nm{A^{-1}}\nm A \cdot \frac{\nm{\delta b}}{\nm b}
	$$
	$K\tlr A = \nm{A^-1}\nm A$ rappresenta l'indice di condizionamento del problema del calcolo della soluzione di un sistema lineare.

2. **perturbazione sia sulla matrice che sul termine noto**
	$$
	\tlr {A+\delta A}\tlr{x+\delta x} = \tlr{b + \delta b}
	$$
	Sotto l'ipotesi che $\nm{A^{-1}} \nm{\delta A} < 1$, vale la seguente relazione:
	$$
	\frac{\nm{\delta x}}{\nm x} \le \nm{A^{-1}}\nm A \frac{\frac{\nm{\delta A}}{\nm A} + \frac{\nm{\delta b}}{\nm b}}{1- \nm{A^{-1}}\nm A \frac{\nm{\delta A}}{\nm A}}
	$$
	L'indice di condizionamento della matrice identità è uguale ad $1$, $K\tlr I = 1$. In generale l'indice di condizionamento di una matrice, per ogni norma matriciale indotta, è maggiore o uguale ad $1$, $K\tlr A \ge 1$.

> [!note]
> Se $A$ è ortogonale, cioè se $A^TA = AA^T = I$ (cioè la sua trasposta coincide con l'inversa), allora
> $$
> K_2\tlr A = \nm A_2 \nm{A^{-1}}_2 = 1
> $$
 Infatti
> $$
> \begin{matrix*}
> \nm A_2 = \sqrt{\rho\tlr{A^TA}} = \sqrt{\rho \tlr I} = 1 \\
> \nm{A^{-1}}_2 = \nm{A^T}_2 = \sqrt{\rho \tlr{AA^T}} = \sqrt{\rho\tlr I} = 1
> \end{matrix*}
> $$
> **La risoluzione di $Ax = b$ con $A$ ortogonale è sempre un problema ben condizionato**

> [!note]
> $K\tlr A$ **piccolo** (ordine $10^p, \ p = 0, 1, 2, 3$): il problema/matrice è  **ben condizionato**
> $K \tlr A$ **grande** (ordine $> 10^3$): il problema/matrice è **mal condizionato**

### Proprietà dell'indice di condizionamento in norma $2$
Si definisce numero di condizionamento in norma $2$ di $A$ il numero reale
$$
\begin{matrix*}
K_2\tlr A = \frac{\sqrt{\lambda_{\max}\tlr{A^TA}}}{\sqrt{\lambda_{\min}\tlr{A^TA}}} \\
K_2\tlr{A^TA} = K_2\tlr A^2
\end{matrix*}
$$
## Metodi per la soluzione di un sistema lineare
I metodi per la soluzione di sistemi lineari vengono usualmente divisi in due raggruppamenti:
- **Metodi diretti** $\Rightarrow$ questi metodi, in assenza di errori di arrotondamento conducono alla soluzione esatta in un numero finito di passi. Essi sono adatti per la soluzione di sistemi con **matrice dei coefficienti densa e di moderate dimensioni**
- **Metodi iterativi** $\Rightarrow$ questi metodi generano una successione di soluzioni, che, sotto opportune ipotesi, convergono alla soluzione del sistema. La matrice dei coefficienti non viene modificata durante il calcolo e quindi è più agevole sfruttarne la sparsità.
  Sono adatti, quindi, per la soluzione di sistemi con **matrice dei coefficienti di grandi dimensioni e sparsa**. In assenza di errori di arrotondamento conducono alla soluzione esatta in un numero finito di passi
### Metodi diretti
I metodi diretti trasformano attraverso un numero finito di passi/operazioni un sistema _lineare generico in un sistema lineare equivalente dotato di una struttura particolare_ che ne semplifichi la risoluzione. Sono basati sulla fattorizzazione di $A$ nel prodotto di due matrici $B$ e $C$.
L'obiettivo della fattorizzazione $A = BC$ è appunto quello di trasformare il sistema lineare $Ax= b$ in un sistema lineare equivalente, la cui risoluzione è più semplice.

Il sistema lineare che si ottiene è della forma:
$$
BCx = b
$$
che si può spezzare in due problemi di più facile soluzione
$$
\begin{cases}
By = b \\
Cx = y
\end{cases}
$$
> [!note]
> Il sistema $Cx=y$ è facilmente risolubile ne caso in cui $C$ sia _triangolare superiore_, poiché facilmente risolvibile con il metodo delle sostituzioni all'indietro.
> Il termine noto $y$ si ottiene risolvendo il sistema lineare $By=b$ dove $B$ è _triangolare inferiore_ o ortogonale.

Il costo della fattorizzazione è $O\tlr{n^3}$ mentre il costo della risoluzione dei sistemi $By=b$ e $Cx=y$ è $O\tlr{n^2}$.
#### Metodi diretti e fattorizzazioni associate
1. **Metodo di eliminazione gaussiana**, associato alla **fattorizzazione $LU$**, $A=LU$ dove $L$ è triangolare inferiore con elementi diagonali $1$ e $U$ triangolare superiore.
2. **Metodo di Cholesky**, associato alla **fattorizzazione $LL^T$ o $R^TR$**, $A=LL^T=R^TR$ dove $L$ è triangolare inferiore con elementi diagonali positivi mentre $R$ è triangolare superiore con elementi diagonali positivi.
3. **Metodo di Householder**, associato alla **fattorizzazione $QR$**, $A = QR$ dove $Q$ è ortogonale $\tlr{Q^{-1}=Q^T}$ e $R$ è triangolare superiore.
> [!note]
> - La fattorizzazione $QR$ esiste sempre
> - La fattorizzazione $LL^T$ esiste per matrici simmetriche e definite positive
> - A differenza delle fattorizzazioni $LU$ e $LL^T$, non è unica

#### Fattorizzazione $LU$ (di Gauss)
^8b8885

Fra i vari tipo esistenti di algoritmi di fattorizzazione riveste un ruolo importante la fattorizzazione $LU$ di Gauss di una matrice $A$.
> [!important] Teorema
> Data $A \in \R^{n\times n}$, sia $A_k$ la sottomatrice principale di testa di $A$ ottenuta considerando le prime $k$ righe e le prime $k$ colone di $A$.
> Se $A_k$ è **non singolare per ogni $k = 1, \dots, n-1$** allora esiste ed è unica la fattorizzazione $LU$ di $A$.

^cbfb59

Non è esplicitamente richiesta la non singolarità di $A$ per scrivere la fattorizzazione $LU$. Con l'ipotesi aggiuntiva che la matrice $A$ abbia determinante diverso da zero allora la fattorizzazione $LU$ può essere utilizzata per risolvere un sistema lineare.
La fattorizzazione $LU$ si basa sull'algoritmo di eliminazione di Gauss, che consiste nel sottoporre il sistema lineare che dobbiamo risolvere ad opportune trasformazioni in modo tale da eliminare successivamente le incognite dalle varie equazioni fino a ridursi ad un sistema triangolare superiore con matrice dei coefficienti $U$, e termine noto trasformato $y$, e quindi costruire la matrice del sistema $A$ in triangolare superiore.

Complessità computazionale dell'algoritmo di fattorizzazione di Gauss: $\cong {1 \over 3}n^3$
La soluzione del sistema lineare $Ax=b$, con $A$ matrice che soddisfa le ipotesi del teorema, si riduce alla soluzione di due sistemi lineari
$$
\begin{cases}
Ly=b \\
Ux=y
\end{cases}
$$
##### Algoritmo di fattorizzazione di Gauss

^15b6dd

Si inizializza la matrice $L$ all'identità
$$
k = 1, \dots, n-1 \begin{cases}
l_{ik} = \frac{a_{ik}}{a_{kk}} & i = k+1, \dots, n \\
a_{ij} = a_{ij}-l_{ik}a_{kj} & i, j = k+1, \dots, n
\end{cases}
$$
Alla fine dell'algoritmo nel triangolo superiore di $A$ viene memorizzato il fattore triangolare superiore $U$ e nella matrice $L$, che risulterà triangolare inferiore con elementi $1$ sulla diagonale, il fattore triangolare inferiore della fattorizzazione.
##### Matrice di Permutazione $P$
$$
P =
\begin{bmatrix}
0 & 0 & 1 & 0 \\
0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
\end{bmatrix}
$$
Questa matrice è ottenuta dalla matrice identità scambiando due righe tra di loro. $P$ prende il nome di **matrice di permutazione**.

Effettuare il prodotto $P\cdot A$ equivale a scambiare le stesse due righe della matrice $A$. Effettuare il prodotto $A\cdot P$ equivale a scambiare le stesse due colonne della matrice $A$.
> [!important] Teorema
> Data una qualunque matrice $A$ non singolare, esiste una matrice di permutazione $P$ non singolare tale che $PA = LU$.

^ae2395

$P$ non è unica, ossia possono esistere diverse matrici $P$ tali che $PA$ soddisfa le ipotesi del [[#^cbfb59|teorema]].

Dal punto di vista algoritmico questo porta all'algoritmo di _Gauss con pivotaggio_.

Al passo $k$, prima di calcolare il moltiplicatore $I_{ik}$, se $a_{kk} = 0$, si va a cercare nella colonna $k$-esima, a partire dalla riga $k$-esima, la posizione di riga $s$ in cui si trova il primo elemento diverso da zero.
Se la riga $s$ è diversa dalla riga $k$-esima, si effettua lo scambio tra la riga $k$-esima e la riga $s$-esima della matrice, e poi si procede secondo lo schema dell'algoritmo classico.

Questa scelta garantisce l'esistenza della fattorizzazione $LU$, per la quale è sufficiente che $a_{kk} \ne 0,\ k = 1, \dots, n-1$.
Esiste un'altra variante dell'algoritmo di Gauss, con **pivotaggio per colonne a perno massimo**, che al passo $k$, prima di calcolare il moltiplicatore $I_{ik}$, va a cercare nella colonna
$k$-esima, a partire dalla riga $k$-esima, la posizione di riga $s$ in cui si trova **l'elemento di modulo massimo**.

```python
for k = 1, ..., n-1 :
	calcola nella colonna k-esima, a partire dall'elemento (k, k) l'indice
	di riga s a cui appartiene il massimo valore assoluto
	if s != k :
		scambia la riga s con la riga k, memorizza lo scambio nella matrice P
		Esegue l'algoritmo di Gauss (vedi link sotto)
```
[[#^15b6dd|Algoritmo di Gauss]]

#### Fattorizzazione di Cholesky
Per la fattorizzazione delle matrici simmetriche e definite positive è stato studiato un algoritmo di fattorizzazione, detto di Cholesky, che deriva dal seguente teorema
> [!important] Teorema di Cholesky
> Sia $A$ una matrice di ordine $n$ simmetrica e definita positiva, allora esiste una matrice triangolare inferiore $L$ con elementi diagonali positivi $\tlr{\tlr{l_{ii}> 0} \quad i = 1, \dots, n}$ tale che
> $$
> A = L\cdot L^T
> $$

Complessità computazionale dell'algoritmo di fattorizzazione di Cholesky: $\cong {1\over 6}n^3$
Sfruttando questo teorema, la soluzione del sistema lineare $Ax=b$, con $A$ matrice simmetrica e definita positiva, si riduce alla soluzione di due sistemi lineari
$$
\begin{cases}
Ly = b \\
L^Tx=y
\end{cases}
$$
#### Fattorizzazione QR di una matrice
> [!important] Teorema QR
> Sia $A \in M^{m\times n}$ con $m \ge n$ e $\rnk A = n$, ossia le colonne di $A$ sono linearmente indipendenti; allora esistono una matrice $Q \in M^{m\times m}$ ortogonale e una matrice $R = \begin{pmatrix}R_1 \\ 0\end{pmatrix} \in M^{m\times n}$ dove $R_1 \in M^{n\times n}$ è una matrice triangolare superiore non singolare, tale che $A = QR$.

Sfruttando questo teorema, la soluzione del sistema lineare $Ax=b$, con $A$ matrice quadrata e a rango massimo, si riduce alla soluzione di due sistemi lineari.
$$
\begin{cases}
Qy=b\\
Rx=y
\end{cases}
$$
Essendo $Q$ ortogonale la soluzione del sistema $Qy=b$ si riduce a $y = Q^TB$, poiché l'inversa di una matrice ortogonale coincide con la sua inversa.
**Costo computazionale**:
- $m-1 \ge n \ \Rightarrow \ \cong mn^2- {n^3 \over 3}$
- $m = n \Rightarrow \ \cong {2n^3 \over 3}$
### Stabilità di un algoritmo di fattorizzazione
Consideriamo la fattorizzazione
$$ A = B\cdot C$$
e studiamo l'effetto che ha sui risultati il fatto che questa fattorizzazione venga eseguita operando con i numeri finiti; poiché le operazioni aritmetiche che compaiono in uno degli algoritmi visti per calcolare la fattorizzazione di una matrice $A$ vengono eseguite in aritmetica finita, alla fine dell'algoritmo si ottengono, anziché i fattori esatti $B$ e $C$, i fattori $\mf B$ e $\mf C$; questi si possono pensare come
$$
\mf{B} = B + \delta B \qquad \mf C = C + \delta C
$$

^b655c0

cioè dati dai fattori esatti più una piccola perturbazione.

Utilizzando la filosofia dell'analisi all'indietro introdotta da Wilkinson, i fattori $\mf B$ e $\mf C$ possono essere pensati come **fattorizzazione esatta di una matrice perturbata**.
$$
A + \delta A = \mf B \cdot \mf C
$$

^0274c6

Si studia perciò da cosa dipenda l'entità della perturbazione $\delta A$.

Dalle relazioni [[#^b655c0|(2)]] e [[#^0274c6|(3)]] si ottiene
$$
A + \delta A = \tlr{B + \delta B} \cdot \tlr{C + \delta C}
$$
cioè
$$
A + \delta A = B \cdot C + B \cdot \delta C + \delta B \cdot C + \delta B \cdot \delta C
$$
da cui si segue per $\delta A$ la seguente espressione:
$$
\delta A = B \cdot \delta C + \delta B \cdot C + \delta B \cdot \delta C
$$

Questa relazione mette in evidenza che la perturbazione $\delta A$, non solo dipende dalle piccole perturbazioni $\delta B$ e $\delta C$, ma è tanto più grande quanto più grandi sono gli elementi dei fattori $B$ e $C$.
Questa osservazione porta al fatto che si definisce la stabilità della fattorizzazione $B \cdot C$ in termini degli elementi di $B$ e di $C$.
> [!important] Definizione di stabilità di un algoritmo di fattorizzazione $B \cdot C$
> Data una matrice $A$ i cui elementi sono tutti minori o uguali ad $1$, si dice che un algoritmo di fattorizzazione che produce una fattorizzazione $B \cdot C$ della matrice $A$ è numericamente stabile in senso forte, se esistono delle costanti positive $a$ e $b$, **indipendenti dall'ordine e dagli elementi** di $A$ tali che
> $$
\blr{b_{ij}} \le a \quad \blr{c_{ij}} \le b
> $$

Se le costanti $a$ e $b$ dipendono dall'ordine di $A$ si dice che la fattorizzazione $B \cdot C$ è stabile in senso debole.
#### Stabilità dell'algoritmo di Gauss
Nel caso in cui si utilizzi la tecnica di pivotaggio a perno massimo per colonne, che nasce da un'opportuna scelta della matrice di permutazione $P$ del [[#^ae2395|teorema]], si ha
$$
\begin{matrix*}
\blr{l_{ij}} \le 1 \\
\blr{u_{ij}} \le 2^\dec n max\blr{a_{ij}}
\end{matrix*}
$$
> [!note]
> L'algoritmo di fattorizzazione di Gauss è stabile in senso debole perché la costante che maggiora gli elementi di $L$ non dipende dall'ordine della matrice, mentre ciò **non accade per la costante che maggiora gli elementi di $U$**, che dipende in maniera esponenziale dall'ordine della matrice.

#### Stabilità dell'algoritmo di Cholesky
$$
\max_{ij}{\blr {l_{ij}}} \le \sqrt{\max_{ij}{\blr{a_{ij}}}}
$$
L'algoritmo di fattorizzazione di Cholesky è stabile in senso forte.
#### Stabilità dell'algoritmo di fattorizzazione QR
$$
\blr{q_{ij}} \le 1 \qquad \blr{r_{ij}} \le \sqrt n \max_{ij}\blr{a_{ij}}
$$
L'algoritmo di fattorizzazione $Q \cdot R$ è stabile in senso debole, perché gli elementi di $R$ in valore assoluto sono maggiorati da $\sqrt n \max_{ij}\blr{a_{ij}}$, ma è più stabile della fattorizzazione $LU$ di Gauss, per la quale gli elementi di $U$ in valore assoluto sono maggiorati da $2^\dec n \max_{ij}{\blr{a_{ij}}}$.
### Soluzione di sistemi lineari con matrici triangolari
Sia  $L=\begin{bmatrix} l_{11} & 0 & \dots & \dots & 0 \\ l_{21} & l_{22} & \dots & \dots & 0 \\ l_{31} & l_{32} & l_{33} & \dots & 0 \\ \dots & \dots & \dots & \dots & \dots \\ l_{n1} & l_{n2} & l_{n3} & \dots & l_{nn} \\ \end{bmatrix}$ una matrice _triangolare inferiore_ ed $U = \begin{bmatrix}u_{11} & u_{12} & u_{13} & \dots & u_{1n} \\ 0 & u_{22} & u_{23} & \dots & u_{2n} \\ 0 & 0 & u_{33} & \dots & u_{3n} \\ \dots & \dots & \dots & \dots & \dots \\ 0 & 0 & 0 & \dots & u_{nn} \end{bmatrix}$ una matrice _triangolare superiore_.
La soluzione di sistemi lineari con queste matrici dei coefficienti si ottiene facilmente mediante sostituzione.

_Soluzione del sistema $Lx=b$, nel caso in cui $L$ sia triangolare inferiore_:
$$
\begin{align}
&l_{1,1}x_1 &= b_1 \\
&l_{2,1}x_1 + l_{2,2}x_2 &= b_2 \\
&\dots \\
&l_{i,1}x_1 + l_{i,2}x_2 + \dots + l_{i,i}x_i &= b_i \\
&\dots \\
&l_{n,1}x_1 + l{n,2}x_2 + \dots + l_{n,n}x_{n} &= b_n
\end{align}
$$
#### Sostituzione in avanti (Forward Substitution)
$$
\begin{cases}
x_1 = \frac{b_1}{l_{1,1}}\\
x_2 = \frac{\tlr{b_2-l_{2,1}x_1}}{l_{2,2}}\\
\dots \\
x_3 = \frac{\tlr{b_i - \tlr{l_{i,1}x_1 + l_{i,2}x_2 + \dots + l_{i,\dec i}x_\dec i}}}{l_{i,i}} & i = 2, \dots, n
\end{cases}
$$
Cioè in forma algoritmica:
```python
for i = 1, 2, ..., n :
	xi = bi
		for j = 1, 2, ..., i-1 :
			xi -= lij*xj
	xi = xi / lii
```

_Soluzione del sistema $Ux=b$, nel caso in cui la matrice $U$ sia triangolare superiore_:
$$
\begin{align}
u_{1,1}x_1 + u_{1,2}x_2 + \dots + u_{1,i}x_i + \dots + u_{1,\dec n}x_\dec n + u_{1,n}x_n &= b_1 \\
u_{i,i}x_i + u_{i,\inc i}x_\inc i + \dots + u_{i,n}x_n &= b_i \\
u_{\dec n,\dec n}x_\dec n + u_{\dec n,n}x_n &= b_\dec n \\
u_{n,n}x_n &= b_n
\end{align}
$$
#### Sostituzione all'indietro (backward Substitution)
$$
\begin{cases}
x_n = \frac{b_n}{u_{n,n}} \\
x_\dec n = \frac{\tlr{b_\dec n - u_{\dec n}x_n}}{u_{\dec n,\dec n}} \\
\dots \\
x_i = \frac{\tlr{b_i - \tlr{u_{i, \inc i}x_\inc i + u_{i, \inc[2]i}x_\inc[2]i + \dots + u_{i, n}x_n}}}{u_{i,i}} & i = n-1, n-2, \dots, 1
\end{cases}
$$
cioè in forma algoritmica
```python
for i = n, n-1, ..., 1 :
	xi = bi
	for j = i+1, ..., n :
		xi -= uij*xj
	xi = xi / uii
```

> [!note] Complessità computazionale
> La complessità computazionale in termini di operazioni moltiplicative è:
> $\sum^n_{i=1}{i} = \frac{n\tlr{\inc n}}{2}$, quindi dell'ordine di $O\tlr{{n^2 \over 2}}$.

### Calcolo Matrice Inversa
Il problema di determinare l'inversa $A^{\dec{}}$ di una matrice $A$ quadrata $n\times n$ non singolare si riconduce al problema di risolvere $n$ sistemi normali:
$$
A \cdot A^\dec{} = I
$$
Poiché l'$i$-esima colonna della matrice identità è l'$i$-esimo vettore della base canonica:
$$
e_i = \begin{bmatrix}
0 \\ 0 \\ \dots \\ 1 \\ 0 \\ \dots \\ 0
\end{bmatrix}
$$
ed indicando con $x_i$ l'$i$-esima colonna della matrice inversa $\inv A$, il calcolo dell'inversa equivale a risolvere $n$ sistemi lineari con la stessa matrice $A$ (si considera la sua fattorizzazione e la si utilizza per risolvere l'$i$-esimo sistema lineare):
$$
Ax_i=e_i \qquad i = 1, \dots, n
$$
La soluzione dell'$i$-esimo sistema lineare rappresenta l'$i$-esima colonna della matrice inversa.

Si può effettuare la [[#^8b8885|fattorizzazione LU]] della matrice $PA$, che rimane la stessa per tutti i sistemi lineari e poi utilizzarla per risolvere gli $n$ sistemi lineari:
$$
\begin{cases}
Ly_i = Pe_i \\
Ux_i = y_i
\end{cases}
\qquad i = 1, \dots, n
$$
La soluzione $x_i$ dell'$i$-esimo sistema lineare così ottenuta rappresenta l'$i$-esima colonna della matrice inversa.

### Calcolo del determinante di una matrice sfruttando la [[#^8b8885|Fattorizzazione LU]] di $PA$
$PA = LU$ con $L$ matrice triangolare inferiore con elementi diagonali uguali ad $1$, $U$ matrice triangolare superiore:
$$
\begin{matrix*}
\det {PA} = \det{LU} = \det L \det U = \det U = \prod_{i = 1, \dots, n}{u_{i, i}} \\
\det{PA} = \det P \det A = \prod_{i = 1, \dots, n}{u_{i, i}} \\
\det P = \tlr{-1}^s
\end{matrix*}
$$
**dove $s$ è il numero di scambi effettuati**.
Quindi $\det A = \tlr{-1}^s \prod_{i = 1, \dots, n}{u_{i, i}}$
Il rango è dato invece dal numero $r$ degli elementi non nulli sulla diagonale di $U$.

# Sistemi di equazioni non lineari
$f:\R^2 \to \R$ è un **campo scalare** su $\R^2$, cioè una **funzione che associa uno scalare ad un punto di** $\R^2$.
Definiamo il grafico di $f$, $G_f$ come segue:
$$
G_f = \glr{\tlr{x, y, z} \in \R^3 | z = \f{x, y}}
$$
Un sistema di equazioni non lineari può essere scritto nella forma:
$$
\begin{cases}
f_1\tlr{x_1, x_2, \dots, x_n} = 0 \\
f_2\tlr{x_1, x_2, \dots, x_n} = 0 \\
\dots \\
f_n\tlr{x_1, x_2, \dots, x_n} = 0 \\
\end{cases}
$$
con $f_i:\R^n \to \R$, $i = 1, \dots, n$ funzioni non lineari continue e differenziabili.
Consideriamo la funzione $F:\R^n\to\R^n$, **funzione a valori vettoriali**:
$$
X = \begin{bmatrix}
x_1 \\
x_2 \\
\dots \\
x_n
\end{bmatrix} \in \R^n \to F\tlr{X} = \begin{bmatrix}
f_1\tlr{x_1, x_2, \dots, x_n} \\
f_2\tlr{x_1, x_2, \dots, x_n} \\
\dots \\
f_n\tlr{x_1, x_2, \dots, x_n} \\
\end{bmatrix}
$$
calcolare **la soluzione del sistema**, cioè calcolare il vettore $\a = \qlr{\a_1, \a_2, \dots, \a_n}^T \in \R^n$ che annulla contemporaneamente le equazioni **equivale a calcolare $\a = \blr{\a_1, \a_2, \dots, \a_n}^T \in \R^n$ tale che $F\tlr\a = 0$**.

Il gradiente di una funzione $f:\R^n\to\R$, differenziabile è dato da:
$$
\nabla\f X = \begin{bmatrix}
\frac{\delta\f X}{\delta x_1} \\
\frac{\delta\f X}{\delta x_2} \\
\dots \\
\frac{\delta\f X}{\delta x_n} \\
\end{bmatrix}
$$

Lo **Jacobiano** di $F\tlr X$ è la matrice le cui entrate sono le derivate parziali di ciascuna funzione $f_i\tlr{x_1, x_2, \dots, x_n}$, $i = 1, 2, \dots, n$ rispetto a ciascuna variabile, $j = 1, \dots, n$
$$
J\tlr X = \begin{bmatrix}
\frac{\delta f_1\tlr X}{\delta x_1} & \frac{\delta f_1\tlr X}{\delta x_2} & \dots & \frac{\delta f_1\tlr X}{\delta x_n} \\
\frac{\delta f_2\tlr X}{\delta x_1} & \frac{\delta f_2\tlr X}{\delta x_2} & \dots & \frac{\delta f_2\tlr X}{\delta x_n} \\
\dots & \dots & \dots & \dots \\
\frac{\delta f_n\tlr X}{\delta x_1} & \frac{\delta f_n\tlr X}{\delta x_2} & \dots & \frac{\delta f_n\tlr X}{\delta x_n} \\
\end{bmatrix}
$$
che può essere riscritto come:
$$
J\tlr X = \begin{bmatrix}
\frac{\delta F\tlr X}{\delta x_1} & \frac{\delta F\tlr X}{\delta x_2} & \dots & \frac{\delta F\tlr X}{\delta x_n} \\
\end{bmatrix}
$$
dove $\frac{\lambda F\tlr X}{\lambda x_1} = \begin{bmatrix} \frac{\delta f_1\tlr X}{\delta x_i} \\ \frac{\delta f_2\tlr X}{\delta x_i} \\ \dots \\ \frac{\delta f_n\tlr X}{\delta x_i} \\ \end{bmatrix}$

Poiché
$$
\nabla F\tlr X = \begin{bmatrix}
\frac{\delta F\tlr X}{\delta x_1} \\
\frac{\delta F\tlr X}{\delta x_2} \\
\dots \\
\frac{\delta F\tlr X}{\delta x_n} \\
\end{bmatrix}
$$
si ha quindi che $\nabla F\tlr X = J^T\tlr X$
## Metodo di Newton Raphson per la soluzione di un sistema di equazioni non lineari
Dato
$$
F\tlr X = F\tlr{x_1, x_2} = \begin{bmatrix}
f_1\tlr{x_1, x_2} \\
f_2\tlr{x_1, x_2} \\
\end{bmatrix}
$$
individuare il vettore $\a = \qlr{\a_1, \a_2}^T \in \R^2$ tale che $F\tlr\a = \begin{bmatrix}f_1\tlr{\a_1, \a_2} \\ f_2\tlr{\a_1, \a_2}\end{bmatrix} = \begin{bmatrix}0 \\ 0 \end{bmatrix}$.
Questo equivale ad individuare un punto del piano in cui entrambe le due funzioni si annullino contemporaneamente.
Consideriamo il polinomio di Taylor di grado $1$ bivariato centrato in un intorno del punto $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$ per entrambe le funzioni bivariate $f_1\tlr{x_1, x_2}$ e $f_2\tlr{x_1, x_2}$.
Tali polinomi rappresentano il piano che meglio approssima ciascuna delle due funzioni bivariate in un intorno del punto $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$ e ciascuno di essi rappresenta il piano tangente a ciascuna delle due superfici in $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$.
$$
\begin{matrix*}
x_3 = P_1\tlr{x_1, x_2} = f_1\tlr{x_1^{(k)}, x_2^{(k)}} + \frac{\delta f_1}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_1^{(k)} - x_1^{(k)}} + \frac{\delta f_1}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_2^{(k)} - x_2^{(k)}} \\
x_3 = Q_1\tlr{x_1, x_2} = f_2\tlr{x_1^{(k)}, x_2^{(k)}} + \frac{\delta f_2}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_1^{(k)} - x_1^{(k)}} + \frac{\delta f_2}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_2^{(k)} - x_2^{(k)}}
\end{matrix*}
$$
La notazione $\frac{\delta f_i}{\delta f_j}\tlr{x_1^{(k)}, x_2^{(k)}}$ indica la derivata parziale di $f_i$ rispetto ad $x_j$ valutata in $\tlr{x_1^{(k)}, x_2^{(k)}}$.
L'obiettivo è di individuare un punto del piano $X_\inc k = \qlr{x_1^{(\inc k)}, x_2^{(\inc k)}}^T$ in cui $F\tlr{X_\inc k} = 0$, cioè entrambe le due funzioni si annullino contemporaneamente.
Poiché $F$ è non lineare, si usa l'approssimazione lineare fornita dai polinomi di Taylor di ciascuna delle due funzioni bivariate e imponiamo che i piani tangenti da essi rappresentati si annullino contemporaneamente.
$$
\begin{cases}
0 = P_1\tlr{x_1, x_2} = f_1\tlr{x_1^{(k)}, x_2^{(k)}} + \frac{\delta f_1}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_1^{(k)} - x_1^{(k)}} + \frac{\delta f_1}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_2^{(k)} - x_2^{(k)}} \\
0 = Q_1\tlr{x_1, x_2} = f_2\tlr{x_1^{(k)}, x_2^{(k)}} + \frac{\delta f_2}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_1^{(k)} - x_1^{(k)}} + \frac{\delta f_2}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}}\tlr{x_2^{(k)} - x_2^{(k)}}
\end{cases}
$$

^04fbe1

Questo sistema di due equazioni lineari rappresenta l'intersezione dei due piano tangenti alle due superfici in $X_n = \qlr{x_1^{(k)}, x_2^{(k)}}^T$ con il piano $x_3 = 0$.

Geometricamente significa: trovare il punto sulla retta di intersezione dei due piani tangenti in cui si ha $x_3 = 0$, cioè in questo punto la retta attraversa il piano $x_3 = 0$.

Indicato con:
$$
J\tlr{X_k} = \begin{bmatrix}
\frac{\delta f_1}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}} & \frac{\delta f_1}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}} \\
\frac{\delta f_2}{\delta x_1}\tlr{x_1^{(k)}, x_2^{(k)}} & \frac{\delta f_2}{\delta x_2}\tlr{x_1^{(k)}, x_2^{(k)}} \\
\end{bmatrix}
$$
lo jacobiano di $F\tlr X$, calcolato in $X_k$:
$$
\begin{matrix*}
F\tlr{X_k} = \qlr{f_1\tlr{x_1^{(k)}}, f_2\tlr{x_2^{(k)}}}^T \\
X - X_k = \qlr{\tlr{x_1 - x_1^{(k)}}, \tlr{x_2-x_2^{(k)}}}^T
\end{matrix*}
$$
Il sistema [[#^04fbe1|(2)]] si può esprimere in forma matriciale come:
$$
\begin{matrix*}
0 = F\tlr{x_k} + J\tlr{X_k}\tlr{X-X_k}\\
J\tlr{X_k}\tlr{X-X_k} = -F\tlr{X_k}
\end{matrix*}
$$
Sotto l'ipotesi che $\det{J\tlr{X_k}} \ne 0$, si ricava $\tlr{X-X_k}$ premoltiplicando ambo i membri per $\inv J\tlr{X_k}$
$$
X - X_k = -\inv J\tlr{X_k}F\tlr{X_k}
$$
e si determina il procedimento iterativo:
$$
X_\inc k - X_k = -\inv J\tlr{X_k}F\tlr{X_k}
$$
Si osserva che $-\inv J\tlr{X_k}F\tlr{X_k}$ è  la soluzione del sistema lineare
$$
J\tlr{X_k}s_k = -F\tlr{X_k}
$$
quindi
$$
X_\inc k = X_k + s_k
$$

L'algoritmo di Newton Raphson si può così schematizzare:
Dato $X_0 \in \R^n$ e $F$, per ogni iterazione $k$:
1. Valutare $J\tlr{X_\dec k}$
2. Risolvere il sistema lineare $J\tlr{X_\dec k}s_\dec k = -F\tlr{X_\dec k}$
3. Porre $X_k = X_\dec k + s_\dec k$

**È un metodo a convergenza locale e ordine di convergenza quadratico**.
### Varianti del Metodo di Newton-Raphson
La valutazione dello Jacobiano richiede di conoscere o poter valutare $n^2$ derivate parziali.
Alcune varianti al metodo possono migliorare l'efficienza.
1. **Metodo delle corde**
	Si utilizza lo stesso Jacobiano $J\tlr{X_0}$ o una sua approssimazione $A\tlr{X_0}$ per tutte le iterazioni $k$. Si potrebbe quindi fattorizzare $J\tlr{X_0} = LU$ e utilizzare i medesimi $L$ ed $U$ per ogni iterazione.
2. **Metodo di Shamanskii**
	Si valuta lo Jacobiano ogni $m$ iterazioni e quindi lo si utilizza per le $m$ iterazioni successive:
	$$
	J^\inc[i] k J^i, \quad i = 1, \dots, m \\
	$$
	Giunti al calcolo di $x_{x + \inc m}$ si rivaluta lo Jacobiano.

### Approccio grafico per localizzare le soluzioni di un sistema di equazioni non lineari
Quando risolviamo un sistema di equazioni non lineari come:
$$
\begin{cases}
f_1\tlr{x_1, x_2} = 0 \\
f_2\tlr{y_1, y_2} = 0 \\
\end{cases}
$$
stiamo cercando i valori di $x_1, x_2$ che soddisfano entrambe le equazioni contemporaneamente. L'approccio grafico offre un modo intuitivo per visualizzare queste soluzioni.
Consideriamo le funzioni $\f[1]{x_1, x_2}$ e $\f[2]{x_1, x_2}$ come superfici nello spazio tridimensionale:
$$
\begin{matrix*}
x_3 = \f[1]{x_1, x_2} \\
x_3 = \f[2]{x_1, x_2} \\
\end{matrix*}
$$
Queste sono due superfici definite sul piano $x_1, x_2$.
Le soluzioni del sistema corrispondono ai punti in cui entrambe le superfici assumono il valore $x_3 = 0$, ossia dove intersecano il piano $x_3 = 0$, cioè il piano $x_1x_2$.
Le curve di livello a quota zero sono date da:
- $\f[1]{x_1, x_2} = 0$ che rappresenta l'intersezione con il piano $x_3 = 0$ (per la prima superficie)
- $\f[2]{x_1, x_2} = 0$ che  rappresenta l'intersezione con il piano $x_3 = 0$ (per la seconda superficie)
Queste curve sono tracciate nel piano $\xi\xx$ e descrivono tutti i punti $\t{\xi, \xx}$ dove ciascuna superficie "tocca" il piano orizzontale $x_3 = 0$.

I punti $\xi,\xx$ che si trovano sull'intersezione di queste due curve di livello a quota zero sono esattamente i punti in cui sia $\f[1]{\xi, \xx}$ che $\f[2]{\xi, \xx}$ sono uguali a zero, quindi sono la soluzione del sistema.

Possiamo esaminare il  grafico e stimare le coordinate $\t{\xi, \xx}$ di uni di questi punti di intersezione.

> [!note]
> Queste coordinate stimate sono una buona approssimazione della soluzione effettiva. Pertanto, possiamo utilizzare queste coordinate come il nostro iterato iniziale per il metodo Newton-Raphson.
> Iniziando da un punto vicino alla vera soluzione, il metodo di Newton-Raphson convergerà rapidamente a una soluzione precisa.

## Minimi e massimi di una funzione in due variabili
Chiamiamo **Massimo Relativo** (o massimo locale) per una funzione $z = \fxy$ un punto $P_0 = \t{\xo, \yo}$ tale che
$$
\f{\xo, \yo} \ge \fxy
$$
per tutti i punti $\t{\xy}$ **che appartengono ad un intorno $\mathcal N$ di $\Po$** contenuto nel dominio della funzione.
+
Chiamiamo invece **Minimo Relativo** (o minimo locale) un punto $\Po$ tale che
$$
\f{\xyo} \le \fxy
$$
per tutti i punti $\t\xy$ **che appartengono ad un intorno $\mathcal N$ di $\Po$** contenuto nel dominio della funzione.

Chiamiamo **Massimo Assoluto** (o massimo globale) per una funzione $z = \f\xy$ un punto $\Po = \t\xyo$ tale che
$$
\f\xyo \ge \fxy
$$
per **tutti i punti $\t\xy$ che appartengono al dominio della funzione**.

Chiamiamo **Minimo Assoluto** (o minimo globale) per una funzione $z = \fxy$ un punto $\Po = \t\xyo$ tale che
$$
\f\xyo \le \f\xy
$$
per **tutti i punti $\t\xy$ che appartengono al dominio della funzione**.
![[Pasted image 20250415125147.png]]

I punti in cui si **annulla il gradiente di una funzione $f$** si chiamano punti **critici o punti stazionari** di $f$.
Si calcola la matrice Hessiana così definita:
$$
\t{H\t{x}}_{ij} = \frac{\delta^2\fx}{\delta x_i\delta x_j} \quad i, j = 1, \dots, n
$$
Se il **determinante della matrice Hessiana calcolata nel punto di stazionarietà**:
- è positivo e l'elemento in posizione $\t{1, 1}$ è positivo, si tratta di un minimo locale
- è positivo e l'elemento in posizione $\t{1, 1}$ è negativo, si tratta di un massimo locale
- è negativo si tratta di un punto di sella
- è nullo non ci sono informazioni sulla natura del punto di stazionarietà
### Funzione Convessa
Una funzione $f:A \subseteq D \to \R$, definita su un insieme convesso $A$ è detta **convessa** se:
$$
\f{t \cdot x + \t{1-t}\cdot x'} \le t\fx + \t{1 -t}\f{x'}
$$
Dal punto di vista geometrico, una funzione si dice **convessa** se ogni coppia di punti sul grafico della funzione è congiunta mediante un segmento che sta al di sopra del grafico, oppure coincide con una parte del grafico.
Per una funzione convessa il minimo relativo coincide con il minimo assoluto.
>[!note] Teorema
>Se la funzione $f$ è convessa e differenziabile, $\t{\xo, \yo}$ è un minimo se e solo se $\nabla\f{\xo, \yo} = 0$

## Metodo di Newton-Raphson per il calcolo del minimo di una funzione in più variabili
Data $f:\R^n \to \R$, $f \in C^2$ (differenziabile due volte con continuità), trovare $X^* \in \R^n$ tale che $X^* = \arg{\min_\limits{X\in\R^n}\f X}$.
I punti di stazionarietà locale $X^*$ sono soluzione del seguente sistema non lineare
$$
\nabla \f{X^*} = 0
$$
Applichiamo il metodo di Newton Raphson al sistema non lineare:
$$
\begin{matrix*}
\nabla \f X = 0 \Rightarrow \begin{cases}
\frac{\delta\f X}{\delta\xi} = 0 \\
\frac{\delta\f X}{\delta\xx} = 0 \\
\dots \\
\frac{\delta\f X}{\delta x_n} = 0 \\
\end{cases} \\
X = \begin{bmatrix}
\xi \\ \xx \\ \dots \\ x_n
\end{bmatrix}
\end{matrix*}
$$
Per verificare poi se tale punto è un massimo, un minimo oppure un punto sella, occorrerà esaminare la matrice hessiana $H\t X = \nabla^2\f X$ in questo punto, dove la matrice Hessiana è così definita:
$$
\t{H\t{x}}_{ij} = \frac{\delta^2\fx}{\delta x_i\delta x_j} \quad i, j = 1, \dots, n
$$
$$
H\t X = \begin{bmatrix}
\frac{\delta^2\f X}{\delta^2\xi} & \frac{\delta^2\f X}{\delta\xi\delta\xx} & \dots & \frac{\delta^2\f X}{\delta\xi\delta x_n} \\
\frac{\delta^2\f X}{\delta\xx\delta\xi} & \frac{\delta^2\f X}{\delta^2\xx} & \dots & \frac{\delta^2\f X}{\delta\xx\delta x_n} \\
\dots & \dots & \dots & \dots \\
\frac{\delta^2\f X}{\delta x_n\delta\xi} & \frac{\delta^2\f X}{\delta x_n\delta\xx} & \dots & \frac{\delta^2\f X}{\delta^2 x_n} \\
\end{bmatrix}
$$
Per semplicità, consideriamo il caso in cui $n=2$.
Consideriamo il polinomio di Taylor di grado $1$ bivariato centrato in un intorno del punto $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$ per entrambe le componenti del gradiente $\nabla\f{\xi, \xx}$.
$$
\begin{matrix*}
x_3 = P_1\tlr{x_1, x_2} = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta x_1} + \frac{\delta^2\f{\xi^\t k , \xx^\t k}}{\delta\xi^2}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xi\delta\xx}\tlr{\xx - \xx^\t k}\\
x_3 = Q_1\tlr{x_1, x_2} = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta \xx} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx\delta\xi}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx^2}\tlr{\xx - \xx^\t k}\\
\end{matrix*}
$$

Tali polinomi rappresentano il piano che meglio approssima ciascuna delle due funzioni bivariate in un intorno del punto $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$ e ciascuno di essi rappresenta il piano tangente a ciascuna di esse in $X_k = \qlr{x_1^{(k)}, x_2^{(k)}}^T \in \R^2$.
Il nostro obiettivo è individuare un punto del piano $X_\inc k = \qlr{\xi^{\tlr{\inc k}}, \xx^{\tlr{\inc k}}}^T$ in cui $\nabla\f{X_\dec k} = 0$, cioè entra,be le due derivate parziali si annullino contemporaneamente.

Poiché $\nabla f$ è non lineare, usiamo l'approssimazione lineare fornita dai polinomi di Taylor di ciascuna delle due componenti del gradiente della funzione $f$ in un intorno di $X_k = \qlr{\xi^{\t k}, \xx^\t k}^T$ e imponiamo che i piani tangenti da essi rappresentati si annullino contemporaneamente.
$$
\begin{cases}
x_3 = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta x_1} + \frac{\delta^2\f{\xi^\t k , \xx^\t k}}{\delta\xi^2}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xi\delta\xx}\tlr{\xx - \xx^\t k}\\
x_3 = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta \xx} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx\delta\xi}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx^2}\tlr{\xx - \xx^\t k}\\
\end{cases}
$$
Questo sistema di due equazioni lineari rappresenta l'intersezione dei due piani tangenti alle due componenti del gradiente della funzione $f$ in $X_k = \qlr{\xi^{\t k}, \xx^\t k}^T$ con il piano $x_3 = 0$.
$$
\begin{cases}
0 = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta x_1} + \frac{\delta^2\f{\xi^\t k , \xx^\t k}}{\delta\xi^2}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xi\delta\xx}\tlr{\xx - \xx^\t k}\\
0 = \frac{\delta f\t{\xi^{\t k}, \xx^{\t k}}}{\delta \xx} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx\delta\xi}\tlr{\xi - \xi^\t k} + \frac{\delta^2\f{\xi^\t k, \xx^\t k}}{\delta\xx^2}\tlr{\xx - \xx^\t k}\\
\end{cases}
$$
Indicata con
$$
H\t{X_k} = \begin{bmatrix}
\frac{\delta^2f}{\delta \xi^2}\t{\xi^\t k, \xx^\t k} &\frac{\delta^2f}{\delta \xi\delta\xx}\t{\xi^\t k, \xx^\t k} \\
\frac{\delta^2f}{\delta \xx\delta\xi}\t{\xi^\t k, \xx^\t k} &\frac{\delta^2f}{\delta\xx^2}\t{\xi^\t k, \xx^\t k} \\
\end{bmatrix}
$$
l'Hessiana di $\f X$, calcolata in $X_k$:
$$
\nabla \f{X_k} = \begin{bmatrix}
\frac{\delta f}{\delta \xi}\t{\xi^\t k, \xx^\t k} & \frac{\delta f}{\delta \xx}\t{\xi^\t k, \xx^\t k}
\end{bmatrix}^T
$$
il gradiente di $f$ calcolato in $X_k$.