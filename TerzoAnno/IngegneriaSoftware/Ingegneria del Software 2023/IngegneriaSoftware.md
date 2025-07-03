```table-of-contents
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 3 # Include headings up to the specified level
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```
# Lezioni
|   |   |
|---|---|
|Martedì|9-12|
|Mercoledì|13-15|
# Esame
Prova scritta con modellazione di specifiche con UML, domande sulla parte teorica
# Esercizi
[[Esercizi Pratici]]
# Ciclo di vita dei sistemi informatici
Comprende le attività svolte durante il periodo di esistenza di un sistema informatico:
- **definizione strategica**: vengono prese le decisioni sull'area aziendale che deve essere oggetto di automazione
- **pianificazione**: vengono definiti gli obiettivi, evidenziati i fabbisogni e viene condotto uno _studio di fattibilità_ per individuare le possibili strategie di attuazione e avere una prima idea dei **costi** e dei **benefici**
- **controllo di qualità**: viene predisposto un _piano di controllo di qualità_ per il progetto, allo scopo di garantire il rispetto delle specifiche e di controllare che il sistema realizzato si comporti come previsto
- **analisi dei requisiti**: formalizza i requisiti avvalendosi di tecniche di modellazione della realtà e produce macro-specifiche per la fase di progettazione
- **progettazione**:
    - **del sistema**: interpreta i requisiti in una soluzione architetturale di massima, produce specifiche indipendenti dai particolari strumenti che saranno usati per la costruzione del sistema
    - **esecutiva**: vengono descritti la struttura e il comportamento dei componenti dell'architettura, producendo specifiche che possano dar luogo, attraverso il ricorso a strumenti di sviluppo opportuni, a un prodotto funzionale
- **realizzazione e collaudo in fabbrica**: il sistema viene implementato sulla piattaforma prescelta e viene testato internamente ($\alpha$-test) sulla base dei casi prova definiti durante la fase di analisi
- **certificazione**: l'attività di certificazione del software ha lo scopo di verificare che esso sia sviluppato secondo i criteri previsti dal metodo tecnico di progetto, in conformità alle specifiche di sistema e a tutta la documentazione di progetto
- **installazione**: il sistema viene installato e configurato, e vengono recuperati gli eventuali dati pregressi
- **collaudo del sistema installato**: gli utenti testano in vitro il prodotto installato ($\beta$-test), si possono evidenziare **errori bloccanti**, **errori non bloccanti, problemi di operatività** e **funzionali**.
- **esercizio**: quando il collaudo dà esito positivo il sistema viene avviato, _messo in produzione_, inizialmente affiancando e poi sostituendo gradualmente l'eventuale sistema precedente
- **diagnosi e manutenzione**: durante l'esercizio gli utenti rilevano eventuali errori; successivamente gli errori che si manifestano durante il funzionamento vengono segnalati e corretti, **manutenzione correttiva**, può essere necessario intervenire sul software per adattarlo ai cambiamenti del dominio applicativo, **manutenzione adattiva**
- **evoluzione**: si valutano le possibilità di far evolvere il sistema incorporando nuove funzionalità o migliorarne l'operatività (**manutenzione evolutiva** o **perfettiva**)
- **messa fuori servizio**:
  
## Analisi dei requisiti
Lo scopo in questa fase è produrre, utilizzando tecniche di modellazione della realtà, un documento di **specifica dei requisiti** che diventi l'input per le successive fasi di progettazione e realizzazione. L'oggetto dell'analisi è l'organizzazione nel suo complesso:
- sottosistemi aziendali
- risorse
- processi
- flussi informativi
### Specifica dei requisiti
La specifica dei requisiti è un accordo tra il produttore di un servizio e il suo consumatore. In questa fase del ciclo di vita, attraverso la specifica dei requisiti l'utente finale e il progettista si accordano sulle funzionalità messe a disposizione dal software.
Le difficoltà per questo tipo di specifica è data dalla diversità dei linguaggi usati dalle due parti. Qualità per la specifica dei requisiti:
- **chiarezza**, ogni specifica deve indicare quanto più chiaramente possibile le operazioni e i soggetti del processo che descrive
- **non ambiguità**, il processo descritto dalla specifica deve essere definito in modo completo e dettagliato
- **consistenza**, le specifiche non devono contenere punti contraddittori
### Alcune definizioni
- **De Marco**: l'analisi è lo studio di un problema, prima di intraprendere qualche azione
- **Coad**: l'analisi è lo studio del dominio di un problema, che porta a una specifica del comportamento _esternamente osservabile_; una descrizione _completa_, _coerente_ e _fattibile_ di ciò che occorre realizzare; una trattazione quantitativa delle caratteristiche operazionali
- **Davis**: l'analisi del problema è il momento in cui viene definito lo spazio del prodotto; la descrizione del prodotto comporta la scelta di una soluzione e l'esplicitazione del comportamento esterno del prodotto dimostrando che esso soddisfa i requisiti
### Cosa e come modellare
Il processo di analisi è **incrementale** e porta per passi successivi alla stesura di un insieme di documenti in grado di **rappresentare un modello dell'organizzazione** e comunicare, in modo **non ambiguo**, una descrizione **esauriente**, **coerente** e **realizzabile** dei vari aspetti statici, dinamici e funzionali di un sistema informatico
## Metodi di analisi
Differenti problemi richiedono differenti approcci e differenti strumenti di analisi:
- Analisi orientata agli **oggetti**
- Analisi orientata alle **funzioni**
- Analisi orientata agli **stati**
### Analisi orientata agli oggetti
L'enfasi è posta sull'identificazione degli oggetti e sulle interrelazioni tra oggetti. Sono aspetti statici e non variano molto nel tempo a differenza degli altri.
![[TerzoAnno/HighPerformance/assets/Untitled.png]]
Nel tempo le proprietà strutturali degli oggetti osservati restano abbastanza stabili, mentre l'uso degli oggetti che si fa può mutare in modo sensibile.
![[TerzoAnno/HighPerformance/assets/Untitled 1.png]]
### Analisi orientata alle funzioni
L'obiettivo è rappresentare un sistema come:
- un insieme di **flussi informativi**
- una rete di **processi** che trasformano flussi informativi
![[TerzoAnno/HighPerformance/assets/Untitled 2.png]]
Ciò corrisponde alla progressiva costruzione di una gerarchia funzionale.
![[TerzoAnno/HighPerformance/assets/Untitled 3.png]]
Non molto utilizzata attualmente
### Analisi orientata agli stati
Per alcune categorie di applicazioni può essere utile pensare fin dall'inizio in termini di **stati** operativi, in cui si può trovare il sistema allo studio, e **transizioni di stato**. Si concentrano principalmente sul tempo, o meglio come lo stato di un oggetto varia nel tempo. Per questo è detto **aspetto dinamico**.
![[TerzoAnno/HighPerformance/assets/Untitled 4.png]]
### Uso dei metodi d'analisi
La tendenza attuale è integrare metodi dei tre tipi, tenendo però conto della tipologia di applicazione:
- **Applicazioni orientate agli oggetti**, l'aspetto più significativo è costituito dalle informazioni, le funzioni svolte sono relativamente semplici (aspetti statici)
- **Applicazioni orientate alle funzioni**, la complessità risiede nel tipo di trasformazione input-output operata (aspetti funzionali)
- **Applicazioni orientate al controllo**, l'aspetto più significativo da modellare è la sincronizzazione fra diverse attività cooperanti nel sistema (aspetti dinamici)
## Il ruolo dell'astrazione
Molteplici sono le relazioni in gioco fra oggetti, funzioni e stati e molteplici i livelli di possibile dettaglio:
- Gli **oggetti** possono essere descritti a partire da termini molto generici, _edificio_ o _strada_, fino ad arrivare a livello di dettaglio specifici, _la torre degli Asinelli_ o _via Saragozza_
- Le **funzioni** possono essere espresse inizialmente in modo vago, _controllare il livello di gas nocivi nell'aria_, e successivamente precisate, _la programmazione del livello di soglia per l'allarme della centralina viene attivata premendo il pulsante P_
- Gli **stati** possono essere descritti a un elevato livello di astrazione, _la centralina è in stato di errore_, o specificanti in maggior dettaglio, _è acceso il segnalatore di errore nel sensore S_
## Meccanismi di Astrazione
I principali meccanismi di astrazione usati durante il processo di analisi per costruire una base di conoscenza sul problema sono **classificazione**, **generalizzazione**, **aggregazione** e **associazione**.
### Classificazione
La classificazione consente di raggruppare in classi oggetti, funzioni, o stati in base alle loro proprietà
![[TerzoAnno/HighPerformance/assets/Untitled 5.png]]
### Generalizzazione
La generalizzazione cattura le relazioni **è-un** ovvero permette di astrarre le caratteristiche comuni fra più classi definendo **superclassi**
![[TerzoAnno/HighPerformance/assets/Untitled 6.png]]
### Aggregazione
L'aggregazione esprime le relazioni **parte-di** che sussistono tra oggetti, tra funzioni, tra stati
![[TerzoAnno/HighPerformance/assets/Untitled 7.png]]
## Associazioni
Oltre ai meccanismi citati è importante modellare le associazioni che sussistono fra le varie classi
![[TerzoAnno/HighPerformance/assets/Untitled 8.png]]
## Linguaggi per la specifica dei requisiti
- **Linguaggi informali**: il linguaggio naturale, alla base della comunicazione durante le interviste tra analista e utente, non può essere adottato come unico mezzo per produrre documenti di specifica per le innumerevoli ambiguità di significato
- **Linguaggi semiformali**: notazione grafica, che presenta una semantica sfumata, accoppiata con descrizioni in linguaggio naturale (E/R, DFD)
- **Linguaggi formali**: linguaggi di specifica algebrici o basati sulla logica dei predicati, oppure concettuali per basi di dati
La diversità degli obiettivi posti dalla specifica dei requisiti implica l'utilizzo di notazioni diverse per la rappresentazione delle informazioni:
- **Formalismi operazionali**, definiscono il sistema descrivendone il comportamento, normalmente mediante un modello.
    - _E è il percorso che si ottiene muovendosi in modo che la somma delle distanze tra due punti fissi p1 e p2 rimanga invariata_
- **Formalismi dichiarativi**, definiscono il sistema dichiarando le proprietà che esso deve avere. Questo approccio fornisce una rappresentazione che non si presta ad ambiguità
	 - $ax^2 + by^2 + c = 0$
L'approccio operazionale fornisce una rappresentazione più semplice poiché più simile al modi di ragionare della mente umana:
- facilità di acquisizione
- facilità di verifica della correttezza
- facilità di comprensione da parte dei programmatori
## Progettazione
Riguarda tutte quelle attività che permettono di passare dalla raccolta ed elaborazione dei requisiti di un sistema software alla sua effettiva realizzazione, pertanto fa da ponte tra la fase di specifica e la fase di codifica.
Durante questa fase si decidono le modalità di passaggio da “che cosa” deve essere realizzato a “come” la realizzazione deve avere luogo. Il sistema complessivo viene suddiviso in più sottosistemi.
A seconda della tecnica impiegata per la progettazione, la realizzazione del sistema può risultare più o meno naturale ed immediata.
Non esiste un metodo generale per la progettazione del software, ma occorre considerare le tipologie di software che di deve progettare. Ad una stessa specifica possono corrispondere più progetti, ossia più metodi di soluzione diversi.
Le scelte di progetto devono poter cambiare in risposta a mutate esigenze di vario tipo senza che per questo tutto il progetto e perciò tutto il software prodotto debba essere modificato radicalmente.
### Vantaggi
- la complessità delle singole parti è minore della complessità totale originaria
- i sottosistemi ottenuti possono essere realizzati ed analizzati da gruppi diversi di programmatori in modo il più possibile indipendente
### Obiettivi
Produrre un software con le caratteristiche di qualità che sono state dettagliate nella fase di analisi e specifica dei requisiti:
- **affidabilità**
- **modificabilità**
- **comprensibilità**
- **riusabilità**
…obiettivi che si possono riassumere nella diminuzione dei costi e tempi di produzione e nell'aumento della qualità del software.
I **costi maggiori** riguardano la **fase di manutenzione** del software, ovvero la capacità di far fronte a modifiche da effettuare senza che l'intera struttura dell'applicazione già costruita debba essere messa nuovamente in discussione ed elaborata.
# Il paradigma a oggetti
I concetti fondamentali sono:
- ereditarietà
- polimorfismo - late binding
- delegazione
- oggetto
- astrazione
- classe
- incapsulamento
## Oggetti
Sono gli elementi base del paradigma, e corrispondono a entità non necessariamente “fisiche” del dominio applicativo
![[TerzoAnno/HighPerformance/assets/Untitled 9.png]]
### Definizione
Un **oggetto** è un individuo sostanziale che possiede un identità e un insieme di proprietà, che ne rappresentano lo stato e il suo comportamento. È caratterizzato da:
- **identità** (**OID - Object IDentifier**), che gli viene associata all'atto della creazione, non può essere modificata ed è indipendente dallo stato corrente dell'oggetto
- **stato**, definito come l'insieme dei valori assunti a un certo istante da un insieme di **attributi**
- **comportamento**, definito da un insieme di **operazioni**
Poiché un oggetto può anche includere riferimenti ad altri oggetti, risulta possibile creare **oggetti complessi**.
### Operazioni e interfaccia
Ogni operazione dichiarata da un oggetto specifica il **nome** dell'operazione, gli oggetti che prende come **parametri** e il **valore restituito** (_**signature**_), l'oggetto su cui l'operazione opera è definito implicitamente.
L'insieme di tutte le signature delle operazioni di un oggetto sono dette _**interfaccia**_ dell'oggetto, quest'ultima specifica l'insieme completo di tutte le richieste che possono essere inviate dall'oggetto.
### Tipo di dato astratto
È una rappresentazione di un insieme di oggetti “simili”, caratterizzato da una **struttura** per i dati e da un'**interfaccia** che definisce quali sono le operazioni associate agli oggetti, ovvero l'insieme dei **servizi** implementati.
Un tipo è **sottotipo** di un **supertipo** se la sua interfaccia contiene quella del **supporto.**
- un sottotipo eredita l'interfaccia del suo supertipo
- l'interfaccia non vincola l'implementazione del servizio offerto ovvero il comportamento effettivo
- oggetti con la stessa interfaccia possono avere implementazioni completamente diverse
## Classe
Fornisce una realizzazione di un tipo di dati astratto, specifica cioè un'implementazione per i metodi a esso associati.
_Un oggetto è sempre istanza di esattamente una classe_
Tutti gli oggetti di una classe hanno gli stessi **attributi** e **metodi**. Esistono metodi di due tipi:
- quelli che restituiscono astrazioni significative sullo stato dell'oggetto cui sono applicati
- quelli che ne alterano lo stato
![[TerzoAnno/HighPerformance/assets/Untitled 10.png]]
### Incapsulamento
Protegge l'oggetto nascondendo lo stato dei dati e l'implementazione delle sue operazioni; un **oggetto** incapsula i dati, **attributi**, e le procedure, **operazioni**, che li possono modificare.
Il principio di **incapsulamento** sancisce che gli attributi di un oggetto possono essere letti e manipolati solo attraverso l'interfaccia che l'oggetto stesso mette a disposizione.
I dettagli dell'implementazione di una classe sono **privati**, cioè manipolabili direttamente solo dai metodi della classe e quindi protetti; l'accesso dall'esterno agli attributi della classe avviene attraverso una ristretta **interfaccia pubblica**, costituita da un sottoinsieme dei metodi della classe.
Un oggetto esegue una operazione quando riceve una richiesta, **messaggio**, da un oggetto client.
**Vantaggi**
- Per l'utilizzo di una classe è sufficiente conoscerne l'interfaccia pubblica; i dettagli implementativi sono nascosti all'interno
- La modifica dell'**implementazione** di una classe non si ripercuote sull'applicazione, a patto che non ne venga variata l'interfaccia
- Poiché la manipolazione diretta degli attributi della classe avviene esclusivamente tramite i suoi metodi, viene fortemente ridotta la possibilità di **errori** nella gestione dello stato degli oggetti
- Il **debugging** delle applicazioni è velocizzato, poiché l'incapsulamento rende più semplice identificare la sorgente di un errore
### Operazioni e metodi
Un **metodo** cattura l'implementazione di una operazione, i metodi possono essere classificati in:
- **costruttori**, per costruire oggetti a partire da parametri di ingresso restituendo l'OID dell'oggetto costruito
- **distruttori**, per cancellare gli oggetti ed eventuali altri oggetti ad essi collegati
- **accessori**, per restituire informazioni sul contenuto degli oggetti (proprietà derivate)
- **trasformatori**, per modificare lo stato degli oggetti e di eventuali altri oggetti ad essi collegati
I metodi possono essere **pubblici**, **protetti**, **privati**.
### Ereditarietà
Il meccanismo di ereditarietà permette di basare la definizione e implementazione di una classe su quelle di altre classi. È possibile definire relazioni di specializzazione/generalizzazione tra classi: la classe generalizzante viene detta **superclasse**, la classe specializzante viene detta **sottoclasse** o **classe derivata**.
Ciascuna sottoclasse ereditata dalla sua superclasse la struttura ed i comportamenti, ovvero gli **attributi**, i metodi e l'interfaccia; può però specializzare le caratteristiche ereditate e aggiungere caratteristiche specifiche non presenti nella superclasse.
![[TerzoAnno/HighPerformance/assets/Untitled 11.png]]
Si parla di **ereditarietà multipla** quando una sottoclasse può essere derivata contemporaneamente da più sottoclassi, in caso di conflitti tra attributi o metodi ereditati da due superclassi, occorre individuare opportune strategie di risoluzione.
Poiché una classe derivata può essere ulteriormente specializzata, si vengono a formare **gerarchie** di classi, strutturate come alberi in caso di ereditarietà singola e come reticoli in caso di ereditarietà multipla.
### Polimorfismo
_Capacità di assumere forme molteplici_
Nel paradigma a oggetti si usa questo termine per alludere alla possibilità di creare metodi con lo stesso nome ma implementazioni differenti. Tramite il meccanismo di **overload** è possibile definire, all'interno di una stessa classe, più metodi con lo stesso nome ma **signature** differenti. A fronte di un messaggio inviato per invocare il metodo, sarà il sistema a scegliere l'implementazione da considerare, sulla base della struttura del messaggio stesso.
Possibilità di ridefinire, all'interno di una sottoclasse, l'implementazione di un metodo ereditato, **override**.
![[TerzoAnno/HighPerformance/assets/Untitled 12.png]]
### Istanziamento dinamico, _late binding_
Il polimorfismo, abbinato all'istanziamento dinamico, permette a ciascun oggetto di rispondere a uno stesso messaggio in modo appropriato a seconda della classe da cui deriva
![[TerzoAnno/HighPerformance/assets/Untitled 13.png]]
Fino a run-time non si è vincolati a una particolare rappresentazione
Il compilatore deve mappare tutte le sottoclassi di una classe per mantenere traccia di tutti i metodi di una sottoclasse.
## Delegazione
SI parla di delegazione quando un oggetto A contiene al suo interno un riferimento a un altro oggetto B, cosicché A, che risulta essere un **oggetto complesso**, può delegare alcune funzioni alla classe a cui appartiene B.
La **delegazione** costituisce il meccanismo fondamentale per implementare **associazioni tra classi**.
![[TerzoAnno/HighPerformance/assets/Untitled 14.png]]
# Lo sviluppo di sistemi a oggetti
L'obiettivo principale dell'approccio orientato agli oggetti, **OO Object Oriented**, è migliorare la produttività aumentando l'estendibilità e la riusabilità del software e controllando la complessità ed i costi della manutenzione.
## L'approccio funzionale
La _decomposizione funzionale_ è un'analisi di tipo top-down tradizionalmente impiegata nel paradigma procedurale, basata sui concetti di **procedura** e **flusso di dati**.
I blocchi di base dell'applicazione sono i task. **compiti**, che durante l'implementazione daranno luogo a procedure, e sono legati alla specifica soluzione proposta.
### Problemi
- Nessun modello unificante per integrare le diverse fasi: c'è una forte **discrepanza** tra concetto di flusso di dati utilizzato nell'analisi e concetto di gerarchia di compiti utilizzato nella progettazione
- Mancanza di **iterazione** nella progettazione: si adotta il modello a cascata, in cui le attività sono viste come una progressione lineare
- Mancanza di **estendibilità**: non si considerano le possibili evoluzioni del sistema
- Poca attenzione al problema della **riusabilità**: ogni sistema viene riconosciuto a partire da zero, per cui i costi di manutenzione sono alti
- La progettazione dei **dati** viene trascurata, poiché le strutture dati sono determinate dalle strutture procedurali
## L'approccio a oggetti
- **ANALISI**: va dall'inizio del progetto fino all'analisi delle specifiche utente e allo studio di fattibilità
- **DESIGN**: progettazione logica e fisica del sistema
- **IMPLEMENTAZIONE**: scrittura del codice, test di verifica, validazione, manutenzione
I confini tra le fasi non sono più distinti, infatti il centro di interesse è lo stesso: gli **oggetti** e le loro interrelazioni. Il processo di sviluppo OO è **iterativo**, infatti si adotta il _modello a fontana_, in cui lo sviluppo raggiunge un alto livello per poi tornare a un livello precedente e risalire di nuovo
L'ereditarietà permette di aggiungere nuove caratteristiche a un sistema riducendo i costi di manutenzione, **estendibilità**, e di costruire nuove funzionalità a partire dall'esistente, **riusabilità**, riscrivendo solo quella parte di codice inadeguato e solo per gli oggetti che ne hanno bisogno.
### Benefici dell'approccio a oggetti
- La decomposizione è orientata alla modellazione: i blocchi base dell'applicazione sono entità che interagiscono, modellate come classi di oggetti e sono legate alla formulazione originale del problema; i **risultati dell'analisi** non sono un semplice input del design, ma ne sono parte integrante: analisi e design lavorano insieme per sviluppare un modello del dominio del problema
- Il progetto dettagliato è rimandato nel tempo e nascosto all'interno di ciascuna classe: algoritmi e strutture dati non sono più congelati” a un alto livello del progetto; si ha più flessibilità, poiché un cambiamento nell'implementazione non implica variazioni consistenti alla struttura del sistema
- I sistemi sviluppati a oggetti risultano più stabili nel tempo di quelli progettati per decomposizione funzionale
- La produttività è alta, fasi diverse dell'analisi dei requisiti e del ciclo di vita possono essere svolte contemporaneamente
- C'è la possibilità di sviluppare rapidamente **prototipi** che possono risultare di valido ausilio per la certificazione dell'analisi dei requisiti
- È possibile che il design e l'implementazione a classi richiedano tempi elevati, volendo provvedere generalità e riusabilità; a fronte di ciò si ha però una drastica riduzione dei **costi di manutenzione**
## Object-oriented analysis
![[TerzoAnno/HighPerformance/assets/Untitled 15.png]]
### Attività
- Determinare la funzionalità del sistema
- Creare una lista delle classi che sono parte del sistema
- Distribuire le funzionalità del sistema attraverso le classi individuate
**In una buona analisi** le classi sono relativamente piccole e molte sono abbastanza generali da poter essere riusate in futuri progetti. Le responsabilità e il controllo sono distribuiti, in altre parole il progetto non ha un “centro” esplicito.
Poche assunzioni sul linguaggio da utilizzare
## Object-oriented design
![[TerzoAnno/HighPerformance/assets/Untitled 16.png]]
### Attività
- Determinare i metodi e dli attributi di ciascuna classe
- Progettare algoritmi per implementare le operazioni
- Progettare le associazioni
**In un buon design** i percorsi di accesso ai dati sono ottimizzati, e le classi sono raggruppate in moduli
# Unified Modeling Language UML
È un **linguaggio** che definisce una notazione standard, basata sul **metamodello** integrato deli “oggetti” che compongono un sistema software. Non prescrive una sequenza di processo, quindi può essere utilizzato da persone e gruppi che seguono metodi diversi.
**Generalità**
UML fornisce i costrutti per le seguenti fasi dello sviluppo dei sistemi software:
- analisi dei requisiti tramite i casi d'uso
- analisi e progetto OO
- modellazione dei componenti
- modellazione della struttura e della configurazione
Il **modello OOA/OOD** viene espresso tramite dei **diagrammi** grafici; ogni entità del modello può comparire in uno o più diagrammi, che ne rappresentano una proiezione. A ogni entità si possono anche associare vari tipi di documentazione testuale; nei vari diagrammi, tutti i concetti e le entità che presentano similitudini sono espressi con la medesima notazione.
## Diagramma vs modello
In UML c'è distinzione fra i concetti di modello e diagramma:
- **modello**, contiene gli elementi di informazione circa il sistema sotto osservazione
- **diagramma**, è una particolare visualizzazione di alcuni tipi di elementi di un modello
Un certo elemento può comparire in più diagrammi ma è univoca la sua definizione all'interno del modello.
## Struttura di UML
La struttura di UML è composta da:
- **costituenti fondamentali**, sono gli elementi di base
    - entità
    - relazioni
    - diagrammi
- **meccanismi comuni**, sono le tecniche comuni per raggiungere specifici obiettivi
    - specifiche
    - ornamenti
    - distinzioni comuni
    - meccanismi di estendibilità
- **architettura**, l'espressione dell'architettura del sistema
### Entità
Sono tutti gli elementi di modellazione
![[TerzoAnno/HighPerformance/assets/Untitled 17.png]]
### Relazioni
Hanno lo scopo di legare tra loro le entità
![[TerzoAnno/HighPerformance/assets/Untitled 18.png]]
Associazione e Composizione = part-of, il rombo va dalla parte dell'oggetto composto.  
Specializzazione = is-a, gerarchie di classi  
Contenimento = simile a part-of, semantica specifica per i package  
### Diagrammi
Sono le viste sul modello UML
- **Statici**
	- **Diagramma delle classi**, descrive la struttura dati degli oggetti del sistema e le loro relazioni; diagramma da cui si può **generare il codice**
    
    - **Diagramma degli oggetti**, mostra un insieme di interesse e le loro relazioni
    - **Diagramma dei package**, mostra i package e le loro relazioni di dipendenza, contenimento e specializzazione
    - **Diagramma dei componenti**, descrive l'architettura software del sistema
    - **Diagramma di deployment**, descrive la struttura del sistema hardware e l'allocazione dei vari moduli software
- **Dinamici**
    - **Diagramma dei casi d'uso** elenca i casi d'uso del sistema e le loro relazioni
    - **Diagramma degli stati**, usa la notazione degli automi di Harel per descrivere gli stati degli oggetti di una classe
    - **Diagramma di attività**, descrive le sequenze eventi-azioni-transizioni di una funzione
    - **Diagramma di interazione**, mostra le interazioni tra gli oggetti durante scenari di funzionamento del sistema
        - Diagramma di sequenza
        - Diagramma di comunicazione
### Specifiche
Sono la descrizione testuale della semantica di un elemento
![[TerzoAnno/HighPerformance/assets/Untitled 19.png]]
### Ornamenti
Rendono visibili gli aspetti particolari della specifica dell'elemento
![[TerzoAnno/HighPerformance/assets/Untitled 20.png]]
## Distinzioni comuni
- **Classificazione/istanza**: separa la nozione astratta di un'entità dalle sue concrete istanze. Un'**istanza** ha di solito la stessa forma del classificatore, ma con il nome sottolineato
![[TerzoAnno/HighPerformance/assets/Untitled 21.png]]
- **Interfaccia/implementazione**: separa “cosa” un oggetto fa da “come” lo fa. Un'interfaccia definisce un contratto che ciascuna sua implementazione garantisce di rispettare
![[TerzoAnno/HighPerformance/assets/Untitled 22.png]]
## Meccanismi di estendibilità
Uno **stereotipo** rappresenta una variazione di un elemento di modellazione esistente, con la stessa forma ma diverso scopo. Permette quindi di introdurre nuovi elementi di modellazione a partire da quelli esistenti, o predefiniti o introdotti dall'utente.
Una **proprietà** è un valore associato a un elemento del modello, espresso da una stringa associata all'elemento:
`{ author = "Joe Smith", status = analysis} { abstract }`
Un **vincolo** è una frase di testo che definisce una condizione o una regola che riguarda un elemento del modello e deve risultare sempre vera
`{ disjoint, complete } { subset }`
Un **profilo** è un insieme di stereotipi, valori etichettati che definiscono proprietà e vincoli, usato per personalizzare UML
## Architettura
- **Vista dei casi d'uso** descrive le funzionalità del sistema come vengono percepite dagli utenti, dagli analisti e dagli esecutori del testing. Non specifica l'organizzazione del software ma è la basa per le altre viste
- **Vista logica**, stabilisce la terminologia del dominio del problema sotto forma di classi e oggetti, illustrando come essi implementano il comportamento richiesto
- **Vista dei processi**, è una variante orientata ai processi della vista logica; modella i thread e i processi sotto forma di classi attive
- **Vista di implementazione**, descrive i moduli implementativi e le loro dipendenze, illustrandone la configurazione così da definire il concetto di versione del sistema
- **Vista di deployment**, mostra la distribuzione fisica del sistema software sull'architettura hardware
# Diagrammi dei casi d'uso
Rappresentano i ruoli di indirizzo del sistema da parte di uno o più utilizzatori:
- esseri umani
- organizzazioni, enti, istituzioni
- altre applicazioni o sistemi
Descrivono l'**interazione** tra attori e sistema, non la logica interna della funzione né la struttura del sistema. Sono espressi in **forma testuale**, comprensibile a tutti
## Attore
Un **attore** identifica il ruolo che un'entità esterna assume quando interagisce direttamente con il sistema. È sempre esterno al sistema, anche se esso ne può mantenere una rappresentazione interna. **Esegue i casi d'uso**.
## Caso d'uso
Un **caso d'uso** è la specifica di una sequenza di azioni che un sistema, un sottosistema o una classe può eseguire interagendo con attori esterni. È una funzionalità come percepita da un attore, produce un risultato utile osservabile dall'attore.
![[TerzoAnno/HighPerformance/assets/Untitled 23.png]]
![[TerzoAnno/HighPerformance/assets/Untitled 24.png]]
Da notare che le precondizioni non vanno inserite negli include (inclusione tra casi d'uso)
### Ruolo dei casi d'uso
Nelle fasi iniziali della progettazione servono per chiarire cosa dovrà fare il sistema. I casi d'uso guidano l'intero progetto di sviluppo, costituiscono il punto di partenza per la progettazione del sistema.
### Identificare i casi d'uso
1. Individuare i confini del sistema
2. Identificare tutte le tipologie di utilizzatori del sistema
3. Per ogni tipologia di attore, rilevare in quale modo utilizzerà il sistema, partendo dagli obiettivi che egli deve raggiungere. A ogni modalità di utilizzo corrisponde un caso d'uso
4. Per ogni caso d'uso, descrivere lo scenario base, e le principali varianti a tale scenario. Cosi facendo possono emergere necessità di interazione del sistema con altri soggetti
## Scenari
Ogni specifica esecuzione, istanza, di un caso d'uso è detta **scenario**. Esistono scenari di **successo** e scenari di **fallimento**.
La prassi più diffusa per la descrizione degli scenari di un caso d'uso è quella di definire uno **scenario base**, cioè lo scenario più semplice possibile che porta al successo del caso d'uso.
Allo scenario base vengono quindi agganciate delle **varianti** che lo rendono più complesso e possono portare al successo o al fallimento del caso d'uso.
### Specifiche del caso d'uso
UML non suggerisce il modo per specificare un caso d'uso, ma viene comunque effettuata.
La **specifica del caso d'uso** ha un ruolo centrale nella comunicazione tra i diversi soggetti coinvolti nello sviluppo di un sistema, dal committente agli utilizzatori, dai progettisti agli specialisti di test.
Un caso d'uso può essere anche descritto da un **diagramma di attività** o **di sequenza**.
![[TerzoAnno/HighPerformance/assets/Untitled 25.png]]
## Realizzare i casi d'uso
La realizzazione dei casi d'uso può essere espressa con una **collaborazione** costituita da classi che interagendo tra loro svolgono i passi specificati nel caso d'uso.
La collaborazione che realizza un caso d'uso può essere descritta:
- **livello statico**, mediante un diagramma delle classi che evidenzi le classi o gli oggetti coinvolti nella collaborazione
- **livello dinamico**, mediante un diagramma di interazione che evidenzi i messaggi che gli oggetti si scambiano nell'ambito della collaborazione
![[TerzoAnno/HighPerformance/assets/Untitled 26.png]]
# Diagramma delle classi
Sono il nucleo fondamentale di UML, descrivono la struttura del sistema in termini di classi e loro relazioni reciproche.
- una **classe** descrive un gruppo di oggetti con proprietà, comportamento e relazioni comuni
- un **attributo** è un valore che caratterizza gli oggetti di una classe
- un'**operazione** è una trasformazione che può essere applicata a gli oggetti di una classe. Ogni operazione ha come argomento implicito l'oggetto di destinazione
![[TerzoAnno/HighPerformance/assets/Untitled 27.png]]
## Notazione
### Attributi

> [!important]
> 
> `visibilità` nome `molteplicità` : `tipo` = `valoreDefault`
- **visibilità**
    - pubblica +
    - privata -
    - protetta #
    - package ~
- **molteplicità**
    - `Strin[5]`, `Real[2..*]`, `Boolean[0..1]`
- **tipo**
    - `Integer`, `UnlimitedNatural`, `Real`
    - `Boolean`
    - `String`
- **ambito**
    - istanza
    - classe
### Operazioni

> [!important]
> `visibilità` nome `(parametro, …)` : `tipoRestituito`
> 
> **nome + parametri + tipo restituito =** _**signature**_
- **parametri**
    - `direzione nomeparametro: tipoParametro=valoreDefault`
- **direzione**
    - in
    - out
    - inout
    - return
- **ambito**
    - istanza
    - classe
## Diversi livelli di astrazione
![[TerzoAnno/HighPerformance/assets/Untitled 28.png]]
## Relazioni tra classi
- Generalizzazione
- Associazione
- Dipendenza
- Aggregazione
- Composizione
- Raffinamento
![[TerzoAnno/HighPerformance/assets/Untitled 29.png]]
### Associazione
È una connessione tra classi, tipicamente bidirezionale; è possibile indicare il **verso di lettura** di una associazione, definire associazioni **monodirezionali**, specificare **ruoli**.
![[TerzoAnno/HighPerformance/assets/Untitled 30.png]]
1 poligono ha almeno 3 linee, 1 linea ha estremi 2 punti;  
2 punti sono estremi di n linee, 3 linee sono i lati di un poligono  
![[TerzoAnno/HighPerformance/assets/Untitled 31.png]]
Le **associazioni qualificate** riducono un'associazione molti-a-molti a una del tipo uno-a uno, specificando un attributo che permette di selezionare un unico oggetto destinazione svolgendo il ruolo di identificatore o chiave di ricerca
![[TerzoAnno/HighPerformance/assets/Untitled 32.png]]
È possibile definire **associazioni n-arie**, cioè tra n classi, ogni istanza dell'associazione è una tupla formata da n oggetti delle rispettive classi. La molteplicità di un ruolo rappresenta il numero di istanze dell'associazione quando sono stati fissati $n-1$ oggetti.
![[TerzoAnno/HighPerformance/assets/Untitled 33.png]]
### Aggregazione
L'aggregazione è un caso speciale di associazione con semantica _part-of_.
![[TerzoAnno/HighPerformance/assets/Untitled 34.png]]
connessione per riferimento
### Composizione
È un'aggregazione in cui il tutto “possiede” le sue parti, le parti esistono solo in relazione al tutto; ogni parte appartiene esattamente ad un tutto.
![[TerzoAnno/HighPerformance/assets/Untitled 35.png]]
connessione per valore
**Classi astratte**
Sono classi che non possono essere istanziate da oggetti, sono utili come radici di **gerarchie di specializzazione**.
![[TerzoAnno/HighPerformance/assets/Untitled 36.png]]
### Generalizzazione
Tutti gli attributi, le operazioni e le relazioni della superclasse vengono **ereditati** dalle sottoclassi. È supportata l'ereditarietà multipla, possono essere indicati **insiemi di generalizzazione** e **vincoli** (_overlapping_, _disjoint_, _complete_, _incomplete_).
![[TerzoAnno/HighPerformance/assets/Untitled 37.png]]
**Powertyping**
Un **powertype** è una (meta)classe le cui istanze sono classi che specializzano un'altra classe.
![[TerzoAnno/HighPerformance/assets/Untitled 38.png]]
### Dipendenza
In generale, A dipende da B _quando una variazione in_ B _può comportare una variazione di_ A.
Nel caso delle classi, una dipendenza indica che una classe cliente dipende da alcuni servizi di una classe fornitore, ma non ha una struttura interna che dipende da quest'ultima.
![[TerzoAnno/HighPerformance/assets/Untitled 39.png]]
Più specificatamente, si può rappresentare il fatto che un'operazione della classe cliente ha argomenti che appartengono al tipo di un'altra classe.
![[TerzoAnno/HighPerformance/assets/Untitled 40.png]]
**Template**
Un **template**, o **classe parametrizzata**, è utilizzato per descrivere una classe in cui uno o più parametri formali non sono istanziati. Un template definisce una famiglia di classi in cui ogni classe è specificata istanziando i parametri con i valori attuali.
Un **bound element** è una classe che istanzia i parametri di un template, e può essere utilizzato esattamente come una classe.
![[TerzoAnno/HighPerformance/assets/Untitled 41.png]]
### Raffinamento
Esprime una relazione tra due descrizioni dello stesso concetto a diversi livelli di astrazione:
- tra un tipo astratto e una classe che lo realizza
- tra una classe di analisi e una di progetto
- tra una implementazione semplice e una complessa della stessa cosa
![[TerzoAnno/HighPerformance/assets/Untitled 42.png]]
**Interfaccia**
Una **interfaccia** è un insieme di funzionalità pubbliche identificate da un nome; specifica le operazioni pubbliche di una classe, di un componente, di un pacchetto o di altre entità, separandone le specifiche dall'implementazione.
Una interfaccia non ha alcuna specifica di struttura interna; è una classe astratta, senza attributi né associazioni e con solo operazioni astratte, senza implementazione.
![[TerzoAnno/HighPerformance/assets/Untitled 43.png]]
Notazione estesa
![[TerzoAnno/HighPerformance/assets/Untitled 44.png]]
Notazione abbreviata
## Analisi vs Progettazione
- **Classi di analisi**: rappresentano un'astrazione nel dominio del problema, corrispondono chiaramente a concetti concreti del mondo del business escludendo tutti i dettagli implementativi. Hanno un insieme ridotto coeso e bend definito di responsabilità, indicano tutti gli attributi che saranno _probabilmente_ inclusi nelle classi di progettazione. ==Le loro operazioni specificano i principali servizi offerti dalla classe==
- **Classi di progettazione**: le loro specifiche sono complete per cui possono essere direttamente implementate, nascono dal dominio del problema per il raffinamento delle classi di analisi, oppure dal dominio della soluzione
### Identificare le classi d'analisi
Le classi corrispondono a **entità fisiche** e a **concetti** del dominio applicativo
- evitare di rappresentare soluzioni implementative
- evitare le classi ridondanti, irrilevanti, vaghe
- evitare le classi onnipotenti
![[TerzoAnno/HighPerformance/assets/Untitled 45.png]]
Una classe è associata a un piccolo e ben definito insieme di responsabilità
I nomi delle classi devono riflettere la loro natura intrinseca e non il ruolo giocato nelle associazioni
![[TerzoAnno/HighPerformance/assets/Untitled 46.png]]
### Identificare le associazioni d'analisi
Le **associazioni** sono tipicamente indicate da _verbi_ che esprimono collocazione fisica (**contenuto in**), azioni (**gestisce**), comunicazioni (**parla a**), proprietà (**possiede**), soddisfacimento di condizioni (**sposato a**).
Ogni riferimento da una classe a un'altra è un'associazione
![[TerzoAnno/HighPerformance/assets/Untitled 47.png]]
Un'aggregazione è un'associazione con semantica _part-of_; evitare le associazioni irrilevanti o che esprimono soluzioni implementative.
Un'associazione deve descrivere una proprietà strutturale del dominio, non un evento transitorio
![[TerzoAnno/HighPerformance/assets/Untitled 48.png]]
Molte associazioni ternarie possono essere scomposte in due associazioni binarie.
### Identificare gli attributi
Le **proprietà** di classi e associazioni sono attributi, gli attributi spesso corrispondono a nomi seguiti da possessivi.
Omettere o evidenziare gli attributi derivati è fondamentale.
![[TerzoAnno/HighPerformance/assets/Untitled 49.png]]
Se una proprietà dipende dalla presenza di un'associazione, rappresentarla con un attributo dell'associazione
![[TerzoAnno/HighPerformance/assets/Untitled 50.png]]
Non aggiungere agli attributi gli identificatori degli oggetti, a meno che non risultino esplicitamente dalle specifiche
![[TerzoAnno/HighPerformance/assets/Untitled 51.png]]
Quando gli attributi di una classe possono essere raggruppati in due o più insiemi, probabilmente la classe dovrebbe essere suddivisa in due o più classi
### Raffinamenti
La possibilità di raffinare il modello deriva dalla natura iterativa dell'approccio a oggetti.
I raffinamenti tramite ereditarietà possono avvenire top-down o bottom-up.
Se esistono più associazioni con lo stesso nome e scopo, conviene generalizzare per creare la superclasse che le unisce
![[TerzoAnno/ComputerGraphics/assets/Untitled 52.png]]
Se un ruolo incide sostanzialmente sulla semantica della classe, può convenire trasformarlo in una classe
![[TerzoAnno/ComputerGraphics/assets/Untitled 53.png]]
### Identificare le classi di progettazione
Con le classi di progettazione si specifica esattamente come le classi **assolveranno le loro responsabilità**, ciascuna classe deve essere:
- **completa**, ossia fornire ai suoi clienti tutti i servizi che essi si aspettano
- **sufficiente**, ossia i suoi metodi devono essere esclusivamente finalizzati allo scopo della classe
- **essenziale**, ossia non mettere a disposizione di più di un modo per effettuare la stessa operazione
- **massimamente coesa**, ossia modellare un unico concetto esatto
- **minimamente interdipendente**, ossia essere associata all'insieme minimo di classi che le consente di realizzare le proprie responsabilità
Costrutti come le associazioni bidirezionali o le classi associative non sono direttamente implementabili.
Le **associazioni di progettazione** si ottengono da quelle di analisi attraverso una trasformazione basata principalmente sul carico di lavoro cui ciascuna associazione è sottoposta.
Le associazioni di progettazione _devono_ specificare:
- il nome
- il verso di navigabilità
- la molteplicità a entrambi gli estremi
- il nome del ruolo di destinazione

> [!important] **Associazione molti-a-uno, molti-a-molti**
> 
> ![[TerzoAnno/ComputerGraphics/assets/Untitled 54.png]]

> [!important] **Associazioni uno-a-uno, ternarie**
> 
> ![[TerzoAnno/ComputerGraphics/assets/Untitled 55.png]]

> [!important] **Classi associative**
> 
> ![[TerzoAnno/ComputerGraphics/assets/Untitled 56.png]]
# Diagrammi degli oggetti
Un oggetto rappresenta una particolare istanza di una classe; un **oggetto composto** è un oggetto di alto livello che contiene altri oggetti.
![[TerzoAnno/ComputerGraphics/assets/Untitled 57.png]]

> [!important]
> Un **diagramma degli oggetti** è un grafo di istanze di elementi che rappresenta un'istanza di un diagramma delle classi; il suo utilizzo è limitato principalmente a mostrare esempi di strutture dati.
Poiché un diagramma delle classi può contenere anche istanze, un diagramma degli oggetti può essere considerato come un caso particolare di diagramma delle classi in cui compaiono solo oggetti
![[TerzoAnno/ComputerGraphics/assets/Untitled 58.png]]
# Diagramma dei package

> [!important]
> Un **package** è un raggruppamento di elementi del modello semanticamente correlati
Si possono rappresentare le **relazioni tra package** come relazioni di _contenimento_, si consiglia di mostrare al massimo due livelli. I package annidati vedono lo spazio dei nomi dei package che li contengono, il contrario non è vero
![[TerzoAnno/ComputerGraphics/assets/Untitled 59.png]]
Esistono quattro tipi di **dipendenza** tra package:
- `<<use>>`, quando un elemento del package cliente usa in qualche modo un elemento del package fornitore
- `<<import>>`, quando gli elementi pubblici dello spazio dei nomi del package fornitore vengono aggiunti come elementi pubblici allo spazio dei nomi del package cliente
- `<<access>>`, quando gli elementi privati dello spazio dei nomi del package fornitore vengono aggiunti come elementi privati allo spazio dei nomi del package cliente
- `<<trace>>`, rappresenta l'evoluzione di un elemento in un altro elemento più dettagliato
![[TerzoAnno/ComputerGraphics/assets/Untitled 60.png]]
Esiste una **generalizzazione** tra due package quando il package specifico si deve conformare all'interfaccia del package generale
![[TerzoAnno/ComputerGraphics/assets/Untitled 61.png]]
## Individuare i package d'analisi
I package d'analisi sono gruppi di elementi del modello accomunati da forti correlazioni semantiche; la fonte migliore per individuarli è il **diagramma delle classi**. I migliori candidati per essere raggruppati nello stesso package sono:
- le classi appartenenti a **gerarchie di composizione**
- le classi appartenenti a **gerarchie di specializzazione**
Anche il **diagramma dei casi d'uso** può servire: uno o più casi d'uso che supportano un processo aziendale o un attore potrebbero indicare un package
# Diagrammi di interazione
Rappresentano la struttura dell'interazione tra oggetti durante uno scenario. Esistono quattro tipi di diagrammi di interazione, ognuno rivolto a un particolare aspetto:
- **Diagrammi di sequenza**: enfatizza la sequenza temporale degli scambi di messaggi
- **Diagramma di comunicazione**: enfatizza le relazioni strutturali tra gli oggetti che interagiscono
- **Diagramma di sintesi dell'interazione**: illustra come un comportamento complesso viene realizzato da un insieme di interazioni più semplici
- **Diagramma di temporizzazione**: enfatizza gli aspetti real-time di un'interazione
## Terminologia
- Una **interazione** è un'unità di comportamento di un classificatore che ne costituisce il contesto; essa comprende un insieme di messaggi scambiati tra linee di vita all'interno del contesto per ottenere un obiettivo
- Il **contesto** può essere dato dall'intero sistema, da un sottosistema, da un caso d'uso, da un'operazione, da una classe
- Una **linea di vita** rappresenta come un'istanza di un classificatore partecipa all'interazione
- Un **messaggio** rappresenta un tipo specifico di comunicazione istantanea tra due linee di vita in un'interazione, e trasporta informazioni nella prospettiva che seguirà una attività
### Linee di vita
Sono disegnate con lo stesso simbolo del loro classificatore; possono avere una “coda” a forma di riga verticale tratteggiata. Non rappresentano specifiche istanze del classificatore, ma _modi_ in cui le istanze partecipano all'interazione
![[TerzoAnno/ComputerGraphics/assets/Untitled 62.png]]
### Messaggi
- **messaggi di chiamata**
- **messaggi di creazione**
- **messaggi di distruzione**
- **invio di segnali**
Per ogni messaggio di chiamata ricevuto da una linea di vita, deve esistere un'operazione corrispondente nel classificatore di quella linea di vita
![[TerzoAnno/ComputerGraphics/assets/Untitled 63.png]]
- **messaggio sincrono**, il mittente aspetta che il destinatario ritorni
![[TerzoAnno/ComputerGraphics/assets/Untitled 64.png]]
- **messaggio asincrono**, il mittente continua l'esecuzione
![[TerzoAnno/ComputerGraphics/assets/Untitled 65.png]]
- **messaggio di ritorno**, il destinatario restituisce il controllo al mittente
![[TerzoAnno/ComputerGraphics/assets/Untitled 66.png]]
- **creazione di un oggetto**, si crea un'istanza del classificatore destinatario
![[TerzoAnno/ComputerGraphics/assets/Untitled 67.png]]
- **distruzione di un oggetto**, il mittente distrugge il destinatario
## Diagrammi di sequenza
Mostrano le interazioni tra linee di vita come una sequenza di messaggi ordinati temporalmente.
Sono la forma più ricca e flessibile di diagramma di interazione, hanno due **dimensioni**: la dimensione verticale rappresenta il tempo, mentre quella orizzontale rappresenta le linee di vita.
Un'**attivazione** mostra il periodo durante il quale una linea di vita esegue un'azione o direttamente o attraverso una procedura subordinata; rappresenta sia la durata dell'azione nel tempo sia la relazione di controllo tra l'attivazione e i suoi chiamanti.
![[TerzoAnno/ComputerGraphics/assets/Untitled 68.png]]
Quando un'istanza riceve un messaggio, il suo stato può cambiare.
Lo **stato** delle istanze può essere mostrato sulla linea di vita.
Un **vincolo** posto sulla linea di vita indica una condizione sulle istanze che deve essere vera da lì in avanti.
![[TerzoAnno/ComputerGraphics/assets/Untitled 69.png]]
## Diagrammi di stato
I **diagrammi di stato** descrivono in modo esaustivo l-evoluzione temporale delle istanze di un classificatore in risposta alle interazioni con altri oggetti.
Ogni classe può avere associato un diagramma di stato.
![[TerzoAnno/ComputerGraphics/assets/Untitled 70.png]]
Notazione di **Harel**, esprime sottostati, stati composti, parallelismo, dati storici, gestione eventi, operazioni, creazione e distruzione degli oggetti, marcamenti temporali, ecc.
### Stati ed eventi
Lo **stato** di un oggetto in un certo istante è un'astrazione dell'insieme dei valori dei suoi attributi e dei suoi collegamenti; le differenti configurazioni di valori e collegamenti vengono raggruppate in stati a seconda di come incidono sul comportamento macroscopico dell'oggetto.
Un **evento** provoca la transazione tra uno stato e l'altro; un oggetto rimane in uno stato per un tempo finito non istantaneo corrispondente all'intervallo tra due eventi.
Uno stato può contenere azioni e attività:
- le **azioni** sono operazioni istantanee, atomiche e non interrompibili, sono associate a transazioni attivate da eventi
- le **attività** sono operazioni che richiedono un certo tempo per essere completate e possono quindi essere interrotte da un evento
![[TerzoAnno/ComputerGraphics/assets/Untitled 71.png]]
### Transizioni
Una **transizione** marca il passaggio di un oggetto da uno stato ad un altro, ed è associata a uno o più eventi e, opzionalmente, a condizioni e azioni.
Un **evento** avviene ad un preciso istante di tempo, e si assume che abbia durata nulla; gli eventi possono essere raggruppati in classi, eventualmente descritte da attributi.
Una **condizione** è un'espressione booleana che deve risultare vera affinché la transizione possa avvenire.
Un'**azione** è un'operazione istantanea, atomica e non interrompibile che viene eseguita all'atto della transizione
![[TerzoAnno/ComputerGraphics/assets/Untitled 72.png]]
Una transizione che esce da uno stato e non riporta alcun evento indica che la transizione avviene al termine dell'attività
### Tipi di eventi
- **Evento di variazione**: si verifica nel momento in cui una condizione diventa vera, è denotato da un'espressione booleana e può essere considerato come una condizione verificata continuamente sebbene in realtà verrà controllata solo al variare dei parametri coinvolti
- **Evento di segnale**: si verifica nel momento in cui un oggetto riceve un oggetto segnale da un altro oggetto
- **Evento chiamata:** è l'invocazione di una specifica operazione nell'istanza del classificatore che fa da contesto al diagramma, è denotato dalla signature dell'operazione e può essere associato a una sequenza di azioni separate da “;”
- **Evento temporale**: si verifica allo scadere di un periodo di tempo
    - **when**(date=GG/MM/YYYY), specifica il momento della transizione
    - **after**(_time_), specifica che la transizione avviene dopo un _time_ definito dall'entrata dell'automa nello stato attuale; è anche possibile specificare il momento in cui inizia a decorrere il periodo aggiungendo una frase del tipo “_since_”
### **Stati composti**
Uno stato si dice **composto** se contiene altri stati annidati, organizzati in uno o più automi; ogni stato annidato eredita tutte le transizioni dello stato che lo contiene
![[TerzoAnno/ComputerGraphics/assets/Untitled 73.png]]
## Diagrammi di attività
Modellano un processo come un'attività costituita da un insieme di nodi connessi da archi.
Un'attività può essere associata a qualunque elementi di modellazione, che ne diviene il contesto:
- caso d'uso
- operazione
- classe
- interfaccia
- componente
- collaborazione
I diagrammi di attività possono anche essere usati per modellare efficacemente processi di business e workflow.
![[TerzoAnno/ComputerGraphics/assets/Untitled 74.png]]
### Attività
Sono medellate come reti di **nodi** connessi da **archi**.
Categorie di nodi:
- **nodi azione**, rappresentano compiti atomici all'interno dell'attività
- **nodi controllo**, controllano il flusso all'interno dell'attività
- **nodi oggetto**, rappresentano oggetti usati nell'attività
Categorie di archi:
- **flussi di controllo**, rappresentano i flussi di controllo attraverso l'attività
- **flussi di oggetti**, rappresentano il flusso di oggetti attraverso l'attività
### Nodi azione
- **Nodo azione di chimata**
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 75.png]]
    
- **Nodo azione di accettazione evento temporale**
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 76.png]]
    
### Nodi controllo
- **Nodo iniziale**, indica l'inizio del flusso
![[TerzoAnno/ComputerGraphics/assets/Untitled 77.png]]
- **Nodo finale dell'attività**, termina un'attività
![[TerzoAnno/ComputerGraphics/assets/Untitled 78.png]]
- **Nodo finale del flusso**, termina uno specifico flusso
![[TerzoAnno/ComputerGraphics/assets/Untitled 79.png]]
- **Nodo decisione**, divide il flusso in più flussi alternativi
![[TerzoAnno/ComputerGraphics/assets/Untitled 80.png]]
- **Nodo fusione**, ricongiunge i flussi a valle di un nodo decisione
![[TerzoAnno/ComputerGraphics/assets/Untitled 81.png]]
- **Nodo biforcazione**, divide il flusso in più flussi concorrenti
![[TerzoAnno/ComputerGraphics/assets/Untitled 82.png]]
- **Nodo ricongiunzione**, sincronizza i flussi concorrenti
![[TerzoAnno/ComputerGraphics/assets/Untitled 83.png]]
### Nodi oggetto
I nodi oggetto indicano che sono disponibili istanze di una data classe in un punto specifico dell'attività. Gli archi in entrata e uscita dai nodi oggetto rappresentano flussi di oggetti creati e consumati da nodi azione.
È possibile rappresentare esplicitamente lo stato di un oggetto
![[TerzoAnno/ComputerGraphics/assets/Untitled 84.png]]
### Corsie
Le attività possono essere partizionate in **corsie** che raggruppano insiemi di azioni correlate.
Le corsie possono corrispondere a:
- casi d'uso
- classi
- componenti
- unità organizzative
- ruoli
La semantica di ogni insieme di corsie è descritta da una _dimensione_
![[TerzoAnno/ComputerGraphics/assets/Untitled 85.png]]
## Diagramma dei componenti
MOstra i componenti e le loro interdipendenze. Un **componente** è una parte modulare di un sistema che incapsula i suoi contenuti (black box). I componenti possono avere attributi e operazioni, e possono partecipare ad associazioni e generalizzazioni
![[TerzoAnno/ComputerGraphics/assets/Untitled 86.png]]
### Componenti
I componenti possono contenere oggetti, ad indicare che essi ne sono parte integrante. i componenti sono connessi tra loro mediante **dipendenze**, possibilmente tramite **interfacce**, ad indicare che un altro componente usa i servizi di un altro componente.
![[TerzoAnno/ComputerGraphics/assets/Untitled 87.png]]
![[TerzoAnno/ComputerGraphics/assets/Untitled 88.png]]
## Diagramma di deployment
Specifica l'hardware su cui verrà eseguito il software e il modo in cui il software è dislocato sull'hardware. Può avere due forme:
- **descrittore**, contiene nodi, relazioni tra nodi e manufatti; modella _tipi_ di architetture
![[TerzoAnno/ComputerGraphics/assets/Untitled 89.png]]
- **istanza**, contiene istanze di nodi, relazioni tra nodi, di relazioni tra nodi e di manufatti; modella un _deployment_ dell'architettura su un particolare sito
![[TerzoAnno/ComputerGraphics/assets/Untitled 90.png]]
### Nodi
Un **nodo** rappresenta un tipo di risorsa computazionale su cui i manufatti possono essere dislocati per l'esecuzione. Due stereotipi standard:
- `<<device>>`, rappresenta un tipo di periferica fisica, per esempio un PC
- `<<executionEnviroment>>`, rappresenta un tipo di ambiente software di esecuzione, per esempio un web server
I nodi possono essere annidati in nodi. Un'associazione tra nodi rappresenta un canale di comunicazione tra di essi.
Si possono usare ulteriori stereotipi e icone per aumentare la leggibilità del diagramma
### Manufatti
Un manufatto rappresenta un'entità concreta del mondo reale, per esempio:
- file sorgenti
- file eseguibili
- script
- tabelle di database
- documenti
- modelli UML
![[TerzoAnno/ComputerGraphics/assets/Untitled 91.png]]
## Benifici di UML
È la risposta ai problemi legati allo sviluppo di sistemi complessi con ambienti visuali:
- ritorno di attenzione sul processo di lavoro e sugli approcci utilizzati, non solo sulle tecnologie
- il metamodello comune favorisce le possibilità di comunicazione tra strumenti di supoprto alla progettazione, e più in generale tra i diversi ambienti utilizzabili dai progettisti nello sviluppo
### Complessità
Il metamodello di UML è molto complesso, perché ha l'ambizione di poter rappresentare qualunque tipo di sistema software, a livelli di astrazione differenziati
Il numero dei diagrammi è elevato, e per molti diagrammi è possibile scegliere tra forme di rappresentazione leggermente dverse tra loro
UML non suggerisce, né tanto meno prescrive una sequenza di utilizzo dei diversi diagrammi, lascia anzi molte strade aperte, tra le quali i progettisti sono liberi di scegliere
## Ricapitolando
UML è uno **standard**, uniformità nei concetti e nelle notazioni utilizzate, interoperabilità tra strumenti di sviluppo, indipendenza dai produttori, dalle tecnologie, dai metodi
UML è **articolato**, può rappresentare qualunque sistema software, a diversi livelli di astrazione
UML è **complesso**, va adattato in base alle specifiche esigenze dei progettisti e dei progetti, utilizzando solo ciò che serve nello specifico contesto
# Ingegneria del software
L'ingegneria del software tratta la realizzazione di sistemi software di dimensioni e complessità talmente elevate da richiedere uno o più team di persona per la loro costruzione.
### Definizione
L'**ingegneria del software** è l'approccio sistematico allo sviluppo, all'operatività, alla manutenzione e al ritiro del software.
È quella disciplina tecnologica e manageriale che riguarda la produzione sistematica e la manutenzione dei prodotti software che vengono sviluppati e modificati entro i tempi e i costi preventivati.
È un _corpus_ di teorie, metodi e strumenti, sia di tipo tecnologico che organizzativo, che consentono di produrre applicazioni con le desiderate caratteristiche di qualità.
## La qualità del software
La qualità di un software su cui si basa la valutazione di un sw possono essere classificate in:
- **Interne**, riguardano le caratteristiche legate allo sviluppo del sw; non sono visibili agli utenti
- **Esterne**, riguardano le funzionalità fornite dal prodotto; sono visibili agli utenti
- **Relative al prodotto**, riguardano le caratteristiche stesse del sw e sono sempre valutabili
- **Relative al processo**, riguardano i metodi utilizzati durante lo sviluppo del sw
- **Correttezza**, un sw è corretto se rispetta le specifiche del progetto
- **Affidabilità**, un sw è affidabile se l'utente può dipendere da esso
- **Robustezza**, un sw è robusto se si comporta in modo ragionevole anche in circostanze non previste dalle specifiche di progetto
- **Efficienza**, un sw è efficiente se usa intelligentemente le risorse di calcolo
- **Facilità d'uso**, un sw è facile da usare se l'interfaccia che presenta all'utente gli permette di esprimersi in modo naturale
- **Verificabilità**, un sw è verificabile se le sue caratteristiche sono facilmente valutabili
- **Riusabilità**, un sw è riusabile se può essere usato, in tutto o in parte, per costruire nuovi sistemi
- **Portabilità**, un sw è portabile se può funzionare su più piattaforme
- **Facilità di manutenzione**, un sw è facile da manutenere non solo se è strutturato in modo tale da facilitare la ricerca degli errori, **modifiche correttive**, ma anche se la sua struttura permette di aggiungere nuove funzionalità al sistema, **modifiche perfettive**, o di adattarlo ai cambiamenti del dominio applicativo, **modifiche adattive**
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 92.png]]
    
- **Interoperabilità**, fa riferimento all'abilità di un sistema di coesistere e cooperare con altri sistemi
- **Produttività**, misura l'efficienza del processo di produzione del software in termini di velocità di consegna del sw
- **Tempestività**, misura la capacità del processo di produzione del software di valutare e rispettare i tempi di consegna del prodotto
- **Trasparenza**, un processo di produzione del software si dice trasparente se permette di capire il suo stato attuale e tutti i suoi passi
## Principi di progettazione
Con il termine **software design** si intende il processo che trasforma, attraverso numerosi passi intermedi, le specifiche dell'utente in un insieme di specifiche direttamente utilizzabili dai programmatori.
Il risultato del processo di design è l'**architettura del software**, ossia l'insieme dei moduli che compongono il sistema, la descrizione della loro funzione, e delle relazioni esistenti tra di essi.
Tutte le fasi della progettazione sono ispirate a un insieme di **principi** su cui si basano le tecniche e i metodi utilizzati nelle fasi operative
### Formalismi
L'utilizzo di **formalismi e di metodologie di standardizzazione** nelle fasi di progettazione, implementazione e documentazione del sistema permette di ridurre fortemente gli errori di progetto.
### Anticipazione dei cambiamenti
La progettazione di un sistema informatico non deve mirare a soddisfare solo le specifiche **attuali** ma deve prevedere anche quelle **future**, poiché la capacità di prevedere i cambiamenti a cui il software sarà sottoposto durante il suo ciclo di vita determina la sua **semplicità di manutenzione** e la sua **riusabilità**.
I cambiamenti possono essere:
- _noti a priori_: ogni software segue un cammino evolutivo rispetto alla sua prima release. Anche i servizi che non verranno inizialmente implementati devono comunque essere presi in considerazione durante la fase progettuale
- _non noti a priori_, al fine di poter affrontare anche modifiche non prevedibili durante la fase di design, la progettazione deve cercare di rendere il progetto facilmente modificabile
I cambiamenti possono riguardare:
- Periferiche e hardware
- Dominio di applicazione
- _Algoritmi e strutture dati_: questi due elementi incidono fortemente sulle prestazioni del software
### Separazione degli argomenti
Indica la necessità di individuare i diversi aspetti di un problema complesso e di trattarli separatamente al fine di semplificare la soluzione.
La suddivisione può essere fatta sulla base del:
- **Tempo**, alla base dei modelli di ciclo di produzione del software, che identificano e separano le attività da svolgere
- **Livello di qualità**, si progetta il software in modo corretto quindi lo si ristruttura parzialmente al fine di aumentare l'efficienza
- **Vista**, nella fase di analisi dei requisiti può essere conveniente analizzare distintamente i flussi di dati tra le diverse attività e il flusso di controllo che le governa
- **Livello di astrazione**, le specifiche vengono progressivamente raffinate
- **Dimensione**, modularizzazione
### Modularità
Con il termine **modulo** si indica il componente di base di un sistema software che raccoglie un insieme di funzionalità tra loro strettamente legate.
Linee guida per la modularizzazione:
- tutti i servizi strettamente connessi devono appartenere allo stesso modulo
- ogni modulo deve essere realizzato in modo indipendente da ogni altro
- i programmatori devono essere in grado di operare su un modulo avendo una conoscenza minima del contenuto degli altri
La definizione dell'**interfaccia** dei moduli deve rispettare il concetto di **information hiding**: l'interfaccia deve cioè contenere tutte le informazioni necessarie ad un corretto utilizzo del modulo evitando di mostrarne i dettagli implementativi. Questo principio permette ai progettisti di modificare l'implementazione del modulo senza che ciò incida sulle alte componenti del sistema.
- **Funzionalità a disposizione**, deve essere ben chiaro quali servizi sono realizzati dal modulo
- **Modalità di fruizione di un servizio**, per ogni servizio è necessario indicare la sequenza di routine da chiamare
- **Definizione dei parametri di input**, il tipo, il numero e la semantica dei parametri di input devono essere specificati in modo chiaro
- **Descrizione dell'output**, semantica e tipologia dei valori restituiti dalle routine devono essere completamente specificati.
    
    Per ogni routine deve essere presente una tabella dei codici di errore che riporti, oltre al tipo dell'errore verificatosi, i motivi che lo hanno provocato
    
  
La suddivisione di un sistema in moduli rende necessario tener traccia delle interazioni tra gli stessi. Le relazioni che devono essere descritte sono:
- _utilizzo_, **USES**, indica quali moduli vengono utilizzati per completare i servizi forniti da un particolare modulo
- _composizione_, **IS PART OF**, descrive la struttura del sistema a diversi livelli di astrazione permettendo ai progettisti di realizzare una documentazione più chiara e completa
- _temporale_, descrive la sequenza con cui devono essere realizzati i diversi moduli
**Rappresentazione delle relazioni dei moduli**
![[TerzoAnno/ComputerGraphics/assets/Untitled 93.png]]
### Astrazione
È uno strumento fondamentale per capire e analizzare problemi complessi, poiché consente di identificare gli aspetti fondamentali di un fenomeno e ignorare i suoi dettagli.
I modelli che vengono costruiti per i fenomeni sono sempre astrazioni della realtà, che trascurano alcuni aspetti ritenuti meno importanti per concentrarsi su altri.
### Generalità
Ogni volta che si deve risolvere un problema, si cerca di capire qual'è il **problema più generale** che gli si nasconde dietro.

> [!important] Il problema generale:
> 
> - può essere più semplice di quello specifico
> - la sua soluzione può essere più riusabile
> - può essere già risolto in un'applicazione commerciale
## Misurazione
Nel ciclo di vita del software la misurazione serve a prevedere o stimare tempi di consegna, costo di lavorazione, qualità del prodotto.

> Alle misure viene assegnato il compito di normalizzazione tra oggetti e fenomeni distinti, per un loro confronto o per effettuare correlazioni, al fine di valutare e prendere decisioni
### Scopi
- La **previsione** delle caratteristiche che avrà il software in una fase del ciclo di vita diversa da quella in cui si effettua la valutazione
- La **stima** delle caratteristiche possedute dal software, nella fase e nello stadio di sviluppo in cui si effettua la valutazione
### Fasi
- **Progettazione**, per prevedere la manutenibilità e prevenire problemi nel software rilasciato in esercizio
- **Collaudo/test**, per confrontare quanto fornito con le specifiche date
- **Rilascio in esercizio**, per misurare l'impatto del prodotto sulla efficienza ed efficacia del lavoro svolto, confrontare le prestazioni con quelle di altri prodotti comparabili, individuare aree di possibile miglioramento, decidere il momento del ritiro dalla produzione
In sostanza si misura per **prendere decisioni ed agire**.
## Stima dei Costi
### Fonti di costo
Il costo delle risorse per lo sviluppo del sw:
- costo del personale tecnico
- costo del personale di supporto
- costo delle risorse informatiche
- materiali di consumo
- costi generali della struttura
### Fattori di costo
- Numero di istruzioni da codificare (benefici del riuso)
- Capacità, motivazione e coordinamento degli addetti allo sviluppo
- Complessità del programma
- Stabilità dei requisiti
- Caratteristiche dell'ambiente di sviluppo
## Dimensioni del Software
### Metriche dimensionali
Si basano sul numero di istruzioni del programma.

> [!important] 
> **LOC (Line Of Code)** o **DSI** (**Delivered Source Instructions**)
![[TerzoAnno/ComputerGraphics/assets/Untitled 94.png]]
### Metriche funzionali
Si basano sulle caratteristiche funzionali del programma.

> [!important] Metodo dei Punti Funzione (**Function Points**)
## Metodo dei Function Points
Restituisce un parametro **adimensionale**.
Misura la dimensione di un sw in termini delle **funzionalità** offerte all'utente, la misurazione si basa sul **disegno logico** del software espresso in una forma qualsiasi: specifiche in linguaggio naturale, schemi Entity-Relationship, diagrammi di flusso dei dati.
Può essere utilizzato a partire dalla **prima fase dello sviluppo** per poi ripetere la misura nel caso in cui le specifiche siano cambiate.
È **indipendente** dall'ambiente tecnologico in cui si sviluppa il progetto.
Consente **confronti** fra differenti progetti e organizzazioni.
  
Può essere usato da un'organizzazione come:
- uno strumento per determinare la **complessità** di un pacchetto applicativo acquistato attraverso la quantificazione di tutte le sue funzioni.
- uno strumento che aiuti gli utenti a determinare il **beneficio** per le loro organizzazioni derivante da un pacchetto applicativo commerciale ,attraverso la quantificazione delle sole funzioni che soddisfano i loro requisiti.
- Un veicolo per **stimare** costi e risorse necessarie per lo sviluppo e la manutenzione del software
- Un fattore di normalizzazione per effettuare **confronti** sul software
### Conteggio dei Function Point
Il metodo consiste nell'identificare 5 tipi di funzioni (funzionalità):
- **funzioni di tipo dati**, file interni logici - file esterni di interfaccia
- **funzioni di tipo transazione**, input esterno - output esterno - interrogazioni esterne
Una volta identificate le funzioni, a ciascuna di esse si assegna un **peso** calcolato sulla base della quantità di dati e sulla complessità delle relazioni tra loro.
La somma dei pesi di tutte le funzioni costituisce il **Numero di Function Points Non Pesato**.
Infine, questo numero è moltiplicato per un **fattore di aggiustamento** ottenuto considerando un insieme di 14 **Caratteristiche Generali del Sistema**.
![[TerzoAnno/ComputerGraphics/assets/Untitled 95.png]]
### Tipi di conteggio
- Per progetti di _sviluppo_: calcolo dei FP di un software da realizzare ex novo più eventuale conversione dei dati dalla vecchia applicazione
- Per progetti di _manutenzione evolutiva_: misura le modifiche a un software esistente, comprendendo funzioni aggiunte, modificate, cancellate e di conversione
- Per una _applicazione esistente_: consente il calcolo dei FP cosiddetti installati e il loro aggiornamento
    1. calcolo dei FP iniziali, differisce dal calcolo per i progetti di sviluppo perché non prevede funzioni di conversione
    2. aggiornamento dei FP dopo ogni manutenzione evolutiva, differisce dal calcolo per un progetto di manutenzione evolutiva perché i punti delle funzioni cancellate sono sottratte invece che sommate
### Ambito del conteggio e confine delle applicazioni
Identificare l'**ambito del conteggio** significa identificare le funzionalità che devono essere considerate in un conteggio.
Il **confine** è la linea di separazione tra le applicazioni che si stanno misurando e le applicazioni esterne o l'utente.
**Regole**
- Il confine è determinato basandosi sul punto di vista dell'utente
- Il confine tra applicazioni collegate è basato su aree funzionali distinte dal punto di vista dell'utente e non in funzione degli aspetti tecnologici
### Funzioni di Tipo Dati
- **File interno logico**, **Internal Logical File ILF**: è un gruppo di dati o informazioni di controllo logicamente collegati e riconoscibili dall'utente che sono mantenuti all'interno dei confini dell'applicazione.
    
    Il compito primario di un ILF è di contenere dati mantenuti attraverso uno o più processi elementari dell'applicazione che si sta contando
    
- **File esterno di interfaccia**, **External Interface File EIF**: è un gruppo di dati o informazioni di controllo logicamente collegati e riconoscibili dall'utente che sono referenziati dall'applicazione ma sono mantenuti all'interno dei confini di un'altra applicazione
    
    Il compito primario di un EIF è contenere dati referenziati da uno o più processi elementari dell'applicazione che si sta contando.
    
    Questo significa che un EIF contato per un'applicazione deve essere un ILF in un'altra applicazione.
    
### Funzioni di Tipo Transazione
- **Input Esterno**, **External Input EI**: è un processo elementare dell'applicazione che elabora dati o informazioni di controllo provenienti dall'esterno del confine dell'applicazione.
    
    Il compito principale di un EI è di mantenere uno o più ILFs e/o di modificare il comportamento del sistema
    
- **Output Esterno**, **External Output EO**: è un processo elementare dell'applicazione che manda dati o informazioni di controllo all'esterno del confine dell'applicazione.
    
    Il compito principale di un EO è di presentare informazioni all'utente, attraverso una logica di processo diversa dal, o in aggiunta al, recupero di dati o informazioni di controllo.
    
    La logica di processo deve contenere almeno una formula matematica o calcolo, creare dati derviati, mantenere uno o più ILFs o modificare il comportamento del sistema.
    
- **Interrogazione Esterna**, **External Inquiry EQ**: è un processo elementare che manda dati o informazioni di controllo fuori dal confine dell'applicazione.
    
    Il compito principale di una EQ è di presentare informazioni all'utente attraverso il recupero di dati o informazioni di controllo da un ILF o EIF.
    
    La logica di processo non contiene formule matematiche o calcoli e non crea dati derivati.
    
### Fattore di Aggiustamento
Il numero totale di FP viene moltiplicato per un **fattore di aggiustamento** per tenere conto di quelle funzionalità generali del sistema non sufficientemente rappresentate dalle funzioni dati e transazionali.
Il valore del fattore di aggiustamento varia fra 0.65 e 1.35 (+/- 35%) e viene calcolato sulla base del grado di influenza di ciascuna delle 14 Caratteristiche Generali del Sistema.
Il grado di influenza di una caratteristica è compreso tra 0 e 5 (nessuna influenza - forte influenza):
$$\text{fattore di aggiustamento} = 0.65 + (TDI * 0.01)$$
Per **TDI** (**Total Degree of Influence**) somma dei gradi di influenza per ciascuna caratteristica:
- comunicazione dati
- distribuzione dell'elaborazione
- prestazioni
- utilizzo estensivo della configurazione
- frequenza delle transazioni
- inserimento dati interattivo
- efficienza per l'utente finale
- aggiornamento interattivo
- complessità elaborativa
- riusabilità
- facilità di installazione
- facilità di gestione operativa
- molteplicità di siti
- facilità di modifica
## Il numero ciclomatico

> [!important] Il
> 
> **numero ciclomatico** è una definizione operativa di complessità del flusso di controllo di un programma, ed è legato all'identificazione di tutti i cammini che permettono di raggiungere una copertura accettabile del programma.
> 
> - Misura della sola complessità del software intesa in riferimento alla sua produzione, comprensione e modifica
> - Viene preso in considerazione il solo flusso di controllo, senza alcun riferimento alla complessità dei dati (grafo del flusso di controllo)
> - Metrica svincolata dalle particolarità di un linguaggio
### Grafo Fortemente Connesso
Il numero ciclomatico di un grafo fortemente connesso è il numero minimo di archi che occorre eliminare per trasformarlo in un albero.
Si calcola come
$$\text{numero ciclomatico} = e - n + 1$$
Dove $e$ è il numero degli archi ed $n$ è il numero di nodi.
Nell'esempio a destra il numero ciclomatico è pari a $3$.
![[TerzoAnno/ComputerGraphics/assets/Untitled 96.png]]
### Programma Ben Formato
Se un programma è ben formato esistono sempre un nodo iniziale e uno terminale. Inoltre, esiste sempre almeno un cammino che permette di collegare il nodo iniziale con uno qualunque degli altri nodi ed almeno un cammino che permette di collegare uno qualunque dei nodi con il nodo terminale.
Si rende fortemente connesso il grafo del flusso di controllo del programma aggiungendo un arco orientato che va dal nodo terminale al nodo iniziale.
Il **numero ciclomatico** del programma, assunto come misura della complessità del suo flusso di controllo, è il numero ciclomatico del grafo $G$ modificato, $v(G)$, ed esprime il **numero di cammini linearmente indipendenti nel grafo di controllo**:
$$v(G) = e - n + 2$$
![[TerzoAnno/ComputerGraphics/assets/Untitled 97.png]]
### Teorema di Mills
$$v(G) = d + 1$$
Dove $d$ è il numero dei punti di decisione del programma (assumendo che un punto di decisione a $k$ uscite contribuisca come $k-1$ punti di decisione a 2 uscite).
Se il programma ha procedure al suo interno, il numero ciclomatico dell'intero grafo è dato dalla somma dei numeri ciclomatici dei singoli grafi indipendenti:
$$v(G) = e - n + 2p$$
dove $e$ ed $n$ sono rispettivamente archi e nodi del grafo nel suo insieme, $p$ è il numero di grafi (procedure) indipendenti.
### Considerazioni
Il numero ciclomatico cattura almeno in parte ciò che intuitivamente è la complessità del flusso di controllo.
Esistono conferme sperimentali che indicano che si ha un buon grado di correlazione tra il numero ciclomatico e grandezze sicuramente influenzate notevolmente dalla complessità del flusso di controllo.

> [!important] La complessità ciclomatica di un modulo non dovrebbe superare il valore 10
## COnstructive COst MOdel

> [!important] Si calcola una stima iniziale dei costi di sviluppo in base alla dimensione del software da produrre, poi la si migliora sulla base di un insieme di parametri
### Modello Intermedio
- **Stima della dimensione del software**: calcolata come numero di linee di codice scritte (KDSI), può essere fatta sulla base dell'esperienza del manager oppure utilizzando una tecnica analitica basata sul metodo **FP**:
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 98.png]]
    
- **Determinazione della classe del software**: i sw sono suddivisi in tre categorie con caratteristiche di difficoltà crescente. Per ogni categoria è stata sviluppata una diversa formula per il calcolo del costo, espresso in mesi uomo:
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 99.png]]
    
    L'appartenenza ad uno dei tre profili viene determinata sulla base dei seguenti parametri:
    
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 100.png]]
    
- **Applicazione degli stimatori di costo**:
    $$M = M_{Nom} \times \prod_{i=1}^{15} c_i$$
    ![[TerzoAnno/ComputerGraphics/assets/Untitled 101.png]]
    
## Produzione

> [!important] Il processo di produzione è la sequenza di operazioni che viene seguita per costruire, consegnare e modificare un prodotto.
La complessità dei sistemi informatici e l'elevata instabilità del processo di costruzione dovuta alla volubilità del mercato rendono necessaria l'adozione di modelli di processo potenti e flessibili:
- **Modello a cascata**
- **Modelli incrementali**
- **Modelli evolutivi**
- **Modelli agili**
## I modelli prescrittivi

> [!important] Definiscono un insieme distinto di attività, azioni, compiti, risultati e prodotti che sono necessari per ingegnerizzare un software di alta qualità.
> 
> Producono programmi, documenti e dati.
Introducono elementi di stabilità, controllo e organizzazione in un'attività che, se lasciata incontrollata, tende a diventare caotica.
Tutti i modelli prescrittivi comprendono sostanzialmente le stesse attività strutturali generiche:
- comunicazione
- pianificazione
- modellazione
- costruzione
- deployment
Ogni modello applica un'enfasi differente a queste attività e definisce un flusso di lavoro che coinvolge ciascuna attività in modo differente.
## Il modello a cascata (Waterfall)

> [!important] Suggerisce un approccio sistematico e sequenziale lineare, in cui l'output di ogni fase rappresenta l'input della successiva.
- È inadeguato quando i requisiti sono incerti o non noti durante le fasi iniziali del progetto.
- Non permette di modificare i risultati delle fasi precedenti alla luce di errori riscontrati a posteriori.
- Solo al termine del progetto si genera una versione funzionante del programma-
![[TerzoAnno/ComputerGraphics/assets/Untitled 102.png]]
## Il modello incrementale

> [!important]
> È un modello _iterativo_ che combina aspetti del modello a cascata applicati a sottosistemi del prodotto finale, producendo il software a _incrementi_.

Consiste nell'applicare più sequenze lineari, scalate nel tempo, ognuna delle quali produce uno **stadio** operativo del software:
- il primo stadio consiste in genere in un “prodotto base”, ossia un prodotto che soddisfa i requisiti fondamentali tralasciando alcune caratteristiche supplementari
- in seguito a una valutazione dell'utente, si stende un piano per lo stadio successivo, che preveda l'aggiunta di nuove funzionalità
È adatto a progetti in cui i requisiti iniziali sono ben definiti ma la dimensione del sistema scoraggia l'adozione di un processo puramente lineare.
![[TerzoAnno/ComputerGraphics/assets/Untitled 103.png]]
## Il modello RAD

> [!important] **_Rapid Application Developement_**
> 
> È un modello di processo incrementale che punta a un ciclo di sviluppo molto breve.
> 
> Si tratta di un adattamento del modello a cascata, nel quale l'obiettivo di accelerare lo sviluppo è raggiunto grazie a strategie costruttive fondate sull'uso di **componenti**.

Ogni applicazione modularizzabile in modo che ciascuna funzionalità principale possa essere completata in meno di 3 mesi è candidata al RAD.
RAD fallisce se:
- gli utenti non riescono a tenere il passo
- il sistema non è modularizzabile
- sono richieste alte prestazioni da ottenere tramite l'ottimizzazione delle interfacce tra i componenti
![[TerzoAnno/ComputerGraphics/assets/Untitled 104.png]]
## Incrementale vs Iterativo
- **Similarità**
    - Prevedono entrambi più versioni successive al sistema
    - Ad ogni istante il primo rilascio esiste una versione in esercizio e una versione in sviluppo
- **Differenze**
    - Sviluppo _**incrementale**_: ogni versione aggiunge nuove funzionalità o sottosistemi
    - Sviluppo _**iterativo**_: da subito sono presenti le funzionalità/sottosistemi di base che vengono successivamente raffinate e migliorate. I requisiti possono cambiare.
## I modelli evolutivi

> [!important] I modelli evolutivi sono iterativi, e caratterizzati in modo tale da consentire lo sviluppo di versioni sempre più complete del software.
Si produce una versione limitata, sulla base di requisiti ben noti, e successivamente si realizzano delle estensioni.
Si fa largo uso di **tecniche di prototipazione**.
## Prototipazione

> [!important] Un **prototipo** è una versione approssimata, parziale, dell'applicazione che deve essere sviluppata
- **Obiettivi**
    - Un prototipo software permette di animare e dimostrare i requisiti. L'uso principale consiste nell'aiutare i clienti e gli sviluppatori a capire meglio i requisiti inizialmente vaghi o insufficienti.  
        Il prototipo può essere usato per l'addestramento dell'utente prima che sia consegnato il sistema finale  
        
- **Benefici**
    - Equivoci fra gli utenti del sw e gli sviluppatori sono messi in evidenza
    - Possono essere evidenziate funzionalità mancanti o confuse
    - Un sistema funzionante è disponibile molto presto nel processo
    - Il prototipo può servire come base per derivare una specifica del sistema
![[SecondoAnno/MDP/assets/image.png]]
### Prototipazione evolutiva

> [!important] L'obiettivo è di fornire un sistema funzionante all'utente finale (vale circa il 14-15% del prodotto finito)
Viene usata per sistemi in cui le specifica non possono essere sviluppate in anticipo, per esempio sistemi AI e interfacce utente
![[SecondoAnno/MetodiNumerici/assets/image 1.png]]
I cambiamenti continui tendono a corrompere il sistema, per cui il mantenimento a lungo termine diviene costoso.
Sono richieste grandi capacità di progettazione e programmazione anche se il tempo di vita del sistema è corto.
### Prototipo usa e getta

> [!important] L'obiettivo è di validare o derivare i requisiti del sistema (vale circa il 5-10% del volume del prodotto finito)
Usata per ridurre il rischio di requisiti incerti.
Il prototipo è sviluppato da una specifica iniziale, consegnato per la sperimentazione e quindi gettato.
Il prototipo NON deve essere considerato un sistema finale perché:
- alcune caratteristiche del sistema possono non essere state considerate
- non c'è specifica per il mantenimento a lungo termine
- il prototipo non è strutturato bene e sarebbe difficile da mantenere
![[SecondoAnno/MetodiNumerici/assets/image 2.png]]
### Prototipazione dell'interfaccia utente
È impossibile specificare in anticipo il _look and feel_ di una interfaccia utente in maniera efficace, quindi prototipare è essenziale.
Lo sviluppo di GUI sta diventando una attività che prende la maggior parte del costo dello sviluppo del sistema.
Generatori di interfacce utente possono essere usati per “disegnare” l'interfaccia e simularne la funzionalità.
## Il modello a spirale
Fa crescere incrementalmente il grado di definizione e implementazione del sistema, riducendo il livello di rischio e producendo un insieme di milestone per garantire la fattibilità delle soluzioni intraprese.
- **Customer communication**, colloqui tra cliente e team di sviluppo
- **Planning**, raccolta requisiti e definizione piano di progetto
- **Risk analysis**, stima e prevenzione dei rischi tecnici e di gestione
- **Engineering**, modellazione e progettazione
- **Construction & release**, realizzazione, collaudo e installazione
- **Customer evaluation**, rilevazione delle reazioni da parte del cliente
![[SecondoAnno/MetodiNumerici/assets/image 3.png]]
## Model-Driven Development
MDD è un tipo di sviluppo in cui si creano modelli formali del software che vengono poi fatti evolvere mentre il sistema viene progettato e implementato.
I modelli diventano la guida del processo di sviluppo; infatti, MDD prevede l'uso di strummenti per la generazione automatica del codice e dei test case a partire dai modelli
![[SecondoAnno/MetodiNumerici/assets/image 4.png]]
## I modelli agili
I modelli prescrittivi, basati su una ferrea disciplina, trascurando la fragilità delle persone che realizzano il software.
I modelli di processo agili presentano le seguenti caratteristiche:
- incoraggiano la soddisfazione del cliente e una consegna incrementale anticipata del software
- impiegano team di progettazione compatti e molto motivati
- impiegano metodi informali
- producono un livello minimo di prodotti di ingegneria del software
- incoraggiano semplicità di sviluppo
- richiedono comunicazione continua tra sviluppatori e utenti
### Extreme programming
È il più diffuso modello di processo agile. XP adotta un approccio object-oriented e include 4 attività strutturali:
- **Pianificazione**, definisce un insieme di _user story_ che descrivono le funzionalità del software. Ad ogni user story il cliente assegna un valore che ne definisce la priorità; i progettisti assegnano a ogni user story un costo (in settimane di sviluppo). Se una user story richiede più di 3 settimane di sviluppo si chiede al cliente di frammentarla
- **Design**:
    - persegue la massima semplicità
    - viene scoraggiata la progettazione di funzionalità aggiuntive
    - incoraggia l'uso di schede CRC
    - se viene individuato un problema di design, si crea immediatamente un prototipo operativo (_spyke solution_) che viene poi valutato
    - incoraggia il _refactoring_ ossia un processi di “ripulitura” e riorganizzazione del software che non ne altera il comportamento esterno
    - l'architettura viene considerata un elemento transitorio
- **Programmazione**, si basa sul _pair programming_, in cui 2 persone collaborano alla stessa workstation per sviluppare il software così da fornire un meccanismo di soluzione in tempo reale dei problemi e una garanzia di qualità
- **Testing**, già prima dell'inizio della programmazione vengono definiti degli _unit test_, ossia un test di ogni singolo componente, che vengono ora implementati attraverso uno strumento di supporto che ne consenta l'automazione. Si incoraggia il _**test di regressione**_ a ogni modifica del software
Dopo il primo rilascio del progetto, il team XP calcola la **velocità del progetto**, intesa come il numero di **user story** implementate nella prima release.
La velocità di progetto è utilizzata per:
- stimare le date di consegna e le pianificazioni per le successive release
- determinare se le user story sono state sottovalutate, ed eventualmente modificare il contenuto delle prossime release o le loro date di consegna
## Unified Process
È un processo di sviluppo del software ideato da Booch, Rumbaugh, Jacobson (gli autori di UML)
- Guidato dai casi d'uso
- Centrato sull'architettura
- Iterativo e incrementale
- Model-based e component-based
- Object-oriented
- Configurabile
### Un modello di UP
Una **risorsa** o **ruolo** definisce il comportamento e le responsabilità di un individuo o un gruppo
Il comportamento è espresso in termini di **attività** e **manufatti**
Si modellano **flussi di lavoro**, ossia sequenze di attività correlate eseguite da ruoli che producono manufatti.
### Manufatti

> [!important] **Set di gestione**
> 
> - elaborati di pianificazione
> - elaborati operazionali

> [!important] **Set di requisiti**
> 
> - documento di visione
> - modello dei casi d'uso
> - modello di business

> [!important] **Set di progettazione**
> 
> - modello di design
> - modello di architetture
> - modello di test

> [!important] **Set di implementazioni**
> 
> - codice sorgente ed eseguibili
> - file di dati

> [!important] **Set di rilascio agli utenti**
> 
> - script di installazione
> - documentazione utente
> - materiale formativo
### Flussi di lavoro
I flussi di lavoro non sono rigidamente sequenziali, e vengono svolti dal progetto in ogni iterazione:
- **Requisiti**, fissa ciò che il sistema deve fare
- **Analisi**, mette a punto i requisiti e li struttura
- **Progettazione**, concretizza i requisiti in un'architettura del sistema
- **Implementazione**, costruisce il software
- **Test**, verifica che l'implementazione rispetti i requisiti
- **Deployment**, descrive la configurazione del sistema
- **Gestione configurazione**, mantiene le versioni del sistema
- **Gestione progetto**, descrive le strategie per gestire un processo iterativo
- **Ambiente**, descrive le infrastrutture di sviluppo
### Fasi
Le fasi sono sequenziali, e corrispondono a milestone significativi per committenti, utenti e management:
- **Inception (avvio)**, definisce gli obiettivi del progetto, ne investiga la fattibilità, ne stima i costi, il potenziale di mercato e i rischi, analizza i prodotti concorrenti
- **Elaboration**, pianifica progetto e ne definisce le caratteristiche funzionali, strutturali e architetturali
- **Construction**, sviluppa il prodotto attraverso una serie di iterazioni effettua il testing, prepara la documentazione
- **Transition**, consegna il sistema agli utenti finali; include marketing, installazione, configurazione, formazione, supporto e mantenimento
Ogni fase può essere composta da una o più iterazioni: il numero esatto dipende dalle scelte del Project Manager e dai rischi del progetto.

> [!important] **Milestone**
> 
> - Inception
>     - documenti di fattibilità
> - Elaboration
>     - specifica dei requisiti software
>     - architettura consolidata e verificata
> - Construction
>     - versione sistema in pre-produzione (beta)
> - Transition
>     - versione sistema in produzione
# Verifica del software
La fase di verifica del software ha lo scopo di controllare se il sistema realizzato risponde alle specifiche di progetto. La verifica non coinvolge solo il prodotto finale ma segue passo per passo il progetto e lo sviluppo del prodotto.
Le tecniche di verifica del sw possono essere classificate come:
- **dinamiche o di testing**: il corretto funzionamento del sistema viene controllato sulla base di prove sperimentali che ne verifichino il comportamento in un insieme rappresentativo di situazioni. Sono le più utilizzate nella pratica.
- **statiche o di analisi**: il corretto funzionamento del sistema viene verificato analizzando direttamente la struttura dei moduli e il codice che li realizza. Sono applicabili durante l'intero ciclo di vita.
## Testing

> [!important] Le operazioni di testing possono individuare la presenza di errori nel software ma non possono dimostrare la correttezza
Lo scopo del testing è quello di verificare il comportamento del sistema in un insieme di casi sufficientemente ampio da rendere plausibile che il suo comportamento sia analogo anche nelle restanti situazioni.
Vista l'impossibilità pratica di verificare un sistema in tutte le possibili circostanze (testing esaustivo) è necessario individuare dei criteri per la selezione dei casi significativi.
Le operazioni di testing si suddividono in:
- **Testing in the small**, riguardano moduli singoli e porzioni specifiche del codice che rivestono una particolare importanza o che hanno una particolare complessità
- **Testing in the large**, riguardano il sistema nella sua globalità
### Testing in the small
Valuta il corretto funzionamento di una porzione del codice analizzando in modo approfondito il suo comportamento in relazione all'input.
![[SecondoAnno/MetodiNumerici/assets/image 5.png]]

> [!important] **Criterio di copertura dei programmi (statement test)**
> 
> Selezionare un insieme di test T tali che, a seguito dell'esecuzione del programma P su tutti i casi di T, ogni istruzione elementare di P venga eseguita almeno una volta
Si basa sull'osservazione che un errore non può essere scoperto se la parte di codice che lo contiene non viene eseguita almeno una volta.
Può essere eseguito solo conoscendo la struttura interna della porzione di codice (**white-box testing**).

> [!important] **Criterio di copertura delle decisioni (branch test)**
> 
> Selezionare un insieme di test T tali che, a seguito dell'esecuzione del programma P su tutti i casi di T, ogni arco del grafo di controllo di P sia attraversato almeno una volta
Il criterio richiede che per ogni condizione presente nel codice sia utilizzato un test che produca il risultato TRUE e FALSE-
Si basa sul flusso di controllo e non sull'insieme di istruzioni.
Può essere eseguito solo conoscendo la struttura interna della porzione di codice (**white-box testing**).
  

> [!important] **Criterio di copertura delle decisioni e delle condizioni**
> 
> Selezionare un insieme di test T tali che, a seguito dell'esecuzione del programma P su tutti i casi di T, ogni arco del grafo di controllo di P sia attraversato e tutti i possibili valori delle condizioni composte siano valutati almeno una volta
Il criterio richiede che, per ogni porzione di condizione composta presente nel codice, sia utilizzato un test che produca il risultato TRUE e FALSE.
Il criterio produce un'analisi più approfondita rispetto al criterio di copertura delle decisioni.
Può essere eseguito solo conoscendo la struttura interna della porzione di codice (**white-box testing**).
![[SecondoAnno/MetodiNumerici/assets/image 6.png]]
### Testing in the large
L'esplosione combinatoria delle possibili soluzioni che si hanno quando si esaminano sistemi di grandi dimensioni rende impossibile l'utilizzo di tecniche white-box.
Si rende quindi necessario valutare il funzionamento del sistema sulla base delle corrispondenze input-output. Il sistema è considerato una scatola nera (**black-box testing**).
L'insieme di test da utilizzare viene selezionato sulla base delle specifiche di progetto che permettono di definire i diversi valori di input e i corrispondenti valori in output.
- **Test di modulo**, verifica se un modulo è stato implementato correttamente in base al suo comportamento esterno
- **Test d'integrazione**, verifica il comportamento di sottoparti del sistema sulla base del loro comportamento esterno. Viene solitamente svolto simulando il comportamento dei moduli che producono l'input del sottosistema in analisi
- **Test di sistema**, verifica il comportamento dell'intero sistema sulla base del suo comportamento esterno
Il test d'integrazione permette di:
1. Anticipare la scoperta di eventuali errori in fase di sviluppo
2. Semplificare la ricerca degli errori poiché questi risultano circoscritti alla sottoporzione in esame
3. Permette il rilascio di sottoparti autonome del sistema
## Analisi del Software

> [!important] Analizzare un software significa ispezionarne il codice per capirne le caratteristiche e funzionalità.
Può essere effettuata sul codice oppure su pseudocodice.
Permette la verifica di un insieme di esecuzioni mentre il testing verifica singoli casi.
È soggetta agli errori di colui che la effettua.
Si basa su un modello della realtà e non su dati reali.
I due principali approcci all'analisi del software sono **Code walk-through** e **Code inspection**.
### Code walk-through
È un tipo di analisi informale eseguita da un team di persone che dopo aver selezionato opportune porzioni del codice e opportuni valori di input ne simulano su carta il comportamento.
Il progettista deve fornire in anticipo la documentazione scritta relativa al codice.
L'analisi non deve durare più di alcune ore, e deve essere indirizzata solamente alla ricerca dei problemi e non alla loro soluzione.
Al fine di aumentare il clima di cooperazione all'analisi non devono partecipare i manager.
### Code inspection
L'analisi, eseguita da un team di persone e organizzata come nel caso del code walk-through, mira a ricercare classi specifiche di errori.
Il codice viene esaminato controllando soltanto la presenza di una particolare categoria di errore, piuttosto che simulando una generica esecuzione.
Le classi di errori che vengono solitamente ricercate con questa tecnica sono:
- uso di variabili non inizializzate
- loop infiniti
- letture di dati non allocati
- deallocazioni improprie di memoria
## Analisi di flusso dei dati
È un tipo particolare di code inspection.
L'analisi dell'evoluzione del valore associato alle variabili durante l'esecuzione di un programma è intrinsecamente dinamica.
Ciononostante, alcuni aspetti di questo problema possono essere analizzati anche staticamente.
A ogni comando è possibile associare staticamente il tipo di operazioni eseguite sulle variabili:
- definizioni (d)
- usi (u)
- annullamenti (a)
Sequenze di comandi, corrispondenti a possibili esecuzioni, sono riducibili staticamente a sequenze di tali operazioni.
### Regole generali
1. L'uso di una variabile `x` deve essere sempre preceduto in ogni sequenza da una definizione della stessa variabile `x`, senza annullamenti intermedi
2. Una definizione di una variabile `x` deve essere sempre seguita da un uso della variabile `x`, prima di un'altra definizione o di un annullamento della stessa variabile `x`
Non tutte le sequenze **au** e **dd** corrispondono necessariamente ad anomalie:
- la sequenza **au** può per esempio comparire in un generatore di numeri casuali, che legge il contenuto non inizializzato di una cella di memoria per determinare il seme della generazione
- la sequenza **dd** può essere dovuta ad una cattiva strutturazione del programma, per cui la prima definizione della sequenza non è usata nell'esecuzione considerata, ma lo è in un'altra esecuzione, che richiede la percorrenza di un cammino diverso.
# Certificazione
La Comunità Europea basa il sistema di controllo della qualità nei diversi settori della produzione su due distinte classi di regole:
- **Regole tecniche**: sono emessa dalla pubblica amministrazione e dagli organi dello Stato (leggi, decreti e regolamenti) nel rispetto delle regole comunitarie (direttive); la loro osservanza ha carattere obbligatorio
- **Norme tecniche consensuali**: sono elaborate e pubblicate dagli organismi di normazione riconosciuti con la collaborazione anche di rappresentanti governativi e possono avere validità nazionale (UNI e CEI), europea (EN), internazionale (ISO e IEC).  
    La loro applicazione non è obbligatoria, ma può essere imposta da opportune direttive, leggi o regolamenti  
    
Le norme tecniche consensuali rappresentano una razionalizzazione dei molti approcci utilizzati tra clienti e fornitori per garantire la qualità del prodotto o del servizio.

> [!important] **La famiglia di norme ISO 9000 ricade tra le norme tecniche consensuali**
## La normativa ISO 9000
Gli obiettivi primari delle norme della famiglia ISO 9000 sono due:
- **Gestione per la qualità**: offrono una guida alle aziende che desiderano progettare e attuare un efficace sistema qualità nella loro organizzazione o migliorare il sistema di qualità esistente. Uno degli obiettivi principali della gestione per la qualità è il miglioramento delle attività e dei processi
- **Assicurazione della qualità**: definiscono i requisiti generali a fronte dei quali un cliente valuta l'adeguatezza del sistema qualità del fornitore, nonché la sua capacità di soddisfare i requisiti stabiliti

> [!important] Con il termine **certificazione** si intende l'atto mediante il quale un **organismo di certificazione accreditato** a livello nazionale o internazionale dichiara che, con un livello confidenziale attendibile, un determinato prodotto, processo, servizio o sistema qualità aziendale è conforme a una specifica norma o documento normativo a essa applicabile
L'**accreditamento** è definito come il riconoscimento formale di idoneità di un laboratorio a effettuare specifiche prove o determinati tipi di prova. L'uso del termine è ora esteso al processo di riconoscimento delle competenze degli organismi di certificazione.
![[SecondoAnno/MetodiNumerici/assets/image 7.png]]
La certificazione ISO 9000 può essere rilasciata anche su sotto-porzioni dell'azienda oggetto di valutazione. La definizione dell'estensione dell'analisi e quindi la scelta degli elementi e dei processo oggetto di verifica sono un problema controverso e motivo di discussione tra le parti. È compito dell'organismo di certificazione, in collaborazione con l'azienda da certificare, definire i confini e l'estensione della certificazione.
Il **manuale di qualità** comprende la specifica di tutti i processi su cui è applicato il sistema qualità. Esso comprende inoltre la descrizione di tutta la documentazione che viene redatta a supporto di tale sistema.
La **verifica ispettiva** è la fase fondamentale della certificazione. Durante la visita ispettiva i valutatori interpellano, secondo un piano concordato in base alle caratteristiche dell'azienda e al risultato dell'analisi del manuale di qualità, vari responsabili aziendali le cui funzioni hanno impatto sulla qualità.  
Vengono quindi visitati i reparti in cui si svolgono le attività ed effettuate le verifiche relative alla corretta applicazione delle procedure aziendali-  
A certificazione avvenuta l'organismo di certificazione effettua visite di mantenimento della certificazione (**visite di sorveglianza**). La frequenza delle visite di sorveglianza non è uguale per tutti gli organismi e può variare da 1 a 4 all'anno.

> [!important] **Non conformità**, secondo la norma è il “non soddisfacimento di requisiti specificati”. La definizione riguarda lo scostamento o l'assenza di una o più caratteristiche di qualità o di elementi del sistema qualità rispetto ai requisiti specificati.
Le non conformità che vengono riscontrate durante le verifiche di certificazione possono essere di vario tipo:
- **Non conformità rispetto ai requisiti della norma**, qualora uno o più requisiti della norma non vengono rispettati
- **Non conformità sulla documentazione**, attività non procedurate o formalizzate in documenti, oppure attività che non seguano le prescrizioni delle procedure
- **Non conformità sull'attuazione delle procedure**, qualore le prescrizioni delle procedure non vengano attuate in modo efficace
![[SecondoAnno/MetodiNumerici/assets/image 8.png]]
## I documenti del progetto
La gestione delle qualità si realizza tramite la standardizzazione di tutte le operazioni che riguardano il processo. Elemento primario a tale fine è l'insieme dei documenti che costituiscono l'archivio del progetto.
La concessione della certificazione ISO 9000 si basa in gran parte sulla correttezza di tale documentazione.
I documenti del progetto si dividono in:
- documenti tecnici
- documenti di pianificazione
![[SecondoAnno/MetodiNumerici/assets/image 9.png]]
# Manutenzione
- **Correttiva**, rimedia ai malfunzionamenti provocati dai difetti derivanti da errori di analisi, progettazione, codifica, test
- **Adattiva**, mantiene inalterato il livello di servizio del sistema al mutare delle condizioni operative
- **Perfettiva**, migliora qualitativamente le caratteristiche funzionali o tecniche del sistema
- **Evolutiva**, migliora qualitativamente e quantitativamente le caratteristiche del sistema
![[SecondoAnno/MetodiNumerici/assets/image 10.png]]
### Manutenzione correttiva
La manutenzione correttiva mira a risolvere:
- **Errori**
    - commessi dall'uomo
    - interessano tutte le fasi del ciclo di sviluppo
- **Difetti**
    - si riscontrano nei programmi
    - si manifestano nella produzione di risultati sbagliati
- **Malfunzionamenti**
    - interessano i sistemi
    - ne compromettono l'intera funzionalità
    - ne annullano il valore informativo
I costi sono molto elevati e si ottengono i seguenti risultati:
- Aumenta l'entropia del programma
- Degrada il sistema
- Abbatte l'affidabilità
- Ripristina delle qualità
### Manutenzione adattiva
Si ricercano migliori performance, si estendono funzioni applicative, nuove interfacce o modifiche architetturali.
I costi sono elevati (circa il 20% - 30%), e si ottengono i seguenti risultati:
- aumento del valore informativo del sistema
- aumento dell'utilizzabilità
- aumento della complessità
- spesso il degrado della qualità
### Manutenzione evolutiva
Si implementano nuove funzioni “embedded” nei vecchi programmi, passaggio da una interfaccia a caratteri ad una interfaccia a finestre, passaggio da file indexed a DBMS relazionali.
I costi sono elevati, spesso nascosti fino all'esercizio, e si ottengono i seguenti risultati:
- aumento tendenziale dell'entropia
- diminuzione della robustezza del sistema
- aumento della potenza
- aumento della qualità, ma solo se si progetta bene l'operazione
# Progettazione di Interfacce Utente
Le GUI esaltano le potenzialità del cervello umano:
- riconoscere e associare
- generalizzazione e dedurre
## Scelta della tecnologia per l'interfaccia
Quando si progetta un interfaccia bisogna tenere conto chi userà l'interfaccia e per cosa verrà utilizzata.
- **in funzione degli obiettivi**
    - rapidità o efficacia
    - che cosa è la qualità e quanto è importante
    - change management
    - utilizzo di strumenti di produttività individuale
    - strategia a lungo o breve termine (elevato o modesto investimento)
- **in funzione degli utenti**
    - numero d'utenti
    - esperienza nell'utilizzo della tecnologia
    - età media
    - motivazione o scetticismo
    - eretogeneità dei gruppi d'appartenenza
    - turnover
    - utilizzatori assidui o saltuari
    - versioni standard o ad hoc
### Interfacce code-based

> [!important] Interazione attraverso comandi (codici), è ottimale per moli di lavoro elevate che richiedono attenzione in punti lontani dal video.
> 
> Occorre mantenere basso il numero di codici utilizzabili, nessuna riusabilità delle conoscenze acquisite
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 11.png]]
### Interfacce 3270

> [!important] Interfaccia a caratteri, ottimale per data-entry ed editing di dati altamente strutturati.
> 
> Workflow fortemente predefinito dove la navigazione e tasti funzionali complicano apprendimento e riusabilità delle conoscenze acquisite
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 12.png]]
### Pseudo-GUI

> [!important] Interfaccia grafica che richiama la strutturazione di un'interfaccia a caratteri, ottimale per applicazioni che debbano gestire dati fortemente strutturati garantendo una buona flessibilità.
> 
> Se standard consente la riusabilità delle conoscenze acquisite
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 13.png]]
### Standard GUI

> [!important] Progettata e sviluppata per un ambiente grafico, esalta la potenzialità di manipolazione diretta (cut & paste, frag & drop).
> 
> Ottimale per user-driven applications (flessibilità)
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 14.png]]
### Special GUI

> [!important] Enfasi massima alla prestazione grafica, l'obitettivo prioritario è l'autoesplicazione (EIS, videogames).
> 
> Il cliente “si serve” da solo; l'utente target potrebbe non avere esperienza sull'utilizzo del computer
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 15.png]]
## Strutturazione
Una strutturazione “bassa e larga” fornisce all'utente una visione migliore delle possibilità offerte e facilita la navigazione.
![[SecondoAnno/MetodiNumerici/assets/image 16.png]]
### Modello multi-window
Più _main window_ attivabili contemporaneamente (estrema flessibilità), complessa navigazione
![[SecondoAnno/MetodiNumerici/assets/image 17.png]]
### Modello multi-document
Una sola _top window_ con menu, la top window guida una serie di _document window_.
La flessibilità è inferiore a quella del del modello multi-window, ma è ottimale anche per utenti inesperti.
![[SecondoAnno/MetodiNumerici/assets/image 18.png]]
### Modello multi-paned
Una _window_ alla volta con o senza menù, eventuale divisione in aree (_pane_) monofunzionali e monoposizionali. Assenza di flessibilità.
![[SecondoAnno/MetodiNumerici/assets/image 19.png]]
## Project standard
Si definiscono degli standard per:
- terminologia
- metafore, icone
- caratteristiche delle finestre (menu, bottoni, dimensioni, posizione, ecc)
L'obiettivo primario è quello di agevolare l'utilizzo da parte dell'utente:
- consistenza esterna
- i tool già utilizzati in azienda (standard de facto)
- consistenza interna subordinata all'usabilità
## Comunicazione visiva nelle GUI
- **Affordance**, enfatizza gli aspetti di un oggetto che invitano a manipolarlo in un certo modo
- **Metafora**, una parola, una frase o una figura che dipinge un oggetto o un concetto attraverso una somiglianza o un'analogia con un altro oggetto o concetto del mondo reale
- **Layout**, è determinato dalla posizione del testo, dei disegni e dei controlli all'interno di un'area considerata
- **Colori**, utili per focalizzare l'attenzione o per creare associazioni
- **Icone**, disegni piccoli, semplici e metaforici
- **Font**, leggibilità in relazione al tipo e alle caratteristiche del carattere
### Affordance
- Tridimensionalità
- Ombreggiatura
- Puntamento
![[SecondoAnno/MetodiNumerici/assets/image 20.png]]
### Metafore
La prima tra le scelte progettuali
![[SecondoAnno/MetodiNumerici/assets/image 21.png]]
### Layout
La posizione degli elementi è un importante strumento di comunicazione: le distanze devono essere in relazione al grado di associazione tra gli elementi.
Fra gli standard di progetto:
- distanza tra campi correlati
- distanza tra i gruppi
- distanza (superiore, laterale, inferiore) tra riquadro ed elementi contenuti
- distanza (superiore, laterale, inferiore) tra margine dell'area principale ed elementi contenuti
![[SecondoAnno/MetodiNumerici/assets/image 22.png]]
### Colori
- Non abusare dei colori in un “ambiente” monocromatico: il risalto è eccessivo
- se il colore è usato come codice: solo 3-5 colori, ricordarsi la semantica
- Colori vivaci per aree piccole e neutri per aree grandi
- Ricercare un contrasto efficace tra testo e sfondo
- Sfondo chiaro (bianco, grigio, giallo) è ottimale per testi scuri
- I colori troppo brillanti causano alterazione visiva sui tempi lunghi: sono pertanto sconsigliabili per applicazioni gestionali, mentre risultano ottimali nelle applicazioni self-service
![[SecondoAnno/MetodiNumerici/assets/image 23.png]]
![[SecondoAnno/MetodiNumerici/assets/image 24.png]]
### Icone
- **Struttura**
    - immagine
    - sfondo
    - testo (facoltativo)
- **Caratteristiche**
    - facilmente distinguibili
    - elevato fattore informativo
    - presentazione esplicita della metafora
    - incrementano la velocità e la correttezza della selezione
    - autoesplicative anche se prive di testo
- **Linee guida**
    - disegni semplici e schematici
    - colori differenti in icone differenti
    - il testo è il titolo della finestra collegata
    - evitare i puzzle

> [!important] **Desktop icon**
> 
> L'obiettivo è quello di avviare o riaprire un'applicazione; vengono utilizzate per applicazioni collegate per l'utente.
> 
> Se minimizzate:
> 
> - icone similari per finestre diverse della stessa applicazione
> - il testo è fondamentale per icone similari rappresentanti finestre diverse
> - testo = window title
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 25.png]]

> [!important] **Menu icon - Palette icon**
> 
> Sono sempre visibili accanto ai menu:
> 
> - overview di funzioni sempre attivabili
> - un modo veloce di selezionare
> - per comandi esprimibili più facilmente con disegni che con parole
> - invito alla sperimentazione
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 26.png]]

> [!important] **Button icon**
> 
> Vengono aggiunte al testo di un bottone rafforzandone graficamente la sua funzione
> 
> ![[SecondoAnno/MetodiNumerici/assets/image 27.png]]
### Font
Linee guida:
- Sans Serif per singole righe
![[SecondoAnno/MetodiNumerici/assets/image 28.png]]
- Serif per testi articolati su molte righe
![[SecondoAnno/MetodiNumerici/assets/image 29.png]]
- Attenzione al maiuscolo
![[SecondoAnno/MetodiNumerici/assets/image 30.png]]
- Spaziatura proporzionale
![[SecondoAnno/MetodiNumerici/assets/image 31.png]]
## Usabilità
L'efficacia, efficienza e soddisfazione con cui determinati utenti eseguono determinati compiti in particolari ambienti.
- **Efficacia**, in che misura i compiti previsti dal funzionamento vengono eseguiti
- **Efficienza**, risorse da impegnare per eseguire i compiti previsti
- **Soddisfazione**, misura dell'accettabilità del funzionamento da parte dell'utente
… ma anche comprensibilità, apprendibilità, operabilità.
![[SecondoAnno/MetodiNumerici/assets/image 32.png]]

> [!important] **Apprendibilità**
> 
> L'80% dei nuovi utenti in grado di svolgere compiutamente una singola attività dell'applicazione in 30 minuti.
> 
> Quando:
> 
> - turn-over alto
> - utenti saltuari
> - riduzione del training
> - sistemi solitamente sottoutilizzati per mancanza di training
> - breve ciclo di vita dei prodotti

> [!important] **Velocità**
> 
> 10 inserimenti ogni 2 minuti
> 
> Quando:
> 
> - utilizzo giornaliero e intensivo
> - attività ripetitiva

> [!important] **Soddisfazione**
> 
> 9 su 10 dichiarano che è “bello da usare”.
> 
> Quando:
> 
> - sistema self-service
> - business process re-engineering incentrato sul nuovo sistema

> [!important] **Facilità di navigazione**
> 
> Possibilità di innescare 6 diverse attività su un singolo oggetto senza ritornare al menù principale.
> 
> Quando:
> 
> - **Flessibilità**
>    - il cliente “guida il gioco”
>    - richiami notevoli tra attività
>    - si attende una decisione
> - **Rigidità**
>    - elevato turn-over
>    - l'importante non è prendere decisioni ma seguire una procedura

> [!important] **Memorabilità**
> 
> Riutilizzo, senza ulteriore training, di una applicazione inattiva da 12 mesi.
> 
> Quando:
> 
> - utenti saltuari
> - applicazioni per circostanze “eccezionali”
> - applicazioni di utilizzo secondario
> - applicazioni attivate in date precise (scadenze)

> [!important] **Prevenzioni degli errori**
> 
> Riduzione della percentuale degli errori incorreggibili (catastrofici).
> 
> Quando:
> 
> - risultati/prodotti ottenuti “faticosamente”
> - risultati correlati a fattori di sicurezza
> - risultati immediatamente visibili al cliente esterno
## Metodologia di progetto
**Prima del termine dello studio di fattibilità:**
1. definire le attività legate alla realizzazione dell'interfaccia
2. definire i parametri di riferimento ed i criteri di usabilità
3. pianificare le attività di valutazione dell'usabilità
4. realizzare il modello concettuale dell'interfaccia
**Precocemente nella fase di analisi e progettazione:**
1. definire e realizzare le strutture base (dialogo, look & feel)
2. stabilire gli standard di progetto per l'interfaccia
3. prototipare le parti ritenute critiche
4. verificare l'allineamento con modello concettuale e standard
**Nella fase di sviluppo:**
5. ultimare l'interfaccia in dettaglio legandola alla logica applicativa
## Test con l'utente
- **Simulatore**, l'utente è passivo
- **Dimostratore**, l'utente agisce sulle parti critiche
- **Prototipo**, l'utente agisce sull'intero sistema in beta-release
Gli elementi da verificare sono:
- il modello concettuale è sufficientemente rappresentato
- rispetto al progetto l'interfaccia è adatta e gli standard sono rispettai
- adeguato bilanciamento tra flusso predefinito e flessibilità
- possibilità d'utilizzo alternativo tra mouse e tastiera
- livello d'integrazione dell'utente con l'interfaccia
- è utilizzata la terminologia utente