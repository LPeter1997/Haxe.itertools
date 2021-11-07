package itertools;

/**
	An iterator that goes in reverse order.
**/
class ReverseIterator<T> {
	final it:Iterator<T>;
	var arr:Array<T>;
    var idx:Int;

	public function new(it) {
		this.it = it;
	}

	public function hasNext() {
        this.buildIfNeeded();
        return this.idx > 0;
    }

	public function next() {
        this.buildIfNeeded();
        this.idx -= 1;
        return this.arr[this.idx];
    }

    function buildIfNeeded() {
        if (this.arr != null)
            return;
        this.arr = Extensions.toArray(this.it);
        this.idx = this.arr.length;
    }
}
