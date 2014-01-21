within ADMSL.Electrical.Analog.Basic.intermediate;
class ResisterWithHeatPort
  extends Resistor(
    redeclare replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.ConditionalHeatPort1);
end ResisterWithHeatPort;
