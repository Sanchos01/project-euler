def nameScores():
	f = open('p022_names.txt')
	l = []
	pos = 'out'
	name = ''
	for line in f:
		for char in line:
			if char == '"' and pos == 'out':
				pos = 'in'
			elif char == '"' and pos == 'in':
				pos = 'out'
				l.append(name)
				name=''
			elif char != '"' and pos == 'in':
				name+=char
	l.sort()
	# print l

	namePosition = 1
	nameCounter = 0
	scores = []
	totalScores = 0
	lettersList = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
	for name in l:
		for char in name:
			nameCounter+=1+lettersList.index(char)
		scores.append(namePosition*nameCounter)
		totalScores+=(namePosition*nameCounter)
		namePosition += 1
		nameCounter = 0
	# print scores
	print totalScores

if __name__=='__main__':
	nameScores()