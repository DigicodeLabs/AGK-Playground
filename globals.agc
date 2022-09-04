// File: globals.agc
// Created: 22-08-22

#constant CATEGORY_2D_PARTICLES 1
#constant CATEGORY_2D_TWEENS 5
#constant CATEGORY_COS_SIN_ORBIT 2
#constant CATEGORY_SINE_WAVES 4

global blankParticlesKeyFrame as typeParticlesKeyFrame
global blankVariable as typeJSONVariables
global codeLines as integer[]
global color as integer[4]
global condensedCode as integer : condensedCode = 0
global copiedToClipboardBackground as integer
global copiedToClipboardBackgroundTween as integer
global copiedToClipboard as integer
global copiedToClipboardTween as integer
global imgBlank as integer : imgBlank = LoadImage("blank-image.png")
global imgMoon as integer : imgMoon = LoadImage("moon.png")
global imgParticle as integer : imgParticle = LoadImage("particle.png")
global imgPlanet as integer : imgPlanet = LoadImage("planet.png")
global imgSpaceship as integer : imgSpaceship = LoadImage("spaceship.png")
global localVariables as typeJSONVariables[]
if (GetFileExists("localVariables.json")) then localVariables.load("localVariables.json")
global particles as integer
global particlesKeyFrames as typeParticlesKeyFrame[]
global recreateParticles as integer
global redrawCode as integer : redrawCode = 1
global redrawPlayground as integer : redrawPlayground = 1
global selectedCategory as integer : selectedCategory = CATEGORY_2D_PARTICLES
global tweenChain as integer
global tweens as integer[]
global versionNumber$ as string : versionNumber$ = "1.0.0"
