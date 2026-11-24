**V3 — interfață.**

Înțeleg pragmatismul, dar recomand V3. Un singur `if` funcționează acum, dar testul unui singur modul (text sau CSV) devine imposibil cu V1 — trebuie să treci prin `exportă` cu condiția potrivită. 

V3 permite testare directă a fiecărui formatter. Pentru o problemă mică, V1 ar putea fi acceptabil, dar V3 nu e "birocrație" — e o investiție minimă care plătește deja la testare. Fără interfață, orice bug într-un format necesită regressie în V1 complet.