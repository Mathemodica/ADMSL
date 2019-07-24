within ADMSL.MSL.Electrical.Analog.Basic;
model Inductor "Ideal linear electrical inductor"
  replaceable partial model Port =
      ADMSL.MSL.Electrical.Analog.Interfaces.OnePort;
  extends Port; 
  // extends ADMSL.MSL.Electrical.Analog.Interfaces.OnePort;

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
