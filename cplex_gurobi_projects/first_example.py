# -*- coding: utf-8 -*-
"""
First Example from CPLEX
"""
import pyomo.environ as pyo
from pyomo.environ import *
from pyomo.opt import SolverFactory

model = pyo.ConcreteModel()

model.c = pyo.Var(bounds=(0, None), domain=Integers)
model.p = pyo.Var(bounds=(0, None), domain=Integers)
c = model.c
p = model.p

model.obj = pyo.Objective(expr = 3000*c + 5000*p, sense=maximize)

model.C1 = pyo.Constraint(expr = 2*c + 3*p <= 30)
model.C2 = pyo.Constraint(expr = 4*c + 8*p <= 70)

opt = SolverFactory('gurobi')

opt.solve(model)

model.pprint()

print('------------------------------------------------------')
print('N casas: ', pyo.value(c))
print('N predios: ', pyo.value(p))
print('Lucro: ', pyo.value(model.obj))