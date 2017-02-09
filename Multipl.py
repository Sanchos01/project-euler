def SumDivisible(t, n):
	i=int((t-1)/n)
	return (int(n*(i+1)*i/2))

def SumOfMultipl(t):
	sum = 0
	for i in xrange(1,t):
		if i%3==0 or i%5==0:
			sum+=i
	return sum

if __name__=='__main__':
	print(SumDivisible(1000,3)+SumDivisible(1000,5)-SumDivisible(1000,15))
	print(SumOfMultipl(1000))