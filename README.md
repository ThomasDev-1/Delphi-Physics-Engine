# Delphi-Physics-Engine
A WIP physics engine written in Delphi 10.4



# TPU (Thomas' Physics Unit)
-------------------------------

## Basic info
--------------------------------
This is a simple Physics simulating Unit that can be used in any Delphi 10.4 program that requires gravity, collisions, and other basic mechanics. This Engine was made with the intention of being used to create games and simulations within the Delphi 10.4 Environment.


## Setup
-------------------------------
1. Add the TPU.pas file to your project. 
2. In your main unit, add "TPU" under uses
3. Create a variable witin your main unit: "TPUEngine : tTPU;"
4. On TForm.FormActivate add: "TPUEngine := tTPU.Create;"
5. On TForm.FormClose add: "TPUEngine.Destroy;"
6. Use TPU features anywhere within your main Unit by calling TPUEngine.<Feature>


## Features
--------------------------------

### Collisions
####Description:
A public function CheckCol() allows you to detect a collision within an object. The function will return true if any object that stems from the TControl type enters the bounds of the parsed TControl object. Both objects MUST share the same Parent in order for collisions to be detected.

#### Usage:
Constant checks for collisions are suggested. This can be done by executing: 
"if TPUEngine.CheckCol(TControlComponent) then //do something"
from within a TTimer component with a maximum Interval of 16
Replace "TControlComponent" with the name of your component. Function will return True if ANY OTHER TControl component enters the Bounds of the parsed component. Note, this will only detect collisions between 2 components that share the same parent.


### Gravity
####Description:
A public procedure ApplyGravity() simulates gravity being applied to multiple objects at the same time. Must be called from within a TTimer component with a maximum Interval of 16. Gravity can be applied to ANY component type, however is designed to work with TControl components.

#### Usage:
Gravity simulations MUST be constantly executed from within a TTimer component. This can be done by executing:
"TPUEngine.ApplyGravity(referenceObject);"
'referenceObject' : TControl component. ANY TControl object that will have gravity applied to. All objects that have the "GRAV" within their .Tag value, AND share the same parent as the referenceObject will be effected by gravity.

**When using Gravity function. Ensure that ALL objects that you wish to be effected by the gravity, have "GRAV" somewhere within their .Tag value, AND that all objects that you wish to act as a hard ground have "GROUND" within their .Tag value.
