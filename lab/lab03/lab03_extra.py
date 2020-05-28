""" Optional problems for Lab 3 """

# Q4
def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    def has_a_factor(num,divisor):
        if divisor == 1:
            return False
        if num % divisor == 0:
            return True
        else:
            return has_a_factor(num,divisor-1)
    return not(has_a_factor(n,n-1))
# Q5
def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    "*** YOUR CODE HERE ***"
    larger = max(a,b)
    smaller = min(a,b)
    if larger % smaller == 0:
        return smaller
    else:
        return gcd(smaller , larger % smaller)
# Q6
def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    def count_numbers(number,digit):
        if number == 0:
            return 0
        last_digit = number % 10
        if last_digit == digit:
            return 1  + count_numbers(number // 10,digit)
        else:
            return count_numbers(number//10,digit)
    if n < 10:
        return 0
    last_digit = n%10
    return count_numbers(n//10,10 - last_digit) + ten_pairs(n//10)



# Q7
def factors_list(n):
    """Return a list containing all the numbers that divide `n` evenly, except
    for the number itself. Make sure the list is in ascending order.

    >>> factors_list(6)
    [1, 2, 3]
    >>> factors_list(8)
    [1, 2, 4]
    >>> factors_list(28)
    [1, 2, 4, 7, 14]
    """
    all_factors = []
    "*** YOUR CODE HERE ***"
    count = 1
    while count < n:
        if n % count == 0:
            all_factors.append(count)
            count += 1
        else:
            count += 1
    return all_factors
