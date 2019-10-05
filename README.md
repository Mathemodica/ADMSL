ADMSL 
=====

Algorithmically Differentiated Library of a part of the standard library Modelica.Electrical.Analog.Basic 

Author 
------

Atiyah Elsheikh [Email](Atiyah.Elsheikh@mathemodica.com)  
See [my Profile](http://mathemodica.com/members/atiyah/)

Description
-----------

ADMSL is the Algorithmically Differentiated (AD) version of a part of the Modelica standard package Modelica.Electrical.Analog.Basic. 
The underlying promising goal is to become the AD version of the Modelica Standard Library. This is where the name ADMSL comes from (Algorithmically differentiated Modelica Standard Library). 

This library serves as a guide for illustrating equation-based algorithmic differentation techniques for Modelica libraries. 
An algorithmically differentiated Modelica library contains everything the original version has together with parameter sensitivities. 
The same models relying on that library can evaluates parameter sensitivities with few minimal efforts and slight changes. However these models preserve the same interface and outlook.

It represents a testing platform for algoirhtmic differerntiation of Modelica libraries w.r.t.
  * algorithmic methodologies 
  * identifying current limitations towards AD of Modelica models  
  * suggesting / recommending further potential language improvements towards AD of Modelica models   

![logo](logo.jpg)


Further contribution
--------------------

Further contribution / collaboration on the topic of algorithmic differentiation of Modelica libraries are welcome. 
Please consult [HowToAddComponent](https://github.com/AtiyahElsheikh/ADMSL/blob/master/UserGuide/HowToAddComponent.mo) using a
a Modelica simulation environment.   


Releases  
========

Current Release
----------------

current release is V1.1.0-alpha (Hamburg Release). Detailed release notes can be consulted [here](https://github.com/AtiyahElsheikh/ADMSL/blob/master/UserGuide/ReleaseNotes.mo) 
using a Modelica simulation environment. 

Tested with
-----------

- OpenModelica 1.13.2 
- Dymola 2020  
- MSL 3.2.3

History
-------

* v1.1.0-alpha (Hamburg Release )   :   September 2019  
	- Improving the overall formulation and working version with OpenModelica 1.13.0

* v1.0         (Vienna Release)     :   January 2014 
	- Algorithmic differentiation of some classes of the Modelica.Electrical.Analog.Basic   


Licenses 
========

License V1.1.0 (Hamburg Release)
--------------------------------

Copyright © 2019, Mathemodica.com
This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [3-BSD License of Modelica Association](https://www.modelica.org/licenses/modelica-3-clause-bsd).

License V1.0 (Vienna Release) 
-----------------------------

Copyright © 2013, Austrian Institute of Technology, Energy Department, Complex Energy Systems
This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).


References 
==========

* Atiyah Elsheikh, Dynamic Parameter Sensitivities: Summary of computation methods for continuous-time Modelica models, Modelica'2019: The 13th International Modelica Conference, Regensburg, Germany, 2019

* Atiyah Elsheikh, Modeling parameter sensitivities via equation-based algorithmic differentiation techniques: The ADMSL.Electrical.Analog.Library, Modelica'2014: The 10th International Modelica Conference, Lund, Sweden, 2014

* Atiyah Elsheikh, Modelica-based computational tools for sensitivity analysis via automatic differentiation, Dissertation, RWTH Aachen university, 2013. 

* Atiyah Elsheikh, ADGenKinetics: An algorithmically differentiated library for biochemical networks modeling via simplified kinetics formats, Modelica'2012, Munich, Germany, 2012  

Online versions of the paper can be found here: 
http://www.researchgate.net/profile/Atiyah_Elsheikh/publications/ 

Bibtex sources 
--------------

@Conference{Elsheikh2019,
author = {Atiyah Elsheikh},
title = {{Dynamic Parameter Sensitivities: Summary of computation methods for continuous-time Modelica models}},
booktitle = {Modelica'2019: The 13th International Modelica Conference},
year = {2019},
address = {Regensburg, Germany},
month = {Mar.},
}

@CONFERENCE{Elsheikh2014a,
author = {Atiyah Elsheikh},
title = {Modeling parameter sensitivities via equation-based algorithmic differentiation techniques: The {ADMSL.Electrical.Analog} library},
booktitle = {Modelica'2014: The 10th International Modelica Conference},
year = {2014},
address = {Lund, Sweden},
month = {Mar.}
}

@PHDTHESIS{Elsheikh2013,
author = {Atiyah Elsheikh},
title = {Modelica-based computational tools for sensitivity analysis via automatic differentiation},
school = {RWTH Aachen university},
year = {2013},
type = {Dissertation},
address = {Aachen, Germany}
}

@INPROCEEDINGS{Elsheikh2012,
author = {Atiyah Elsheikh},
title = {{ADGenKinetics}: An Algorithmically Differentiated Library for Biochemical Networks Modeling via Simplified Kinetics Formats},
booktitle = {Modelica'2012: The 9th International Modelica Conference},
year = {2012},
number = {076},
series = {Linköping Electronic Conference Proceedings},
pages = {915 -- 926},
address = {Munich, Germany},
month = {Sep.},
doi = {ecp12076915}
}

