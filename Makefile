CC = g++
CFLAGS := -std=c++11
# INCLUDE += -I tensorflow/cc
# INCLUDE += -I tensorflow/core
# INCLUDE += -I ./
# INCLUDE += -I third_party
INCLUDE += -I /home/fupeng/workspace/JADE-v4.0/support/tensorflow_include/include
# INCLUDE += -I/home/fupeng/workspace/gitlab/JADE-v4.0/support/tensorflow_file/tensorflow_2/tensorflow-master/bazel-bin/tensorflow/include 
TEST_LIB := -L/home/fupeng/workspace/JADE-v4.0/support/tensorflow_lib
# TEST_LIB := -L/home/fupeng/workspace/gitlab/JADE-v4.0/support/tensorflow_file/tensorflow_2/tensorflow-master/bazel-bin/tensorflow
# $(TEST_LIB) -ltensorflow_framework -ltensorflow_cc


model:model.o data_set.o
	$(CC) $(CFLAGS) -o model model.o data_set.o $(TEST_LIB) -ltensorflow_framework -ltensorflow_cc $(INCLUDE)

# g++ -std=c++11 -o model model.cpp data_set.cpp -L./lib -ltensorflow_framework -ltensorflow_cc -I /home/fupeng/workspace/gitlab/JADE-v4.0/support/tensorflow_file/tensorflow-master/bazel-bin/tensorflow/include

model.o : data_set.h model.cpp
	$(CC) $(CFLAGS) -c model.cpp $(TEST_LIB) -ltensorflow_framework -ltensorflow_cc $(INCLUDE)
data_set.o : data_set.h data_set.cpp
	$(CC) $(CFLAGS) -c data_set.cpp $(TEST_LIB) -ltensorflow_framework -ltensorflow_cc $(INCLUDE)

.PHONY : clean
clean:
	rm model *.o

# export LD_LIBRARY_PATH=/home/fupeng/workspace/gitlab/JADE-v4.0/support/test/lib:$LD_LIBRARY_PATH
# g++ -std=c++11 -o model model.o data_set.o -L./lib -ltensorflow_framework -ltensorflow_cc -I tensorflow/ -I third_party -I ~/workspace/gitlab/JADE-v4.0/support/tensorflow_file/tensorflow-master/bazel-bin/tensorflow/include