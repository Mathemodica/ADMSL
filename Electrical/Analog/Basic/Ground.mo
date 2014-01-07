within ADMSL.Electrical.Analog.Basic;
class Ground "AD version of Modelica.Electrical.Analog.Basic.Ground"
  extends ADMSL.Interfaces.GradientInfo;
  extends Bases.Ground(redeclare ADMSL.Electrical.Analog.Interfaces.Pin p);

equation
  for ad_i in 1:NG loop
    p.g_v[ad_i] = 0;
  end for;

end Ground;
