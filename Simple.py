import math
from math import *
import time

def Simple(n):
	_startTime = time.time()
	k=int(sqrt(n))
	print(k)
	a=range(1,n+1)
	list = []
	p=2
	while p<sqrt(n):
		newlist=range(2*p,n+1,p)
		for newel in newlist:
			if newel in a:
				a.remove(newel)
		for el in a:
			if el > p:
				p = el
				break
	print(a)
	print "Elapsed time: {:.3f} sec".format(time.time() - _startTime)

if __name__=='__main__':
	Simple(1000)