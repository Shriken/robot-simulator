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
