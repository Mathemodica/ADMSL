within ADMSL.T1.Electrical.Analog.Basic;
model Resistor "AD version of Modelica.Electrical.Analog.Basic.Resistor"
  
  parameter SI.Resistance R(start=1)
    "Resistance at temperature T_ref";
  parameter SI.Temperature T_ref=300.15 "Reference temperature";
  parameter SI.LinearTemperatureCoefficient alpha=0
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";

  extends ADMSL.T1.Electrical.Analog.Interfaces.OnePort;
  extends ADMSL.T1.Electrical.Analog.Interfaces.ConditionalHeatPort(T=T_ref,g_T=g_T_ref);
  SI.Resistance R_actual
    "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
    
  parameter Real g_R[NG] = zeros(NG) "The gradient of resistance";
  parameter Real g_T_ref[NG] = zeros(NG)
    "The gradient of reference temperature";
  parameter Real g_alpha[NG] = zeros(NG)
    "The gradient of temperature coefficients";

  Real g_R_actual[NG];

protected
  Real T_1111;
  // Real g_T_1111[NG];

  // Real T_111;
  // Real g_T_111[NG];

  Real T_11;
  // Real g_T_11[NG];

  // Real T_1;
  // Real g_T_1[NG];

equation

  T_1111 = T_heatPort - T_ref;
  // g_T_1111[1:NG] = g_T_heatPort[1:NG] - g_T_ref[1:NG];

  // T_111  = alpha * (T_heatPort - T_ref);
  // g_T_111[1:NG] = g_alpha[1:NG] * (T_heatPort - T_ref) + alpha * (g_T_heatPort[1:NG] - g_T_ref[1:NG]);

  T_11   = 1 + alpha * T_1111;
  // g_T_11[1:NG] = g_alpha[1:NG] * (T_heatPort - T_ref) + alpha * (g_T_heatPort[1:NG] - g_T_ref[1:NG]);

  // R_actual    = R * (1 + alpha * (T_heatPort - T_ref));
  // g_R_actual[1:NG] = g_R[1:NG] * (1 + alpha * (T_heatPort - T_ref)) + R * (g_alpha[1:NG] * (T_heatPort - T_ref) + alpha * (g_T_heatPort[1:NG] - g_T_ref[1:NG]));
  
  for ad_i in 1:NG loop
    g_R_actual[ad_i] = g_R[ad_i] * T_11 + R * (g_alpha[ad_i] * T_1111 + alpha * (g_T_heatPort[ad_i] - g_T_ref[ad_i]));
    //R_actual = T_1;
    //g_R_actual[1:NG] = g_T_1[1:NG];

    g_v[ad_i] = g_R_actual[ad_i] * i + R_actual * g_i[ad_i];

    g_LossPower[ad_i] = g_v[ad_i] * i + v * g_i[ad_i];
  end for; 
  
   assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps,
    "Temperature outside scope of model!");
  R_actual = R*(1 + alpha*(T_heatPort - T_ref));
  v = R_actual*i;
  LossPower = v*i;
  annotation (
    Documentation(info="<html>
<p>The linear resistor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i*R = v</em>. The Resistance <em>R</em> is allowed to be positive, zero, or negative.</p>
</html>", revisions="<html>
<ul>
<li><em> August 07, 2009   </em>
     by Anton Haumer<br> temperature dependency of resistance added<br>
     </li>
<li><em> March 11, 2009   </em>
     by Christoph Clauss<br> conditional heat port added<br>
     </li>
<li><em> 1998   </em>
     by Christoph Clauss<br> initially implemented<br>
     </li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-70,0}}, color={0,0,255}),
        Line(points={{70,0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-150,-40},{150,-80}},
          textString="R=%R"),
        Line(
          visible=useHeatPort,
          points={{0,-100},{0,-30}},
          color={127,0,0},
          pattern=LinePattern.Dot),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255})}));
end Resistor;
