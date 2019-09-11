within ADMSL.T1.Electrical.Analog.Examples;
model ChuaCircuit0_all
  "Dynamic parameter sensitivities of the Chua Circuit Example with all parameters are active"
  import ADMSL.Utilities.unitVector;

  extends ChuaCircuit0(
    NG = 8,
    L(g_L= unitVector(1,NG)),
    Ro(g_R=unitVector(2,NG)),
    G(g_G=unitVector(3,NG)),
    C1(g_C=unitVector(4,NG)),
    C2(g_C=unitVector(5,NG)),
    Nr(g_Ga = unitVector(6,NG),g_Gb = unitVector(7,NG),g_Ve = unitVector(8,NG)));
end ChuaCircuit0_all;
