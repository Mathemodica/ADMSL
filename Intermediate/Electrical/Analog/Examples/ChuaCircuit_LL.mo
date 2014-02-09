within ADMSL.Intermediate.Electrical.Analog.Examples;
model ChuaCircuit_LL "Chua's circuit, ns, V, A"
  extends ChuaCircuit(
    NG = 1, L(
            g_L =   {1}));

end ChuaCircuit_LL;
