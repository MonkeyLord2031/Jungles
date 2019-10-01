"""""""""""""""""""""""""""
Created by MonkeyLord2031
Calculator9000
"""""""""""""""""""""""""""

#импоптируем необходимые библиотеки
#tkinter - библиотека для работы с окнами, интерфесом
from tkinter import *
from tkinter import ttk
from tkinter import messagebox

#создаем окно
window = Tk()
window.title('Калькулятор')
window.resizable(False, False)

#логика калькулятора
str1 = '0123456789+-.*/()'
str2 = '+-*/.'
def calc(key):
    global memory
    if key == '=':
#исключение написания слов
        if '=' not in entry.get():
            if entry.get()[0] not in str1:
                entry.insert(END, 'Первый символ не число!')
                messagebox.showerror('Ошибка','Проверьте правильность данных')                      
#вычислениe
            n = 0
            for ch in entry.get():
                if ch == '(':
                    n += 1
                if ch == ')':
                    n -= 1
            for i in range(0,abs(n)):
                if n>0:
                    entry.insert(END, ')')
                else:
                    entry.insert(0, '(')
            try:
                res = eval(entry.get())
                entry.insert(END, '=' + str(res))
            except:
                entry.insert(END, 'Ошибка')
                messagebox.showerror('Ошибка','Проверьте правильность данных')
#функционал кнопок
    elif key == 'Del':
        if ("=" in entry.get()):
            entry.delete(0,END)
        else:
            entry.delete(len(entry.get())-1)
    elif key == "+\-":
        if "=" in entry.get():
            entry.delete(0,END)
        try:
            if (entry.get()[0] == '-'):
                entry.delete(0)
            else:
                entry.insert(0, '-')
        except IndexError:
            pass
    elif key == '+':
        if entry.get()[-1] not in str2:
            entry.insert(END,key)
    elif key == '-':
        if entry.get()[-1] not in str2:
            entry.insert(END,key)
    elif key == '*':
        if entry.get()[-1] not in str2:
            entry.insert(END,key)
    elif key == '/':
        if entry.get()[-1] not in str2:
            entry.insert(END,key)
#ошибка
#точка ставиться после знаков оперций
#попробовать регулярные выражения
    elif key == '.':
        text = entry.get()
        if len(text) == 0:
            entry.insert(END, '0')
        pt=0
        pt = text.rfind('.')
        if pt == -1:
            entry.insert(END,'.')
        else:
            rtext = text[pt+1:]
            rtext = rtext[::-1]
            for i in range(1,len(rtext)):
                if (rtext[i] in str2):
                    if (rtext[i-1] in '0123456789'):
                        entry.insert(END,'.')
                        return
                    else:
                        return
    else:
        if '=' in entry.get():
            entry.delete(0,END)
        entry.insert(END,key)


#создаем поле ввода
entry = Entry(window, width=57)
entry.grid(columnspan=5)

#создаем кнопки
buttons =[
    '7','8','9','+','-',
    '4','5','6','*','/',
    '1','2','3','=','Del',
    '0','.','+\-','(',')'
    ]

r = 1
c = 0
for i in buttons:
    cmd = lambda x=i: calc(x)
    ttk.Button(window, text=i, command=cmd, width=10).grid(column=c, row=r)
    c += 1
    if (c > 4):
        c = 0
        r += 1

window.mainloop();
