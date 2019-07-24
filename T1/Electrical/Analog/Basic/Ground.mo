within ADMSL.T1.Electrical.Analog.Basic;
model Ground "AD version of Modelica.Electrical.Analog.Basic.Ground"
  extends ADMSL.Utilities.GradientInfo;
  /* extends ADMSL.MSL.Electrical.Analog.Basic.Ground(redeclare ADMSL.T1.Electrical.Analog.Interfaces.Pin p(NG=NG)); */
 /* extends ADMSL.MSL.Electrical.Analog.Basic.Ground(redeclare ADMSL.T1.Electrical.Analog.Interfaces.Pin p); */ 
  extends ADMSL.MSL.Electrical.Analog.Basic.Ground;
  redeclare ADMSL.T1.Electrical.Analog.Interfaces.Pin p(NG=NG);

equation

  for ad_i in 1:NG loop
    p.g_v[ad_i] = 0;
  end for;

end Ground;
