within ADMSL.Electrical.Analog.Basic.intermediate;
model ResisterWithHeatPort
  extends Resistor(
    redeclare replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.ConditionalHeatPort1);
end ResisterWithHeatPort;
