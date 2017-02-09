def CollatzSequence(i):
	n=0
	r=1
	while r:
		if i==1:
			r=0
			return(n)
		if i%2==0:
			i/=2
			n+=1
		elif i%2!=0:
			i=3*i+1
			n+=1

def LongestCollatz():
	Largest=0
	for i in xrange(800000,1000000):
		if CollatzSequence(i)>Largest:
			Largest=CollatzSequence(i)
			ans=i
	print ans

if __name__=='__main__':
	LongestCollatz()