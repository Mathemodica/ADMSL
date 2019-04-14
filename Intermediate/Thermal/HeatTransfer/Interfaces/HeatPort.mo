within ADMSL.Intermediate.Thermal.HeatTransfer.Interfaces;
partial connector HeatPort
  "AD version of Modelica.Thermal.HeatTransfer.Interfaces.HeatPort"
  extends MSL.Thermal.HeatTransfer.Interfaces.HeatPort;
  extends Utilities.GradientInfo;

  Real g_T[NG] "gradient of port's Temperature";
  flow Real g_Q_flow[NG] "gradient of port's heat flow rate";

end HeatPort;
