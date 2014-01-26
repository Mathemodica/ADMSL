within ADMSL.MSL.Electrical.Analog.Basic;
model Capacitor "Ideal linear electrical capacitor"
  replaceable class OnePort =
      ADMSL.MSL.Electrical.Analog.Interfaces.OnePort;
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
