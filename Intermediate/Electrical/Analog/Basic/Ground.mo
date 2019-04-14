within ADMSL.Intermediate.Electrical.Analog.Basic;
model Ground 
  extends MSL.Electrical.Analog.Basic.Ground(redeclare Interfaces.Pin p);

equation
  for ad_i in 1:NG loop
    p.g_v[ad_i] = 0;
  end for;

end Ground;
