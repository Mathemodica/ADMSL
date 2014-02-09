within ADMSL.Intermediate.Electrical.Analog.Interfaces;
partial model ConditionalHeatPort1
  "AD version of Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort with UseHeatPort=true"
  extends MSL.Electrical.Analog.Interfaces.ConditionalHeatPort(
                                    useHeatPort=true,
      redeclare ADMSL.T1.Thermal.HeatTransfer.Interfaces.HeatPort_a
                                                                 heatPort(T(start=T)=T_heatPort, Q_flow=-LossPower,
                                                                          g_T = g_T_heatPort, g_Q_flow = g_LossPower));
  extends ADMSL.Utilities.GradientInfo;

  parameter Real g_T[NG] = zeros(NG) "The gradient of the fixed temperature";

  Real  g_LossPower[NG];
  Real  g_T_heatPort[NG];

equation
  // g_T_heatPort[1:NG] = g_T[1:NG];

end ConditionalHeatPort1;
