within ADMSL.UserGuide;
model Overview "The main contents of the library"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p><h4><font color=\"#008000\">About</font></h4></p>
<p>ADMSL is the algorithmically differentiated version of a part of the Modelica standard package <a href=\"Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a></p>
<p>The underlying promising goal it to become the AD version of the Modelica Standard Library. This where the name comes from ADMSL (Algorithmically differentiated Modelica Standard Library) </p>
<p><br/><b><font style=\"color: #008000; \">Structure of the Library</font></b></p>
<p><br/>The following packages are available: </p>
<p><ul>
<li><i>Electrical.Analog.Basic</i>: AD version of <a href=\"
Modelica.Electrical.Analog.Basic\">Modelica.Electrical.Analog.Basic</a></li>
<li><i>MSL</i>: Duplicated slightly modified version of some copies within the Modelica Standard Library</li>
<li><i>Thermal</i>: AD version of <a href=\"
Modelica.Thermal\">Modelica.Thermal </a>(Just the needed interfaces for a first working example</li>
<li><i>UnitTests</i>: Unit tests for components </li>
<li><i>Utilities</i>: Basic functions for AD components and unit tests<br/></li>
</ul></p>
<p><h4><font color=\"#008000\">Implementation</font></h4></p>
<p><br/>The following rules for the declaration part and the equation part are used for computing algorithmically differentiated versions: </p>
<p><h4>1. Declaration rule: structure duplications </h4></p>
<p><ul>
<li>The package structure of the <a href=\"ADMSL.Electrical\">ADMSL.Electrical</a> library is identical to the structure of the package <a href=\"Modelica.Electrical\">Modelica.Electrical</a></li>
<li>A class C&apos; in a package ADMSL.P1.P2...PN extends the class C in the package Modelica.P1.P2...PN </li>
<li>E.g. See the package <a href=\"
ADMSL.Electrical.Analog.Basic\">ADMSL.Electrical.Analog.Basic</a></li>
</ul></p>
<p>to satisfy that the following steps are sometimes necessary </p>
<p><ul>
<li>Declared classes within C&apos; should be replaced by their corresponding AD versions</li>
<li>Since declared classes within components of the Modelica standard libraries are not necessarily declared as replaceable, therefore, sometimes some components in Modelica.Electrical has been enhanced with replaceable declaration and placed under ADMSL.MSL </li>
<li>See e.g. the difference between X &AMP; Y </li>
</ul></p>
<p><br/>2. Declaration rule: </p>
<p><h4><font color=\"#008000\">Connections</font></h4></p>
<p><h4><font color=\"#008000\">Interfaces and abstract classes</font></h4></p>
<p><br/>Further interfaces and abstract classes are used within implemented reactions for simplifying their implementations and emphasizing their classification. The most important of which are: </p>
<p><i><a href=\"ADGenKinetics.Interfaces.Reversible.ReactionReversibility\">ADGenKinetics.Interfaces.Reversible.ReactionReversibility</a></i>: for determining the reversibility of reactions. The extended interfaces OneWay, TwoWay are used for irreversible, reversible reactions, respectively:</p>
<p><ul>
<li><i><a href=\"
GenKinetics.Interfaces.static.NodeConnections\">ADGenKinetics.Interfaces.static.NodeConnections</a></i>: fixed number of connections for nodes</li>
<li><i><a href=\"
GenKinetics.Interfaces.dynamic.NodeConnections\">ADGenKinetics.Interfaces.dynamic.NodeConnections</a></i>: parameterized number of connections for nodes.</li>
<li><i><a href=\"
GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">ADGenKinetics.Interfaces.dynamic.Dimension.ReactionDimension</a></i>: parameterized number of connections for nodes. This interface can be used for specializing further classes of specific dimension, e.g. <i><a href=\"
GenKinetics.Interfaces.dynamic.Dimension.ReactionDimension\">ADGenKinetics.Interfaces.dynamic.Dimension.UniUni</a> .</i> </li>
<li><i><a href=\"
GenKinetics.Interfaces.static\">ADGenKinetics.Interfaces.static</a></i>.{<i><a href=\"GenKinetics.Interfaces.static.Reaction1S\">ReactionXS</a>, <a href=\"
GenKinetics.Interfaces.static.Reaction2P\">ReactionXP</a></i>, <i><a href=\"
GenKinetics.Interfaces.static.Reaction1I\">ReactionXI</a>,</i> <i><a href=\"Reaction1A\">ReactionXA</a></i>}: icons and connections for reactions with X number of connections.</li>
</ul></p>
<p><h4><font color=\"#008000\">Nodes</font></h4></p>
<p><br/>Typically, the component <i><a href=\"GenKinetics.NodeElements.dynamic.Node\">ADGenKinetics.NodeElements.dynamic.Node</a></i> or <i><a href=\"GenKinetics.NodeElements.static.Node\">ADGenKinetics.NodeElements.static.Node</a> </i>is the basic one needed for constructing biochemical reaction networks. Further types can be also imported from available implementation of the Biochem library. </p>
<p><h4><font color=\"#008000\">Reactions </font></h4></p>
<p><br/>Reaction kinetics are available in the packages<i><a href=\" ADGenKinetics.Reactions.convenience.\"> </a><a href=\" ADGenKinetics.Reactions.convenience\">ADGenKinetics.Reactions.convenience</a><a href=\" ADGenKinetics.Reactions.convenience.\">.</a>{<a href=\"ADGenKinetics.Reactions.convenience.dynamic\">dynamic</a></i>.<i><a href=\"ADGenKinetics.Reactions.convenience.static\">static</a></i>}. </p>
<p><br/>For instance,<i><a href=\" ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic\"> ADGenKinetics.Reactions.convenience.dynamic.IrrKinetic</a></i> is used for irreversible reactions with arbitrary number of substrates and products, while <i><a href=\"ADGenKinetics.Reactions.convenience.dynamic.InhRevKinetic\">ADGenKinetics.Reactions.convenience.dynamic.InhRevKinetic</a></i> for reversible inhibited reactions with arbitrary number of substrates, products and inhibitors. </p>
<p><br/>Static packages provide reaction kinetics with fixed reaction structure. For instance <i><a href=\"ADGenKinetics.Reactions.convenience.static.IrrKinetic2S1P1I\">ADGenKinetics.Reactions.convenience.static.IrrKinetic2S1P1I</a></i>. </p>
<p><br/>Examples of constructing biochemical networks are given in <i><a href=\"GenKinetics.Examples.Spirallusdyn\">ADGenKinetics.Examples.Spirallusdyn</a> and <a href=\"GenKinetics.Examples.Spirallustatic\">ADGenKinetics.Examples.Spirallustatic</a>. </i></p>
<p><h4><font color=\"#008000\">Computation of parameter sensitivities</font></h4></p>
<p><br/>Given a biochemical reaction network model, the same model can be used for computing parameter sensitivities by additional slight modification in the declaration part: </p>
<p><ol>
<li>Importing <i><a href=\"
ADGenKinetics.Derivatives.NodeElements.*\">ADGenKinetics.Derivatives.NodeElements.*</a></i> and <i><a href=\"
ADGenKinetics.Derivatives.Reactions.convenience\">ADGenKinetics.Derivatives.Reactions.convenience.*</a></i> types for nodes and reaction kinetics.</li>
<li>Initializing the input Jacobian specifying active parameter with respect to which derivatives are sought. </li>
</ol></p>
<p>For instance compare the model given in <i><a href=\"GenKinetics.Examples.Spirallusdyn\">ADGenKinetics.Examples.Spirallusdyn</a> with <a href=\"GenKinetics.Derivatives.Examples.SpirallusdynAll \">ADGenKinetics.Derivatives.Examples.SpirallusdynAll </a></i></p>
</html>"));
end Overview;
