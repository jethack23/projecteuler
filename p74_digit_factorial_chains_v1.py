# elapsed: 18.23354959487915
def factorial(n):
    if n < 2:
        return 1
    else:
        return n * factorial(n - 1)


digit_factorials = list(map(factorial, range(10)))


def chain_length(n):
    mem = {*()}
    rst = 0
    while not n in mem:
        rst += 1
        mem.add(n)
        n = sum(map(lambda x: digit_factorials[int(x)], str(n)))
    return rst


def solution(M):
    rst = 0
    for i in range(M):
        if chain_length(i) == 60:
            rst += 1
    return rst


from time import time


def main():
    start = time()
    print(solution(1000000))
    print("elapsed:", time() - start)


main()


# translated from below s-expression

# version : 0.1.8
# (def factorial [n]
#   (if (< n 2)
#       (return 1)
#       (return (* n (factorial (- n 1))))))
#
# (= digit-factorials (list (map factorial (range 10))))
#
# (def chain-length [n]
#   (= mem {,})
#   (= rst 0)
#   (while (not (in n mem))
#     (+= rst 1)
#     (mem.add n)
#     (= n (sum (map (lambda [x] (sub digit-factorials (int x))) (str n)))))
#   (return rst))
#
# (def solution [M]
#   (= rst 0)
#   (for i (range M)
#     (if (== (chain-length i) 60)
#         (+= rst 1)))
#   (return rst))
#
# (defmacro euler [*inputs]
#   (return `(do (from time [time])
#
#                (def main []
#                  (= start (time))
#                  (print (solution ~@inputs))
#                  (print "elapsed:" (- (time) start)))
#
#                (main))))
#
# (euler 1000000)
