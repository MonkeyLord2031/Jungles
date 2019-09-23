"""""""""""""""""""""""
Created by MonkeyLord2031
SimpleNeuro
"""""""""""""""""""""""
#импортируем необходимые библтотеки
from numpy import *

class NeuralNetwork():
    def __init__(self):
        #создаем генератор случайных чисел с фиксированным сидом,
        #чтобы он генерировал одни и те же числа при каждом запуске программы
        random.seed(1)

        #моделируем нейрон с тремя входами и одним выходом 
        #присваевам случайные веса матрице 3х1 со значениями от -1 до 1
        #и средним знчачением 0
        self.weights = 2 * random.random((3,1)) - 1

    #с помощью сигмоид функции, которая описывает S-образный график,
    #мы нормализуем взвешенную сумму входных данных,
    #чтобы нормализовать их между 0 и 1
    def __sigmoid(self, x):
        return 1/(1+exp(-x))

    #производная нашей функции
    #это градиент к графику, который позволяет
    #настраивать веса, взависимости от выхода функции

    def __sigmoid_derivative(self, x):
        return x * (1-x)

    #сеть будет учиться на ошибках
    #постоянно подправляя веса
    def train(self, training_inputs, training_outputs, training_iterations):
        for iteration in range(training_iterations):
            #пропускаем тренировочные данные через сеть
            output = self.think(training_inputs)

            #вычисляем ошибку (разницу между желаемым
            #ответом и полученным от сети
            error = training_outputs - output

            #перемножим входные данные, ошибку и градиент функции
            #умножая на данные, отбрасываем влияние тех входов,
            #которые равны, нулю
            #остальные используются, чтобы подправить веса
            adjustment = dot(training_inputs.T, error * self.__sigmoid_derivative(output))

            #подправляем веса
            self.weights += adjustment

    #логика нейронной сети
    def think(self, inputs):
        #пропускаем данные через нейрон
        return self.__sigmoid(dot(inputs, self.weights))

if __name__ == "__main__":

    #устаналиваем нейросеть из одного нейрона
    neural_network = NeuralNetwork()

    print("Начальные случайные веса:")
    print(neural_network.weights)

    #обучающие данные
    #5 примеров данных с 3-мя входами и 1 выходом 
    training_set_inputs = array([[1,0,1],[0,0,1],[1,1,1],[1,1,0],[1,0,0]])
    training_set_outputs = array([[0,0,1,1,0]]).T 
    
    #обучаем нейронную сеть с помощью заготовленных даннх
    #проделываем это 1,000,000 раз, каждый раз поправляя веса
    neural_network.train(training_set_inputs, training_set_outputs, 1000000)

    print('Новые веса после тренинга:')
    print(neural_network.weights)

    #проверяем сеть на новой ситуации
    print("Проверяем новую ситуацию [0,1,1]:")
    print(neural_network.think(array([0,1,1])))
