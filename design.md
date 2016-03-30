### Decoupled segments
* Simulator
* Robot controller(s)

The Simulator communicates with the Controllers by sending them sensor input.

**Model - Sensors - Controller**

### Simulator
Simulator deals with model movement and physical interaction.

```D
controller.update(
	[sensor.getOutput(simulation) for sensor in controller.sensors]
);
```

Each (N?) update tick(s) the controllers are fed any sensor input.

### Controller

Time could be non-discretized to allow for different controller clock speeds. For the moment that would be way overkill.

How can we formalize the raltionship between Controllers and Models?
Controllers should modify Models, but only in well-defined ways.
Eg. a car model should be restricted to accelerating, decelerating, and changing its steering angle.

### Debug printing
Debugmode should be enablable for each Model, Controller, and Sensor separately.
