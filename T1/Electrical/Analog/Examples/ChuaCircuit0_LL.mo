within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit0_LL
  "Dynamic parameter sensitivities of the Chua Circuit Example with only the parameter L.L is active / heat port is disabled"
  extends ChuaCircuit0(
    NG = 1, L(
            g_L =   {1}));

end ChuaCircuit0_LL;
