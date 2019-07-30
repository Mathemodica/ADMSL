within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit_all "Chua's circuit, ns, V, A"

  import Modelica.Icons;
  extends Icons.Example;
  import ADMSL.Utilities.*;

  parameter Integer NG = 8; 

  ADMSL.T1.Electrical.Analog.Basic.Inductor L(L=18,g_L=unitVector(1,NG),NG=NG) annotation (Placement(transformation(
        origin={-75,38},
        extent={{-25,-25},{25,25}},
        rotation=270)));
  ADMSL.T1.Electrical.Analog.Basic.Resistor Ro(R=12.5e-3,g_R=unitVector(2,NG),NG=NG) annotation (Placement(transformation(
        origin={-75,-17},
        extent={{-25,-25},{25,25}},
        rotation=270)));
  ADMSL.T1.Electrical.Analog.Basic.Conductor G(G=0.565,g_G=unitVector(3,NG),NG=NG) annotation (Placement(transformation(extent={{-25,38},
            {25,88}},      rotation=0)));
  ADMSL.T1.Electrical.Analog.Basic.Capacitor C1(C=10, g_C=unitVector(4,NG),v(start=4),NG=NG) annotation (Placement(transformation(
        origin={25,3},
        extent={{-25,-25},{25,25}},
        rotation=270)));
  ADMSL.T1.Electrical.Analog.Basic.Capacitor C2(C=100,g_C=unitVector(5,NG),NG=NG) annotation (Placement(transformation(
        origin={-25,3},
        extent={{-25,-25},{25,25}},
        rotation=270)));
  ADMSL.T1.Electrical.Analog.Examples.Utilities.NonlinearResistor Nr(
    Ga(min=-1) = -0.757576, g_Ga = unitVector(6,NG),
    Gb(min=-1) = -0.409091, g_Gb = unitVector(7,NG),
    Ve=1,g_Ve = unitVector(8,NG),NG=NG) annotation (Placement(transformation(
        origin={75,3},
        extent={{-25,-25},{25,25}},
        rotation=270)));
  ADMSL.T1.Electrical.Analog.Basic.Ground Gnd(NG=NG) annotation (Placement(transformation(extent={{-25,-112},{25,
            -62}}, rotation=0)));
equation

  connect(L.n, Ro.p) annotation (Line(points={{-75,13},{-75,8}}));
  connect(C2.p, G.p) annotation (Line(
      points={{-25,28},{-25,28},{-25,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(L.p, G.p) annotation (Line(
      points={{-75,63},{-50.5,63},{-50.5,63},{-25,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(G.n, Nr.p) annotation (Line(
      points={{25,63},{75,63},{75,28}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(C1.p, G.n) annotation (Line(
      points={{25,28},{25,28},{25,63}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Ro.n, Gnd.p) annotation (Line(
      points={{-75,-42},{-75,-62},{0,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(C2.n, Gnd.p) annotation (Line(
      points={{-25,-22},{-24,-22},{-24,-62},{0,-62}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gnd.p, C1.n) annotation (Line(
      points={{0,-62},{25,-62},{25,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gnd.p, Nr.n) annotation (Line(
      points={{0,-62},{75,-62},{75,-22}},
      color={0,0,255},
      smooth=Smooth.None));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={1,1}), graphics),
    Documentation(info="<html>
<p>Chua&#39;;s circuit is the most simple nonlinear circuit which shows chaotic behaviour. The circuit consists of linear basic elements (capacitors, resistor, conductor, inductor), and one nonlinear element, which is called Chua&#39;;s diode. The chaotic behaviour is simulated.</p>
<p>The simulation end time should be set to 5e4. To get the chaotic behaviour please plot C1.v. Choose C2.v as the independent variable .</p>
<p><b>Reference:</b></p>
<p>Kennedy, M.P.: Three Steps to Chaos - Part I: Evolution. IEEE Transactions on CAS I 40 (1993)10, 640-656</p>
</html>",
   revisions="<html>
<dt>
<b>Main Authors:</b>
<dd>
Christoph Clau&szlig;
    &lt;<a href=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</a>&gt;<br>
    Andr&eacute; Schneider
    &lt;<a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright &copy; 1998-2010, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>"),
    experiment(StopTime=1),
    Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
            100,100}}), graphics={Text(
          extent={{-98,104},{-32,72}},
          lineColor={0,0,255},
          textString="Chua Circuit")}));
end ChuaCircuit_all;
