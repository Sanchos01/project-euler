import time
import math
from math import sqrt

def isPrime(k):
	if k==1:
		return False
	else:
		if k<4:
			return True
		else:
			if k%2==0:
				return False
			else:
				if n<9:
					return True
				else:
					if k%3==0:
						return False
					else:
						r=sqrt(k)
						f=5
						while f<=r:
							if k%f==0:
								return False
							if k%(f+2)==0:
								return False
							f+=6
						return True

def Check(n):
	starttime=time.time()
	limit=n
	count=1
	candidate=1
	while count!=limit:
		candidate+=2
		if isPrime(candidate):
			count+=1
	print(candidate)
	print 'Elapsed Time: {:.3f} sec'.format(time.time()-starttime)

if __name__=='__main__':
	n=10001
	Check(n)