// File: globals.agc
// Created: 22-08-22

#constant CATEGORY_2D_PARTICLES 1
#constant CATEGORY_COS_SIN_ORBIT 2
#constant CATEGORY_SINE_WAVES 4

global blankParticlesKeyFrame as typeParticlesKeyFrame
global blankVariable as typeJSONVariables
global color as integer[4]
global imgParticle as integer : imgParticle = LoadImage("particle.png")
global localVariables as typeJSONVariables[]
if (GetFileExists("localVariables.json")) then localVariables.load("localVariables.json")
global particles as integer
global particlesKeyFrames as typeParticlesKeyFrame[]
global recreateParticles as integer
global selectedCategory as integer : selectedCategory = CATEGORY_2D_PARTICLES
