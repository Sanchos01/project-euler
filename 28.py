def numberSpiralDiagonals(n):
	if n%2==0 or n<3:
		print 'wtf?'
	else:
		i = 2		# step
		k = 1		# first number
		l = 0		# iteration of step
		amount = 0
		maxNumber = n**2
		while k<=maxNumber:
			amount += k
			k += i
			l += 1
			print k, l
			if l == 4:
				l = 0
				i += 2
		print amount


if __name__=='__main__':
	numberSpiralDiagonals(1001)