## saiaCalc #

### Purpose of Application

To decouple the desired Slip Angle and Desired Camber Angle into pure component angles.  For example, assume a wheel oriented with a desired Slip Angle of 4° and a desired Camber angle of 0°.  If the desired Camber Angle is increased to 15° then the component Slip Angle will have to be set for 3.8635° and the component Camber Angle set for 15.0326°.

This application takes as input via. its user interface a Desired Slip Angle and Desired Camber Angle.  It in turn will output the Component Slip and Camber Angles.

Conversely, the application, when provided with the component Slip and Camber Angles, will convert those angles to actual Slip and Camber Angles. 

#### **Terminolgy:**

* **Camber Angle**: or Inclination Angle, is the angle made by the wheels of a vehicle; specifically, it is the angle between the vertical axis of the wheels used for steering and the vertical axis of the vehicle when viewed from the front or rear.
* **Slip Angle**: or Slideslip Angle,  is the angle between a rolling wheel's actual direction of travel and the direction towards which it is pointing (i.e., the angle of the vector sum of wheel forward velocity *Vx* and lateral velocity *Vy*). 

#### **Equation to "Decouple" Angles:**

This calculation is iterative in nature.  At least 3 iterations will give a reasonable approximation of the component angles, however, 10 iterations gives the best results.

*all angles are assumed to be in radians for the sake of the computation, conversion to degrees can occur afterwards if degrees are required.*

```pascal  
// Initialization  
decoupledIA := desiredIA;  
decoupledSA := desiredSA;

// iterative computation, 10x yields good result  
decoupledIA := ArcTan( Tan( desiredIA ) / Cos( decoupledSA )):  
decoupledSA := ArcTan( Tan( desiredSA ) * Cos( decoupledIA ));  
```
 
#### **Equation to "Couple" the Angles:  

```pascal
coupledSA := ArcTan(Tan(decoupledSA) / Cos(decoupledIA));  
coupledIA := ArcTan(Tan(decoupledIA) * Cos(decoupledSA));  
```
