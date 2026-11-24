**V3 — interfață.**

Aceasta schimbă totul. V3 devine singura opțiune tehnică viabilă. Interfața Formator permite celorlalte echipe să implementeze propriii formatori independent, fără să modifice codul nostru. 

Cu V1 sau V2, fiecare echipă trebuie să ne modifice codul — imposibil. V3 e tocmai designed pentru extensibilitate din exterior: fiecare echipă implementează Formator și o pasează la `exportă`. Nu e birocrație, e arhitectura corectă pentru acest caz de utilizare.