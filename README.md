# imperativeProgrammierung
Aufgaben aus dem Skript und Übungen der Vorlesung [63811 "Einführung in die imperative Pprogrammierung"](https://www.fernuni-hagen.de/mi/studium/module/ein_prog.shtml?sg=bamath) der [FernUniversität Hagen](https://www.fernuni-hagen.de/)

## Zusammenfassung der Muss-Regeln
1. Selbstdefiniete Konstantenbezeichner bestehen **nur aus Grossbuchstaben**.<br>
   Bezeichner vonStandardkonstanten wie z.B. `maxint` sind also ausgenommen.
2. Typbezeichnern wird ein `t` vorangestellt.
   Bezeichner von Zeigertypen beginnen mit `tRef`.
   Bezeichner formaler Parameter beginnen mit `in`, `io` oder `out`, im FreePascal ist `io` und `out` durch `var` zu ersetzen, `in` exisitiert hier nicht.
3. Jede Anweisung beginnt in einer neuen Zeile.
   `begin` und `end` stehen jeweils in einer Eigenen Zeile. 