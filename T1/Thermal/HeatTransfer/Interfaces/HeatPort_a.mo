within ADMSL.T1.Thermal.HeatTransfer.Interfaces;
connector HeatPort_a
  "AD version of Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a;
  extends Utilities.GradientInfo;

  Real g_T[NG] "gradient of port's Temperature";
  flow Real g_Q_flow[NG] "gradient of port's heat flow rate";
end HeatPort_a;
