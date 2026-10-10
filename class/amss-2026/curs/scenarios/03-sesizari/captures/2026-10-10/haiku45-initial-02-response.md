# Specificație: Sistem de Raportare Defecțiuni Campus

## Cerințe Funcționale

**1. Raportare problemă**
- Student completează formular: locație (cladă/cameră), tip defecțiune, descriere, fotografie (opțional)
- Sistem generează ticket unic (ID automat)
- Confirmare imediată via email/mesaj cu ID-ul ticket-ului

**2. Urmărire status**
- Student vizualizează starea ticket-ului: **Primit** → **În lucru** → **Rezolvat** → **Închis**
- Acces rapid prin link din email sau prin interfață web/mobilă
- Actualizări automate când status se schimbă

**3. Comunicare**
- Notificări când echipa lucrează la problemă
- Comentarii: student poate adăuga detalii, echipă poate cere clarificări
- Deadline estimat de rezolvare vizibil

**4. Rapoarte administrative**
- Vedere globală a tuturor ticket-urilor deschise
- Statistici: timp mediu de rezolvare, zone cu probleme frecvente

---

## Cerințe de Calitate

| Criteriu | Țintă |
|----------|-------|
| **Disponibilitate** | 99% timp de funcționare |
| **Timp de răspuns** | < 2 secunde pentru încărcarea paginii |
| **Acuratețe locație** | Trebuie să identifice corect clădirea/camera |
| **Auditare** | Istoricul complet al fiecărui ticket (cine a schimbat status, când) |
| **Siguranță** | Autentificare cu cont de student; datele personale protejate |

---

## Criterii de Acceptare

**Exemplul 1: Happy path**
```
CÂND: Maria raportează o crepătură în ușa din camera 304, bloc A
ȘI: atașează o fotografie
ATUNCI: primește ID ticket #2024-1847
ȘI: starea inițială este "Primit"
ȘI: pe pagina de urmărire vede "Estimat miercuri 15:00"
```

**Exemplul 2: Actualizare status**
```
CÂND: Admin marchează ticket-ul ca "În lucru"
ATUNCI: Maria primește notificare "Echipa va rezolva azi"
ȘI: pe pagina de urmărire starea se schimbă instantaneu
```

**Exemplul 3: Ticket închis**
```
CÂND: Admin încarcă o poză cu reparația și marchează "Rezolvat"
ATUNCI: Maria vede starea "Rezolvat" și fotografia reparației
ȘI: poate cere reluarea dacă crede că nu e bine
ȘI: după 3 zile fără răspuns, ticket se marchează "Închis"
```

---

## Observații Implementation

- **Interfață**: Simplă (web + QR code pentru acces rapid din telefon)
- **Integrare**: Cu sistemul de autentificare existing al universității
- **Cost**: Minimal (platformă open-source sau SaaS low-cost)
- **Lansare**: Pilot 2-3 săptămâni cu 100-200 studenți, apoi full campus