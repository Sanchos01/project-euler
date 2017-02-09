import math
from math import *
import time
 
# n -> o -> p

def PrimeFactor(n):
	_startTime = time.time()
	r=0
	g=2
	while r!=1:
		if n % g == 0 and r!=1:
			o = n / g
			p = int(sqrt(o))
			while p!=1 and r!=1:
				if o % p == 0:
					o-=1
					break
				p-=1
				if p==1:
					print(o)
					r=1
		g+=1
		# if o==0:
		# 	r=1
	# print(n,o,p)
	print "Elapsed time: {:.3f} sec".format(time.time() - _startTime)

if __name__=='__main__':
	PrimeFactor(600851475143)