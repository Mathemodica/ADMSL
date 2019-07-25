within ADMSL.T1.Electrical.Analog.Basic;
model Capacitor "AD version of Modelica.Electrical.Analog.Basic.Capacitor"
  /*extends ADMSL.Utilities.GradientInfo;
  extends MSL.Electrical.Analog.Basic.Capacitor(
    redeclare replaceable partial model Port = Interfaces.OnePort);*/ 
    
  extends ADMSL.MSL.Electrical.Analog.Basic.Capacitor;
  redeclare replaceable partial model Port = ADMSL.T1.Electrical.Analog.Interfaces.OnePort;     
  extends Port; 

  parameter Real g_C[NG] = zeros(NG) "The gradient of capacitance";

equation

  for ad_i in 1:NG loop
    g_i[ad_i] = g_C[ad_i] * der(v) + C * der(g_v[ad_i]);
  end for;

end Capacitor;
