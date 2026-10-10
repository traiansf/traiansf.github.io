# Specificație: Sistem de Raportare și Urmărire Defecțiuni Campus

## Cerințe Funcționale

**CF1. Raportare defecțiune**
- Studenții completează formular ușor: descriere, locație, foto opțională
- Sistem validează date și generează bilet unic
- Confirmare instantanee cu numărul biletului

**CF2. Urmărire stare**
- Studiează accesează starea biletului prin ID sau email
- Stări posibile: „Primit" → „În lucru" → „Rezolvat" → „Închis"
- Notificări la schimbarea stării (SMS/email)

**CF3. Adminstrație**
- Dashboard pentru personalul IT/mentenanță
- Asignare automat sau manual a biletelor
- Adăugare comentarii și progres vizibil

**CF4. Accesibilitate**
- Aplicație web și mobil-responsive
- Fără login obligatoriu pentru raportare
- QR-coduri pe ziduri pentru raportare rapidă

---

## Cerințe de Calitate

**CQ1. Performance**
- Timp de încărcare < 2 secunde
- Răspuns API < 500ms

**CQ2. Disponibilitate**
- Sistem activ 24/7
- Uptime minim 99%

**CQ3. Ușurință de folosire**
- Maxim 3 clicks pentru raportare
- Design intuitiv, accessible (WCAG 2.1 AA)

**CQ4. Securitate**
- Date criptate în tranzit și stocare
- Protecție CSRF și validare input

---

## Exemple de Acceptare

**Exemplu 1: Raportare defecțiune - fereastră spartă**

*Dat că* sunt student în cladirea A
*Și* am găsit o fereastră spartă în sala de studiu
*Când* deschid aplicația și dau click pe „Raportează defecțiune"
*Atunci* completez: descriere „Fereastră spartă în B101", atas o foto
*Și* primesc instantaneu biletul #2847 cu mesaj „Defecțiune raportată, echipa va verifica în 24h"
*Și* pot urmări starea la orice moment prin pagina biletului
*Și* primesc notificare când IT-istul îl marcheaza pe „În lucru"

---

**Exemplu 2: Urmărire progres de pe telefon**

*Dat că* am raportez o defecțiune cu 2 ore în urmă
*Și* studianții din campus vin cu aceeași plângere
*Când* accesez link-ul din bilet (sau scann QR-ul de pe perete)
*Atunci* văd starea curentă: „Primit - Așteptare diagnoza"
*Și* văd comentariu de la tehnicien: „Pornit diagnostic, estimez 4 ore"
*Și* știu exact ce se întâmplă, nu mai sun departamentul

---

**Exemplu 3: Notificare de rezolvare**

*Dat că* mi-am trimis defecțiune cu 2 zile în urmă
*Și* nu mă gândesc la ea
*Când* departamentul IT o marchează pe „Rezolvat"
*Atunci* primesc SMS: „Defecțiune #2847 rezolvată. Confirmi?"
*Și* pot confirma sau reclama dacă nu e finalizată
*Și* dacă confirm, biletul trece la „Închis"

---

## Beneficii Așteptate

- **Pentru studenți**: transparență, răspuns rapid, reduc frustrarea
- **Pentru admin**: evidență centralizată, repartizare eficientă, timp răspuns măsurabil

Acest sistem transformă gestionarea defecțiunilor dintr-un proces nebulos într-un serviciu predictibil și măsurabil.