within ADMSL.T1.Electrical.Analog.Basic;
model Inductor "AD version of Modelica.Electrical.Analog.Basic.Inductor"
  //extends ADMSL.Utilities.GradientInfo;

  extends ADMSL.MSL.Electrical.Analog.Basic.Inductor(
    redeclare replaceable partial model Port =
        ADMSL.T1.Electrical.Analog.Interfaces.OnePort);

  parameter Real g_L[p.NG] = zeros(p.NG) "The gradient of inductance";

equation

  for ad_i in 1:p.NG loop
    g_v[ad_i] = g_L[ad_i] * der(i) + L * der(g_i[ad_i]);
  end for;

end Inductor;
