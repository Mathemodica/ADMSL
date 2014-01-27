within ADMSL.Electrical.Analog.Basic.intermediate;
class ResistorWithHeatPort
  "AD version of Modelica.Electrical.Analog.Basic.ResistorWithHeatPort"
  extends Resistor(
    redeclare replaceable class ConditionalHeatPort =
        ADMSL.Electrical.Analog.Interfaces.ConditionalHeatPort1);
end ResistorWithHeatPort;
