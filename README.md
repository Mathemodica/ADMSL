ADMSL
=====

Algorithmically Differentiated Library of a part of the standard library Modelica.Electrical.Analog.Basic 


Description
=========== 

ADMSL is the Algorithmically Differentiated (AD) version of a part of the Modelica standard package Modelica.Electrical.Analog.Basic. 
The underlying promising goal it to become the AD version of the Modelica Standard Library. This is where the name ADMSL comes from (Algorithmically differentiated Modelica Standard Library). 

This library serves as a guide for illustrating equation-based algorithmic differentation techniques for Modelica libraries. 
An algorithmically differentiated Modelica library contains every thing the original version has together with parameter sensitivities. 
The same models relying on that library can evaluates parameter sensitivities with few minimal efforts and slight changes. However these models preserve the same interface and outlook.


It represents a testing platform for algoirhtmic differerntiation of Modelica libraries w.r.t.
  * algorithmic methodologies 
  * identifying current limitations towards AD of Modelica models  
  * suggesting / recommending further potential language improvements towards AD of Modelica models   

![logo](logo.jpg)


Release Notes 
============= 

current release 1.0 


r1.0 : 26.01.2014 - Algorithmic differentiation of some classes of the Modelica.Electrical.Analog.Basic   


License
=======

Copyright © 2013, Austrian Institute of Technology, Energy Department, Complex Energy Systems
This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

Author 
======

Atiyah Elsheikh (Email: Atiyah.Elsheikh@ait.ac.at)  


Tested with
===========

Dymola 2014, Modelica library 3.2


Literature
==========

Please cite: 

Atiyah Elsheikh, Modeling parameter sensitivities via equation-based algorithmic differentiation techniques -- The ADMSL.Electrical.Analog.Library,
Modelica'2014: The 10th International Modelica Conference, Mar. 2014 Lund, Sweden, 

Online version of the paper can be found here: 
http://www.researchgate.net/profile/Atiyah_Elsheikh/publications/ 

Bibtex source: 
@CONFERENCE{Elsheikh2014a,
  author = {Atiyah Elsheikh},
  title = {Modeling parameter sensitivities via equation-based algorithmic differentiation
	techniques -- The {ADMSL.Electrical.Analog} library},
  booktitle = {Modelica'2014: The 10th International Modelica Conference},
  year = {2014},
  address = {Lund, Sweden},
  month = {Mar.},
  owner = {ElsheikhA},
  timestamp = {2014.01.16}
}


Further contribution
====================

Further contribution / collaboration on the topic of algorithmic differentiation of Modelica libraries are welcome   