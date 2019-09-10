within ;
package ADMSL
  extends Modelica.Icons.Package;


  annotation(Icon(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), Diagram(coordinateSystem(extent = {{-100,-100},{100,100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2,2})), uses(Modelica(version = "3.2.3")),
  Documentation(info="<html>
<p><br/>ADMSL is the Algorithmically Differentiated (AD) version of a part of the Modelica standard package <a href=\"Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a>. The underlying promising goal is to become the AD version of the Modelica Standard Library. This is where the name ADMSL comes from (Algorithmically differentiated Modelica Standard Library). </p>
<p>This library serves as a guide for illustrating equation-based algorithmic differentation techniques for Modelica libraries. An algorithmically differentiated Modelica library contains every thing the original version has together with parameter sensitivities. The same models relying on that library can evaluates parameter sensitivities with few minimal efforts and slight changes. However these models preserve the same interface and outlook. It represents a testing platform for algoirhtmic differerntiation of Modelica libraries w.r.t.</p>
<p><ul>
<li>algorithmic methodologies </li>
<li>identifying current limitations towards AD of Modelica models </li>
<li>suggesting / recommending further potential language improvements towards AD of Modelica models </li>
</ul></p>
<p><br/>Licensed under the Modelica License 2</p>
<p><br/>Copyright &copy; &LT;2013&GT;-&LT;2014&GT;, &LT;Atiyah Elsheikh&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</html>"));
end ADMSL;
