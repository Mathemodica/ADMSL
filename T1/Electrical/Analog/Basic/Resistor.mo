within ADMSL.T1.Electrical.Analog.Basic;
model Resistor "AD version of Modelica.Electrical.Analog.Basic.Resistor"

  /* extends MSL.Electrical.Analog.Basic.Resistor(
    redeclare replaceable model OnePortC =
        ADMSL.T1.Electrical.Analog.Interfaces.OnePort,
    redeclare replaceable class ConditionalHeatPort =
        Interfaces.ConditionalHeatPort);
  extends ADMSL.Utilities.GradientInfo; */ 

  extends ADMSL.MSL.Electrical.Analog.Basic.Resistor;
  redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort;     
  extends Port; 

  redeclare replaceable model CHPort = ADMSL.T1.Electrical.Analog.Interfaces.ConditionalHeatPort;
  extends CHPort(T = T_ref); 

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
  
end Resistor;
