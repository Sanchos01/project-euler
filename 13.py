import time
from math import pow
def LargeSum():
	starttime=time.time()
	lst=[]
	summa=long(0)
	f=open('LargeSum.txt')
	for line in f:
		lst.append(line)
	print lst[0],lst[1]
	for number in lst:
		l=len(number)
		for i in range(l):
			if i==50:
				break
			# if i==49:
			# 	print number[i], int(10**(l-1-i))
			else:
				# print(number[i])
				summa+=int(number[i])*int(10**(l-1-i))
	print summa
	print type(summa)


	print('Elapsed time:{:.3f} sec'.format(time.time()-starttime))
if __name__=='__main__':
	LargeSum()