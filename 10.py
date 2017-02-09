from math import sqrt
def isPrime(n):
	if n==1:
		return False
	else:
		if n<4:
			return True  #2 and 3 are prime
		else:
			if  n%2==0:
				return False
			else:
				if n<9:
					return True  #we have already excluded 4,6 and 8
				else:
					if n%3==0:
						return False
					else:
						r=int(sqrt(n)) #n rounded to the greatest integer r so that r*r<=n
						f=5
						while f<=r:
							if n%f==0:
								return False #(and step out of the function)
							elif n%(f+2)==0:
								return False #(and step out of the function)
							f=f+6
						return True #(in all other cases)

def SummationOfPrimes(limit):
	lst=[]
	summa=2
	# count=1
	cand=1
	while  cand<limit-1:
		cand+=2
		if isPrime(cand):
			# count+=1
			# lst.append(cand)
			summa+=cand
	# print(lst)
	print(cand)
	print(summa)
	# 2 3 5 7 11 13 17 19

if __name__=='__main__':
	SummationOfPrimes(2000000)