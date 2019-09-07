within ADMSL.MSL.Electrical.Analog.Interfaces;
partial model ConditionalHeatPort1
  "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

//  parameter Boolean useHeatPort = true "=true, if heatPort is enabled" annotation(Evaluate=true, HideResult=true, choices(checkBox=true));
  parameter Modelica.SIunits.Temperature T=293.15
    "Fixed device temperature if useHeatPort = false";
  replaceable Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=T)=T_heatPort, Q_flow=-LossPower)
    "Conditional heat port"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}}),
        iconTransformation(extent={{-10,-110},{10,-90}})));
  Modelica.SIunits.Power LossPower "Loss power leaving component via heatPort";
  Modelica.SIunits.Temperature T_heatPort(stateSelect=StateSelect.never) "Temperature of heatPort";
equation
/*  if not useHeatPort then
     T_heatPort = T;
  end if;*/

  annotation (      Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
end ConditionalHeatPort1;
