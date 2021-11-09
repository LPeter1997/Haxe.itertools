package itertools;

/**
    An iterable based on a function to create the iterator.
**/
class FuncIterable<T> {
	final f:() -> Iterator<T>;

	public function new(f) {
		this.f = f;
	}

	public function iterator()
		return this.f();
}
