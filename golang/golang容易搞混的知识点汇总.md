# golang容易搞混的知识点汇总

## 1.函数的指针接收者和值接收者

**pointer receiver and value receiver**

值接收者和指针接收者最大的区别就是，值接收者不能改变接收者的值，而指针接收者则可以改变接收者的值。如下两段代码：

	package main

	import (
		"fmt"
		"math"
	)	

	type Vertex struct {
		X, Y float64
	}

	func (v Vertex) Abs() float64 {
		return math.Sqrt(v.X*v.X + v.Y*v.Y)
	}

	func (v *Vertex) Scale(f float64) {
		v.X = v.X * f
		v.Y = v.Y * f
	}

	func main() {
		v := Vertex{3, 4}
		v.Scale(10)
		fmt.Println(v.Abs())
	}

程序运行结构为`50`。

函数`Scale`的初衷是为了对结构体`Vertex`的值进行改变，因此这里应该为指针接收者。而`Abs`的初衷是为了返回平方和，不需要对`Vertex`的值进行改变，所以用值接收者和指针接收者都可以。

如果将`Scale`的接收者改为值接收者，如下：

	package main

	import (
		"fmt"
		"math"
	)	

	type Vertex struct {
		X, Y float64
	}

	func (v Vertex) Abs() float64 {
		return math.Sqrt(v.X*v.X + v.Y*v.Y)
	}

	func (v Vertex) Scale(f float64) {
		v.X = v.X * f
		v.Y = v.Y * f
	}

	func main() {
		v := Vertex{3, 4}
		v.Scale(10)
		fmt.Println(v.Abs())
	}

程序运行结果为`5`。

一般具备以下两种情况，会选择使用指针接收者：

- 1.方法可能会修改指针指向的地址的值。
 
	The first is so that the method can modify the value that its receiver points to.

- 2.为了避免在每次调用的时候都对值进行拷贝，如果接收者是一个非常大的结构体，这样做更有效。

	The second is to avoid copying the value on each method call. This can be more efficient if the receiver is a large struct, for example.

