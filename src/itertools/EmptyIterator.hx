package itertools;

/**
    A simple empty iterator that returns nothing.
**/
class EmptyIterator<T> {
    public function new() {}

    public function hasNext()
        return false;

    public function next():T
        throw new IteratorException("An empty iterator contains no elements!");
}
