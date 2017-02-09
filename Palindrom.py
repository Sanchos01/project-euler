def Polindrom():
	k=999
	l=999
	lst=[]
	r=0
	while k>900 and r!=1:
		while l>900 and r!=1:
			n=k*l
			# n=...n3 n2 n1
			n1=n%10
			n2=(n%100-n1)/10
			n3=(n%1000-n2)/100
			n123=n1*100+n2*10+n3
			if int(n/1000)==n123:
				# print(n,k,l)
				lst.append(n)
				break
			l-=1
		k-=1
		l=999
	lst.sort()
	lst.reverse()
	print(lst)


if __name__=='__main__':
	Polindrom()