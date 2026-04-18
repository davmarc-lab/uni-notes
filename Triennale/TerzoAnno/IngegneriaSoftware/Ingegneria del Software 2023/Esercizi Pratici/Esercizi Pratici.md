[[Tips]]
# Diagrammi possibili
- Classi
	- Casi d'uso
- Attività
- Sequenza
- Progetto delle Associazioni??
- Stati
# Uso dei metodi d’analisi
La tendenza attuale è integrare metodi dei tre tipi, tenendo però conto della tipologia di applicazione:

- **Applicazioni orientate agli oggetti**, l’aspetto più significativo è costituito dalle informazioni, le funzioni svolte sono relativamente semplici (aspetti statici)
- **Applicazioni orientate alle funzioni**, la complessità risiede nel tipo di trasformazione input-output operata (aspetti funzionali)
- **Applicazioni orientate al controllo**, l’aspetto più significativo da modellare è la sincronizzazione fra diverse attività cooperanti nel sistema (aspetti dinamici)

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
> ![[SecondoAnno/MetodiNumerici/assets/image 33.png|image 33.png#center]]

> [!important] **Associazione**
> 
> È una connessione tra classi, tipicamente bidirezionale; è possibile indicare il verso di lettura di una associazione, definire associazioni monodirezionali, specificare ruoli
> 
> ![[image 1 2.png|image 1 2.png#center]]
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
> ![[image 2 2.png|image 2 2.png#center]]
> 
> Un template, o classe parametrizzata, è utilizzato per descrivere una classe in cui uno o più parametri formali non sono istanziati. Un template definisce una famiglia di classi in cui ogni classe è specificata istanziando i parametri con i valori attuali.

> [!important] **Aggregazione**
> 
> L’aggregazione esprime le relazioni “parte-di” che sussistono tra oggetti, funzioni e stati
> 
> ![[image 3 2.png|image 3 2.png#center]]

> [!important] **Composizione**
> 
> È un aggregazione in cui il tutto “possiede” le sue parti, la parti esistono solo in relazione al tutto; ogni parte appartiene esattamente ad un tutto
> 
> ![[image 4 2.png|image 4 2.png]]

> [!important] **Raffinamento**
> 
> Esprime una relazione tra due descrizioni dello stesso concetto a diversi livelli di astrazione:
> 
> - tra un tipo astratto e una classe che lo realizza
> - tra una classe di analisi e una di progetto
> - tra una implementazione semplice e una complessa della stessa cosa
> 
> ![[image 5 2.png|image 5 2.png]]
## Classi Associative
La classe associativa permette di inserire un attributo su un associazione, può essere coinvolta in associazioni.
>[!note] Utilizzare una classe associativa impone indirettamente il vincolo di unicità dell'istanza, ovvero può esistere un'unica coppia (A, B), dove A e B sono due istanze.
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

![[TerzoAnno/HighPerformance/assets/Untitled 24.png]]
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
> La prassi più diffusa per la descrizione degli scenari di un caso d’uso è quella di definire uno scenario base, cioè lo scenario più semplice possibile che porta al successo del caso d’uso.
> Allo scenario base vengono quindi agganciate delle varianti che lo rendono più complesso e possono portare al successo o al fallimento dei casi d’uso.
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
> Si possono rappresentare le relazioni tra package come relazioni di contenimento, si consiglia di mostrare al massimo due livelli. I package annidati vedono lo spazio dei nomi dei package che li contengono, il contrario non è vero.
> Esistono i seguenti tipi di dipendenze tra package:
- **use**, quando un elemento del package cliente usa in qualche modo un elemento del package fornitore
- **import**, quando gli elementi pubblici dello spazio dei nomi del package fornitore vengono aggiunti come elementi pubblici dello spazio dei nomi del package cliente
- **access**, quando gli elementi privati dello spazio dei nomi del package fornitore vengono aggiunti come elementi privati allo spazio dei nomi del package cliente
- **trace**, rappresenta l’evoluzione di un elemento in un altro elemento più dettagliato
![[image 6 2.png|image 6 2.png]]
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
> Un’interazione è un’unità di comportamento di un classificatore che ne costituisce il contesto; essa comprende un insieme di messaggi scambiati tra linee di vita all’interno del contesto per ottenere un obiettivo.
> il **contesto** può essere dato dall'intero sistema, da un sottosistema, da un coso d'uso, da un'operazione, da una classe.
> Una **linea di vita** rappresenta come un'istanza di un classificatore partecipa all'interazione.
> Un **messaggio** rappresenta un tipo specifico di comunicazione istantanea tra due linee di vita in un'interazione, e trasporta un'informazione nella prospettiva che seguirà una attività.

## Linee di vita
Sono disegnate con lo stesso simbolo del loro classificatore, possono avere una "coda" a forma di riga verticale tratteggiata.
>[!note] Non rappresentano specifiche istanze del classificatore ma *modi* in cui le istanze partecipano all'interazione

## Messaggi
Possono essere di diversi tipi:
- **messaggi di chiamata**
- **messaggi di creazione**
- **messaggi di distruzione**
- **invio di segnali**
Per ogni messaggio di chiamata ricevuto da una linea di vita, deve esistere un'operazione corrispondente nel classificatore di quella linea di vita.

| Simbolo                                 | Descrizione                                                                     |
| --------------------------------------- | ------------------------------------------------------------------------------- |
| ![[Pasted image 20250509115938.png#le]] | **Messaggio sincrono**: il mittente aspetta che il destinatario ritorni         |
| ![[Pasted image 20250509115909.png]]    | **Messaggio asincrono**: il mittente continua l'esecuzione                      |
| ![[Pasted image 20250509115948.png]]    | **Messaggio di ritorno**: il destinatario restituisce il controllo al mittente  |
| ![[Pasted image 20250509120038.png]]    | **Creazione di un oggetto**: si crea un'istanza del classificatore destinatario |
| ![[Pasted image 20250509120052.png]]    | **Distruzione di un oggetto**: il mittente distrugge il messaggio               |
# Diagrammi di sequenza
Mostrano le interazioni tra linee di vita come una sequenza di messaggi ordinati temporalmente. Sono la forma più ricca e flessibile di diagramma di interazione.
Hanno **due dimensioni**: la dimensione verticale rappresenta il tempo mentre quella orizzontale rappresenta le linee di vita.

Un'**attivazione** mostra il periodo durante il quale una linea di vita esegue un'azione o direttamente o attraverso una procedura subordinata; rappresenta sia la durata dell'azione nel tempo sia la relazione di controllo tra l'attivazione e i suoi chiamanti.

Si possono specificare **nodi decisionali**, **iterazioni**, **attivazioni annidate**. È consigliato descrivere il flusso tramite un'insieme di **note** poste accanto agli elementi.
![[Pasted image 20250509123606.png]]
Quando un'istanza riceve un messaggio, il suo stato può cambiare:
- lo **stato** delle istanze può essere mostrato sulla linea di vita
- un **vincolo** posto sulla linea di vita indica una condizione sulle istanze che deve essere vera da lì in avanti
![[Pasted image 20250509123755.png]]![[Pasted image 20250509123815.png]]

# Diagrammi di stato
I diagrammi di stato descrivono in modo esaustivo l'evoluzione temporale delle istanze di un classificatore in risposta alle interazioni con altri oggetti.
Ogni classe può avere associato un diagramma di stato.
![[Pasted image 20250509124016.png#center]]
## Stati ed eventi
Lo **stato** di un oggetto in un certo istante è un'astrazione dell'insieme di valori dei suoi attributi e dei suoi collegamenti. Le differenti configurazioni di valori e collegamenti vengono raggruppate in stati a seconda di come incidono sul comportamento macroscopico dell'oggetto.
Uno stato può contenere azioni e attività:
- le **azioni** sono operazioni istantanee, atomiche e non interrompibili; sono associate a transizioni attivate da eventi
- le **attività** sono operazioni che richiedono un certo tempo per essere completate e possono quindi essere interrotte da un evento

Un **evento** provoca la transizione tra uno stato e l'altro; un oggetto rimane in uno stato per un tempo finito non istantaneo corrispondente all'intervallo tra i due eventi.
![[Pasted image 20250509125953.png#center]]
## Transizioni
>[!info] Transizione
>Una **transizione** marca il passaggio di un oggetto da uno stato all'altro, ed è associata a uno o più eventi e, opzionalmente, a condizioni e azioni

Un evento avviene a un preciso istante di tempo, e si assume che abbia durata nulla: possono essere raggruppati in classi, eventualmente descritte da attributi

Una **condizione** è un'espressione booleana che deve risultare vera affinché la transizione possa avvenire.

Un'**azione** è un'operazione istantanea, atomica e non interrompibile che viene eseguita all'atto della transizione.
![[Pasted image 20250509130259.png#center]]

Una transizione che esce da uno stato e non riporta alcun evento indica che la transizione avviene al termine dell'attività.
![[Pasted image 20250509130342.png#center]]
![[Pasted image 20250509130501.png#center]]

>[!note] Pseudo-stato di selezione
>Consente di dirigere il flusso nell'automa secondo le condizioni specificate sulle sue transizioni di uscita
>![[Pasted image 20250509130605.png#center]]

## Tipi di eventi
- **Evento di variazione**: si verifica nel momento in cui una condizione diventa vera. È denotato da un'espressione booleana e può essere considerato come una condizione verificata continuamente sebbene in realtà verrà controllata solo al variare dei parametri coinvolti
- **Evento di segnale**: si verifica nel momento in cui un oggetto riceve un oggetto segnale da un altro oggetto
- **Evento di chiamata**: è l'invocazione di una specifica operazione nell'istanza del classificatore che fa da contesto al diagramma, è denotato dalla signature dell'operazione e può essere associato a una sequenza di azioni separate da `;`
- **Evento temporale**: si verifica allo scadere di un periodo di tempo:
	- **when** (data=01/01/2025): specifica il momento della transazione
	- **after** (10 secondi): specifica che la transazione deve avvenire dopo 10 secondi dall'entrata dell'automa nello stato attuale; è anche possibile specificare il momento in cui inizia a decorrere il periodo aggiungendo una frase del tipo `since...`
## Stati Compositi
Uno stato composito è uno stato che contiene altri stati annidati, organizzati in uno o più automi. Ogni stato annidato eredita tutte le transizioni dello stato che lo contiene.
![[Pasted image 20250509141044.png#center]]
> [!note] Lo stato composito di un automa viene applicato solo a quell'automa
# Diagrammi di attività
Modellano un processo come un'attività costituita da un insieme di nodi connessi da archi.
Un'attività può essere associata a qualunque elemento di modellazione, che ne diviene il contesto:
- caso d'uso
- operazione
- classe
- interfaccia
- componente
- collaborazione
I diagrammi di attività possono essere usati per modellare efficacemente processi di business e workflow.
![[Pasted image 20250509141447.png#center]]
## Attività
Sono modellate come reti di **nodi** connessi da **archi**. I possibili tipi di nodi sono:
- **nodi azione**, che rappresentano compiti atomici all'interno dell'attività
- **nodi controllo**, che controllano il flusso all'interno dell'attività
- **nodi nodi oggetto**, che rappresentano oggetti usati nell'attività
Le possibili categorie di archi sono:
- **flussi di controllo**, che rappresentano il flusso di controllo attraverso l'attività
- **flussi di oggetti**, che rappresentano il flusso di oggetti attraverso l'attività
### Nodi azione
Possono essere di due tipologie:
- **nodo azione di chiamata**:

| Azione                  | Simbolo                              |
| ----------------------- | ------------------------------------ |
| chiama un comportamento | ![[Pasted image 20250509142011.png]] |
| chiama un'attività      | ![[Pasted image 20250509142036.png]] |
| chiama un'operazione    | ![[Pasted image 20250509142056.png]] |

- **nodo azione di accettazione evento temporale**:

| Azione                                                                          | Simbolo                              |
| ------------------------------------------------------------------------------- | ------------------------------------ |
| produce un evento temporale ogni volta che la condizione temporale diventa vera | ![[Pasted image 20250509142238.png]] |
| diventa attivo solo quando si attiva l'arco                                     | ![[Pasted image 20250509142257.png]] |
### Nodi controllo

| Tipo                                                                | Simbolo                                     |
| ------------------------------------------------------------------- | ------------------------------------------- |
| **Nodo Iniziale**: indica l'inizio del flusso                       | ![[Pasted image 20250509142747.png#center]] |
| **Nodo finale dell'attività**: termina un'attività                  | ![[Pasted image 20250509142809.png#center]] |
| **Nodo finale del flusso**: termina uno specifico flusso            | ![[Pasted image 20250509142824.png#center]] |
| **Nodo decisione**: divide il flusso in più flussi alternativi      | ![[Pasted image 20250509142848.png#center]] |
| **Nodo fusione**: ricongiunge i flussi a valle di un nodo decisione | ![[Pasted image 20250509142900.png#center]] |
| **Nodo biforcazione**: divide il flusso in più flussi concorrenti   | ![[Pasted image 20250509142923.png#center]] |
| **Nodo ricongiunzione**: sincronizza flussi concorrenti             | ![[Pasted image 20250509142936.png#center]] |

### Nodi oggetto
I nodi oggetto indicano che sono disponibili istanze di una data classe in un punto specifico dell'attività.
Gli archi in entrata e in uscita dai nodi oggetto rappresentano flussi di oggetti creati e consumati da nodi azione.
È possibile rappresentare esplicitamente lo stato di un oggetto.
![[Pasted image 20250509144436.png#center]]
## Corsie
Le attività possono essere partizionate in **corsie** che raggruppano insiemi di azioni correlate; le corsie possono corrispondere a:
- casi d'uso
- classi
- componenti
- unità organizzative
- ruoli
La semantica di ogni insieme di corsie è descritta da una *dimensione*.
![[Pasted image 20250509144606.png#center]]
# Diagramma dei componenti
Mostra i componenti e loro interdipendenze.
Un **componente** è una parte modulare di un sistema che incapsula i suoi contenuti (black box), i componenti possono avere attributi e operazioni, e possono partecipare ad associazioni e generalizzazioni.
![[Pasted image 20250509155355.png#center]]
## Componenti
I componenti possono contenere oggetti, ad indicare che essi ne sono parte integrante. I componenti sono connessi tra loro mediante **dipendenze**, possibilmente tramite **interfacce**, ad indicare che un componente usa i servizi di un altro componente.
![[Pasted image 20250509161050.png#center]]
# Diagramma di deployment
Specifica l'hardware su cui verrà eseguito il software e il modo in cui il software è dislocato sull'hardware.
Può avere due forme:
- **descrittore**, che contiene nodi, relazioni tra nodi e manufatti; modella *tipi* di architetture
- **istanza**, che contiene istanze di nodi, di relazioni tra nodi e di manufatti; modella un deployment dell'architettura su un particolare sito
![[Pasted image 20250509161300.png#center]]
## Nodi
Un **nodo** rappresenta un tipo di risorsa computazionale su cui i manufatti possono essere dislocati per l'esecuzione. Due stereotipi standard:
- `<<device>>`, rappresenta un tipo di periferica fisica, per esempio un PC
- `<<executionEnvironment>>`, rappresenta un tipo di ambiente software di esecuzione, per esempio un web server
I nodi possono essere annidati in nodi, un'associazione tra nodi rappresenta un canale di comunicazione tra di essi.
Si possono usare altri stereotipi e icone per aumentare la leggibilità del diagramma.
## Manufatti
Un manufatto rappresenta un'entità concreta del mondo reale, per esempio:
- file sorgenti
- file eseguibili
- script
- tabelle di database
- documenti
- modelli UML
I manufatti vengono dislocati sui nodi.
![[Pasted image 20250509161642.png#center]]
![[Pasted image 20250509161709.png#center]]
