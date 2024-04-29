"https://www.jdoodle.com/execute-smalltalk-online/"



"----- wielokat -----"
Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'
!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"
	nazwa := nowaNazwa.
	wierzcholki := Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.!
!

!Wielokat methodsFor: 'printing'!

drukuj
	"wyswietl nazwe, pole i wierzcholki wielokata"
	Transcript show: 'Nazwa: ', self nazwa; cr.
	Transcript show: 'Pole: ', self pole printString; cr.
	Transcript show: 'Wierzcholki: '; cr.
	wierzcholki do: [:each | Transcript show: each printString; space].
	Transcript cr; cr!
!

!Wielokat methodsFor: 'actions'!

pole
	"licz pole wielokata, domyslnie zwroc 0"
	^0!

skaluj: skala
	"skaluj wielokat przez mnozenie wspolrzednych przez skale"
	wierzcholki do: [:each |
		| x y |
		x := (each x * skala).
		y := (each y * skala).
		each x: x y: y
	]!

obroc: kat
    | s c |
    s := kat sin.
    c := kat cos.
    wierzcholki do: [:each |
        | x y newX newY |
        x := each x.
        y := each y.
        newX := (x * c) - (y * s).
        newY := (x * s) + (y * c).
        each x: newX y: newY
    ].
    Transcript show: 'Obroce figure o kat: ', (kat / Float pi) printString, ' pi radianow'; cr.
    self drukuj.
	Transcript cr!
!

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaj nazwe wielokata"
    ^nazwa!

nazwa: nowa_nazwa
	"ustaw nowa nazwe wielokata"
	nazwa := nowa_nazwa!
!





"----- kwadrat -----"
Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'
!

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"
	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.!
!

!Kwadrat methodsFor: 'printing'!

drukuj
	"wyswietl nazwe, pole i wierzcholki kwadratu"
	super drukuj!
!

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"
	| bok |
	bok := (wierzcholki at: 2) x abs.
	^bok squared!

skaluj: skala
	"skaluj wielokat przez mnozenie wspolrzednych przez skale"
	Transcript show: 'Przeskaluje boki kwadratu przez: ', skala printString; cr.
	super skaluj: skala.
	self drukuj.
	Transcript cr!
!

!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"
	| p |
	p := self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt!
!





"----- trojkat rownoramienny -----"
Wielokat subclass: #TrojkatRownoramienny
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'
!

!TrojkatRownoramienny methodsFor: 'initialize-release'!

initializeBase: podstawa height: wysokosc
	"tworz trojkat rownoramienny o podanej podstawie i wysokosci"
	super initialize: 3 name: 'TrojkatRownoramienny'.
	wierzcholki := Array new: 3.
	wierzcholki at: 1 put: 0@0.
	wierzcholki at: 2 put: podstawa@0.
	wierzcholki at: 3 put: (podstawa / 2)@wysokosc.!
!

!TrojkatRownoramienny methodsFor: 'printing'!

drukuj
	"wyswietl nazwe, pole i wierzcholki trojkata rownoramiennego"
	super drukuj!
!

!TrojkatRownoramienny methodsFor: 'actions'!

pole
	"licz pole trojkata rownoramiennego"
	| podstawa wysokosc |
	podstawa := (wierzcholki at: 2) x abs.
	wysokosc := (wierzcholki at: 3) y abs.
	^ (podstawa * wysokosc) / 2.!

skaluj: skala
	"skaluj wielokat przez mnozenie wspolrzednych przez skale"
	Transcript show: 'Przeskaluje boki trojkata przez: ', skala printString; cr.
	super skaluj: skala.
	self drukuj.
	Transcript cr!
!

!TrojkatRownoramienny methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"
	| p |
	p := self pole + figura pole.
	^(TrojkatRownoramienny new) initializeBase: (p * 2) sqrt height: (p * 2) sqrt!
!





"----- testy kwadratow -----"
Transcript show: '-------- KWADRATY --------'; cr; cr.

| pi |
pi := Float pi.

| trojkat1 trojkat2 kwadrat_skala kwadrat_skala kwadrat_obrot |
kwadrat1 := Kwadrat new initialize: 4.
kwadrat1 drukuj.

kwadrat2 := Kwadrat new initialize: 2.
kwadrat2 drukuj.

kwadrat_sum := (kwadrat1 + kwadrat2).
kwadrat_sum drukuj.

kwadrat_skala := Kwadrat new initialize: 6.
kwadrat_skala drukuj.

kwadrat_skala skaluj: 2.

kwadrat_obrot := Kwadrat new initialize: 5.
kwadrat_obrot drukuj.

kwadrat_obrot obroc: 2 * pi.

"----- testy trojkatow -----"
Transcript show: '-------- TROJKATY --------'; cr; cr.

| trojkat1 trojkat2 trojkat_sum trojkat_skala trojkat_obrot |
trojkat1 := TrojkatRownoramienny new initializeBase: 6 height: 4.
trojkat1 drukuj.

trojkat2 := TrojkatRownoramienny new initializeBase: 3 height: 2.
trojkat2 drukuj.

trojkat_sum := (trojkat1 + trojkat2).
trojkat_sum drukuj.

trojkat_skala := TrojkatRownoramienny new initializeBase: 9 height: 6.
trojkat_skala drukuj.

trojkat_skala skaluj: 2.

trojkat_obrot := TrojkatRownoramienny new initializeBase: 12 height: 8.
trojkat_obrot drukuj.

trojkat_obrot obroc: pi.