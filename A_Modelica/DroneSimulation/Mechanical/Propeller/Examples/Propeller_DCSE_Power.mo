within DroneSimulation.Mechanical.Propeller.Examples;
model Propeller_DCSE_Power
  Rotor.Examples.rotor rotor1
    annotation (Placement(transformation(extent={{-16,20},{26,-20}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a Airframe
    annotation (Placement(transformation(extent={{86,-26},{118,6}})));
  Blades.Examples.Blades blades
    annotation (Placement(transformation(extent={{50,6},{92,46}})));

  parameter Real PropellerGain=-1
    "Propeller gain. Set to 1 for clockwise, -1 for counterclockwise";
  Modelica.Blocks.Interfaces.RealInput position
    annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));

  parameter Modelica.SIunits.Voltage VaNominal=5
    "Nominal armature voltage for motor"
    annotation (Dialog(group="Motor Parameters"));
  parameter Modelica.SIunits.Current IaNominal=0.1
    "Nominal armature current (>0..Motor, <0..Generator) for motor"
    annotation (Dialog(group="Motor Parameters"));

  Motor.DCMotor_DCSE            dCMotor_DCMachine_SeriesExcited(
    k=PropellerGain,
    VaNominal=VaNominal,
    IaNominal=IaNominal,
    V=V) annotation (Placement(transformation(extent={{-68,-20},{-24,20}})));
  parameter Modelica.SIunits.Voltage V "Battery voltage";
  parameter Modelica.SIunits.Resistance R=100 "Resistance at temperature T_ref";
equation
  connect(rotor1.Airframe, Airframe) annotation (Line(
      points={{26.42,-10.4},{102,-10.4},{102,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(rotor1.Blade, blades.Input) annotation (Line(
      points={{26.42,8},{36,8},{36,26},{49.16,26}},
      color={95,95,95},
      thickness=0.5));
  connect(dCMotor_DCMachine_SeriesExcited.force_out, rotor1.force) annotation (
      Line(
      points={{-24,12.4},{-20,12.4},{-20,12.4},{-16.42,12.4}},
      color={95,95,95},
      thickness=0.5));
  connect(rotor1.torque_2, dCMotor_DCMachine_SeriesExcited.torque_1)
    annotation (Line(
      points={{-16.42,0},{-24,0}},
      color={95,95,95},
      thickness=0.5));
  connect(dCMotor_DCMachine_SeriesExcited.torque_2, rotor1.torque_1)
    annotation (Line(
      points={{-24,-12},{-16.42,-12}},
      color={95,95,95},
      thickness=0.5));
  connect(dCMotor_DCMachine_SeriesExcited.position, position) annotation (Line(
        points={{-72.4,-12},{-90,-12},{-90,-20},{-120,-20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -40},{100,60}})),                                    Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,60}})));
end Propeller_DCSE_Power;
