within ADMSL.T1.Electrical.Analog.Basic;
model Inductor "AD version of Modelica.Electrical.Analog.Basic.Inductor"
  extends MSL.Electrical.Analog.Basic.Inductor(
    redeclare replaceable class OnePort = Interfaces.OnePort);
  extends ADMSL.Utilities.GradientInfo;

  parameter Real g_L[NG] = zeros(NG) "The gradient of inductance";

equation

  for ad_i in 1:NG loop
    g_L[ad_i] * der(i) + L * der(g_i[ad_i]) = g_v[ad_i];
  end for;

end Inductor;
