within ADMSL.UserGuide;
model Overview "The main contents and the usage of the library"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p align=\"center\"><h4><span style=\"color: #008000\">About</span></h4></p>
<p>ADMSL is the Algorithmically Differentiated (AD) version of a part of the Modelica standard package <a href=\"Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a>. The underlying promising goal it to become the AD version of the Modelica Standard Library. This is where the name ADMSL comes from (Algorithmically differentiated Modelica Standard Library). </p>
<p>This library serves as a guide for illustrating equation-based algorithmic differentation techniques for differentiating Modelica libraries. An algorithmically differentiated Modelica library contains every thing the original version has together with parameter sensitivities. The same models relying on that library additionally evaluates parameter sensitivities with few minimal efforts and slight changes. However these models preserve the same interface and outlook.</p>
<p><br><b><span style=\"color: #008000;\">Implementation</span></b></p>
<p><br>This library is an algorithmically differentiated version of the Modelica supackage <a href=\"Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a>. It is the result of applying some simple code generation rules. </p>
<p>The following rules for the declaration part and the equation part are used for computing algorithmically differentiated versions: </p>
<h4>1. Declaration rule: structure duplications </h4>
<ul>
<li>The package structure of the <a href=\"
ADMSL.T1.Electrical\">ADMSL.T1.Electrical</a> library is identical to the structure of the package <a href=\"Modelica.Electrical\">Modelica.Electrical</a></li>
<li>A class C&apos; in a package ADMSL.T1.P1.P2...PN extends the class C in the package MSL.P1.P2...PN </li>
<li>E.g. See the package <a href=\"
ADMSL.T1.Electrical.Analog.Basic\">ADMSL.T1.Electrical.Analog.Basic</a></li>
</ul>
<p>In order to satisfy that the following steps are sometimes necessary </p>
<ul>
<li>Declared classes within C&apos; should be replaced by their corresponding AD versions</li>
<li>Since declared classes within components of the Modelica standard libraries are not necessarily declared as replaceable, therefore, sometimes some components in <a href=\"
Modelica.Electrical\">Modelica.Electrical</a> has been enhanced with replaceable declaration and placed under<a href=\"ADMSL.MSL\"> ADMSL.MSL</a>. </li>
<li>See e.g. the difference between <a href=\"
Modelica.Electrical.Analog.Basic.Resistor\">Modelica.Electrical.Analog.Basic.Resistor</a> and <a href=\"
ADMSL.MSL.Electircal.Analog.Basic.Resistor\">ADMSL.MSL.Electircal.Analog.Basic.Resistor</a></li>
</ul>
<h4>2. Declaration rule: duplication of data segments </h4>
<ul>
<li>For each variable, or parameter a gradient object is associated</li>
<li>See e.g. <a href=\"
Modelica.Electrical.Analog.Interfaces.Pin\">Modelica.Electrical.Analog.Interfaces.Pin</a> vs. <a href=\"
ADMSL.T1.Electrical.Analog.Interfaces.Pin\">ADMSL.T1.Electrical.Analog.Interfaces.Pin</a></li>
<li><a href=\"
Modelica.Electrical.Analog.Basic.Resistor\">Modelica.Electrical.Analog.Basic.Resistor</a> vs. <a href=\"
ADMSL.T1.Electircal.Analog.Basic.Resistor\">ADMSL.T1.Electircal.Analog.Basic.Resistor</a></li>
</ul>
<h4>3. Forward differentiation rule: generation of sensitivity equations </h4>
<ul>
<li>The equation part of an AD version of a component includes the corresponding sensitivity equation. </li>
<li>For many simple components, the computation of sensitivity equations is very simple, </li>
<li>see e.g.<a href=\"
ADMSL.T1.Electrical.Analog.Basic.Capacitor\"> ADMSL.T1.Electrical.Analog.Basic.Capacitor</a> which extends <a href=\"Modelica.Electrical.Analog.Basic.Capacitor\">Modelica.Electrical.Analog.Basic.Capacitor</a>.</li>
<li>For complicated components, equation-based AD techniques is applied. See the <a href=\"ADMSL.UserGuide.References\">references</a> for more algorithmic details </li>
<li>See e.g. <a href=\"
ADMSL.T1.Electrical.Analog.Basic.Conductor\">ADMSL.T1.Electrical.Analog.Basic.Conductor</a></li>
</ul>
<h4><span style=\"color: #008000\">Further Information</span></h4>
<ul>
<li><a href=\"ADMSL.UserGuide.Contributors\">Contributors</a></li>
<li><a href=\"ADMSL.UserGuide.Contact\">Contact</a></li>
<li><a href=\"ADMSL.UserGuide.ThreeClauseBSDLicenseModelicaAssociation\">License</a></li>
<li><a href=\"ADMSL.UserGuide.ReleaseNotes\">Current Relase and Release Notes</a></li>
<li><a href=\"ADMSL.UserGuide.References\">References</a></li>
</ul>
</html>"));
end Overview;
