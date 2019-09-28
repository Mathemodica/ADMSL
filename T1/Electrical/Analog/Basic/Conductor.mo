within ADMSL.T1.Electrical.Analog.Basic;
model Conductor "AD version of Modelica.Electrical.Analog.Basic."
  extends ADMSL.T1.Electrical.Analog.Interfaces.ConditionalHeatPort(T=T_ref,g_T=g_T_ref);
  extends ADMSL.T1.Electrical.Analog.Interfaces.OnePort;


  parameter SI.Conductance G(start=1)
    "Conductance at temperature T_ref";
  parameter SI.Temperature T_ref=300.15 "Reference temperature";
  parameter SI.LinearTemperatureCoefficient alpha=0
    "Temperature coefficient of conductance (G_actual = G_ref/(1 + alpha*(T_heatPort - T_ref))";
  
  SI.Conductance G_actual
    "Actual conductance = G_ref/(1 + alpha*(T_heatPort - T_ref))";

   parameter Real g_G[NG] = zeros(NG)
    "The gradient of Conductance at temperature T_ref";
   parameter Real g_T_ref[NG] = zeros(NG) "The gradient Reference temperature";
   parameter Real g_alpha[NG] = zeros(NG)
    "The gradient of Temperature coefficient of conductance ";

   Real g_G_actual[NG];

protected
  Real T_1111;
  Real T_111;
  // Real g_T_111[NG];

  Real D_11;
  // Real g_D_11[NG];
  Real adl_11_1;
  Real adl_11_2;
  Real adl_11_3;

  //Real T_1;
  //Real g_T_1[NG];
  Real adl_1_1;
  Real adl_1_2;

equation


  // G_actual = G/(1 + alpha*(T_heatPort - T_ref));

  T_1111 = T_heatPort - T_ref;
  // g_T_1111[1:NG] = g_T_heatPort[1:NG] - g_T_ref[1:NG];ld

  T_111 = alpha * T_1111;
  // g_T_111[1:NG] = g_alpha[1:NG] * T_111 + alpha * g_T_1111[1:NG];
  // g_T_111[1:NG] = g_alpha[1:NG] * T_111 + alpha * (g_T_heatPort[1:NG] - g_T_ref[1:NG]);

  1/D_11 = 1 + T_111;
  // g_D_11[1:NG] = - g_T_111[1:NG] * D_11 * D_11;
  // g_D_11[1:NG] =  -(g_alpha[1:NG] * T_111 + alpha * (g_T_heatPort[1:NG] - g_T_ref[1:NG])) * D_11 * D_11;
  adl_11_1 = - D_11 * D_11;
  adl_11_2 = adl_11_1 * alpha;
  adl_11_3 = T_111 * adl_11_1;
  // g_D_11[1:NG] = g_alpha[1:NG] * ad_l_11_3 + (g_T_heatPort[1:NG] - g_T_ref[1:NG]) * ad_l_11_2;

  // T_1 = G * D_11;
  // g_T_1[1:NG] = g_G[1:NG] * D_11 + G * g_D_11[1:NG];
  // g_T_1[1:NG] = g_G[1:NG] * D_11 + G * (g_alpha[1:NG] * ad_l_11_3 + (g_T_heatPort[1:NG] - g_T_ref[1:NG]) * ad_l_11_2);
  adl_1_1 = G * adl_11_3;
  adl_1_2 = G * adl_11_2;
  // g_T_1[1:NG] = g_G[1:NG] * D_11 + adl_1_1 * g_alpha[1:NG]  + adl_1_2 * (g_T_heatPort[1:NG] - g_T_ref[1:NG]);


  for ad_i in 1:NG loop
    // G_actual = T_1
    g_G_actual[ad_i] = g_G[ad_i] * D_11 + adl_1_1 * g_alpha[ad_i]  + adl_1_2 * (g_T_heatPort[ad_i] - g_T_ref[ad_i]);

    // i = G_actual*v;
    g_i[ad_i] = g_G_actual[ad_i] * v + G_actual * g_v[ad_i];

    //LossPower = v*i;
    g_LossPower[ad_i] = g_v[ad_i] * i + v * g_i[ad_i];
  end for; 
  
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps,
    "Temperature outside scope of model!");
  G_actual = G/(1 + alpha*(T_heatPort - T_ref));
  i = G_actual*v;
  LossPower = v*i;
  annotation (
    Documentation(info="<html>
<p>The linear conductor connects the branch voltage <em>v</em> with the branch current <em>i</em> by <em>i = v*G</em>. The Conductance <em>G</em> is allowed to be positive, zero, or negative.</p>
</html>", revisions="<html>
<ul>
<li><em> August 07, 2009   </em>
     by Anton Haumer<br> temperature dependency of conductance added<br>
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
          pattern=LinePattern.Dot),
        Text(
          extent={{-150,-40},{150,-80}},
          textString="G=%G"),
        Text(
          extent={{-150,90},{150,50}},
          textString="%name",
          lineColor={0,0,255})}));

end Conductor;
