within ADMSL.Electrical.Analog.Basic;
package Bases
  "Modified copies of some basic components from MSL for extension redeclaration"
  extends Modelica.Icons.BasesPackage;
  model Ground "Ground node"

    replaceable Modelica.Electrical.Analog.Interfaces.Pin p
                     annotation (Placement(transformation(
          origin={0,100},
          extent={{10,-10},{-10,10}},
          rotation=270)));
  equation
    p.v = 0;
    annotation (
      Documentation(info="<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>",
   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-60,50},{60,50}}, color={0,0,255}),
          Line(points={{-40,30},{40,30}}, color={0,0,255}),
          Line(points={{-20,10},{20,10}}, color={0,0,255}),
          Line(points={{0,90},{0,50}}, color={0,0,255}),
          Text(
            extent={{-144,-19},{156,-59}},
            textString="%name",
            lineColor={0,0,255})}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(
            points={{-60,50},{60,50}},
            thickness=0.5,
            color={0,0,255}),
          Line(
            points={{-40,30},{40,30}},
            thickness=0.5,
            color={0,0,255}),
          Line(
            points={{-20,10},{20,10}},
            thickness=0.5,
            color={0,0,255}),
          Line(
            points={{0,96},{0,50}},
            thickness=0.5,
            color={0,0,255}),
          Text(
            extent={{-24,-38},{22,-6}},
            textString="p.v=0",
            lineColor={0,0,255})}));
  end Ground;

model Resistor "Ideal linear electrical resistor"
  parameter Modelica.SIunits.Resistance R(start=1)
      "Resistance at temperature T_ref";
  parameter Modelica.SIunits.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.SIunits.LinearTemperatureCoefficient alpha=0
      "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";

  replaceable class OnePort = ADMSL.Electrical.Analog.Interfaces.Bases.OnePort;
  extends OnePort;
  replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.Bases.ConditionalHeatPort;
  extends ConditionalHeatPort(                    T = T_ref);
  Modelica.SIunits.Resistance R_actual
      "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";

equation
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps, "Temperature outside scope of model!");
  R_actual = R*(1 + alpha*(T_heatPort - T_ref));
  v = R_actual*i;
  LossPower = v*i;
  annotation (
    Documentation(info="<html>
<p>The linear resistor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i*R = v</i>. The Resistance <i>R</i> is allowed to be positive, zero, or negative.</p>
</html>",
 revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of resistance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,0},{-70,0}}, color={0,0,255}),
          Line(points={{70,0},{90,0}}, color={0,0,255}),
          Text(
            extent={{-144,-40},{142,-72}},
            lineColor={0,0,0},
            textString="R=%R"),
          Line(
            visible=useHeatPort,
            points={{0,-100},{0,-30}},
            color={127,0,0},
            smooth=Smooth.None,
            pattern=LinePattern.Dot),
          Text(
            extent={{-152,87},{148,47}},
            textString="%name",
            lineColor={0,0,255})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
          Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
          Line(points={{-96,0},{-70,0}}, color={0,0,255}),
          Line(points={{70,0},{96,0}}, color={0,0,255})}));
end Resistor;

model Conductor "Ideal linear electrical conductor"
  parameter Modelica.SIunits.Conductance G(start=1)
      "Conductance at temperature T_ref";
  parameter Modelica.SIunits.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.SIunits.LinearTemperatureCoefficient alpha=0
      "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";

  replaceable class OnePort = ADMSL.Electrical.Analog.Interfaces.Bases.OnePort;
  extends OnePort;

  replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.Bases.ConditionalHeatPort;
  extends ConditionalHeatPort(T = T_ref);

  Modelica.SIunits.Conductance G_actual
      "Actual conductance = G_ref/(1 + alpha*(T_heatPort - T_ref))";

equation
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps, "Temperature outside scope of model!");
  G_actual = G/(1 + alpha*(T_heatPort - T_ref));
  i = G_actual*v;
  LossPower = v*i;
  annotation (
    Documentation(info="<html>
<p>The linear conductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = v*G</i>. The Conductance <i>G</i> is allowed to be positive, zero, or negative.</p>
</html>",
 revisions="<html>
<ul>
<li><i> August 07, 2009   </i>
       by Anton Haumer<br> temperature dependency of conductance added<br>
       </li>
<li><i> March 11, 2009   </i>
       by Christoph Clauss<br> conditional heat port added<br>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
          Rectangle(
            extent={{-70,30},{70,-30}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),
          Line(points={{-90,0},{-70,0}}, color={0,0,255}),
          Line(points={{70,0},{90,0}}, color={0,0,255}),
          Line(
            visible=useHeatPort,
            points={{0,-100},{0,-30}},
            color={127,0,0},
            smooth=Smooth.None,
            pattern=LinePattern.Dot),
          Text(
            extent={{-152,87},{148,47}},
            textString="%name",
            lineColor={0,0,255}),
          Text(
            extent={{-144,-38},{142,-70}},
            lineColor={0,0,0},
            textString="G=%G")}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
          Line(points={{-96,0},{-70,0}}, color={0,0,255}),
          Line(points={{70,0},{96,0}}, color={0,0,255}),
          Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255})}));
end Conductor;

  model Capacitor "Ideal linear electrical capacitor"
    replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.Bases.OnePort;
     // constrainedby Modelica.Electrical.Analog.Interfaces.OnePort;
    extends OnePort;
    parameter Modelica.SIunits.Capacitance C(start=1) "Capacitance";

  equation
    i = C*der(v);
    annotation (
      Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>i = C * dv/dt</i>. The Capacitance <i>C</i> is allowed to be positive, zero, or negative.</p>
</html>",
   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(
            points={{-14,28},{-14,-28}},
            thickness=0.5,
            color={0,0,255}),
          Line(
            points={{14,28},{14,-28}},
            thickness=0.5,
            color={0,0,255}),
          Line(points={{-90,0},{-14,0}}, color={0,0,255}),
          Line(points={{14,0},{90,0}}, color={0,0,255}),
          Text(
            extent={{-136,-60},{136,-92}},
            lineColor={0,0,0},
            textString="C=%C"),
          Text(
            extent={{-150,85},{150,45}},
            textString="%name",
            lineColor={0,0,255})}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(
            points={{-20,40},{-20,-40}},
            thickness=0.5,
            color={0,0,255}),
          Line(
            points={{20,40},{20,-40}},
            thickness=0.5,
            color={0,0,255}),
          Line(points={{-96,0},{-20,0}}, color={0,0,255}),
          Line(points={{20,0},{96,0}}, color={0,0,255})}));
  end Capacitor;

  model Inductor "Ideal linear electrical inductor"
    replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.Bases.OnePort;
    extends OnePort;

    parameter Modelica.SIunits.Inductance L(start=1) "Inductance";
  equation
    L*der(i) = v;
    annotation (
      Documentation(info="<html>
<p>The linear inductor connects the branch voltage <i>v</i> with the branch current <i>i</i> by <i>v = L * di/dt</i>. The Inductance <i>L</i> is allowed to be positive, zero, or negative.</p>
</html>",
   revisions="<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
          Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
          Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
          Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
          Rectangle(
            extent={{-60,-30},{60,0}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{60,0},{90,0}}, color={0,0,255}),
          Line(points={{-90,0},{-60,0}}, color={0,0,255}),
          Text(
            extent={{-138,-60},{144,-94}},
            lineColor={0,0,0},
            textString="L=%L"),
          Text(
            extent={{-152,79},{148,39}},
            textString="%name",
            lineColor={0,0,255})}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Ellipse(extent={{-60,-15},{-30,15}}, lineColor={0,0,255}),
          Ellipse(extent={{-30,-15},{0,15}}, lineColor={0,0,255}),
          Ellipse(extent={{0,-15},{30,15}}, lineColor={0,0,255}),
          Ellipse(extent={{30,-15},{60,15}}, lineColor={0,0,255}),
          Rectangle(
            extent={{-60,-30},{60,0}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{60,0},{96,0}}, color={0,0,255}),
          Line(points={{-96,0},{-60,0}}, color={0,0,255})}));
  end Inductor;
end Bases;
