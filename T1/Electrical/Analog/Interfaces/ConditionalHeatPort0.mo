within ADMSL.T1.Electrical.Analog.Interfaces;
partial model ConditionalHeatPort0
  "AD version of Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort with useHeatPort=false"

  extends ADMSL.Utilities.GradientInfo;

  extends MSL.Electrical.Analog.Interfaces.ConditionalHeatPort0;

  parameter Real g_T[NG] = zeros(NG) "The gradient of the fixed temperature";

  Real  g_LossPower[NG];
  Real  g_T_heatPort[NG];

equation

  for ad_i in 1 : NG loop
    g_T_heatPort[ad_i] = g_T[ad_i];
  end for;

end ConditionalHeatPort0;
