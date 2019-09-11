within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit_LL "Dynamic parameter sensitivities of the Chua Circuit Example with only the parameter L.L is active"
  extends ChuaCircuit(
    NG = 1, L(
            g_L =   {1}));

end ChuaCircuit_LL;
