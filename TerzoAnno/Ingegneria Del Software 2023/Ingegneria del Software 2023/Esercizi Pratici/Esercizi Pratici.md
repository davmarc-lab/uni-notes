> [!important] **Classificazione**
> 
> La classificazione consente di raggruppare in classi oggetti, funzioni o stati in base alle loro proprietà
# Diagramma delle classi
Descrivono la struttura del sistema in termini di classi e le loro relazioni reciproche.
Una classe descrive un gruppo di oggetti con proprietà, comportamento e relazioni comuni.
Un attributo è un valore che caratterizza gli oggetti di una classe.
Un’operazione è una trasformazione che può essere applicata agli oggetti di una classe. Ogni operazione ha come argomento implicito l’oggetto di destinazione.
## Classi di analisi
Rappresentano un’astrazione nel dominio del problema, corrispondono chiaramente a concetti concreti del mondo del business escludendo tutti i dettagli implementativi.
Hanno un insieme ridotto coeso e ben definito di responsabilità, indicato tutti gli attributi che saranno _probabilmente_ inclusi delle classi di progettazione. **Le loro operazioni specificano i principali servizi offerti dalla classe**.
## Classi di progettazione
Le loro specifiche sono complete per cui possono essere direttamente implementate, nascono dal dominio del problema per il raffinamento delle classi di analisi, oppure dal dominio della soluzione

> [!important] **Generalizzazione**
> 
> Tutti gli attributi, le operazioni e le relazioni della superclasse vengono ereditati dalle sottoclassi. È supportata l’ereditarietà multipla, possono essere indicati insiemi di generalizzazione e vincoli
> 
> ![[assets/image 33.png|image 33.png]]

> [!important] **Associazione**
> 
> È una connessione tra classi, tipicamente bidirezionale; è possibile indicare il verso di lettura di una associazione, definire associazioni monodirezionali, specificare ruoli
> 
> ![[assets/image 1 2.png|image 1 2.png]]
> 
> Le associazioni qualificate riducono un’associazione molti-a-molti a una del tipo uno-a-uno, specificando un attributo che permette di selezionare un unico oggetto destinazione svolgendo il ruolo di identificatore o chiave di ricerca
> 
> È possibile definire associazioni n-arie, cioè tra n-classi, ogni istanza dell’associazione è una tupla formata da n oggetti delle rispettive classi.

> [!important] **Dipendenza**
> 
> In generale, A dipende da B quando una variazione in B può comportare una variazione di A.
> 
> Nel caso delle classi, una dipendenza indica che una classe cliente dipende da alcuni servizi di una classe fornitore, ma non ha una struttura interna che dipende da quest’ultima.
> 
> Più specificatamente si può rappresentare il fatto che un’operazione della classe cliente ha argomenti che appartengono al tipo di un altra classe.
> 
> ![[assets/image 2 2.png|image 2 2.png]]
> 
> Un template, o classe parametrizzata, è utilizzato per descrivere una classe in cui uno o più parametri formali non sono istanziati. Un template definisce una famiglia di classi in cui ogni classe è specificata istanziando i parametri con i valori attuali.

> [!important] **Aggregazione**
> 
> L’aggregazione esprime le relazioni “parte-di” che sussistono tra oggetti, funzioni e stati
> 
> ![[assets/image 3 2.png|image 3 2.png]]

> [!important] **Composizione**
> 
> È un aggregazione in cui il tutto “possiede” le sue parti, la parti esistono solo in relazione al tutto; ogni parte appartiene esattamente ad un tutto
> 
> ![[assets/image 4 2.png|image 4 2.png]]

> [!important] **Raffinamento**
> 
> Esprime una relazione tra due descrizioni dello stesso concetto a diversi livelli di astrazione:
> 
> - tra un tipo astratto e una classe che lo realizza
> - tra una classe di analisi e una di progetto
> - tra una implementazione semplice e una complessa della stessa cosa
> 
> ![[assets/image 5 2.png|image 5 2.png]]
# Diagramma dei Casi d’uso
Rappresentano i ruoli di indirizzo del sistema da parte di uno o più utilizzatori:
- esseri umani
- organizzazioni, enti, istituzioni
- altre applicazioni o sistemi
Descrivono l’interazione tra attori e sistema, non la logica interna della funzione né la struttura del sistema. Sono espressi in forma testuale, comprensibile a tutti

> [!important] **Attore**
> 
> Un attore identifica il ruolo che un’entità esterna assume quando interagisce direttamente con il sistema. È sempre esterno al sistema, anche se esso ne può mantenere una rappresentazione interna

> [!important] **Caso d’uso**
> 
> Un caso d’uso è la specifica di una sequenza di azioni che un sistema, un sottosistema o una classe può eseguire interagendo con attori esterni. È una funzionalità come percepita da un attore, produce un risultato utile osservabile dall’attore.
## Ruoli dei casi d’uso
Le fasi iniziali della progettazione servono per chiarire cosa dovrà fare il sistema. I casi d’uso guidano l’intero progetto di sviluppo, costituiscono il punto di partenza per la progettazione del sistema.
## Identificare i casi d’uso
1. Identificare i confini del sistema
2. Identificare tutte le tipologie di utilizzatori del sistema
3. Per ogni tipologia di attore, rilevare in quale modo utilizzerà il sistema, partendo dagli obiettivi che esso deve raggiungere. A ogni modalità di utilizzo corrisponde un caso d’uso
4. Per ogni caso d’uso, descrivere lo scenario base, e le principali varianti a tale scenario. Così facendo possono emergere necessità di interazione del sistema con altri soggetti
## Scenari

> [!important] **Scenari**
> 
> Ogni specifica esecuzione, istanza, di un caso d’uso è detta scenario. Esistono scenari di successo e scenari di fallimento.
La prassi più diffusa per la descrizione degli scenari di un caso d’uso è quella di definire uno scenario base, cioè lo scenario più semplice possibile che porta al successo del caso d’uso.
Allo scenario base vengono quindi agganciate delle varianti che lo rendono più complesso e possono portare al successo o al fallimento dei casi d’uso.
## Realizzare i casi d’uso
La realizzazione dei casi d’uso può essere espressa con una collaborazione costituita da classi che interagendo tra loro svolgono i passi specificati nel caso d’uso.
La collaborazione che realizza un caso d’uso può essere descritta:
- **statico**, mediante un diagramma delle classi che evidenzi le classi o gli oggetti coinvolti nella collaborazione
- **dinamico**, mediante un diagramma di interazione che evidenzi i messaggi che gli oggetti si scambiano nell’ambito della collaborazione
# Diagramma degli oggetti
Un oggetto rappresenta una particolare istanza di una classe; un oggetto composto è un oggetto di alto livello che contiene altri oggetti.

> [!important] Un diagramma degli oggetti è un grafo di istanze di elementi che rappresenta un’istanza di un diagramma delle classi; il suo utilizzo è limitato principalmente a mostrare esempi di strutture dati
# Diagramma dei package

> [!important] Un package è un raggruppamento di elementi del modello semanticamente correlati.
Si possono rappresentare le relazioni tra package come relazioni di contenimento, si consiglia di mostrare al massimo due livelli. I package annidati vedono lo spazio dei nomi dei package che li contengono, il contrario non è vero.
Esistono i seguenti tipi di dipendenze tra package:
- **use**, quando un elemento del package cliente usa in qualche modo un elemento del package fornitore
- **import**, quando gli elementi pubblici dello spazio dei nomi del package fornitore vengono aggiunti come elementi pubblici dello spazio dei nomi del package cliente
- **access**, quando gli elementi privati dello spazio dei nomi del package fornitore vengono aggiunti come elementi privati allo spazio dei nomi del package cliente
- **trace**, rappresenta l’evoluzione di un elemento in un altro elemento più dettagliato
![[assets/image 6 2.png|image 6 2.png]]
Esiste una generalizzazione tra due package quando il package specifico si deve conformare all’interfaccia del package generale.
## Package d’analisi

> [!important] I package d’analisi sono gruppi di elementi del modello accomunati da forti correlazioni semantiche; la fonte migliore per individuarli è il diagramma delle classi
I migliori candidati per essere raggruppati nello stesso package sono:
- le classi appartenenti a gerarchie di composizione
- le classi appartenenti a gerarchie di specializzazione
Anche il diagramma dei casi d’uso può servire: uno o più casi d’uso che supportano un processo aziendale o un attore potrebbero indicare un package.
# Diagrammi di interazione
Rappresentano la struttura dell’interazione tra oggetti durante uno scenario. Esistono quattro tipi di diagrammi di interazione:
- **diagrammi di sequenza**, enfatizza la sequenza temporale degli scambi di messaggi
- **diagrammi di comunicazione**, enfatizza le relazioni strutturali tra gli oggetti che interagiscono
- **diagrammi di sintesi dell’interazione**, illustra come un comportamento complesso viene realizzato da un insieme di interazioni più semplici
- **diagramma di temporizzazione**, enfatizza gli aspetti real-time di un’interazione

> [!important] **Interazione**
> 
> Un’interazione è un’unità di comportamento di un classificatore che ne costituisce il contesto; essa comprende un insieme di messaggi scambiati tra linee di vita all’interno del contesto per ottenere un obiettivo