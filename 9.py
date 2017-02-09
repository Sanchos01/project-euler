from math import sqrt

def PythagoreanTriplet(n):
	lst=[]
	for a in range(30,n):
		print(a)
		for b in range(a+1,n-1):
			c=n-a-b
			# print(b,c)
			if a**2+b**2==c**2:
				t=a*b*c
	# print(lst)
	# t=lst[0[0]]*lst[0[1]]*lst[0[2]]
	print(t)

if __name__=='__main__':
	PythagoreanTriplet(1000)