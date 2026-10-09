Modelul trebuie să distingă între **cerere de împrumut** și **rezervare pentru un exemplar anume**. Dacă un exemplar este disponibil pe raft, cererea lui M2 nu trebuie să-l ocolească: sistemul îi oferă acel exemplar direct sau îl rezervă pe numele lui, conform regulilor bibliotecii.

- La depunerea cererii, caută un exemplar disponibil. Dacă există, alocă-l lui M2 și creează o rezervare cu termen de ridicare; M2 îl poate împrumuta, iar M3 nu îl poate lua între timp.
- Dacă nu există exemplare disponibile, adaugă cererea lui M2 în coada de așteptare pentru titlul „Ion”.
- La returnarea unui exemplar, dacă există cereri în așteptare, îl rezervă primului membru din coadă; dacă nu, îl marchează disponibil.

Așadar, în situația descrisă, M2 primește rezervarea pentru exemplarul de pe raft, iar M1 păstrează împrumutat celălalt exemplar.
