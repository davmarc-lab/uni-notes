---
id: Metodi Numerici
aliases: []
tags: []
---
### Email
damiana.lazzaro@unibo.it
l.pellegrini@unibo.it
marcella.lucciardi2@unibo.it

<!--toc:start-->
- [Introduzione](#introduzione)
  - [Problema Numerico](#problema-numerico)
    - [Algoritmo di un problema numerico](#algoritmo-di-un-problema-numerico)
    - [Classificazione dei problemi numerici](#classificazione-dei-problemi-numerici)
    - [Denoising di immagini](#denoising-di-immagini)
- [Introduzione all’Intelligenza Artificiale (AI)](#introduzione-allintelligenza-artificiale-ai)
  - [Definizione](#definizione)
  - [Machine Learning](#machine-learning)
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
## Machine Learning
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
    
    o equivalentemente se $\det({A-\lambda I}) = 0$
    
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