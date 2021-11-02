#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 31 22:12:15 2021

@author: herminio
"""

import gurobipy as gp
from gurobipy import GRB
m = gp.Model("cintos")
x1 = m.addVar(vtype=GRB.INTEGER, name="mi")
x2 = m.addVar(vtype=GRB.INTEGER, name="m2")

m.setObjective(4*x1 + 3*x2,GRB.MAXIMIZE)

m.addConstr(2*x1 + x2 <= 1000,"R1")
m.addConstr(x1 + x2 <= 800, "R2")
m.addConstr(x1 <= 400, "R3")
m.addConstr(x2 <= 706, "R4")

m.optimize()

for v in m.getVars():
    print('%s %g' %(v.varName, v.x))
    
print('Obj: %g' % m.objVal)