# Differential pairs (230)

The usefulness of the differential pair stems from two key properties. First,
cascades of differential pairs can be directly connected to one another without interstage
coupling capacitors. Second, the differential pair is primarily sensitive to the difference between
two input voltages, allowing a high degree of rejection of signals common to both inputs.

## Dc analysis importance
The large-signal behavior of the emitter-coupled pair is important in part because it illus-
trates the limited range of input voltages over which the circuit behaves almost linearly. Also,
the large-signal behavior shows that the amplitude of analog signals in bipolar circuits can
be limited without pushing the transistors into saturation, where the response time would be
increased because of excess charge storage in the base region.

![[Pasted image 20240710133640.png]]

![[Pasted image 20240710133651.png]]
These two currents are shown as a function of Vid in Fig. 3.46. When the magnitude of Vid
is greater than about 3VT , which is approximately 78 mV at room temperature, the collector
currents are almost independent of Vid because one of the transistors turns off and the other
conducts all the current that flows. 

Furthermore, the circuit behaves in an approximately linear fashion only when the magnitude of Vid is less than about VT . We can now compute the output voltages as 
$$
\large{V_{o1} = V_{cc} - I_{c1} R_{c}}
$$$$
\large{V_{o2} = V_{cc} - I_{c2} R_c}
$$
![[Pasted image 20240710134033.png]]

## Se puede aumentar el rango de linealidad agregando una $R_{E}$
(Es similiar a pensar que la $R_{E}$) es de realimentación negativa, aumenta la linealidad pero a coste de ganancia

# Modo diferencial
El modo de operación que nos interesa analizar es el diferencial (es decir la diferencia entre las entradas), ya que esto rechaza lo común entre estás señales de entrada (modo común). Por lo que se define lo siguiente para hacer los análisis:
$$
\large{v_{id} = v_{i1} - v_{i2}}
$$
common-mode or average input:
$$
\large{v_{ic} = \frac{v_{i1} +  v_{i2}}{2} }
$$
These equations can be inverted  (usually we use these equations):
$$
\large{ v_{i1} = v_{ic} + \frac{v_{id}}{2} }
$$
$$
\large{ v_{i2} = v_{ic} - \frac{v_{id}}{2} }
$$
The differential output is:
$$
\large{ v_{od} = v_{o1} - v_{o2} }
$$
And the same conclusions can be drawn for the differential output (same equations pretty much)

![[Pasted image 20240710135703.png]]

The gains defined in terms of the new equations are:
![[Pasted image 20240710135854.png]]

The differential-mode gain $A_{dm}$ is the change in the differential output per unit change in differential input:
![[Pasted image 20240710135957.png]]
The common-mode gain $A_{cm}$ is the change in the common-mode output voltage per unit change in the common-mode input:
![[Pasted image 20240710140016.png]]

## Estos son los cruzados que le decimos nosotros
![[Pasted image 20240710140048.png]]

# Rechazo de modo común
common mode rejection ratio
![[Pasted image 20240710140350.png]]

## Good conclusions
This expression applies to the particular case of a single-stage, emitter-coupled pair. It shows
that increasing the output resistance of the tail current source RTAIL improves the common-
mode-rejection ratio. This topic is considered in Chapter 4.

Since bipolar transistors have finite β0 , and since differential amplifiers are often used as
the input stage of instrumentation circuits, the input resistance of emitter-coupled pairs is also
an important design consideration. The differential input resistance Rid is defined as the ratio
of the small-signal differential input voltage v id to the small-signal input current ib when a
pure differential input voltage is applied. By inspecting Fig. 3.56, we find that
![[Pasted image 20240710141154.png]]