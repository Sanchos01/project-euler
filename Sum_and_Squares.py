def SumSquares(n):
	summa=0
	squares=0
	for i in xrange(n+1):
		summa+=i
		squares+=i**2
	summa=summa**2
	print(squares, summa)
	print(summa-squares)

if __name__=='__main__':
	SumSquares(100)