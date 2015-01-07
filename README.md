# PseudoRandomBackoff
A new random backoff generation for CSMA/ECA with multiple ACs.

Here, nodes pick a random backoff that is different to the ones already being used.
Plus, it makes sure that the randomly chosen backoff does not collide with eventual
successful tranasmissions from other ACs.

How to run?

Execute the plotta.m file. It accepts as parameters 1. number of ACs, 2. number of cycles.
Each cycle is the equivalent of a passing empty slot (WiFi).
