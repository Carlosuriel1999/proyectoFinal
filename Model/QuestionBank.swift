//
//  QuestionBank.swift
//  FunWithFlags
//
//  Created by Victor on 2017-12-16.
//  Copyright © 2017 Victor. All rights reserved.
//

import Foundation

class QuestionBank{
    var list = [Question]()
    
    init() {
        
        list.append(Question(image: "geo1", questionText: "En geometria, como se llama la figura antes mostrada.", choiceA: "A. Circulo", choiceB: "B. Cubo", choiceC: "C. Poligono", choiceD: "D. paralepipedo", answer: 4))
        
        list.append(Question(image: "geo2", questionText: "De acuerdo a la figura, ¿Cual es la altura del avion?", choiceA: "A. 200m", choiceB: "B. 100m", choiceC: "C. 20m", choiceD: "1km", answer: 3))
        
        list.append(Question(image: "geo3", questionText: "Resuelva la derivada", choiceA: "A.3(-3x^2/x-2) ", choiceB: "B. 4(-3x^2)/(x^2+1)^3", choiceC: "C. 3(-3x^2)/(x+2)", choiceD: "D. 4(-3x^2)/(x^2-3)^3", answer: 2))
        
        list.append(Question(image: "geo4", questionText: "Resuelve la integral", choiceA: "A. 193", choiceB: "B. 234", choiceC: "C. 245", choiceD: "D. 198", answer: 1))
        
        list.append(Question(image: "geo5" , questionText: "¿Cual es la dinstacia que hay entre los dos puntos?", choiceA: "A. √57" , choiceB: "B. √89" , choiceC: "C. √87" , choiceD: "D. √78", answer: 2))
        
        list.append(Question(image: "geo6" , questionText: "Resuelva la siguiente integral doble", choiceA: "A. 23/6" , choiceB: "B. 23/9" , choiceC: "C. 25/6" , choiceD: "D. 12/8", answer: 1))
        
        list.append(Question(image: "geo7" , questionText: "Resuelva la siguiente ecuacion diferencial", choiceA: "A. 1/4" , choiceB: "B. -1/8" , choiceC: "C. 1/8" , choiceD: "D. -1/4", answer: 4))
        
        list.append(Question(image: "geo8" , questionText: "2. En el siguiente arreglo de capacitores C1= 6 [μF], C2= 3 [μF], C3= 2 [μF], C4= 4 [μF] y C5= 1 [μF].Si            Vad= 30 [V], calcule: a) La capacitancia equivalente entre los puntos a y d, es decir, Cad. Se sugiere dibujar los circuitos equivalentes que resultan del procedimiento de reducción.", choiceA: "A. -8[μF]" , choiceB: "B. -2 [μF]" , choiceC: "C. 8 [μF]" , choiceD: "D. 2 [μF]", answer: 4))
        
        list.append(Question(image: "geo9" , questionText: "Resuelve el siguiente ejercio de Termodinamica ", choiceA: "A.4x10^2[N/m^2]" , choiceB: "B.6x10^2[N/m^2]" , choiceC: "C.6x10^3[N/m^2]" , choiceD: "D. 4x10^3[N/m^2]", answer: 1))
        list.append(Question(image: "geo10" , questionText: "Resuelva el siguiente ejercio de Mecacnica", choiceA: "A. 140" , choiceB: "B. 208" , choiceC: "C. 320" , choiceD: "D. 134", answer: 2))
           list.append(Question(image: "geo11" , questionText: "Resuelva el siguiente ejercio de Quimica", choiceA: "A. 1,55 %" , choiceB: "B.1,75 %" , choiceC: "C. 1,257 %" , choiceD: "D. 2,5%", answer: 3))
        
        list.append(Question(image: "geo12" , questionText: "Resuelva la siguiente  Matriz", choiceA: "A. m1=-3, m2=-1/3" , choiceB: "B. m1=2 ,m2=1/2" , choiceC: "C. m1=4, m2=1/4" , choiceD: "D. m1=-4, m2=-1/4", answer: 2))
        list.append(Question(image: "geo13" , questionText: "Resuelva la siguiente determinate de la Matriz", choiceA: "A. -217" , choiceB: "B. 217" , choiceC: "C. 309" , choiceD: "D. -309", answer: 1))
        list.append(Question(image: "geo14" , questionText: "Resuelva la siguiente ejercicio de Fisica", choiceA: "A. t = 4.12s" , choiceB: "B. t = 3.23s" , choiceC: "C. t = 5.28s" , choiceD: "D. t = 3.12s", answer: 3))
        list.append(Question(image: "geo15" , questionText: "Resuelva la siguente  de Fisica", choiceA: "A. Va= 27.3 km/h" , choiceB: "B.  Va= 35.2 km/h" , choiceC: "C. Va= 13.2 km/h" , choiceD: "D. Va= 20.7 km/h", answer: 1))
        list.append(Question(image: "geo16" , questionText: "Resuelva la siguiente Integral", choiceA: "A. 2sin(2x)+c" , choiceB: "B. sin(2x)" , choiceC: "C. 1/2sin(2x)" , choiceD: "D. 1/2sin(2x)+c", answer: 4))
        
        list.append(Question(image: "geo17" , questionText: "Resuelva la siguiente Integral", choiceA: "A. -3/2 arctan(x/2)+c" , choiceB: "B. 1/2 arctan(x/2)+c" , choiceC: "C. -1/2 arctan(x/2)+c" , choiceD: "D. 3/2 arctan(x/2)+c", answer: 1))
        
        list.append(Question(image: "geo18" , questionText: "Resuelva la siguiente ejercicio de Optica ", choiceA: "A. s= -2.5 x10^2m, m=-7.5x10^2m" , choiceB: "B. s=7.5 x10^2m, m=2.5x10^2m" , choiceC: "C. s= -7.5 x10^2m, m=-2.5x10^2m" , choiceD: "D. s= 7.5 x10^3m, m=2.5x10^3m", answer: 3))
        list.append(Question(image: "geo19" , questionText: "Resuelva la siguiente ejercio de Optica", choiceA: "A.a=60 grad , b= 2,52 Nprismas  " , choiceB: "B. a=40 grad , b= 1,52 Nprismas " , choiceC: "C.a=40 grad , b= 2,52 Nprismas  " , choiceD: "D.a= 60 grad , b= 3,23 Nprismas ", answer: 2))
        list.append(Question(image: "geo20" , questionText: "Resuelva la siguiente ejercio de Acustica", choiceA: "A. a= 5,6 x 10^-6 W/m^2 , b= 66,55 dB " , choiceB: "B. a= 4.17 x 10^-6 W/m^2 , b= 30.77 dB " , choiceC: "C.a= 3,4 x 10^-6 W/m^2 , b= 30.5 dB " , choiceD: "D.a= 2.7 x 10^-6 W/m^2 , b= 55.66 dB ", answer: 4))

        
        
        
        
        
        

    }
}
