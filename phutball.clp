; TODO
;
(defrule init
(declare (salience 200))
(initial-fact)
?wd <- (world (limit $?limit) (ball $?ball) (men $?men) (id ?id) (moves))
=>
(retract ?wd)
(assert (world (limit $?limit) (ball $?ball) (men $?men) (id ?id) (moves $?ball - )))
)


(deftemplate worldX
	(multislot limit) ; max size (orizontala, verticala)
	(multislot ball) ; minge
	(multislot men) ; pozitiile una dupa alta, x y -
	(slot id) ; identificator pt lume
	(multislot moves) ; lista mutarilor, initial vida
  (slot d)
	)


;Mergem in Nord
(defrule N
(declare (salience 28))
?nord <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (- ?x 1) ?omX))
(test (= ?omY ?y))
=>
;(retract ?nord)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 2) ?y) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d nord))))

(defrule testN
(declare (salience 50))
?testN <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d nord))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testN)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 1) ?y) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d nord)))
)

;Mergem in SUD

(defrule S
(declare (salience 31))
?sud <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (+ ?x 1) ?omX))
(test (= ?omY ?y))
=>
;(retract ?sud)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 2) ?y) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d sud)))
)

(defrule testS
(declare (salience 60))
?testS <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d sud))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testS)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 1) ?y) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d sud)))
)

;Mergem in EST

(defrule E
(declare (salience 29))
?est <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (+ ?y 1) ?omY))
(test (= ?omX ?x))
=>
;(retract ?est)
(assert (worldX (limit ?maxX ?maxY) (ball ?x (+ ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d est))))

(defrule testE
(declare (salience 60))
?testE <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d est))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testE)
(assert (worldX (limit ?maxX ?maxY) (ball ?x (+ ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d est)))
)

;Mergem in VEST

(defrule V
(declare (salience 29))
?vest <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (- ?y 1) ?omY))
(test (= ?x ?omX))
=>
;(retract ?vest)
(assert (worldX (limit ?maxX ?maxY) (ball ?x (- ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d vest))))

(defrule testV
(declare (salience 60))
?testV <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d vest))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testV)
(assert (worldX (limit ?maxX ?maxY) (ball ?x (- ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d vest)))
)

;Mergem in N-E

(defrule NE
(declare (salience 30))
?nordest <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (- ?x 1) ?omX))
(test (= (+ ?y 1) ?omY))
=>
;(retract ?nordest)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 2) (+ ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d nordest))))

(defrule testNE
(declare (salience 60))
?testNE <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d nordest))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testNE)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 1) (+ ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d nordest)))
)

;Mergem in N-V

(defrule NV
(declare (salience 30))
?nordvest <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (- ?x 1) ?omX))
(test (= (- ?y 1) ?omY))
=>
;(retract ?nordvest)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 2) (- ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d nordvest))))

(defrule testNV
(declare (salience 60))
?testNV <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d nordvest))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testNV)
(assert (worldX (limit ?maxX ?maxY) (ball (- ?x 1) (- ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d nordvest)))
)

;Mergem in S-V

(defrule SV
(declare (salience 28))
?sudvest <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (+ ?x 1) ?omX))
(test (= (+ ?y 1) ?omY))
=>
;(retract ?sudvest)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 2) (+ ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d sudvest))))

(defrule testSV
(declare (salience 60))
?testSV <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d sudvest))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testSV)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 1) (+ ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d sudvest)))
)

;Mergem in S-E

(defrule SE
(declare (salience 28))
?sudest <- (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves))
(test (= (+ ?x 1) ?omX))
(test (= (- ?y 1) ?omY))
=>
;(retract ?sudest)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 2) (- ?y 2)) (men $?pa $?pb) (id ?worldid) (moves $?moves) (d sudest))))

(defrule testSE
(declare (salience 60))
?testSE <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?pa ?omX ?omY - $?pb ) (id ?worldid) (moves $?moves) (d sudest))
(test (= ?omX ?x))
(test (= ?omY ?y))
=>
(retract ?testSE)
(assert (worldX (limit ?maxX ?maxY) (ball (+ ?x 1) (- ?y 1)) (men $?pa $?pb ) (id ?worldid) (moves $?moves) (d sudest)))
)


(defrule stabilirePoz
(declare (salience 25))
?test <- (worldX (limit ?maxX ?maxY) (ball ?x ?y) (men $?p) (id ?worldid) (moves $?moves) (d ?))
=>
(retract ?test)
(assert (world (limit ?maxX ?maxY) (ball ?x ?y) (men $?p) (id ?worldid) (moves $?moves ?x ?y -)))
)

(defrule forwin
(declare (salience 150))
?t <- (world (limit ?limitX ?limitY) (ball ?x ?y) (men $?) (id ?worldid) (moves $?moves))
(test (= ?limitX (+ ?x 1)))
=>
(assert (win (id ?worldid) (moves $?moves)))
(assert (retractTot ?worldid))
)

(defrule retracttot
(declare (salience 151))
(retractTot ?worldid)
?t <- (world (limit $?) (ball $?) (men $?) (id ?worldid) (moves $?moves))
=>
(retract ?t)
)

(defrule retractTT
(declare (salience -100))
?f <- (retractTot ?id)
=>
(retract ?f)
)

(defrule retractforlose
(declare (salience -101))
?t <- (world (limit $?) (ball $?) (men $?) (id ?worldid) (moves $?))
=>
(retract ?t)
)

