package itertools;

/**
	An iterator that repeats a single element infinitely.
**/
class RepeatIterator<T> {
    final element:T;

	public function new(element) {
		this.element = element;
	}

	public function hasNext()
        return true;

	public function next()
		return this.element;
}
