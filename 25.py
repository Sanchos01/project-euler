def NdigitFibonacci(N):
	a=1
	b=1
	n=0
	i=2
	while n<N:
		c=a+b
		n=len(str(c))
		a=b
		b=c
		i+=1
		# print c
	print c
	print i

if __name__=='__main__':
	NdigitFibonacci(1000)