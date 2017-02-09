from fractions import Fraction
def digitCancellingFractions():
	a=10.0
	b=10.0
	lst=[]
	bigA = 1
	bigB = 1
	while b < 100:
		a10=a//10
		b1=b%10
		if a/b==1 or b1==0:
			b+=1
			a=10.0
			continue
		a1=a%10
		b10=b//10
		if a/b==a10/b1 and a1==b10:
			lst.append((a,b))
		a+=1
	i=0
	m=1
	for item in lst:
		bigA*=item[0]
		bigB*=item[1]
		m*=Fraction(int(item[0]),int(item[1]))
		i+=1		

	print m

if __name__ == '__main__':
	digitCancellingFractions()