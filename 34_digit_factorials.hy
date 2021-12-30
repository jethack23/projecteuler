;;; since 9! * 7 = 2540160, n <= 2540160

(require [hy.contrib.loop [loop]])

(defn factorial [n]
  (setv ret 1)
  (while (> n 1)
    (*= ret n)
    (-= n 1))
  ret)

(defn digit-fac-sum [n]
  (setv ret 0)
  (while n
    (+= ret (factorial (% n 10)))
    (//= n 10))
  ret)

(defn sol [n]
  (setv ret 0)
  (for [i (range 10 (+ n 1))]
    (if (= i (digit-fac-sum i))
        (+= ret i)))
  ret)

(sol 2540160)
