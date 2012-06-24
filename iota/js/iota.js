function NewIota(start){
	start -= 1;
	return function(){
		start += 1;
		return start;
	}
}

iota = NewIota(0)
iota() // 0
iota() // 1
iota() // 2

enum = NewIota(0)
var itemTyp = {
	Error : enum(),
	Bool : enum(),
	Complex : enum(),
	EOF : enum()
}
