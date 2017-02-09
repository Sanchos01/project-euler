from math import sqrt
import time

starttime=time.time()
n=600851475143
if n % 2 ==0:
	lastFactor=2
	n=int(n/2)
	while n%2==0:
		n=int(n/2)
else:
	lastFactor=1
factor=3
maxFactor=sqrt(n)
while n>1 and factor<=maxFactor:
	if n%factor==0:
		n=int(n/factor)
		lastFactor=factor
		while n%factor==0:
			n=int(n/factor)
		maxFactor=sqrt(n)
	factor=factor+2
if n==1:
	print(lastFactor)
else:
	print(n)
print "Elapsed time: {:.6f} sec".format(time.time() - starttime)