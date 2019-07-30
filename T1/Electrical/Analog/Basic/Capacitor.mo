within ADMSL.T1.Electrical.Analog.Basic;
model Capacitor "AD version of Modelica.Electrical.Analog.Basic.Capacitor"
  
  extends ADMSL.T1.Electrical.Analog.Interfaces.OnePort(v(start=0));
  parameter SI.Capacitance C(start=1) "Capacitance";

  parameter Real g_C[NG] = zeros(NG) "The gradient of capacitance";

equation

  for ad_i in 1:NG loop
    g_i[ad_i] = g_C[ad_i] * der(v) + C * der(g_v[ad_i]);
  end for;
  
   i = C*der(v);
  annotation (
    Documentation(info="<html>
<p>The linear capacitor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i = C * dv/dt</em>. The Capacitance <em>C</em> is allowed to be positive or zero.</p>

</html>", revisions="<html>
<ul>
<li><em> 1998   </em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Line(points={{-6,28},{-6,-28}}, color={0,0,255}),
        Line(points={{6,28},{6,-28}}, color={0,0,255}),
        Line(points={{-90,0},{-6,0}}, color={0,0,255}),
        Line(points={{6,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,-40},{150,-80}},
          textString="C=%C"),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255})}));
          
end Capacitor;
