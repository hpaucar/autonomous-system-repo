#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov  1 00:18:02 2021

@author: herminio
"""

import pyomo.environ as pyEnv
path = "/home/herminio/CPLEX_Studio128/cplex/bin/x86-64_linux/cplex"

# DADOS
lucros = [92, 57, 49, 68, 60, 43, 67, 84, 87, 72]
pesos = [23, 31, 29, 44, 53, 38, 63, 85, 89, 82]
capacidade = 165
m = len(lucros)

#__DECLARACAO DO MODELO————————— ##

modelo = pyEnv.ConcreteModel()
modelo.I = range(m)

modelo.x = pyEnv.Var(modelo.I, within=pyEnv.Binary)

modelo.objetivo = pyEnv.Objective(expr = sum(lucros[i]*modelo.x[i] for i in modelo.I), sense = pyEnv.maximize)

modelo.rest = pyEnv.Constraint(expr = sum(pesos[i]*modelo.x[i] for i in modelo.I) <= capacidade)

#---------RESOLUCAO DO MODELQ—— 4

solver = pyEnv.SolverFactory('cplex', executable = path)

resultado_objetivo = solver.solve(modelo, tee=True)

#df PRINT DAS VARIAVEIS DE DECISAQ—————————_##

lista = list(modelo.x.keys())

for i in lista:
    print('\n', i,'——', modelo.x[i]())

print('Valor objetivo =', modelo.objetivo())

