within ADMSL.Electrical.Analog.Interfaces;
partial model OnePort
 extends MSL.Electrical.Analog.Interfaces.OnePort(
                       redeclare PositivePin p,
                       redeclare NegativePin n);
 extends ADMSL.Utilities.GradientInfo;

 Real g_v[NG];
 Real g_i[NG];

equation
 g_v[1:NG] = p.g_v[1:NG] - n.g_v[1:NG];
 for ad_i in 1:NG loop
    0 = p.g_i[ad_i] + n.g_i[ad_i];
 end for;
 g_i[1:NG] = p.g_i[1:NG];

end OnePort;
