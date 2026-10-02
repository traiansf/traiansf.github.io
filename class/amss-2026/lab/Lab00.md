---
title: "AMSS 2026/2027 — Laboratorul 0: Pregătire și orientare"
author: "Traian-Florin Șerbănuță"
lang: ro-RO
---

# Laboratorul 0: Pregătire și orientare

**Participarea este opțională.** Poți urma acest ghid în sala de laborator sau pe cont propriu, indiferent de grupă. Nu ai nevoie de cursul 2, de o echipă deja formată sau de experiență în proiectare.

Scopul este să găsești materialele, să îți pregătești spațiul de lucru și să reflectezi la experiența ta. Alege pașii care îți sunt utili și revino la ceilalți când ai timp. Activitatea nu se notează și nu are termen de predare.

Laboratorul 1, despre înțelegere, specificare și revizuire, se desfășoară **după predarea cursurilor 1 și 2**. Pentru o grupă care are întâlnirea imediat după primul curs, aceasta este laboratorul 0; laboratorul 1 poate avea loc în săptămâna 3. Programarea fiecărei grupe se anunță pe Teams.

## Citatul zilei

> „Informatica ar trebui să se ocupe de concepte, nu de limbaje.”
>
> Original: “Computer science should be about concepts, not languages.”

— **Leslie Lamport**

[Sursa: Computation and State Machines (2008), prefață](https://lamport.azurewebsites.net/pubs/state-machine.pdf#page=2)

<!-- Original verificat în prefață, pagina PDF 2, manuscrisul de pe site-ul autorului. Legătura cu tema: uneltele sprijină învățarea; pregătirea lor nu înlocuiește înțelegerea. -->

## Cum poți folosi cele 90 de minute

| Pas | Durată orientativă | Activitate |
|-----|----------------|-----------------------------------------|
| 1 | 10 minute | Găsește Teams, materialele și ghidul de pregătire a mediului de lucru. |
| 2 | 15 minute | Amintește-ți o cerință neclară sau o schimbare dificilă. |
| 3 | 20 de minute | Formulează întrebări care ar fi ajutat. |
| 4–5 | 20 de minute | Pregătește un spațiu de lucru și verifică accesul la instrumente. |
| 6 | 15 minute | Explorează idei de proiect și caută colegi de echipă. |
| 7 | 10 minute | Notează întrebările și ce mai ai de pregătit. |

Poți împărți activitatea în sesiuni mai scurte. În sală poți discuta în perechi și cu profesorul; dacă lucrezi singur, folosește întrebările și exemplele de mai jos. Nu este necesar să reproduci o discuție de grup.

## 1. Găsește informațiile de care vei avea nevoie

Deschide:

- [pagina cursului](https://traiansf.github.io/class/amss2026/);
- [echipa Microsoft Teams](https://teams.cloud.microsoft/l/team/19%3AVxKxx_O-NWeyohdw5ZunUYqv4Ai-s5cSD24U1-3eOZc1%40thread.tacv2/conversations?groupId=9aac9415-9492-4850-9ac4-66f7174fa3e1&tenantId=08a1a72f-fecd-4dae-8cec-471a2fb7c2f1) — cod `fswo4rl`;
- [cerințele proiectului](https://traiansf.github.io/class/amss2026/proiect/);
- [ghidul de pregătire a mediului de lucru](https://github.com/traiansf/traiansf.github.io/blob/main/class/amss-2026/tooling/SETUP.md).

Verifică dacă găsești schema de notare, ce trebuie să conțină anunțul temei și cum poți cere feedback. Nu este necesar să reții toate detaliile acum; important este să știi unde le găsești.

**Dacă nu ai acces:** notează ce pagină sau serviciu nu poți deschide și cere ajutor profesorului. Poți continua partea de reflecție pe hârtie.

## 2. Pornește de la o experiență proprie

Alege o situație dintr-un proiect de facultate, de la serviciu sau dintr-o activitate personală:

- ai primit o cerință pe care oamenii au interpretat-o diferit;
- o modificare aparent mică a afectat mai multe părți ale soluției;
- un rezultat produs cu AI a părut corect, dar a trebuit verificat.

Scrie câteva rânduri: ce se dorea, ce ai înțeles inițial și ce s-a întâmplat. Nu include informații confidențiale. Dacă lucrezi în pereche, comparați exemplele.

**Dacă nu îți vine în minte niciun exemplu:** folosește situația didactică de mai jos: „Un coleg cere o pagină pe care să găsească mai ușor notițele cursurilor.” Nu presupune încă nimic despre ce vrea: căutare, etichete, o listă de linkuri sau acces de pe telefon.

## 3. Ce întrebare ar fi ajutat mai devreme?

Pentru exemplul ales, răspunde:

1. Ce informație a lipsit sau a fost interpretată diferit?
2. Ce întrebare ai fi pus înainte de a începe lucrul la soluție?
3. Cum ar putea răspunsul să schimbe ce construiești?
4. Ce ai putea observa sau verifica pentru a decide dacă soluția ajută?

Pentru exemplul notițelor, o întrebare utilă ar fi: „Cum cauți acum o notiță și în ce situație nu o găsești?” Dacă problema este o listă dezorganizată de linkuri, o căutare în textul tuturor documentelor poate fi o soluție disproporționată. Dacă însă colegul își amintește numai un fragment din document, ordonarea linkurilor poate să nu îi ajungă.

Nu există o singură formulare corectă. Verifică dacă întrebarea ta poate schimba o decizie concretă. „Ce tehnologie folosim?” poate fi utilă mai târziu, dar nu clarifică singură nevoia colegului.

## 4. Pregătește un spațiu simplu de lucru

Creează un director local pentru exercițiile cursului și un fișier `pregatire.md`. Poți folosi orice editor de text; pentru această întâlnire ajung și notițele pe hârtie.

Un început posibil:

```markdown
# Pregătirea mea pentru AMSS

## Experiența aleasă
Ce se dorea și ce a fost neclar?

## Întrebarea care ar fi ajutat
Ce aș întreba și ce decizie ar depinde de răspuns?

## Mediul de lucru
Ce pot deschide și edita? Ce acces mai trebuie pregătit?

## Idei și întrebări
Ce problemă aș vrea să explorez? Ce trebuie să clarific?
```

Salvează fișierul, închide-l și deschide-l din nou. Verifică dacă modificările s-au păstrat. Notițele de pregătire pot rămâne locale; nu trebuie să anunți acum un proiect sau să publici acest fișier.

### Dacă vrei să exersezi lucrul cu Git

Acest pas este opțional. Într-un terminal deschis în directorul nou, poți salva fișierul într-un commit:

```bash
git init
git add pregatire.md
git commit -m "Adaug notitele de pregatire"
git log --oneline
```

Dacă Git îți cere identitatea autorului, configureaz-o pentru acest director cu numele și adresa ta:

```bash
git config user.name "Numele tau"
git config user.email "adresa-ta@example.com"
```

Apoi repetă comanda `git commit` de mai sus.

Scopul este să vezi că poți salva și regăsi o versiune. Dacă Git nu este disponibil, păstrează fișierul și notează ce ajutor îți trebuie; nu trebuie să instalezi totul în această sesiune.

## 5. Verifică accesul la un asistent, dacă ai unul

Poți folosi orice asistent la care ai deja acces: în browser, în editor sau local. Nu se cere un abonament plătit, un furnizor sau un model anume.

Dacă vrei, dă-i exemplul cu notițele și cere-i:

> Propune două întrebări de clarificare, fără să alegi o soluție sau să implementezi o aplicație.

Compară întrebările cu a ta. Poți explica în ce fel răspunsurile ar schimba o alegere?

**Fără AI:** continuă cu întrebările din pasul 3. Activitatea este completă și fără asistent. Exercițiul tehnic de delegare și revizuire apare în cursul 2 și este reluat în laboratorul 1.

## 6. Explorează idei de proiect și caută colegi de echipă

Recitește [cerințele proiectului](https://traiansf.github.io/class/amss2026/proiect/). Echipele au 3–5&nbsp;membri și dezvoltă o specificație și o soluție de proiectare comune, în care contribuția fiecărui membru se poate identifica.

Notează, dacă dorești, una sau două probleme pe care ai vrea să le înțelegi mai bine. Pentru fiecare: cine are problema, ce decizie sau regulă pare interesantă și ce ai lăsa în afara unei prime variante.

În sală poți discuta ideile cu colegii. Pe cont propriu, poți reveni la ele și poți căuta colegi pe Teams. Nu este necesar să alegi tema sau să formezi echipa în laboratorul 0. Când veți anunța proiectul, includeți linkul către repository-ul public de pe GitHub sau GitLab, pe care îl creați atunci (vezi cerințele proiectului).

## 7. Încheie cu o verificare personală

- [ ] Pot găsi materialele cursului, anunțurile și cerințele proiectului.
- [ ] Pot salva și regăsi notițele mele.
- [ ] Pot spune ce informație lipsea din exemplul ales și de ce contează.
- [ ] Știu ce acces sau instrument mai trebuie pregătit.
- [ ] Am notat întrebările pe care vreau să i le pun profesorului.

Păstrează notițele pentru tine sau folosește-le într-o discuție. Nu trebuie să le trimiți ca temă. Dacă ai nevoie de ajutor, scrie pe Teams la ce pas te-ai oprit și ce problemă ai întâlnit.

**Urmează:** cursul 2, apoi laboratorul 1. Scenariul cu rezervarea sălilor rămâne pentru laboratorul 1, după introducerea tehnică.

## Chestionarul de început de curs

Profesorul distribuie pe Teams un chestionar despre experiență, cunoștințe și așteptări; îl poți deschide și direct, la [forms.gle/uHCXyFvxqQxsWWmH9](https://forms.gle/uHCXyFvxqQxsWWmH9). Este facultativ și ne ajută să adaptăm conținutul cursului. Invitația se adresează tuturor grupelor. Rezervă-ți pentru el aproximativ 10–12&nbsp;minute, separat de pașii ghidului.
