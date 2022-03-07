# imperativeProgrammierung
Aufgaben aus dem Skript und Übungen der Vorlesung [63811 "Einführung in die imperative Pprogrammierung"](https://www.fernuni-hagen.de/mi/studium/module/ein_prog.shtml?sg=bamath) der [FernUniversität Hagen](https://www.fernuni-hagen.de/)

## Zusammenfassung der Muss-Regeln
1. Selbstdefiniete Konstantenbezeichner bestehen nur aus Grossbuchstaben.<br>
   Bezeichner vonStandardkonstanten wie z.B. `maxint` sind also ausgenommen.
2. Typbezeichnern wird ein `t` vorangestellt.<br>
   Bezeichner von Zeigertypen beginnen mit `tRef`.<br>
   Bezeichner formaler Parameter beginnen mit `in`, `io` oder `out`, im FreePascal ist `io` und `out` durch `var` zu ersetzen, `in` exisitiert hier nicht.
3. Jede Anweisung beginnt in einer neuen Zeile.<br>
   `begin` und `end` stehen jeweils in einer Eigenen Zeile.
4. Anweisungsfolgen werden zwischen `begin` und `end` um eine konstante Anzahl von 2-4 Stellen eingerückt. `begin` und `end` stehen linksbündig unter der zugehörigen Kontrollanweisung, sie weden nicht weiter eingerückt.
5. Anweisungsteile von Kontrollanweisungen werden genauso eingerückt.
6. Im Programmkopf wird die Aufgabe beschrieben, die das Programm löst.
7. Jeder Funktions- und Prozedurkopf enthält eine knappe Aufgabenbeschreibung als Kommentar. Ggf. werden zusätzlich die Parameter kommentiert.
8. Die Parameter werden sortiert nach Übergabeart: Eingangs-, Änderungs- und Ausgangsparameter.
9. Die Übergabeart jedes Parameters wird durch Voranstellen von `in`, `io` oder `out` vor den Parameternamen gekennzeichnet.
10. Das Layout von Funktionen und Prozeduren entspricht dem von Programmen.
11. Jede von einer Funktion oder Prozedur benutzte bzw. manipulierte Variable wird als Parameter übergeben. Es werden keine globalen Variablen manipuliert.
12. Jeder nicht von der Prozedur veränderte Parameter wird als Wertparameter übergeben. Lediglich Felder können auch anstattals Wertparameter als Refernzparameter übergeben werden, um den Speicherplatz für die Kopie und den Kopiervorgang zu sparen. Der Feldbezeichner beginnt aber stets mit dem präfix `in`, wenn das Feld nicht verändert wird.
13. Funktionsprozeduren werden wie Funktionen im mathematischen Sinne benutzt, d.h. sie besitzen nur Wertparameter. Wie bei Prozeduren ist eine Ausnahme nur bei Feldern erlaubt, um zusätzlichen Speivherplatz und Kopieraufwand zu vermeiden.
14. Wertparameter werden nicht als lokale Variable missbraucht.
15. Die Laufvariable wird innerhalb eine `for`-Anweisung nicht manipuliert.
16. Die Grundsätze der strukturierten Programmierung sind strikt zu befolgen.
