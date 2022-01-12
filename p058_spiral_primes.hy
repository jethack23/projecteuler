;;; hy==1.0a4

(import time [time])

(defn prime? [n primes]
  (for [p primes]
    (cond [(> (* p p) n) (return True)]
          [(= (% n p) 0) (return False)])))

(defn ratio [cnt n]
  (/ cnt (+ (* 4 n) 1)))

(defn sol [thr]
  (setv cnt 3
        n 1
        primes [2 3 5 7]
        cur 9)
  (while (> (ratio cnt n) thr)
    (print cnt n (ratio cnt n))
    (+= n 1)
    (for [_ (range 3)]
      (for [_ (range n)]
        (+= cur 2)
        (if (prime? cur primes)
            (primes.append cur)))
      (if (= (get primes -1) cur)
          (+= cnt 1)))
    (for [_ (range (- n 1))]
        (+= cur 2)
        (if (prime? cur primes)
            (primes.append cur)))
    (+= cur 2))
  (+ 1 (* 2 n)))

(setv t (time))
(print (sol 0.1))
(print (- (time) t))

;;; 1336s in pypy
