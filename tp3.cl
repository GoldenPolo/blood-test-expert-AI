(defparameter *normes* 
  '((Reticulo (homme 40 130000) (femme 40 130000))
    (Hematies (homme 4500000 5500000) (femme 4000000 5000000))
    (Hemoglobine (homme 13 17) (femme 12 15))
    (VGM (homme 80 100) (femme 80 100))
    (CCMH (homme 32 36) (femme 32 36))
    (Leucocytes (homme 4000 10000) (femme 4000 10000))
    (Neutrophiles (homme 2000 7500) (femme 2000 7500))
    (Eosinophiles (homme 0 100) (femme 0 100))
    (Basophiles (homme 0 100) (femme 0 100))
    (Lymphocytes (homme 1500 4000 (femme 1500 4000)))
    (Monocytes (homme 200 1000) (femme 200 1000))
    (Plaquettes (homme 150000 450000) (femme 150000 450000))
    (CRP (homme 0 5) (femme 0 5))
    (Glycemie_a_jeun (homme 0.74 1.06) (femme 0.74 1.06))
    (DFG (homme 60 ) (femme 60 ))
    (TGO (homme 0 35) (femme 0 35))
    (TGP (homme 0 35) (femme 0 35))
    (Gamma_GT (homme 0 38) (femme 0 38))
    (Troponine (homme 0 0.04) (femme 0 0.04))
))



(defparameter *baseregles_pathologie*
  '((R1 ((eq sexe homme) (> Hematies 5500000) (eq sejour_altitude non )) (eq pathologie Polyglobulie))
    (R2 ((eq sexe homme) (eq pathologie Polyglobulie) (eq pathologie Insuffisance_renale)) (eq pathologie Cancer_du_rein))
    (R3 ((eq sexe homme) (eq pathologie Polyglobulie)) (eq pathologie Polyglobulie_idiopathique_ou_primitive))
    (R4 ((eq sexe homme) (< Hematies 4500000)) (eq pathologie Anemie))
    (R5 ((eq sexe homme) (eq pathologie Anemie) (eq VGM normal) (eq CCMH normal)) (eq pathologie Anemie_normochrome))
    (R6 ((eq sexe homme) (eq pathologie Anemie_normochrome) (< Reticulo 40)) (eq pathologie Anemie_normochrome_aregenerative))
    (R7 ((eq sexe homme) (eq pathologie Anemie_normochrome_aregenerative) (eq chimiotherapie non)) (eq pathologie Cancer_du_sang))
    (R8 ((eq sexe homme) (eq pathologie Anemie_normochrome) (> Reticulo 130000)) (eq pathologie Anemie_normochrome_regenerative))
    (R9 ((eq sexe homme) (eq pathologie Anemie_normochrome_regenerative) (eq saignement non) (eq chirurgie_recente oui)) (eq pathologie Maladie_auto-immune))
    (R10 ((eq sexe homme) (eq pathologie Anemie) (< Hemoglobine 13) (< VGM 80)) (eq pathologie Anmie_microcytaire))
    (R11 ((eq sexe homme) (eq pathologie Anemie_microcytaire) (< CCMH 32)) (eq pathologie Anemie_microcytaire_hypochrome))
    (R12 ((eq sexe homme) (eq pathologie Anemie_microcytaire_hypochrome)) (eq pathologie Carence_alimentaire_en_Fer_ou_saignement_chronique))
    (R13 ((eq sexe homme) (eq pathologie Anemie_microcytaire) (eq CCMH normal)) (eq pathologie Anemie_microcytaire_normochrome))
    (R14 ((eq sexe homme) (eq pathologie Anemie_microcytaire_normochrome)) (eq pathologie Thalassemie))
    (R15 ((eq sexe homme) (< Hematies 4500000) (< Hemoglobine 13) (> VGM 100)) (eq pathologie Anemie_macrocytaire))
    (R16 ((eq sexe homme) (eq pathologie Anemie_macrocytaire) (eq dosage_B12 oui )) (eq pathologie Cancer_du_sang))
    (R17 ((eq sexe homme) (eq pathologie Anemie_macrocytaire) (eq dosage_B12 non)) (eq pathologie Carence_alimentaire_en_B12))
    (R18 ((eq sexe homme) (> Leucocytes 10000) (> Eosinophiles 700) (eq signes_allergiques oui)) (eq pathologie Allergie))
    (R19 ((eq sexe homme) (> Leucocytes 10000) (> Eosinophiles 700) (eq signes_allergiques non)) (eq pathologie Parasite))
    (R20 ((eq sexe homme) (eq Leucocytes normal) (> Eosinophiles 700)) (eq pathologie Cancer_du_sang))
    (R21 ((eq sexe homme) (eq Leucocytes normal) (> Neutrophiles 7500)) (eq pathologie Cancer_du_sang))
    (R22 ((eq sexe homme) (> Leucocytes 10000) (> Lymphocytes 4000) (> CRP 5)) (eq pathologie Infection))
    (R23 ((eq sexe homme) (eq pathologie Infection) (> Basophiles 100)) (eq pathologie Infection_virale))
    (R24 ((eq sexe homme) (eq pathologie Infection) (> Neutrophiles 7500)) (eq pathologie Infection_bacterienne))
    (R25 ((eq sexe homme) (eq pathologie Infection) (> Monocytes 1000)) (eq pathologie Infection_chronique))
    (R26 ((eq sexe homme) (> Monocytes 1000) (> CRP 5)) (eq pathologie Maladie_auto-immune))
    (R27 ((eq sexe homme) (eq Leucocytes normal) (> Monocytes 1000)) (eq pathologie Cancer_du_sang))
    (R28 ((eq sexe homme) (eq Leucocytes normal) (> Lymphocytes 4000)) (eq pathologie Cancer_du_sang))
    (R29 ((eq sexe homme) (> Glycemie_a_jeun 1.06)) (eq pathologie Diabete))
    (R30 ((eq sexe homme) (< Plaquettes 150000) (< Hematies 4500000)) (eq pathologie Cancer_du_sang))
    (R31 ((eq sexe homme) (> DFG 60)) (eq pathologie Insuffisance_renale))
    (R32 ((eq sexe homme) (> TGO 35) (> TGP 35) (eq Troponine normal)) (eq pathologie Hepatite))
    (R33 ((eq sexe homme) (eq pathologie Hepatite) (> CRP 5)) (eq pathologie Hepatite_infectieuse))
    (R34 ((eq sexe homme) (eq pathologie Hepatite) (eq CRP normal) (eq Gamma_GT normal)) (eq pathologie Hepatite_medicamenteuse))
    (R35 ((eq sexe homme) (eq pathologie Hepatite) (eq CRP normal) (> Gamma_GT 38)) (eq pathologie Hepatite_alcoolique))
    (R36 ((eq sexe homme) (> TGO 35) (> TGP 35) (> Troponine 0.04)) (eq pathologie Infarctus))
    (R37 ((eq sexe femme) (> Hematies 5500000) (eq sejour_altitude non )) (eq pathologie Polyglobulie))
    (R38 ((eq sexe femme) (eq pathologie Polyglobulie) (eq pathologie Insuffisance_renale)) (eq pathologie Cancer_du_rein))
    (R39 ((eq sexe femme) (eq pathologie Polyglobulie)) (eq pathologie Polyglobulie_idiopathique_ou_primitive))
    (R40 ((eq sexe femme) (< Hematies 4500000)) (eq pathologie Anemie))
    (R41 ((eq sexe femme) (eq pathologie Anemie) (eq VGM normal) (eq CCMH normal)) (eq pathologie Anemie_normochrome))
    (R42 ((eq sexe femme) (eq pathologie Anemie_normochrome) (< Reticulo 40)) (eq pathologie Anemie_normochrome_aregenerative))
    (R43 ((eq sexe femme) (eq pathologie Anemie_normochrome_aregenerative) (eq chimiotherapie non)) (eq pathologie Cancer_du_sang))
    (R44 ((eq sexe femme) (eq pathologie Anemie_normochrome) (> Reticulo 130000)) (eq pathologie Anemie_normochrome_regenerative))
    (R45 ((eq sexe femme) (eq pathologie Anemie_normochrome_regenerative) (eq saignement non) (eq chirurgie_recente oui)) (eq pathologie Maladie_auto-immune))
    (R46 ((eq sexe femme) (eq pathologie Anemie) (< Hemoglobine 13) (< VGM 80)) (eq pathologie Anmie_microcytaire))
    (R47 ((eq sexe femme) (eq pathologie Anemie_microcytaire) (< CCMH 32)) (eq pathologie Anemie_microcytaire_hypochrome))
    (R48 ((eq sexe femme) (eq pathologie Anemie_microcytaire_hypochrome)) (eq pathologie Carence_alimentaire_en_Fer_ou_saignement_chronique))
    (R49 ((eq sexe femme) (eq pathologie Anemie_microcytaire) (eq CCMH normal)) (eq pathologie Anemie_microcytaire_normochrome))
    (R50 ((eq sexe femme) (eq pathologie Anemie_microcytaire_normochrome)) (eq pathologie Thalassemie))
    (R51 ((eq sexe femme) (< Hematies 4500000) (< Hemoglobine 13) (> VGM 100)) (eq pathologie Anemie_macrocytaire))
    (R52 ((eq sexe femme) (eq pathologie Anemie_macrocytaire) (eq dosage_B12 oui )) (eq pathologie Cancer_du_sang))
    (R53 ((eq sexe femme) (eq pathologie Anemie_macrocytaire) (eq dosage_B12 non)) (eq pathologie Carence_alimentaire_en_B12))
    (R54 ((eq sexe femme) (> Leucocytes 10000) (> Eosinophiles 700) (eq signes_allergiques oui)) (eq pathologie Allergie))
    (R55 ((eq sexe femme) (> Leucocytes 10000) (> Eosinophiles 700) (eq signes_allergiques non)) (eq pathologie Parasite))
    (R56 ((eq sexe femme) (eq Leucocytes normal) (> Eosinophiles 700)) (eq pathologie Cancer_du_sang))
    (R57 ((eq sexe femme) (eq Leucocytes normal) (> Neutrophiles 7500)) (eq pathologie Cancer_du_sang))
    (R58 ((eq sexe femme) (> Leucocytes 10000) (> Lymphocytes 4000) (> CRP 5)) (eq pathologie Infection))
    (R59 ((eq sexe femme) (eq pathologie Infection) (> Basophiles 100)) (eq pathologie Infection_virale))
    (R60 ((eq sexe femme) (eq pathologie Infection) (> Neutrophiles 7500)) (eq pathologie Infection_bacterienne))
    (R61 ((eq sexe femme) (eq pathologie Infection) (> Monocytes 1000)) (eq pathologie Infection_chronique))
    (R62 ((eq sexe femme) (> Monocytes 1000) (> CRP 5)) (eq pathologie Maladie_auto-immune))
    (R63 ((eq sexe femme) (eq Leucocytes normal) (> Monocytes 1000)) (eq pathologie Cancer_du_sang))
    (R64 ((eq sexe femme) (eq Leucocytes normal) (> Lymphocytes 4000)) (eq pathologie Cancer_du_sang))
    (R65 ((eq sexe femme) (> Glycemie_a_jeun 1.06)) (eq pathologie Diabete))
    (R66 ((eq sexe femme) (< Plaquettes 150000) (< Hematies 4500000)) (eq pathologie Cancer_du_sang))
    (R67 ((eq sexe femme) (> DFG 60)) (eq pathologie Insuffisance_renale))
    (R68 ((eq sexe femme) (> TGO 35) (> TGP 35) (eq Troponine normal)) (eq pathologie Hepatite))
    (R69 ((eq sexe femme) (eq pathologie Hepatite) (> CRP 5)) (eq pathologie Hepatite_infectieuse))
    (R70 ((eq sexe femme) (eq pathologie Hepatite) (eq CRP normal) (eq Gamma_GT normal)) (eq pathologie Hepatite_medicamenteuse))
    (R71 ((eq sexe femme) (eq pathologie Hepatite) (eq CRP normal) (> Gamma_GT 38)) (eq pathologie Hepatite_alcoolique))
    (R72 ((eq sexe femme) (> TGO 35) (> TGP 35) (> Troponine 0.04)) (eq pathologie Infarctus))))



(defparameter *baseregles_specialiste*
  '((R1 (Cancer_du_rein) (Nephrologue))
    (R2 (Polyglobulie_idiopathique_ou_primitive) (Hematologue))
    (R3 (Cancer_du_sang) (Hematologue))
    (R4 (Carence_alimentaire_en_Fer_ou_saignement_chronique) (Gastro-enterologue))
    (R5 (Thalassemie) (Hematologue))
    (R6 (Allergie) (Allergologue))
    (R7 (Parasite) (Infectiologue))
    (R8 (Infection) (Infectiologue))
    (R9 (Maladie_auto-immune) (Interniste))
    (R10 (Diabete) (Diabetologue))
    (R11 (Insuffisance_renale) (Nephrologue))
    (R12 (Hepatite) (Gastro-enterologue))
))

---------------------------------------------------------------------
------------------------chainage-arrière-----------------------------
---------------------------------------------------------------------


;;Fonctions secondaires

(defun cclRegle (regle) (caddr regle))
(defun premisseRegle (regle) (cadr regle))
(defun numRegle (regle) (car regle))


(defun create_patient ()
  (progn
    (format t "Connaissez-vous le sexe du patient ? ~%")
    (if (eq (read) 'oui)
        (progn
          (format t "~%Rentrez le sexe du patient ~%")
          (push (list 'sexe (read)) *basefaits*)))
    (format t "~%Connaissez-vous l'âge du patient ? ~%")
    (if (eq (read) 'oui)
        (progn
          (format t "~%Rentrez l'âge du patient ~%")
          (push (list 'age (read)) *basefaits*)))
    (format t "~%Connaissez-vous le poids du patient ? ~%")
    (if (eq (read) 'oui)
        (progn
          (format t "~%Rentrez le poids du patient ~%")
          (push (list 'poids (read)) *basefaits*)))
    (format t "~%Connaissez-vous la taille du patient ? ~%")
    (if (eq (read) 'oui)
        (progn
          (format t "~%Rentrez la taille du patient ~%")
          (push (list 'taille (read)) *basefaits*)))))
    

(defun create_bdf ()
  (progn
    (loop for x in *normes* do
        (progn
          (format t "~%Connaissez-vous la valeur de ~A ? ~%" (car x))
          (if (eq (read) 'oui)
              (progn
                (format t "~%Rentrez sa valeur ~%")
                (push (list (car x) (read)) *basefaits*)))))
    (format t "~%A-t-il fait un séjour en altitude récemment ? ~%")
    (push (list 'sejour_en_altitude (read)) *basefaits*)
    (format t "~%Fait-il de la chimiothérapie actuellement ? ~%")
    (push (list 'chimiotherapie (read)) *basefaits*)
    (format t "~%A-t-il eu des saignements récents ? ~%")
    (push (list 'saignement (read)) *basefaits*)
    (format t "~%A-t-il eu une chirurgie récemment ? ~%")
    (push (list 'chirurgie_recente (read)) *basefaits*)
    (format t "~%Suit-il un traitement avec un dosage B12 ? ~%")
    (push (list 'dosage_B12 (read)) *basefaits*)
    (format t "~%A-t-il eu des signes d'allergies récemment ? ~%")
    (push (list 'signes_allergiques (read)) *basefaits*)
    (format t "~%Avez-vous à nous signaler une autre pathologie pour laquelle il est suivi ? ~%")
    (if (eq (read) 'oui)
        (progn
          (format t "~%Rentrez le nom de la pathologie, en n'oubliant pas la majuscule ~%")
          (push (list 'pathologie (read)) *basefaits*)))))


(defun appartient (but)
  ;; but est de la forme: (comparateur attribut valeur)
  (let ((valeur (cadr (assoc (cadr but) *basefaits*))))
    (if valeur
        (if (or (and (eq valeur 'normal) (not (eq (caddr but) 'normal))) (and (eq valeur 'inconnu) (not (eq (caddr but) 'inconnu))))
            nil
          (funcall (car but) valeur (caddr but))
          )))) ;; le eval ne fonctionne pas avec eq : (eval (list (car but) valeur (caddr but))))))



(defun regles_candidates (but bdr) ;; (eq moyen voiture) // (> age 18) 
  ;;(print bdr)
  (if bdr
      (let* ((conclusion (cclRegle (car bdr))) ;; R1 (eq moyen voiture) // Rx (> age 20)
             (attribut (cadr conclusion)) ;; moyen  // age
             (valeur (caddr conclusion))) ;; voiture // 20
        (if 
          (and 
           ;; il faut verifier l identite des attributs
           (eq attribut (cadr but))  ;; eq moyen moyen // eq age age
           ;; et que la regle concluera sur une valeur correcte 
           (funcall (car but) valeur (caddr but)))  ;; eq voiture voiture // > 20 18 // ou (eval list (car but) valeur (caddr but))))
          (cons (car bdr) (regles_candidates but (cdr bdr))) ;; alors on push la regle R1 // RX
          (regles_candidates but (cdr bdr))))))

  
(defun question-utilisateur (but)
  (unless
      (eql :inconnu (cdr (assoc but *basefaits*)))
      (format t "Connaissez vous la valeur de ~s ? sinon tapez inconnu~%" but)
      (push (list but (read)) *basefaits*)))

           
(defun verifier_ou (but but1 bdR &optional (i 0))
  (let ((ok nil))
    (OR
     (if (appartient but) ;; ici on remplacer le member par appartient
         (progn 
           (format t "~V@t But : ~A proof ~%" i but)
           T))
     (let ((regles (reverse (regles_candidates but bdR))))
       (while (and regles (not ok))
         (format t "~% ~V@t VERIFIE_OU ~A Regles ~s :  ~A ~%" i but (numRegle (car regles)) (car regles))
         (setq ok (verifier_et (pop regles) but1 bdR i)))
       ok)
     (if (and (not (assoc (cadr but) *basefaits*)) (not (eq (caddr but) (caddr but1))))
         (progn
           (setq *basefaits* (question-utilisateur (cadr but)))
           (format t "~% ~V@t Toto bdf : ~s ~%" i *basefaits*)
           (verifier_ou but but1 bdR i)
           ))

    )))

(defun verifier_et (regle but1 bdR i)
  (let ((ok t) (premisses (premisseRegle regle)))
    (while (and premisses ok)
      (format t "~V@t  ~t VERIFIE_ET ~s premisse ~A~%" (+ 1 i) (numRegle regle) (car premisses))
      (setq ok (verifier_ou (pop premisses) but1 bdR (+ 6 i))))
    ok))


;;Fonction principale

(defun chainage-arriere (bdr)
  (setq *basefaits* '())
  (progn
    (format t "Veuillez rentrer les infos concernant le patient ~%")
    (create_patient)
    (format t "~%Veuillez à présent rentrer les différentes informations nécessaires si vous les connaissez ~%")
    (create_bdf)
    (format t "~%Quelle est la pathologie soupçonnée ? ~%")
    (setq but (list 'eq 'pathologie (read)))
    (setq but1 (list 'eq 'pathologie (read)))
    (format t "~%Nous allons à présent vérifier la pathologie soupçonnée ~%")
    (if (verifier_ou but but1 bdr)
        (format t "~%La pathologie soupçonnée est bien confirmer ~%")
      (progn
        (format t "~%La pathologie soupçonnée n'est pas confirmer ~%")
        (format t "~%Nous vous orientons vers un programme qui permettra de déterminer la ou les pathologies exacts grâce au données que vous avez fourni ~%")
        (chainage_avant *baseregles_pathologie*)))))
      
    
---------------------------------------------------------------------------
----------------------------chainage-avant---------------------------------
---------------------------------------------------------------------------

;;Fonctions secondaires


(defun check-rule (regle) ;; fonction qui permet de regarder si les prémisses d'une règle sont valides, si oui range la conclusion de la regle dans une liste
  (let ((prems (premisseRegle regle)) (valide? 0) (i 0)) ;; initialisation des variable : prems, prend les premisses de la regle / valide?, s'incrémente pour chaque prémisse valide / i, compteur de prémisses
    (loop for x in prems do ;; pour chaque premisse dans les premisses de la regle
          (if (appartient x) ;; si elle appartient à base de fait
              (progn
                (setq valide? (+ valide? 1)) ;; valide? s'incrémente
                (setq i (+ i 1)) ;; i s'incrémente
                )
            (progn ;; sinon
              (setq i (+ i 1)) ;; il n'y a que i qui s'incrémente
              )))
    (if (equal valide? i) ;; si i et valide? sont égales alors toutes les prémisses sont validées
        (push (caddr (cclRegle regle)) *cclvalide*) ;; donc on push la pathologie associé à la règle dans la liste des pathologie possible
      ))
)     



(defun appartient2 (but regle)
  ;; but est de la forme: (comparateur attribut valeur)
  (let ((valeur (caadr regle)))
    (if valeur
        (if (eq valeur but)
           (format t "Pour la pathologie ~A , nous lui conseillons de prendre rendez-vous chez le spécialiste suivant : ~A~%" valeur (car (cclRegle regle)))
         )))) ;; le eval ne fonctionne pas avec eq : (eval (list (car but) valeur (caddr but))))))


(defun find_specialiste (regle)
  (loop for x in *cclvalide* do
        (appartient2 x regle)))

(defun find_spe_all (bdr)
  (loop for x in bdr do
        (find_specialiste x)))
        

;;Fonction principale

(defun chainage_avant (bdr) ;; déclenche le chainage-avant
  (setq *cclvalide* '()) ;; on clear la liste des pathologie possible à chaque appel de la fonction
  (loop for x in bdr do ;; pout toutes les regles dans la bdr
        (check-rule x)) ;; on effectue la fonction check-rule
  (if (eq *cclvalide* nil)
      (format t "Tout va bien, mais nous lui conseillons de ne pas oublier de prendre rendez-vous chez son médecin traitant ~%")
    (progn
      (format t "Le patient a potentiellement la ou les pathologies suivantes : ")
      (mapcar 'print *cclvalide*);; on print la liste des maladie possible
      (format t "~%Nous lui conseillons de prendre rendez-vous chez le ou les spécialistes attribués ~%")
      (find_spe_all *baseregles_specialiste*)
    )))
      




(defun chainage_avant (bdr) ;; déclenche le chainage-avant
  (setq *basefaits* '())
  (setq *cclvalide* '()) ;; on clear la liste des pathologie possible à chaque appel de la fonction
  (progn
    (format t "Veuillez rentrer les infos concernant le patient ~%")
    (create_patient)
    (format t "~%Veuillez à présent rentrer les différentes informations nécessaires si vous les connaissez ~%")
    (create_bdf)  
  (loop for x in bdr do ;; pout toutes les regles dans la bdr
        (check-rule x)) ;; on effectue la fonction check-rule
  (if (eq *cclvalide* nil)
      (format t "Tout va bien, mais nous lui conseillons de ne pas oublier de prendre rendez-vous chez son médecin traitant ~%")
    (progn
      (format t "Le patient a potentiellement la ou les pathologies suivantes : ")
      (mapcar 'print *cclvalide*);; on print la liste des maladie possible
      (format t "~%Nous lui conseillons de prendre rendez-vous chez le ou les spécialistes attribués ~%")
      (find_spe_all *baseregles_specialiste*)
    ))))
      



