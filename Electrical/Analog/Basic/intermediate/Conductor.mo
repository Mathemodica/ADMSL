within ADMSL.Electrical.Analog.Basic.intermediate;
model Conductor
  extends Bases.Conductor(
    redeclare replaceable class OnePort =
        ADMSL.Electrical.Analog.Interfaces.OnePort,
    redeclare replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.ConditionalHeatPort0);
  extends ADMSL.Interfaces.GradientInfo;

   parameter Real g_G[NG] = zeros(NG)
    "gradient of Conductance at temperature T_ref";
   parameter Real g_T_ref[NG] = zeros(NG) "gradient Reference temperature";
   parameter Real g_alpha[NG] = zeros(NG)
    "gradient of Temperature coefficient of conductance ";

   Real g_G_actual[NG];

protected
  Real T_1111;
  Real g_T_1111[NG];

  Real T_111;
  Real g_T_111[NG];

  Real D_11;
  Real g_D_11[NG];

  Real T_1;
  Real g_T_1[NG];

equation
  // G_actual = G/(1 + alpha*(T_heatPort - T_ref));
  T_1111 = T_heatPort - T_ref;
  g_T_1111[1:NG] = g_T_heatPort[1:NG] - g_T_ref[1:NG];

  T_111 = alpha * T_1111;
  g_T_111[1:NG] = g_alpha[1:NG] * T_111 + alpha * g_T_111[1:NG];

  1/D_11 = 1 + T_111;
  g_D_11[1:NG] = - g_T_111[1:NG] * D_11 * D_11;

  T_1 = G * D_11;
  g_T_1[1:NG] = g_G[1:NG] * D_11 + G * g_D_11[1:NG];

  // G_actual = T_1
  g_G_actual[1:NG] = g_T_1[1:NG];

  // i = G_actual*v;
  g_i[1:NG] = g_G_actual[1:NG] * v + G_actual * g_v[1:NG];

  //LossPower = v*i;
  g_LossPower[1:NG] = g_v[1:NG] * i + v * g_i[1:NG];

end Conductor;
