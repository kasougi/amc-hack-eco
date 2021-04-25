class rating:


    def __init__(self, column):
        self.sum = 0
        self.column = 0

    def sum_of_cluster(self, mas):
        for i in range(len(mas)):
            self.sum = self.sum + mas[i][self.column]
