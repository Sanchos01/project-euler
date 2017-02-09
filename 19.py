import datetime
def CountSundays():
	y,m,d=1901,1,1
	i=0
	hollymolly=datetime.date(y,m,d)
	while hollymolly!=datetime.date(1999,12,1):
		if hollymolly.weekday()==0:
			i+=1
			print hollymolly
		m+=1
		if m>12:
			m=1
			y+=1
		hollymolly=datetime.date(y,m,d)

	print hollymolly, i
if __name__=='__main__':
	CountSundays()