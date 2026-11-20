# Interacțiunea și garanțiile operațiilor de înscriere

## Flux al interacțiunii

**Site-ul** trimite registrului cererile de înscriere cu identificator unic `c` pentru fiecare participant și atelier. **Registrul** validează cererea (loc liber, participant neînscris, identificator neînregistrat), consumă un loc și înregistrează înscrierea. Apoi apelează **mesageria** să trimită o confirmare, așteptând răspunsul (`trimis` sau `eșec`). Registrul consemnează starea confirmării la înscrierea acceptată și returnează site-ului rezultatul `acceptat`, indiferent de succes. **La reîncercări**, registrul recunoaște cererea prin identificator și returnează același răspuns fără a repeta consumul de loc; retrimite confirmare doar dacă cea precedentă a eșuat. **Operatorul** poate declanșa `retrimite confirmările()` pentru a reîncerca una câte una confirmările nețrimise.

---

## Garanțiile pentru echipa de dezvoltare

### Consistența datelor

1. **Atomicitate la acceptare:** o cerere cu identificator neînregistrat și conținut valid consumă exact un loc și creează exact o înscriere (c, p, a); nu se crează înscrierea fără consumul locului, nici locul consumat fără înscrierea.

2. **Idempotență pe identificator:** o cerere cu identificator c deja înregistrat nu modifică starea locurilor, nu crează o nouă înscriere și nu consumă resurse suplimentare; site-ul primește răspunsul original, chiar dacă reapare după ore.

3. **Izolare:** o cerere nu afectează alte participanți, alte ateliere sau alte înscrierii; reîncercările unui participant nu influențează locurile altora.

### Livrarea confirmărilor

1. **Legare la acceptare:** o confirmare este trimisă *doar* dacă înscrierea a fost acceptată; refuzurile nu declanșează apeluri la mesagerie.

2. **Înregistrare a încercării finale:** starea confirmării (`trimisă` / `netrimisă` / `în așteptare`) reflectă răspunsul final al mesageriei la ultima încercare pentru acea înscrierea; `netrimisă` înseamnă că ultimul apel a întors `eșec`, nu certitudine că mesajul nu a ajuns.

3. **Acceptare independentă de confirmare:** o înscrierea rămâne acceptată și consumă locul chiar dacă confirmarea eșuează; beneficiarul preferă participant înscris neconfirmat decât loc ocupat ineficient.

### Comportament la repetare

1. **Recunoaștere prin identificator:** reîncercarea se detectează complet prin `c`; aceeași cerere (c, p, a) repetată primește același rezultat; schimbarea oricărui parametru cu același `c` este neadmisă.

2. **Retrimitere selectivă:** la reîncercare, mesageria se apelează *doar* dacă confirmarea precedentă a fost `netrimisă`; confirmările deja `trimise` nu sunt reapelate de `înscrie`, evitând mesaje duplicate involuntare.

3. **Retrimitere manuală:** operatorul poate declanșa retrimiteri selective prin `retrimite confirmările()` pentru toate confirmările `netrimisă`, fără să afecteze înscrierii sau locurile.