within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit_LL "Parameter sensitivities w.r.t. one parameter"
  extends ChuaCircuit(
    NG = 1, L(
            g_L =   {1}));

end ChuaCircuit_LL;
