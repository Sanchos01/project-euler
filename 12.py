import time
from math import sqrt
def HighlyDivisibleTriangle(a,b,n,k):
	starttime=time.time()
	while k<n:
		k=0
		for i in range(1,int(sqrt(a))+1):
			if a%i==0:
				k+=2
		a+=b
		b+=1
	a-=b-1
	print(a)
	print('Elapsed time: {:.3f} sec'.format(time.time()-starttime))


if __name__=='__main__':
 HighlyDivisibleTriangle(1,2,500,0)