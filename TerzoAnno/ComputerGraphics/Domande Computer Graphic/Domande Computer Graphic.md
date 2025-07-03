## Parziale 1
- **Descrizione dei componenti principali di una scheda video**
    
    ### GPU
    
    La GPU è un componente specializzato nell’elaborazione delle immagini e delle animazioni. Riceve le istruzioni dal software tramite la libreria grafica e le esegue. Serve per:
    
    - **elaborazione grafica**, la gpu è specializzata nell’elaborazione di dati grafici, e risulta essenziale per attività come: giochi, editing video, applicazioni 3D e applicazioni scientifiche
    - **calclolo parallelo**, la loro capacità di eseguire calcoli in parallelo a una velocità elevata le rende strumenti indispensabili in molti settori, come nel deep learning e nell’HIgh Performance Computing
    
    La GPU ha una architettura di tipo SIMD (Single Instruction Multiple Data), ovvero dato uno stream di dati in ingresso (come le primitive e le loro proprietà), essa applica la stessa operazione a tuttti i dati.
    
    Una scheda video è composta dai seguenti componenti:
    
    - GPU
    - Memoria video: è un componente in grado di memorizzare le informazioni elaborate dalla GPU ed eventualmente le immagini completate nell’attesa di inviarle al monitor. Si parla di RAM in modalità **frame-buffer** quando una parte di essa è dedicata a memorizzare le immagini complete finché queste non debbano essere visualizzate.
    - BIOS video: è un chip che memorizza le impostazioni della scheda video e, al momento del suo avvio, esegue tutti i test di diagnostica sull amemori, sull’input e sull’output della scheda stessa.
    - Connessione monitor
    - Connessione scheda madre per dati e alimentazione
    
    > [!important] **Modalità 2D accelerata**
    > 
    > Le schede grafiche 2D accelerate sono quelle che siamo abituati a vedere da almeno una decina d’anni a questa parte, ovvero quelle dotate di GPU in grado di “aiutare” il processore del computer ad eseguire parte delle funzioni
    
    > [!important] **Modalità 3D accelerata**
    > 
    > Questo tipo di scheda dispone delle funzionalità dell’accelerazione 2D e vi si affianca la modalità 3D, in cui la GPU esegue ancora più calcoli, e l’unico compito della CPU resta fornire i dati geometrici tramite i quali la GPU stessa calcolerà i pixel fotogramma per fotogramma. È richiesta una grande quantità di RAM, che conterrà le texture da applicare ai pixel.
    
    ### Frambe Buffer
    
    Il framebuffer è una porzione della memoria RAM presente nella scheda video, dove vengono memorizzate le immagini prima di essere visualizzate sul display. Il frame buffer è una collezione di diversi buffer (piani di bit) dedicati.
    
    > [!important] **Color Frame Buffer**
    > 
    > Il buffer principale è il **color frame buffer**: contiene le componenti del colore per ogni pixel, la sua forma a matrice riproduce la struttura a griglia del display raster; ogni elemento $(x, y)$ contiene informazioni per il pixel corrispondente nella posizione $(x, y)$ nel display.
    > 
    > Poiché il colore del pixel di un monitor si forma in sintesi additiva a partire dai tre primari R, G e B, ogni posizione sarà divisa in tre zone per i tre valori R, G e B.
    > 
    > Se per ogni colore primario sono riservati otto bit (1 byte), ogni pixel richiede 24 bit (3 byte).
    
    Altri buffer disponibili sono lo **Z-buffer**, anche chiamato depth buffer, che gestisce la visibilità.
    
    Il **double buffer** (front buffer ^ back buffer) è comunemente usato per velocizzare le animazioni: se l’immagine finale mostrata a video è contenuta nel front buffer, nel back buffer è contenuta la scena che sta per essere mostrata. I due buffer vengono poi scambiati dal processore grafico, dopo lo scambio i ruoli di back e front buffer si scambiano, e così succede dopo ogni frame visualizzato.
    
- **Differenza tra grafica raster e grafica vettoriale**
    
    > [!important] **Grafica raster**
    > 
    > La grafica a punti (grafica bitmap o raster) trova applicazione soprattutto nell’elaborazione di immagini fotografiche e nelle illustrazioni pittoriche.
    > 
    > Lavorando con i singoli pixel si possono ottenere effetti simili a quelli della pittura e grafica tradizionale. I programmi di fotoritocco funzionano con immagini raster e i ritocchi sono possibili punto per punto.
    > 
    > È possibile ingrandire l’immagine solo ingrandendo la dimesione del pixel, che può diventare visibile, fino a crere effetti sgradevoli.
    > 
    > Uno dei principali svantaggi della grafica raster consiste invece nella natura intrinsecamente discreta della rappresentazione tramite pixel: le primitive grafiche devono essere convertite nelle matrici di pixel che meglio le rappresentano, per poter essere visualizzate su un display di tipo raster. Questa operazione è chiamata **scan conversion**.
    
    > [!important] **Grafica vettoriale**
    > 
    > La grafica a oggetti è un’evoluzione della grafica a punti.
    > 
    > I programmi che consentono di creare immagini ad oggetti non memorizzano il disegno come insieme di punti, ma con formule matematiche che descrivono i singoli oggetti.
    > 
    > Ogni oggetto viene memorizzato in un database interno di oggetti grafici descritti matematicamente.
    > 
    > Grazie a questa tecnica gli oggetti si possono ingrandire, rimpicciolire, routare, ridimensionare, colorare (bordi e contenuto) senza nessuna perdità di qualità.
    
- **Pipeline di rendering**
    
    La GPU ha un architettura a pipeline poiché progettata per soddisfare la graphics rendering pipeline. In input alla pipeline vi è un insieme di primitive geometriche 3D, camera virtuale, risorse luminose, texture ed altro.
    
    ### Fixed Function Pipeline
    
    Implementazione cablata via hardware della pipeline grafica.
    
    I programmatori potevano accedere alle funzionalità fornite dall’hardware grafico della GPU tramite opportune interfacce 3D di programmazione (API).
    
    La realizzazione della pipeline in hardware ha permesso di migliorare notevolmente le performance delle applicazioni, ma la standardizzazione degli algoritmi di rendering non permetteva flessibilità negli effetti di resa grafica, limitandone qualità e realismo.
    
    ### Programmable Pipeline
    
    Significa libertà da parte del programmatore di implementare vari tipi di algoritmi come differenti modelli di luminisità, o generazione di coordinate di texture, trasformazioni non lineari.
    
    Si hanno due distinte unità programmabili: **vertex processor** e **fragment processor**; queste rappresentano rispettivamente la manipolazione della geometria e la rasterizzazione dei pixel.
    
    > [!important] **Vertex Shader**
    > 
    > Un vertex shader è un programma che prende in ingresso una serie di informazioni su un vertice della scena, e da in uscita la posizione di questo nel sistema di coordinate di vista, e, opzionalmente, il colore, il vettore normale alla superficie e le coordinate di texture.
    
    La Shader Unit può modificare proceduralmente i dati in uscita variando le matrici di trasformazione, gli attributi relativi alle fonti di luce che illuminano la scena, o altri parametri necessari a specificare le operazioni di trasformazione e illuminazione del Geometry Stage.
    
    > [!important] **Fragment Shader**
    > 
    > Prendono come input gli output del programma vertex shader e le texture map. Producono un colore finale e una trasparenza come output. Sono spesso chiaamati shader di frammenti.
    
    In questo modo dalla propria applicazione i programmatori di grafica possono accedere e controllare direttamente le funzionalità della scheda grafica.
    
    Per ogni fase di elaborazione della pipeline, le GPU contengono molte unità di elaborazione identiche, che hanno una propria area di memoria temporanea e propri registri interni, ma che condividono l’unità di controllo. Sono chiamate **Shader Processing Unit**: a ciascuna di esse è assegnato un diverso elemento presente nel buffer di origine e quando un numero sufficiente di Processing Unit è pronta, tutti i dati sono elaborati contemporaneamente.
    
- **Stadi della Graphics Rendering Pipeline**
    
    I vari stadi della pipeline possono essere accorpati in tre principali stadi:
    
    - **application**
        - 3D modeling e texture loading
        - user interaction handling
    - **geometry**
        1. Model & View Transformations: la GPU trasforma tutti gli oggetti in un sistema di coordinate comune: dal sistema di riferimento dell’oggetto, al sistema di riferimento del mondo, al sistema di riferimento della camera virtuale
        2. Vertex Shading & Illumination: dopo che le coordinate di un triangolo sono in un sistema di coordinate globale, la GPU calcola il suo colore in base alle luci nella scena
        3. Projection: proiezione del volume di vista che continene la scena, in un volume canonico con centro l’origine e i valori di $x, y, z$ che variano tra $-1$ e $1$.
        4. Clipping: elimina tutto ciò che è esterno al volume di vista canonico
        5. Screen Mapping: trasformazione dello spazio dello schermo (le primitive adesso sono in 2D e si può passare al processo di rasterizzazione)
    - **rasterizer**
        1. Scan conversion
        2. Fragment processing
        3. Z-buffer ,Cull Face Testing e Blending
- **Spazi vettoriali**
    
    > [!important] **Spazio vettoriale**
    > 
    > Sia l’insieme $R^n$ l’insieme dei vettori ad $n$ componenti reali. Gli elementi di $R^n$ sono i vettori e gli scalari.
    > 
    > L’insieme $R^n$ in cui si definiscono le operazioni di addizione tra due vettori e di moltiplicazione di un vettore per uno scalare è munito di una struttura di **spazio vettoriale sul campo** $R$.
    > 
    > $$u \in R^n \quad v \in R^n \quad u+v= \begin{bmatrix}  
    > u_1 + v_1 \\  
    > u_2 + v_2 \\  
    > \dots \\  
    > u_n + v_n  
    > \end{bmatrix}  
    > \quad  
    > \lambda u = \begin{bmatrix}  
    > \lambda u_1 \\  
    > \lambda u_2 \\  
    > \dots \\  
    > \lambda u_n  
    > \end{bmatrix}, \lambda \in R$$
    
    > [!important] **Norma euclidea (norma 2)**
    > 
    > Utilizzata per misurare la lunghezza di un vettori; fonrisce una nozione di lunghezza che rimane inalterata per rotazioni/traslazioni e riflessioni del vettore.
    > 
    > $$\|a\|_2 = \sqrt{<a, a>} = \sqrt{a^Ta} = \sqrt{\sum_{i=1}^{n}{a_i}^2} = \sqrt{a_1^2 + a_2^2 + \dots + a_n^2}$$
    
    > [!important] **Prodotto scalare**
    > 
    > Il prodotto scalare è un valore scalare che da informazioni sulla relazione tra i due vettori. In particolare il suo segno da informazioni sull’angolo che formano i vettori.
    > 
    > $$a \cdot b = \|a\|\|b\|\cos(\theta)$$
    
    > [!important] **Vettori perpendicolari**
    > 
    > Dato un vettore $a = (a_x, a_y)$ il vettore ad esso perpendicolare è dato da:
    > 
    > $$a^{\perp} = \pm(-a_y, a_x)$$
    
    > [!important] **Cross Product (Prodotto esterno o vettoriale)**
    > 
    > $a \times b$ è un vettore perpendicolare ad entrambi $a$ e $b$ ed ha la direzione definita dalla regola della mano destra:
    > 
    > - pollice = primo vettore
    > - indice = secondo vettore
    > - medio = vettore risultato
    
    > [!important] **Calcolare la normale ad un triangolo**
    > 
    > $$n^* = (B - A) \times (C -A) \\  
    > n = {n^* \over \|n^*\|}$$
    
- **Spazi affini**
    
    > [!important] **Spazio affine**
    > 
    > Gli spazi affini sono un’estensione dello spazio lineare che include un’ulteriore tipo di entità: i **punti**.
    > 
    > Oltre a somma e moltiplicazione tra scalari, somma tra vettori e moltiplicazione scalare-vettore, si introducono due nuove operazioni:
    > 
    > - differenza **punto-punto** che definisce un vettore $v = P - Q$
    > - somma **punto+vettore**, $P+v$ che definisce un nuovo punto: $Q=P+v$
    > 
    > L’interpolazione geometrica è immediata.
    > 
    > I **punti** sono locazioni nello spazio e la differenza di due punti è data dal vettore che li congiunge.
    
    > [!important] **Coordinate omogenee**
    > 
    > Un vettore è rappresentato mediate la terna $(v_1, v_2, v_3)$ come:
    > 
    > $$v = v_1e_1 + v_2e_2 + v_3e_3$$
    > 
    > Si aggiunge una dimensione extra e viene utilizzata per identificare vettori e punti:
    > 
    > - **Punto** $(v_1, v_2, v_3, 1)^T$
    > - **Vettore** $(v_1, v_2, v_3, 0)^T$
    
    > [!important] **Coordinate baricentriche**
    > 
    > Una combinazione affine è una combinazione lineare di punti con coefficienti che hanno somma $1$.
    > 
    > $$P = \alpha_0P_0 + \alpha_1P_1 + \dots + \alpha_NP_N \qquad  
    > \text{con }\alpha_0 + \alpha_1 + \dots + \alpha_N = 1$$
    > 
    > I coefficienti $\alpha_0, \alpha_1, \dots, \alpha_N$ sono le coordinate baricentriche (affini) di $P$ nello spazio affine.
    > 
    > La combinazione affine di due punti distinti descrive la retta passante per i due punti.
    > 
    > Siano $Q$ e $R$ due punti dello spazio affine reale e sia $v$ il vettore da essi individuato:
    > 
    > $$v = R -Q$$
    > 
    > Consideriamo la loro combinazione affine, $\alpha + \beta = 1$,
    > 
    > $$P = \alpha R+\beta Q, \quad \beta = 1 - \alpha \\  
    > P(\alpha) = \alpha R + (1 - \alpha)Q \\  
    > P(\alpha) = Q + \alpha(R - Q) \\  
    > P = Q + \alpha v$$
    
    > [!important] **Combinazione convessa**
    > 
    > La combinazione convessa è una combinazione **affine con pesi positivi**.
    > 
    > Nel caso della combinazione convessa di due punti, il punto risultante giace sul segmento che congiunge i due punti.
    > 
    > Nel caso di $n$ punti che formano un poligono convesso, il punto risultante si trova all’interno del poligono.
    > 
    > Se tutti i pesi sono uguali a $^1/_n$, il punto risultante si chiama **centroide** dell’insieme dei punti.
    
    > [!important] **Coordinate baricentriche di un punto appartenente ad un triangolo**
    > 
    > ![[TerzoAnno/ComputerGraphics/assets/image.png|image.png]]
    
    > [!important] **Convessità**
    > 
    > Un oggetto è convesso se e solo se comunque presi due punti nell’oggetto tutti i punti sul segmento di linea tra questi punti sono anche nell’oggetto.
    
    > [!important] **Guscio Convesso**
    > 
    > Dato un insieme di punti $P_1, P_2, \dots, P_n$, l’insieme di tutti i punti $P$ che possono essere rappresentati come combinazioni convesse è detto inviluppo convesso (guscio convesso) dell’insieme.
    > 
    > Il guscio convesso (**convex hull**) di un insieme di punti è la più piccola regione convessa che contiene tutti i punti dati.
    
    > [!important] **Equazione in forma implicita di una linea in 2D**
    > 
    > ![[TerzoAnno/ComputerGraphics/assets/image 1.png|image 1.png]]
    > 
    > ![[TerzoAnno/ComputerGraphics/assets/image 2.png|image 2.png]]
    
- **Cambiamento di sistema di riferimento**
- **Rendering Pipeline: il sottosistema geometrico**
    
    Definita una camera virtuale e una scena tridimensionale, la pipeline di rendering costruisce una serie di trasformazioni che proiettano la scena tridimensionale in un’immagine in una finestra contenuta nello schermo bidimensionale.
    
    Questo stadio della rendering pipeline può essere vista come una pipeline di trasformazioni geometriche o trasformazioni di sistemi di coordinate.
    
    Un modello geometrico è infatti trasformato mediante trasformazioni di modellazione, vista, proiezione e viewport, ovvero trasformazioni tra vari sistemi di riferimento.
    
    > [!important] **World Coordinate System**
    > 
    > Inizialmente il modello geometrico viene creato nello spazio locale del modello.
    > 
    > Viene quindi posizionato ed orientato in scena nel **World Coordinate System**, mediante trasformazioni di modellazione sui vertici del modello
    > 
    > Il WCS è unico e dopo che tutti i modelli geometrici necessari per creare una scena sono stati posizionati tutti i modelli sono rappresentati in questo spazio.
    
    > [!important] **View Coordinate System**
    > 
    > Poiché solo i modelli ‘visti’ dalla camera virtuale sono resi, tutti i modelli sono quindi trasformati mediante una trasformazione di vista nel sistema di riferimento della camera o camera frame **View Coordinate System**.
    > 
    > Dal centro del sistema della camera solo una porzione di volume, detto **volume di vista**, contiene la scena che è visibile all’osservatore.
    
    Solo le primitive interne al volume di vista sono passate all’ultima trasformazione del geometry stage, la **trasformazione di viewport** (o **screen mapping**).
    
    Quest’ultima converte le coordinate $(x, y)$ reali di ogni vertice, in coordinate schermo espresse in pixel (**Device Coordinate System NDC**). Quest’ultime, insieme con la coordinata $-1 \le z \le 1$ forniranno l’input per lo stadio successivo della pipeline, la fase di rasterizzazione.
    
    ### Trasformazioni di modellazione
    
    Ogni oggetto è definito in un suo sistema di coordinate, Object Coordinate System. Le trasformazioni di modellazione permettono di muovere, orientare e trasformare modelli geometrici all’interno di un sistema di riferimento comune, sistema di coordinate del mondo (WCS).
    
    Significa moltiplicare ogni vertice per una matrice di trasformazione affine $4\times4 \ T_m$
    
    ### View transform
    
    Prende in input dei vertici in WCS e li trasforma in un sistema di coordinate della telecamera (VCS)
    
- **Clipping: algoritmo di Cohen-Sutherland per il clipping di segmenti 2D**
- **Curve interpolanti di Hermite**
- **Pipeline di rendering: sottosistema raster**