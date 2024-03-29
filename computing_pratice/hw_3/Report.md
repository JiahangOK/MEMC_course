# 第四章上机作业实习报告

吴家行 2020213991

## P116 1

### 理论分析

该题主要考察不动点迭代法和Newton法，以及Steffensen加速方法。

### 计算程序

主程序位于`code/main_1.m`文件中，

其中，第(1)问的迭代法程序实现位于`code/iteration_1.m`，第(2)问的迭代法程序实现函数位于`code/iteration_2.m`，第(3)问的迭代法程序实现函数位于`code/iteration_1_steffensen.m`，第(4)问的迭代法程序实现函数位于`code/iteration_2_steffensen.m`，第(5)问的迭代法程序实现函数位于`code/newton_iteration.m`。

### 计算结果分析

设置最大迭代次数为10001，程序输出如下，

```
迭代法(1)
k=24, x=1.368808107
迭代法(2)
不收敛
k=10001, x=1.923189477
迭代法(1) Steffensen加速
k=3, x=1.368808108
迭代法(2) Steffensen加速
k=4, x=1.368808108
Newton迭代法
k=4, x=1.368808108
```

可见，迭代法（1）收敛，迭代次数为24次才能到达Leonardo的准确度，而通过Steffensen加速后，收敛速度显著提高，迭代次数缩减为3次。

迭代法（2）不收敛，而通过Steffensen加速后，变得收敛，且收敛速度也比较快，迭代次数仅需要4次。

Newton法迭代收敛，迭代次数也需要4次。

## P116 2

### 理论分析

本题目主要考察非线性方程组的数值解法。

### 计算程序

主程序位于`code/main_2.m`文件中，

其中，第二问的Newton法函数位于`code/newton_nonlinear_iteration.m`中。

### 计算结果分析

对于（1）

构造迭代法：
$$
x=\begin{bmatrix} x1 \\ x2 \\ x3 \end{bmatrix}, \Phi(x)=\begin{bmatrix} \phi_1(x) \\ \phi_2(x) \\ \phi_3(x) \end{bmatrix}=\begin{bmatrix} \frac{1}{3}(cos(x_2x_3)+\frac{1}{2}) \\  \pm\frac{1}{9}\sqrt{x_1^2+sin x_3+1.06}-0.1 \\ \frac{1}{20}(\frac{3-10\pi}{3}-e^{-x_1x_2}) \end{bmatrix} 
$$


由于x2有开根号的情况，若开根号取正号，设置$x_0=[0,0,0]^T$，迭代10次后，输出结果如下：

```
不动点迭代法(x2开根取正):
k=1, x=[0.500000,0.014396,-0.523599]
k=2, x=[0.499991,0.000000,-0.523240]
k=3, x=[0.500000,0.000019,-0.523599]
k=4, x=[0.500000,0.000000,-0.523598]
k=5, x=[0.500000,0.000000,-0.523599]
k=6, x=[0.500000,0.000000,-0.523599]
k=7, x=[0.500000,0.000000,-0.523599]
k=8, x=[0.500000,0.000000,-0.523599]
k=9, x=[0.500000,0.000000,-0.523599]
k=10, x=[0.500000,0.000000,-0.523599]
```

可见$k=5$时已经收敛，方程组的解为$x=[0.500000,0.000000,-0.523599]^T$。

若开根号取负号，设置，迭代10次后，输出结果如下：

```
不动点迭代法(x2开根取负):
k=1, x=[0.500000,-0.200000,-0.523599]
k=2, x=[0.498174,-0.200000,-0.528857]
k=3, x=[0.498137,-0.199606,-0.528837]
k=4, x=[0.498145,-0.199605,-0.528826]
k=5, x=[0.498145,-0.199606,-0.528826]
k=6, x=[0.498145,-0.199606,-0.528826]
k=7, x=[0.498145,-0.199606,-0.528826]
k=8, x=[0.498145,-0.199606,-0.528826]
k=9, x=[0.498145,-0.199606,-0.528826]
k=10, x=[0.498145,-0.199606,-0.528826]
```

可见$k=5$时已经收敛，方程组的解为$x=[0.498145,-0.199606,-0.528826]^T$。

对于（2），$x_0$分别取$[0,0,0]^T$,$[1,1,1]^T$,$[-1,-1,-1]^T$三种初值。

- 若$x_0=[0,0,0]^T$，迭代10次后，输出结果如下：

```
k=1, x=[0.500000,-0.016889,-0.523599]
k=2, x=[0.500016,0.001660,-0.524490]
k=3, x=[0.500000,0.000018,-0.523516]
k=4, x=[0.500000,0.000000,-0.523598]
k=5, x=[0.500000,0.000000,-0.523599]
k=6, x=[0.500000,0.000000,-0.523599]
k=7, x=[0.500000,0.000000,-0.523599]
k=8, x=[0.500000,-0.000000,-0.523599]
k=9, x=[0.500000,0.000000,-0.523599]
k=10, x=[0.500000,0.000000,-0.523599]
```

可见$k=5$时已经收敛，方程组的解为$x=[0.500000,0.000000,-0.523599]^T$。

- 若$x_0=[1,1,1]^T$，迭代10次后，输出结果如下：

```
k=1, x=[0.913262,0.460820,-0.480480]
k=2, x=[0.501078,0.187771,-0.492003]
k=3, x=[0.500351,0.061402,-0.516221]
k=4, x=[0.500100,0.011773,-0.520881]
k=5, x=[0.500006,0.000648,-0.523029]
k=6, x=[0.500000,0.000004,-0.523566]
k=7, x=[0.500000,0.000000,-0.523599]
k=8, x=[0.500000,0.000000,-0.523599]
k=9, x=[0.500000,0.000000,-0.523599]
k=10, x=[0.500000,0.000000,-0.523599]
```

这时收敛速度变慢，k=7时才收敛，方程组的解为$x=[0.500000,0.000000,-0.523599]^T$。

- 若$x_0=[-1,-1,-1]^T$，迭代10次后，输出结果如下：

```
k=1, x=[0.629628,-0.538028,-0.453520]
k=2, x=[0.493206,-0.329618,-0.558115]
k=3, x=[0.498016,-0.236261,-0.535041]
k=4, x=[0.498098,-0.204459,-0.530732]
k=5, x=[0.498143,-0.199705,-0.529090]
k=6, x=[0.498145,-0.199606,-0.528831]
k=7, x=[0.498145,-0.199606,-0.528826]
k=8, x=[0.498145,-0.199606,-0.528826]
k=9, x=[0.498145,-0.199606,-0.528826]
k=10, x=[0.498145,-0.199606,-0.528826]
```

迭代依旧收敛，k=7时收敛，然而方程组的解和前面不同，变成了$x=[0.498145,-0.199606,-0.528826]^T$。