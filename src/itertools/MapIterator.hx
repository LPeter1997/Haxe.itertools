package itertools;

/**
    An iterator that transforms each element with a given function.
**/
class MapIterator<T, U> {
    final it:Iterator<T>;
    final f:T->U;

    public function new(it, f) {
        this.it = it;
        this.f = f;
    }

    public function hasNext()
        return this.it.hasNext();

    public function next()
        return this.f(this.it.next());
}
