package itertools;

/**
	An iterator that takes the first n elements.
**/
class TakeIterator<T> {
	final it:Iterator<T>;
	var n:Int;

	public function new(it, n) {
		this.it = it;
		this.n = n;
	}

	public function hasNext()
		return this.n > 0 && this.it.hasNext();

	public function next() {
		--this.n;
		return this.it.next();
	}
}
