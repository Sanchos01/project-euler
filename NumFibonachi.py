def NumFibonachi():
	list = []
	a = 1
	b = 2
	c = 0
	limit = 4000000
	while a < limit or b < limit:
		if b > a:
			if b % 2 == 0:
				c+=b
			a+=b
		elif a > b:
			if a % 2 == 0:
				c+=a
			b+=a
	print(c)

if __name__ == '__main__':
	NumFibonachi()