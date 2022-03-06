# imperativeProgrammierung
Aufgaben aus dem Skript und Übungen der Vorlesung [63811 "Einführung in die imperative Pprogrammierung"](https://www.fernuni-hagen.de/mi/studium/module/ein_prog.shtml?sg=bamath) der [FernUniversität Hagen](https://www.fernuni-hagen.de/)

## Zusammenfassung der Muss-Regeln
1. Selbstdefiniete Konstantenbezeichner bestehen **nur aus Grossbuchstaben**.<br>
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
9. Die Übergabeart jedes Parameters wird duch Voranstellen von `in`, `io` oder `out` vor den Parameternamen gekennzeichnet.
10. Das Layout von Funktionen und Prozeduren entspricht dem von Programmen.
