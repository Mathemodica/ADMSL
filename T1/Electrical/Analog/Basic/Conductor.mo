within ADMSL.T1.Electrical.Analog.Basic;
model Conductor "AD version of Modelica.Electrical.Analog.Basic."
  /* extends MSL.Electrical.Analog.Basic.Conductor(
    redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort,
    redeclare replaceable partial model CHPort =
        ADMSL.T1.Electrical.Analog.Interfaces.ConditionalHeatPort,
        NG=NG);
  extends ADMSL.Utilities.GradientInfo;*/ 
  
  extends ADMSL.MSL.Electrical.Analog.Basic.Conductor;
  redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort;
  redeclare replaceable partial model CHPort = ADMSL.T1.Electrical.Analog.Interfaces.ConditionalHeatPort;     
  extends Port;
  extends CHPort;  

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
  
end Conductor;
