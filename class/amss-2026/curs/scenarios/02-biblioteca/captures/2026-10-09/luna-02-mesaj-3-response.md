Sistemul ar trebui să ofere mai întâi exemplarul disponibil lui M2, fără să creeze o cerere de așteptare. Altfel, o cerere ar putea bloca inutil exemplarul de pe raft.

Ajustarea modelului: cererea de împrumut este pentru **o carte**, dar se depune doar când nu există niciun exemplar disponibil și nealocat. Dacă există unul, sistemul îl rezervă imediat pentru membru, cu un termen de ridicare. La returnare, exemplarul se alocă primei cereri eligibile din coadă; dacă nu există cereri, devine disponibil. Aceste verificări și alocările trebuie făcute atomic.
