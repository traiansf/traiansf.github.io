# Rulări AI — diagrama de clase cu interfață (Laboratorul 5), 24 noiembrie 2026

Rulate la cererea titularului, ca lista erorilor posibile din ghid să se sprijine pe răspunsuri păstrate. Nu apar pe slide-uri și nu li se arată studenților înainte de atelier.

Instrument: Claude Code 2.1.331, `claude -p --model claude-haiku-4-5 --safe-mode`, fără unelte și fără contextul proiectului; `capture.py` este copia neschimbată a celui din Cursul 9. Cinci încercări ale aceluiași prompt (`diagrama-prompt.md`), fiecare într-un context nou, toate încheiate cu succes; cost total raportat 0,37 USD. Temperatura nu este raportată; efortul nu a fost setat explicit. Răspunsurile sunt păstrate octet cu octet.

Promptul conține specificația dinainte de aceste rulări; după ele i s-a adăugat numai un punct la „Cum verificăm răspunsul asistentului AI”. Toate cele cinci diagrame se randează fără erori (mermaid-cli 12.0.0).

| Încercare | Abateri față de listă (puncte) |
|---|---|
| `haiku45-diagrama-01` | varianta L și „Doi la rând” desenate ca realizări (2, 5); „fixează” spre interfață, nu spre realizări (3); automatul lipsește; biletele, cu depășiri, trec prin interfață (4); C2 fără schimbarea contractului (8) |
| `haiku45-diagrama-02` | cea mai apropiată de referință: L la registru, depășirile rămân la registru; în contract, o postcondiție inventată („nu se întoarce același bilet fără o nouă sosire”) (6); fără clasa Bilet; ghișeul este numit „Secretara” |
| `haiku45-diagrama-03` | „Doi la rând” ca realizare (2); depășirile trec prin interfață, iar textul se contrazice: la punctul 4 regula „trebuie să cunoască […] depășirile”, la punctul 7 realizările nu au nevoie de ele; C2 fără schimbarea contractului (8) |
| `haiku45-diagrama-04` | „Doi la rând” ca realizare (2); coada, cu depășiri, trece prin interfață (4), dar textul spune că realizările „nu au acces la depășiri”; secretara și ghișeul separate; fără clasa Bilet; C2 „nu schimbă diagrama” (8) |
| `haiku45-diagrama-05` | postcondiția „depășiri < 2” la interfață: A3 cerută și realizărilor (5, 6); limita aplicată „biletului”, nu celui mai vechi; operațiile registrului repetate la automat și la ghișeu; bilete cu depășiri prin interfață (4) |

Toate cele cinci răspunsuri declară fiecare punct al listei îndeplinit, unele cu „✓ Da”. Este o observație despre aceste cinci rulări, nu despre comportamentul obișnuit al modelului.
