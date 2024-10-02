Questo è un tentativo di creare un IDE per la programmazione assembly (Masm32 è il mio preferito), che permetta un controllo sul codice il più vicino possibile a Visual Studio 2022. Sicuramente avrà meno opzioni e verrà creato un po' alla volta. Implementato in assembly x86 in versione 32 bit per il momento e successivamente a 64 bit (e successivi quando saranno).

Cercherò di tenere su GitHub il codice sorgente, e l'eseguibile; i restanti file derivanti dall' assemblatura verranno eliminati (o almeno la maggior parte).

Il file a.bat mi permette di assemblare e linkare il tutto senza dover riscrivere continuamente sulla linea di comando la sintassi (un po' prolissa)

A seguto una serie di obbiettivi per arrivare alla fine del progetto:

- 1° obbiettivo: creare un editor di testo che permetta la creazione di soluzioni e progetti con varie opzioni di ricerca e anche una funzione di completamento del codice e suggerimento di variabili già dichiarate per semplificare la scrittura del codice specialemte nelle strutture.
	Spachettizzazione dell'obbiettivo 1:
	* Creazione di una finestra
	* Creazione di una finestra figlia dove inserire i file
	* Creazione del menu file per chiusura programma
	* Aggiornamento menu file per apertura file sorgente
	* (.... altri in arrivo)

- 2° obbiettivo: integrare masm32 e altri assembler per compilare i progetti

- 3° obbiettivo: creare un assembler interno con sintassi Intel per compilare internamente i progetti

- 4° obbiettivo: creare contemporaneamente un linker per creare i file eseguibili

- 5° obbiettivo: debugger integrato per portare l'editor a diventare un IDE a tutti gli effetti.

- 6° obbiettivo: aggiornare l'assembler per creare un assemblatore OOP (ok, mi sa che ho esagerato questa volta)....

