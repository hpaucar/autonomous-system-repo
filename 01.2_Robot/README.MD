# PDDL: Robot Problem: Gripper task with four balls
There is a robot that can move between two rooms and pick up or drop balls with either of his two arms. Initially, all balls and the robot are in the first room. We want the balls to be in the second room.

- Objects: The two rooms, four balls and two robot arms.
- Predicates: Is x a room? Is x a ball? Is ball x inside room y? Is robot arm x empty? [...]
- Initial state: All balls and the robot are in the first room. All robot arms are empty. [...]
- Goal specification: All balls must be in the second room.
- Actions/Operators: The robot can move between rooms, pick up a ball or drop a ball.