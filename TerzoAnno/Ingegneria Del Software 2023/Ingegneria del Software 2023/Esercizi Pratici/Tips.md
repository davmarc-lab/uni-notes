# Consigli Vari
## Diagramma delle classi
### Classi associative
Se ho bisogno di inserire un attributo su un'associazione, devo utilizzare una classe associativa
![[Pasted image 20250513113000.png]]
Un istanza di `Uomo` e un istanza di `Donna`, si possono sposare solamente una volta.

Ciò viene implicato dalla classe associativa stessa con il **vincolo di unicità** delle classi associative.
Se voglio permettere che la coppia `(Uomo-Donna)`, con le stesse istanze, possano sposarsi più di una volta ho bisogno di modificare l'associazione nel seguente modo:
![[Pasted image 20250513113333.png]]
In questo caso uno stesso `Uomo` può sposarsi con la stessa `Donna` più volte, vale anche il viceversa.
### Associazioni ternarie
Nelle associazioni ternarie vengono scritte solo le **molteplicità di ritorno**: data una coppia di istanze quanti risultati ho?
- 1 aula e 1 corso, quanti GO posso avere? $\longrightarrow$ \*
- 1 corso e 1 GO, quante aule posso avere? $\longrightarrow$ $1$
- 1 GO e 1 aula, quanti corsi posso avere? $\longrightarrow$ $1$
![[Pasted image 20250513113853.png]]
Il primo passo da eseguire è verificare se è effettivamente una ternaria o no, un modo per farlo consiste nel verificare se tutte le **molteplicità di andata** sono $1..*$.
- 1 aula può avere \*(corsi-GO)? $\longrightarrow$ SI
- 1 corso può avere \*(GO-aula)? $\longrightarrow$ SI
- 1 GO può avere \*(aula-corso)? $\longrightarrow$ SI
Dalle molteplicità di ritorno è possibile individuare le **dipendenze funzionali**, sono tutte quelle che hanno come valore $1$.