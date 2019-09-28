within ADMSL.UserGuide;
model HowToAddComponent "Guidelines for adding new components "
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<h4>Basic steps for adding components </h4>
<p><br>For extending this library with further components for your purpose, the following elementary steps are needed: </p>
<h4><span style=\"color: #008000\">Preprocessing </span></h4>
<p><br>This step is concerned with preparing the desired components for algorithmic differentiation. This is done by a slight modification to make the declaration part be replaceable. If you are differentiating your own library, you can modify the components directly. But since the Modelica standard library is something you should not play with, you should place your desired components within <a href=\"ADMSL.MSL\">ADMSL.MSL</a> package. </p>
<p>Formally, given the component Modelica.X1.X2...XN.C</p>
<p>1. Insert the package X1.X2...XN into MSL (if not yet exist)</p>
<p>2. Insert all declared components in C into MSL, if not yet inserted </p>
<p>3. Make all connectors and models within C be replaceable, if any </p>
<p>As examples, see <a href=\"ADMSL.MSL.Electrical.Analog.Interfaces.OnePort\">ADMSL.MSL.Electrical.Analog.Interfaces.OnePort</a> &amp; <a href=\"ADMSL.MSL.Electrical.Analog.Basic.Capacitor\">ADMSL.MSL.Electrical.Analog.Basic.Capacitor</a> </p>
<h4><span style=\"color: #008000\">Processing </span></h4>
<p><br>Now for each new inserted component C in MSL, algorithmically differentiate C as follows: </p>
<p><br>1. Duplicate the component <a href=\"ADMSL.MSL\">ADMSL.MSL</a>.X1.X2...XN.C into <a href=\"ADMSL.T1\">ADMSL.T1</a>.X1.X2...XN.C </p>
<p>- See for e.g. <a href=\"ADMSL.MSL.Electrical.Analog.Interfaces.Pin\">ADMSL.MSL.Electrical.Analog.Interfaces.Pin</a> &amp; <a href=\"ADMSL.T1.Electrical.Analog.Interfaces.Pin\">ADMSL.T1.Electrical.Analog.Interfaces.Pin</a> </p>
<p><br>2. Make the new component C extend from<a href=\"ADMSL.Utilities.GradientInfo\"> ADMSL.Utilities.GradientInfo</a> for specifiying the number of active parameters</p>
<p>i.e.: </p>
<p>model C extends ADMSL.Utilities.GradientInfo; </p>
<p><br>3. redeclare any component x of type MSL.*.T as T1.*.T </p>
<p>- See e.g. <a href=\"ADMSL.MSL.Analog.Interfaces.OnePort\">ADMSL.MSL.Analog.Interfaces.OnePort</a> vs. <a href=\"ADMSL.T1.Analog.Interfaces.OnePort \">ADMSL.T1.Analog.Interfaces.OnePort</a><a href=\"ADMSL.Intermediate.Analog.Interfaces.OnePort \"> </a></p>
<p><br>4. redeclare a gradient array object for each variable or parameter of type Real </p>
<p>- e.g. for Real x =&gt; Real g_x[NG]; </p>
<p><br>5. differentiate the equation directly w.r.t. the parameters</p>
<p>- See e.g. <a href=\"ADMSL.MSL.Analog.Basic.Inductor\">ADMSL.MSL.Analog.Basic.Inductor</a> vs. <a href=\"ADMSL.T1.Analog.Basic.Inductor\">ADMSL.T1.Analog.Basic.Inductor</a></p>
<p>a. For long equations, see <a href=\"UserGuide.References\">UserGuide.References</a> for straightforward easy algorithms for differentiation using notions of abstract syntax trees</p>
</html>"));
end HowToAddComponent;
