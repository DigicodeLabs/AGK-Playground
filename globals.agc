// File: globals.agc
// Created: 22-08-22

#constant COS_SIN_ORBIT 2
#constant SINE_WAVES 3

global blankVariable as typeJSONVariables
global localVariables as typeJSONVariables[]
if (GetFileExists("localVariables.json")) then localVariables.load("localVariables.json")
global selectedCategory as integer : selectedCategory = SINE_WAVES
