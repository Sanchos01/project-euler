def findMultiples():
	final_sum = 0
	list3 = []
	list5 = []
	for i in range(1,1000):
		if i % 3 == 0:
			list3.append(i)
	for i in range(1,1000):
		if i % 5 == 0:
			list5.append(i)
	for i in list5:
		if i not in list3:
			list3.append(i)
	list3.sort()
	for i in list3:
		final_sum += i

	print(list3)
	print(final_sum)

def FindMultiples2():
	final_sum = 0
	lst = []
	for i in range(1,1000):
		if i%3==0 and i%5==0:
			final_sum+=1

	print lst
	print final_sum

if __name__ == '__main__':
	FindMultiples()
	FindMultiples2()