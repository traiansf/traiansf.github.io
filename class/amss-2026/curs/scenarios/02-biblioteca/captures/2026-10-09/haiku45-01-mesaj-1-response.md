# Model de date și operații pentru sistem de împrumut de cărți

## **Entități principale**

1. **Membru** — id, nume, email, tel, adresă, data înregistrării, status
2. **Carte** — id, titlu, autor, isbn, categorie
3. **Exemplar fizic** — id, carte_id, status (disponibil/împrumutat/defect/rezervat)
4. **Împrumut** — id, membru_id, exemplar_id, data_start, data_scadență, data_retur, penalitate
5. **Cerere de împrumut** — id, membru_id, carte_id, data_cererii, status (așteptare/aprobată/anulată), poziție în coadă

## **Relații**
- Fiecare carte → mai multe exemplare fizice
- Fiecare membru → mai multe împrumuturi active
- Carte → coadă de cereri (la fel ca in sistemele de cinema)

## **Operații principale**

| Operație | Descriere |
|----------|-----------|
| **Împrumut** | Creează împrumut dacă exemplarul e disponibil; setează scadență |
| **Returnare** | Marchează exemplarul liber, calculează penalitate (dacă întârzierea) |
| **Cerere** | Adaugă membru în coada de așteptare dacă cartea e împrumutată |
| **Aprobă cerere** | Când se eliberează exemplar, notifică următorul din coadă |
| **Verifică disponibilitate** | Listează exemplare libere/în așteptare pentru o carte |
| **Rapoarte** | Împrumuturi restante, istoric membru, ocupanță |

## **Reguli de business**
- Penalitate automată pentru întârziere
- Coadă FIFO pentru cererile de împrumut
- Member nu poate împrumuta dacă are penalități neplătite (opțional)
- Notificare automată când cartea devine disponibilă

Vrei detalii despre structura unui anumit modul?
