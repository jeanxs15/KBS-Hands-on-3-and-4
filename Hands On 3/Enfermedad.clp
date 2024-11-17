(deftemplate enfermedad
    (slot nombre)
    (slot tipo)
    (multislot sintomas))

(deffacts base-enfermedades
    "Lista inicial de enfermedades"
    (enfermedad (nombre "Gripe") (tipo "Viral") (sintomas "Fiebre" "Tos" "Dolor de garganta" "Fatiga"))
    (enfermedad (nombre "COVID-19") (tipo "Viral") (sintomas "Fiebre" "Tos" "Dificultad para respirar" "Fatiga"))
    (enfermedad (nombre "Tuberculosis") (tipo "Bacteriana") (sintomas "Tos con sangre" "Dolor de pecho" "Fiebre"))
    (enfermedad (nombre "Salmonelosis") (tipo "Bacteriana") (sintomas "Diarrea" "Fiebre" "Calambres abdominales"))
    (enfermedad (nombre "Dengue") (tipo "Viral") (sintomas "Fiebre alta" "Dolor de cabeza" "Dolor muscular"))
    (enfermedad (nombre "Meningitis") (tipo "Viral/Bacteriana") (sintomas "Fiebre" "Dolor de cabeza" "Rigidez en el cuello"))
    (enfermedad (nombre "Neumonía") (tipo "Bacteriana") (sintomas "Tos" "Fiebre" "Dificultad para respirar"))
    (enfermedad (nombre "Hepatitis B") (tipo "Viral") (sintomas "Ictericia" "Fatiga" "Dolor abdominal"))
    (enfermedad (nombre "Amigdalitis") (tipo "Bacteriana") (sintomas "Dolor de garganta" "Fiebre" "Inflamación de amígdalas"))
    (enfermedad (nombre "Cólera") (tipo "Bacteriana") (sintomas "Diarrea acuosa" "Vómitos" "Deshidratación")))

    (defrule diagnosticar-enfermedad
    ?diagnostico <- (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas $?sintomas))
    (declare (salience 10))
    (test (subsetp $?input-sintomas $?sintomas))
    =>
    (printout t "Posible enfermedad diagnosticada: " ?nombre ", Tipo: " ?tipo crlf))

(deffunction subsetp (?set1 $?set2)
    (if (member$ (first$ ?set1) ?set2)
        then (if (subsetp (rest$ ?set1) ?set2) then return TRUE else return FALSE))
    else return FALSE)


(deffunction agregar-enfermedad (?nombre ?tipo $?sintomas)
    (assert (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas $?sintomas)))
    (printout t "Enfermedad agregada: " ?nombre crlf))

(deffunction actualizar-enfermedad (?nombre ?nuevo-tipo $?nuevos-sintomas)
    (retract (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas $?sintomas)))
    (assert (enfermedad (nombre ?nombre) (tipo ?nuevo-tipo) (sintomas $?nuevos-sintomas)))
    (printout t "Enfermedad actualizada: " ?nombre crlf))

(deffunction borrar-enfermedad (?nombre)
    (retract (enfermedad (nombre ?nombre) (tipo ?tipo) (sintomas $?sintomas)))
    (printout t "Enfermedad eliminada: " ?nombre crlf))

    (load "enfermedades.clp")
(load "reglas.clp")
(load "funciones.clp")

(reset)
(run)

;; Consultar y diagnosticar
(assert (input-sintomas "Fiebre" "Dolor de cabeza"))
(run)

;; Agregar una nueva enfermedad
(agregar-enfermedad "Varicela" "Viral" "Fiebre" "Erupción cutánea")

;; Actualizar enfermedad
(actualizar-enfermedad "Gripe" "Viral" "Fiebre" "Tos" "Congestión")

;; Borrar enfermedad
(borrar-enfermedad "Cólera")

(run)
