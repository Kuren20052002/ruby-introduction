#fibonacci without recursion
def fibs(number)
  first_fib = 0
  second_fib = 1
  result = []
  number.times do
    result << first_fib
    first_fib, second_fib = second_fib, first_fib + second_fib
  end
  result
end


#fibonacci with recursion
def fibs_rec(number)
  return number if number <= 1
  fibs_rec(number - 1) + fibs_rec(number - 2)
end
