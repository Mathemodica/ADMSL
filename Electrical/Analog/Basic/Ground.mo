within ADMSL.Electrical.Analog.Basic;
model Ground "AD version of Modelica.Electrical.Analog.Basic.Ground"
  extends Bases.Ground(redeclare ADMSL.Electrical.Analog.Interfaces.Pin p);
  extends ADMSL.Interfaces.GradientInfo;

equation
  for ad_i in 1:NG loop
    p.g_v[ad_i] = 0;
  end for;

end Ground;
