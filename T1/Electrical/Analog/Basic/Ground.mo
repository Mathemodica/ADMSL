within ADMSL.T1.Electrical.Analog.Basic;
model Ground "AD version of Modelica.Electrical.Analog.Basic.Ground"
  extends ADMSL.MSL.Electrical.Analog.Basic.Ground(
    redeclare replaceable ADMSL.T1.Electrical.Analog.Interfaces.Pin p);

equation

  for ad_i in 1:p.NG loop
    p.g_v[ad_i] = 0;
  end for;

end Ground;
