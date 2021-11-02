CODE_DIR="$(pwd)/"
cd /home/herminio/PDDL/Material/ff-planer/Metric-FF
./ff -p $CODE_DIR -o domain.pddl -f problem.pddl -s 4 -w 1
cd $CODE_DIR 