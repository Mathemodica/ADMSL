within ADMSL.T1.Electrical.Analog.Interfaces;
partial model ConditionalHeatPort
  "AD version of Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort with useHeatPort=false"

  extends ADMSL.Utilities.GradientInfo;

  extends MSL.Electrical.Analog.Interfaces.ConditionalHeatPort(
      redeclare ADMSL.T1.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(
                  T(start=T)=T_heatPort, Q_flow=-LossPower,
                  g_T = g_T_heatPort, g_Q_flow = g_LossPower));

  parameter Real g_T[NG] = zeros(NG) "The gradient of the fixed temperature";

  Real  g_LossPower[NG];
  Real  g_T_heatPort[NG];

equation

  if not useHeatPort then
     for ad_i in 1 : NG loop
      g_T_heatPort[ad_i] = g_T[ad_i];
     end for;
  end if;

end ConditionalHeatPort;
