package ADMSL
  extends Modelica.Icons.Package;
  import SI = Modelica.SIunits;










  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
    uses(Modelica(version = "3.2.3")),
    Documentation(info = "<html><head></head><body><p><br>ADMSL is the Algorithmically Differentiated (AD) version of a part of the Modelica standard package <a href=\"Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a>. The underlying promising goal is to become the AD version of the Modelica Standard Library. This is where the name ADMSL comes from (Algorithmically differentiated Modelica Standard Library). </p>
<p>This library serves as a guide for illustrating equation-based algorithmic differentation techniques for Modelica libraries. An algorithmically differentiated Modelica library contains every thing the original version has together with parameter sensitivities. The same models relying on that library can evaluates parameter sensitivities with few minimal efforts and slight changes. However these models preserve the same interface and outlook. It represents a testing platform for algoirhtmic differerntiation of Modelica libraries w.r.t.</p>
<p></p><ul>
<li>algorithmic methodologies </li>
<li>identifying current limitations towards AD of Modelica models </li>
<li>suggesting / recommending further potential language improvements towards AD of Modelica models</li></ul><h4>License V1.1 &nbsp;(Hamburg Release)&nbsp;</h4><p>Copyright &nbsp;© &lt;2019&gt;, Mathemodica.com</p><p>Licensed under th 3-BSD License of Modelica Association.&nbsp;</p><p><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://ADMSL.UsersGuide.ThreeClauseBSDLicenseModelicaAssociation\">ADMSL.UsersGuide.ThreeClauseBSDLicenseModelicaAssociation</a>&nbsp;or visit&nbsp;</i><a href=\"https://www.modelica.org/licenses/modelica-3-clause-bsd\">https://www.modelica.org/licenses/modelica-3-clause-bsd</a>.</p><!--StartFragment--><!--EndFragment-->
<h4>License V1.0 (Vienna Release)</h4><p>Copyright © &lt;2013&gt;-&lt;2014&gt;, Austrian institute of Technology&nbsp;</p><p>Licensed under the terms of Modelica License 2.&nbsp;</p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
</body></html>"));
end ADMSL;
