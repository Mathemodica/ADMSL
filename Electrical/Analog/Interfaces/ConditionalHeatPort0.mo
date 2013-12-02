within ADMSL.Electrical.Analog.Interfaces;
partial model ConditionalHeatPort0
  extends Bases.ConditionalHeatPort(useHeatPort=false);
  extends ADMSL.Interfaces.GradientInfo;

  parameter Real g_T[NG] = zeros(NG);

  Real  g_LossPower[NG];
  Real  g_T_heatPort[NG];

equation
  g_T_heatPort[1:NG] = g_T[1:NG];

end ConditionalHeatPort0;
