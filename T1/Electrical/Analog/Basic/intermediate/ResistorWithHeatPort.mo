within ADMSL.T1.Electrical.Analog.Basic.intermediate;
class ResistorWithHeatPort
  "AD version of Modelica.Electrical.Analog.Basic.ResistorWithHeatPort"
  extends Resistor(
    redeclare replaceable class ConditionalHeatPort =
        Interfaces.ConditionalHeatPort1);
end ResistorWithHeatPort;
