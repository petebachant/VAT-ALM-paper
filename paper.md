# An actuator line model for axial- and cross-flow turbines using OpenFOAM

## Introduction

As turbines...

The actuator line method is an application of blade element (BE) theory to
Navier--Stokes solvers. Typically blade element models use either simple
momentum or vortex (potential flow) methods to solve for the incident flow
field. This is very computationally efficient, and can provide engineering level
predictions for rotors operating in conditions where unsteady flow effects are
minimal. For example, a propeller or wind turbine, which ideally encounters a
steady flow during normal operation, can be optimized reasonably well with blade
element momentum (BEM) techniques.

A helicopter rotor, which while maneuvering has blades that are changing pitch
cyclically, encounters unsteady flow, though this can still be accounted for
reasonably well with BEM models. Unsteady aerodynamics have been investigated
thoroughly to aid in the design of these rotors. Models have been developed to
deal with not only the hysteresis caused by unsteady flow, but the effects of
stall under dynamic conditions, so-called dynamic stall.

A cross-flow turbine (CFT) presents a new challenge in that the turbine blades
are always operating in highly unsteady flow, even in idealized conditions, with
blade angles of attack changing sign throughout their rotation. Their incident
flow is further complicated by the common occurrence of dynamic stall and the
downstream blades nearly always encountering upstream blade wakes, which may
include coherent vortex structures from the stalling process. Cyclic changes in
relative velocity magnitude modify the blade Reynolds number throughout the
rotation and further complicate the application of 2-D static foil data to
predict blade loading.

Nevertheless, BEM and vortex models have been developed and validated against
low-solidity rotors, which have then been used to design large scale Darrieus
vertical-axis wind turbines. However, these models are not very robust when
applied to high-solidity rotors commonly used in marine hydrokinetic or small
scale wind applications. This fact combined with modern computing power makes
the actuator line model an attractive candidate for CFTs. In theory we should be
able to model local flow and blade-wake interaction more accurately thanks to
Navier--Stokes solvers, but avoid the high cost of modeling the fine details of
the boundary layer adjacent to the blades.

This new ALM contains some features that have not been implemented in others:

* Multiple variations of Leishman--Beddoes type dynamic stall models.
* Reynolds number corrections for static foil data.
* Turbulence model scalar sources based on element loading.
* A generalized end effects model.
* A flow curvature effects model for high-solidity CFTs.
* The ability to place any type of actuator line object anywhere in the flow, e.g., to represent nearby support structures.
* Inclusion in standard OpenFOAM solvers, e.g. `simpleFoam` and `pimpleFoam`, which allows for both RANS and LES turbulence modeling.
* Modeling both axial- and cross-flow turbines with similar underlying software objects, allowing both types of turbines in the same simulation.
* Freely available and open source.

This paper describes the development of the model and presents results regarding
its effectiveness.

We start out with a list of test cases in order to validate the model from the
ground up:

1. A single airfoil in steady flow -- To validate angle of attack detection and end effects modeling
2. A harmonically pitching foil in steady flow -- To verify implementation of dynamic stall models and detection of unsteady angle of attack
3. A standalone axial-flow turbine -- To validate performance and wake predictions for a relatively steady flow case in rotor context
4. A standalone low-solidity cross-flow turbine
5. A standalone high-solidity cross-flow turbine -- Probably the most difficult due to the inclusion of flow curvature effects
6. A pair of CFTs, to test the ability to model turbine wake interaction and hence array performance.
