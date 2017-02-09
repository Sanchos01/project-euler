import math
from math import *

def SmallestDivided(k):
	n=1
	i=1
	r=1
	p=[1,2,3,5,7,11,13,17,19,23]
	a=[0,0,0,0,0,0,0,0,0,0]
	limit=sqrt(k)
	while p[i]<=k:
		a[i]=1
		if r:
			if p[i]<=limit:
				a[i]=floor(log(k, p[i]))
			else:
				r=0
		n=n*math.pow(p[i], int(a[i]))
		i=i+1
	print(n)

if __name__=='__main__':
	SmallestDivided(20)